require 'claim_token/configuration'
require "claim_token/version"
require 'claim_token/signer'
require 'claim_token/encryptor'
require 'claim_token/decryptor'

module ClaimToken

  def self.extract encoded_token
    decrypt(JSON.parse( Base64.urlsafe_decode64(encoded_token)))
  end

  def self.pack message
    Base64.urlsafe_encode64(JSON.dump(encrypt(message)))
  end

  def self.encrypt message
    ClaimToken::Encryptor.encrypt(message)
  end

  def self.decrypt encrypted_token
    ClaimToken::Decryptor.decrypt(encrypted_token)
  end
end
