module RubyiCloud
  class Request
    REQUEST_TYPES = {
      backupd: {client_info: 'com.apple.backupd/(null)', user_agent: 'backupd (unknown version) CFNetwork/666 Darwin/14.0.0'},
      ubd:     {client_info: 'com.apple.ubd/243.6', user_agent: 'ubd/243.6 CFNetwork/666 Darwin/14.0.0'},
      mobilebackup: {client_info: 'com.apple.backupd/(null)', user_agent: 'MobileBackup/6.0.1 (10A523; iPhone4,1)'},
      fmip: {user_agent: 'FindMyiPhone/294 CFNetwork/666 Darwin/14.0.0', client_info: 'com.apple.DeviceLocator/(null)' },
      backup: {client_info: 'com.apple.backupd/(null)', user_agent: 'MobileBackup/5.1.1 (9B206; iPhone4,1)'}
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
      #p req_type
      #p REQUEST_TYPES[req_type]
      @headers = {"X-MMe-Country" => "US",
                  "X-MMe-Client-Info" => "<iPhone4,1> <iPhone OS;6.0.1;10A523> <com.apple.AppleAccount/1.0 (#{REQUEST_TYPES[req_type][:client_info]})>",
                  "User-Agent" => REQUEST_TYPES[req_type][:user_agent]}.merge(@headers)
      if @uri.is_a? Symbol
        @uri = client.get_uri(@uri)
      end
    end

  end
end