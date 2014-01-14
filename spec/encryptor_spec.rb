require 'claim_token'
require 'spec_helper'

describe ClaimToken::Encryptor do
  use_test_configuration

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

    stub_random_iv

    it "returns an encrypted token" do
      token = ClaimToken::Encryptor.encrypt({foo: "bar", expires: "NOW"})
      expect( token ).to eql( token_data )
    end
  end
end
