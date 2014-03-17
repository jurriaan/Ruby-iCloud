module RubyiCloud
  class ConfigurationResponse < PlistResponse
    def initialize(resp, request)
      @plist_base = 'urls'
      super resp, request
    end

    def process(client)
      client.uris.merge! @content[:urls]
    end
  end
end
