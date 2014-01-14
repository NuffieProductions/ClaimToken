require 'openssl'

module ClaimToken
  module Signer
    def self.sign encrypted_data
      OpenSSL::HMAC.hexdigest('sha1', digest_secret, encrypted_data)
    end

    def self.digest_secret
      ClaimToken.configuration.digest_secret
    end
  end
end
