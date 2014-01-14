module ClaimToken

  DEFAULT_CIPHER_TYPE = "aes-256-cbc"

  class Configuration
    attr_accessor :shared_encryption_key, :digest_secret, :cipher_type

    def initialize
      @cipher_type = DEFAULT_CIPHER_TYPE
      @shared_encryption_key = :no_shared_encryption_key_set
      @digest_secret = :no_digest_secret_set
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end
