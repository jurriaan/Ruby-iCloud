module RubyiCloud
  class BackupRequest < Request
    def initialize 
      super :backup_dataclass
      @response = BackupResponse
      @method = :get
      @req_type = :backup
      @headers['X-Apple-MBS-Protocol-Version'] = '1.7'

    end
    def prepare client
      super client
      p @uri
      @uri += "/mbs/" + client.account_info[:dsid]
      p @uri 
      token = Util.header_base64("#{client.account_info[:dsid]}:#{client.tokens[:mmeAuthToken]}")
      @headers['Authorization'] = "X-MobileMe-AuthToken #{token}"
      @headers['Accept'] = 'application/vnd.com.apple.mbs+protobuf'
      @headers.delete 'X-MMe-Country'
      p @headers
    end
  end
end