module Cloud
  class Request
    REQUEST_TYPES = {
      backupd: {client_info: 'com.apple.backupd/(null)', user_agent: 'backupd (unknown version) CFNetwork/609 Darwin/13.0.0'},
      ubd:     {client_info: 'com.apple.ubd/243.6', user_agent: 'ubd/243.6 CFNetwork/609 Darwin/13.0.0'},
      mobilebackup: {client_info: 'com.apple.backupd/(null)', user_agent: 'MobileBackup/6.0.1 (10A523; iPhone4,1)',
      fmip: {user_agent: 'FindMyiPhone/249 CFNetwork/609 Darwin/13.0.0', client_info: '' }}
    }
    
    attr_reader :headers, :req_type
    attr :uri, :method, :body, :response
    
    def initialize(uri, method = :get, headers = {}, req_type = :backupd, body = '')
      @headers = headers
      @uri = uri
      @method = method
      @req_type = req_type
      @body = body
      @response = DefaultResponse    
    end
    
    def prepare client
      @headers = {"X-MMe-Country" => "US", 
                  "X-MMe-Client-Info" => "<iPhone4,1> <iPhone OS;6.0.1;10A523> <com.apple.AppleAccount/1.0 (#{REQUEST_TYPES[req_type][:client_info]})>", 
                  "User-Agent" => REQUEST_TYPES[req_type][:user_agent]}.merge(@headers)
      if @uri.is_a? Symbol
        @uri = client.get_uri(@uri)
      end
    end
    
  end
end