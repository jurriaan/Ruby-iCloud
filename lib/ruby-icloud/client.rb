require 'httpclient'
require 'tmpdir'
require 'securerandom'

module RubyiCloud
  class Client
    attr_reader :tokens, :account_info, :uris, :tokens, :client_id, :features

    def initialize
      @client = HTTPClient.new
      @client.proxy = 'http://localhost:8080' if $DEBUG
      dir = Dir.mktmpdir
      @client.set_cookie_store("#{dir}/cookies.bin")
      puts "Storing cookies in #{dir}/cookies.bin" if $DEBUG
      @client.debug_dev = STDERR if $DEBUG
      #@client.ssl_config.add_trust_ca("apple.pem")
      @client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE #TODO: Fix this
      @client_id = SecureRandom.uuid
      @uris = {configuration: 'https://setup.icloud.com/configurations/init?context=settings'}
      @tokens = {}
      @account_info = {}
      @features = {}
      update_configuration
    end

    def update_configuration
      process ConfigurationRequest
    end

    def process request
      request = request.new if request.is_a?(Class) && request.superclass == RubyiCloud::Request
      request.prepare self

      res = if request.method == :get
        @client.get(request.uri,nil,request.headers)
      elsif request.method == :post
        @client.post(request.uri,request.body,request.headers)
      else
        raise NotImplementedError
      end
      @client.save_cookie_store
      response = request.response.new res
      response.process self
      response
    end

    def get_uri key
      if @uris.has_key? key
        @uris[key]
      else
        raise StandardError.new("URI #{key} not found..")
      end
    end

    def authorize email, pass
      process AuthenticationRequest.new(email, pass)
      update_configuration
      get_account_settings
    end

    def get_account_settings
      @account_settings = process AccountSettingsRequest
    end
  end
end