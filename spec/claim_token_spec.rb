require 'spec_helper'
require 'claim_token'

describe ClaimToken do

  use_test_configuration

  let(:encoded_token) {
    "eyJ0eXBlIjoiRW5jcnlwdGVkTWVzc2FnZSIsImNpcGhlciI6ImFlcy0yNTYtY2Jj" +
    "IiwiZGF0YSI6IjZ4eGwxR3pmbzVXRUhnMUluVk5rZFE9PSIsIml2IjoiQ2tzUFhq" +
    "Rlk1b29uMjJhNGsybWpuUT09Iiwic2lnbmF0dXJlIjoiNWFmOGIxYTA0Y2Y0MmIw" +
    "MDZiZDY3ZjJjZTM2YTFjODcyN2I3MTJhMyJ9"
  }

  describe ".extract" do
    it "extracts a packed token" do
      extracted_token = ClaimToken.extract(encoded_token)

      expect( extracted_token ).to eql({"foo" => "bar"})
    end
  end

  describe ".pack" do
    stub_random_iv

    it "packs a token" do
      raw_token = {"foo" => "bar"}

      packed_token = ClaimToken.pack(raw_token)

      expect( packed_token ).to eq encoded_token
    end
  end
end
