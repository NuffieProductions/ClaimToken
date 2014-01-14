require 'spec_helper'
require 'claim_token'

describe ClaimToken::Decryptor do
  before do
    ClaimToken.configure do |config|
      config.shared_encryption_key = "uFeb25D_z0BAGhgH7WKy8QBSat6kxfDa6PrKw1ox69U="
      config.digest_secret = "d22b90c9172649eaf49cd185f73bd4a53ec3ff4dc6f7d51f9dbaac62421e6dd297b38efcd431a7f2"
    end
  end

  after do
    restore_default_config
  end

  describe :decrypt do

    let(:token_data) {
      {
        "type" => "EncryptedMessage",
        "cipher" => "aes-256-cbc",
        "data" => "P_2kgNhGBCu2WaF5lM3foW-tGdaJ3O_5tYSmhqg7rtI=",
        "iv" => "CksPXjFY5oon22a4k2mjnQ==",
        "signature" => "25efcdc87bae25dd0844a74db58462640d705f11",
      }
    }

    it "returns a decrypted message" do
      expect( ClaimToken::Decryptor.decrypt(token_data) ).to eql({"foo" => "bar", "expires" => "NOW"})
    end

    it "errors on bad signature" do
      expect { ClaimToken::Decryptor.decrypt(token_data.merge!("signature" => "12345")) }.to raise_error("IncorrectSignature")
    end
  end
end
