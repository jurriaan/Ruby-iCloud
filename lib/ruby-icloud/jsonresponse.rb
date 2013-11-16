require 'multi_json'
module RubyiCloud
  class JSONResponse < Response
    def parse
      @content = MultiJson.load(content, symbolize_keys: true)
    end

    def [](key)
      @content[key]
    end
  end
end
