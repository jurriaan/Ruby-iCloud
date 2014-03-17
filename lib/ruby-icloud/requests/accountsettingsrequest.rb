require 'plist'
module RubyiCloud
  class AccountSettingsRequest < Request
    def initialize
      super :getAccountSettings
      @req_type = :ubd
      @method = :post
      @response = AccountSettingsResponse
      @headers['Content-Type'] = 'application/xml'
      @body = { 'protocolVersion' => '1.0', 'userInfo' => { 'client-id' => nil, 'language' => 'en', 'timezone' => 'Europe/Amsterdam' } }
    end

    def prepare(client)
      @body['userInfo']['client-id'] = client.client_id
      @body = @body.to_plist
      token = Util.header_base64("#{client.account_info[:dsid]}:#{client.tokens[:mmeAuthToken]}")
      @headers['Authorization'] = "Basic #{token}"
      super client
    end
  end
end
