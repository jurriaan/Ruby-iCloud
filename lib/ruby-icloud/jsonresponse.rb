require 'json'
module RubyiCloud
  class JSONResponse < Response
    def parse
      @content = JSON.load(content)
    end

    def [](key)
      @content[key]
    end
  end
end
