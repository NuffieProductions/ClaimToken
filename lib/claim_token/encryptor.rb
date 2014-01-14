require 'json'
require 'openssl'
require 'base64'

module ClaimToken

  module Encryptor

    module_function

    def encrypt message
      message_json = JSON.dump(message)

      cipher, iv = build_cipher

      encrypted_data = encrypt_message_with_cipher message_json, cipher

      encoded_encrypted_data = encode(encrypted_data)

      signature = ClaimToken::Signer.sign(encoded_encrypted_data)

      {
        "type" => "EncryptedMessage",
        "cipher" => cipher_type,
        "data" => encoded_encrypted_data,
        "iv" => encode(iv),
        "signature" => signature,
      }
    end

    def build_cipher
      cipher = OpenSSL::Cipher::Cipher.new(cipher_type)
      cipher.encrypt
      cipher.key = encryption_key
      cipher.iv = iv = cipher.random_iv
      return [cipher, iv]
    end

    def cipher_type
      ClaimToken.configuration.cipher_type
    end

    def encryption_key
      ClaimToken.configuration.shared_encryption_key
    end

    def encrypt_message_with_cipher message, cipher
      cipher.update(message.encode("UTF-8")) + cipher.final
    end

    def encode raw_string
      Base64.urlsafe_encode64 raw_string
    end
  end
end
