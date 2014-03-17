module RubyiCloud
  class AuthenticationResponse < PlistResponse
    def process(client)
      client.tokens.merge! @content[:tokens]
      client.account_info.merge! @content[:appleAccountInfo]
    end
  end
end
