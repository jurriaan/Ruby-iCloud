module RubyiCloud
  class Response
    attr_reader :response
    def initialize(response, request = nil)
      @response = response
      @request = request
      @headers = @response.headers
      @content = @response.content
      parse
    end

    def parse
      p @content
      fail NotImplementedError
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
