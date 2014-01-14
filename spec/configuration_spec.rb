require 'spec_helper'
require 'claim_token'

describe ClaimToken::Configuration do
  after do
    restore_default_config
  end

  context "when no cipher is specified" do
    before do
      ClaimToken.configure do |config|
      end
    end

    it "defaults to AES 256 with CBC" do
      expect( ClaimToken.configuration.cipher_type ).to eq ClaimToken::DEFAULT_CIPHER_TYPE
    end
  end

  context "when no shared encryption key is set" do
    before do
      ClaimToken.configure do |config|
      end
    end

    it "defaults to a descriptive symbol" do
      expect( ClaimToken.configuration.shared_encryption_key ).to eq( :no_shared_encryption_key_set )
    end
  end

  context "when a shared encryption key is set" do
    let(:shared_key) { "Test Shared Encryption Key" }

    before do
      ClaimToken.configure do |config|
        config.shared_encryption_key = shared_key
      end
    end

    it "returns the shared encryption key" do
      expect( ClaimToken.configuration.shared_encryption_key ).to eq( shared_key )
    end
  end

  context "when no digest secret is set" do
    before do
      ClaimToken.configure do |config|
      end
    end

    it "defaults to a descriptive symbol" do
      expect( ClaimToken.configuration.digest_secret ).to eq( :no_digest_secret_set )
    end
  end

  context "when a digest secret is set" do
    let(:digest_secret) { "Test Digest Key" }

    before do
      ClaimToken.configure do |config|
        config.digest_secret = digest_secret
      end
    end

    it "returns the digest secret" do
      expect( ClaimToken.configuration.digest_secret ).to eq( digest_secret )
    end
  end
end
