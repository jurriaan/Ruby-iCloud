module RubyiCloud
  class BackupDevicesRequest < Request
    def initialize
      super :backup_dataclass
      @response = BackupDevicesResponse
      @method = :get
      @req_type = :backup
      @headers['X-Apple-MBS-Protocol-Version'] = '1.7'
    end
    
    def prepare client
      super client
      @uri += "/mbs/" + client.account_info[:dsid] 
      token = Util.header_base64("#{client.account_info[:dsid]}:#{client.tokens[:mmeAuthToken]}")
      @headers['Authorization'] = "X-MobileMe-AuthToken #{token}"
      @headers['Accept'] = 'application/vnd.com.apple.mbs+protobuf'
      @headers.delete 'X-MMe-Country'
    end
  end
end