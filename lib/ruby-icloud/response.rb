module RubyiCloud
  class Response
    def initialize response
      @response = response
      @headers = @response.headers
      @content = @response.content
      parse
    end

    def parse
      p @content
      raise NotImplementedError
    end

    def headers
      @response.headers
    end

    def status
      @response.status
    end

    def content
      @content
    end
  end
end