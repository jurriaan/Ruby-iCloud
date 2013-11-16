require 'multi_json'
module RubyiCloud
  class InitClientRequest < Request
    def initialize
      super :devicelocator_dataclass
      @req_type = :fmip
      @method = :post
      @response = InitClientResponse
      @headers['Content-Type'] = 'application/json; charset=utf-8'
      @headers['X-Apple-Find-API-Ver'] = '3.0'
      @headers['X-Apple-AuthScheme'] = 'Forever'
      @headers['X-Apple-Realm-Support'] = '1.0'
      @headers['Accept-Language'] = 'en-us'
      @headers['Connection'] = 'keep-alive'
      @body = {"clientContext"=>
  {"appName"=>"FindMyiPhone",
   "appVersion"=>"2.0.2",
   "buildVersion"=>"294",
#   "clientTimestamp"=>397037346462,
   "deviceUDID"=>"15cacd55eece27de5b02761a344b8c57c341230d",
   "inactiveTime"=>9907964,
   "osVersion"=>"7.0",
   "productType"=>"iPhone5,0"},
 "serverContext"=>{}}
    end

    def prepare client
      super client
      @uri = @uri.sub('fmip','fmipmobile')+'/fmipservice/device/'+client.account_info[:dsid]+'/initClient'
      p @uri
      token = Util.header_base64("#{client.account_info[:dsid]}:#{client.tokens[:mmeFMIPToken]}")
      p "#{client.account_info[:dsid]}:#{client.tokens[:mmeFMIPToken]}"
      p token
      token = '.....'
      @headers['Authorization'] = "Basic #{token}"
      @headers.delete 'X-MMe-Country'
      @headers.delete 'X-MMe-Client-Info'
      p @headers
      @body = MultiJson.dump(@body)
    end
  end
end