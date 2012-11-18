module Cloud
  class Response
    def initialize response
      @response = response
      @headers = @response.headers
      @content = @response.content
      parse
    end
    
    def parse 
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