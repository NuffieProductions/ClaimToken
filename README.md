# ClaimToken

ClaimToken encrypts and signs tokens to be used in a claim-based authentication system

## Installation

Add this line to your application's Gemfile:

    gem 'claim_token'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install claim_token

## Usage

    ClaimToken.configure do |config|
      config.cipher_type = "aes-256-cbc"  # this is the default
      config.shared_encryption_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      config.digest_secret = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    end

To encrypt a token:

    ClaimToken.encrypt(token)

To decrypt a token:

    ClaimToken.decrypt(encrypted_token)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
