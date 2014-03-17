module RubyiCloud
  class BackupDevicesRequest < Request
    def initialize
      super :backup_dataclass
      @response = BackupDevicesResponse
      @method = :get
      @req_type = :backup
    end

    def prepare(client)
      super client
      @uri += '/mbs/' + client.account_info[:dsid]
      token = Util.header_base64("#{client.account_info[:dsid]}:#{client.tokens[:mmeAuthToken]}")
      @headers['X-Apple-MBS-Protocol-Version'] = '2.3'
      @headers['Authorization'] = "X-MobileMe-AuthToken #{token}"
      @headers['Accept'] = 'application/vnd.com.apple.mbs+protobuf'
      @headers.delete 'X-MMe-Country'
    end
  end
end
