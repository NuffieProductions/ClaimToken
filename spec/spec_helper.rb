# Test coverage startup
if ENV['SIMPLECOV']
  # Set the environment variable if you want to generate a detailed
  # coverage report on your local box
  require "simplecov"
  SimpleCov.start
end

def stub_random_iv
  before do
    cipher = OpenSSL::Cipher::Cipher.new(ClaimToken.configuration.cipher_type)
    allow(cipher).to receive(:random_iv).and_return("\nK\x0F^1X\xE6\x8A'\xDBf\xB8\x93i\xA3\x9D")
    allow(OpenSSL::Cipher::Cipher).to receive(:new).and_return(cipher)
  end
end

def use_test_configuration
  before do
    ClaimToken.configure do |config|
      config.shared_encryption_key = "uFeb25D_z0BAGhgH7WKy8QBSat6kxfDa6PrKw1ox69U="
      config.digest_secret = "d22b90c9172649eaf49cd185f73bd4a53ec3ff4dc6f7d51f9dbaac62421e6dd297b38efcd431a7f2"
    end
  end

  after do
    restore_default_config
  end
end

def restore_default_config
  ClaimToken.configuration = nil
  ClaimToken.configure {}
end
