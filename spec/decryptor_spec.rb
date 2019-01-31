require 'spec_helper'
require 'claim_token'

describe ClaimToken::Decryptor do
  use_test_configuration

  describe :decrypt do

    let(:token_data) {
      {
        "type" => "EncryptedMessage",
        "cipher" => "aes-256-cbc",
        "data" => "swfTPYQu9WYYhJAu00WIPrmrnmdcZI9928AHhGMetJg=",
        "iv" => "CksPXjFY5oon22a4k2mjnQ==",
        "signature" => "6d5ad5e8132424a0e399294cd4ff6c0d357f5055",
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
