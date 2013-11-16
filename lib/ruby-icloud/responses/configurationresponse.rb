module RubyiCloud
  class ConfigurationResponse < PlistResponse
    def initialize resp
      @plist_base = 'urls'
      super resp
    end

    def process client
      client.uris.merge! @content[:urls]
    end
  end
end