require 'claim_token'
require 'spec_helper'

describe ClaimToken::Encryptor do
  before do
    ClaimToken.configure do |config|
      config.shared_encryption_key = "uFeb25D_z0BAGhgH7WKy8QBSat6kxfDa6PrKw1ox69U="
      config.digest_secret = "d22b90c9172649eaf49cd185f73bd4a53ec3ff4dc6f7d51f9dbaac62421e6dd297b38efcd431a7f2"
    end
  end

  after do
    restore_default_config
  end

  describe :encrypt do

    let(:token_data) {
      {
        "type" => "EncryptedMessage",
        "cipher" => "aes-256-cbc",
        "data" => "P_2kgNhGBCu2WaF5lM3foW-tGdaJ3O_5tYSmhqg7rtI=",
        "iv" => "CksPXjFY5oon22a4k2mjnQ==",
        "signature" => "25efcdc87bae25dd0844a74db58462640d705f11",
      }
    }

    before do
      cipher = OpenSSL::Cipher::Cipher.new(ClaimToken.configuration.cipher_type)
      cipher.stub(random_iv: "\nK\x0F^1X\xE6\x8A'\xDBf\xB8\x93i\xA3\x9D")
      OpenSSL::Cipher::Cipher.stub(new: cipher)
    end

    it "returns an encrypted token" do
      token = ClaimToken::Encryptor.encrypt({foo: "bar", expires: "NOW"})
      expect( token ).to eql( token_data )
    end
  end
end
