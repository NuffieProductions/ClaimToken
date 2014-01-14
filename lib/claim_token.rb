require 'claim_token/configuration'
require "claim_token/version"
require 'claim_token/signer'
require 'claim_token/encryptor'
require 'claim_token/decryptor'

module ClaimToken
  def self.encrypt message
    ClaimToken::Encryptor.encrypt(message)
  end

  def self.decrypt encrypted_token
    ClaimToken::Decryptor.decrypt(encrypted_token)
  end
end
