require 'spec_helper'
require 'claim_token'

describe ClaimToken::Decryptor do
  use_test_configuration

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
