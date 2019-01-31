[![Gem Version](https://badge.fury.io/rb/claim_token.png)](http://badge.fury.io/rb/claim_token)
<br/>
<img src="https://circleci.com/gh/NuffieProductions/ClaimToken.png?circle-token=39bd4a9416dd8d9f3f7f647d63565297e2e77a11" />

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
      config.shared_encryption_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # 32 byte key required
      config.digest_secret = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    end

To encrypt and encode a claim token:

    token = {"your_permissions" => "I HAZ THEM", "expires" => "2014-01-14T01:26:07Z"}
    ClaimToken.pack(token)

To decode and decrypt a claim token:

    packed_token = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX..."
    ClaimToken.extract(packed_token)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright 2014 CricHQ Limited

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
