require 'spec_helper'
require 'claim_token'

describe ClaimToken::Encryptor do
  use_test_configuration

  describe :encrypt do

    let(:token_data) {
      {
        "type" => "EncryptedMessage",
        "cipher" => "aes-256-cbc",
        "data" => "swfTPYQu9WYYhJAu00WIPrmrnmdcZI9928AHhGMetJg=",
        "iv" => "CksPXjFY5oon22a4k2mjnQ==",
        "signature" => "6d5ad5e8132424a0e399294cd4ff6c0d357f5055",
      }
    }

    stub_random_iv

    it "returns an encrypted token" do
      token = ClaimToken::Encryptor.encrypt({foo: "bar", expires: "NOW"})
      expect( token ).to eql( token_data )
    end
  end
end
