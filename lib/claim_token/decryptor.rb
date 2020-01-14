require 'json'
require 'openssl'
require 'base64'

module ClaimToken

  module Decryptor

    module_function

    def decrypt encrypted_token
      check_signature! encrypted_token

      cipher = build_cipher(encrypted_token)

      decrypted = decrypt_token_with_cipher(encrypted_token, cipher)

      JSON.parse(decrypted)
    end

    def check_signature! token
      signature = token.fetch("signature")
      real_signature = ClaimToken::Signer.sign(token.fetch("data"))

      raise "IncorrectSignature" unless signature == real_signature
    end

    def build_cipher token
      cipher = OpenSSL::Cipher.new( token.fetch("cipher") )
      cipher.decrypt
      cipher.key = encryption_key
      cipher.iv = decode(token.fetch("iv"))
      return cipher
    end

    def decrypt_token_with_cipher token, cipher
      decrypted = cipher.update decode(token.fetch("data"))
      decrypted << cipher.final
    end

    def encryption_key
      raise "MissingKeyException : ClaimToken configuration is missing the shared_encryption_key" if ClaimToken.configuration.shared_encryption_key.nil?
      ClaimToken.configuration.shared_encryption_key
    end

    def decode encoded_string
      Base64.urlsafe_decode64 encoded_string
    end
  end
end
