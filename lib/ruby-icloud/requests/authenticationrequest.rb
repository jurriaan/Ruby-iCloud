module RubyiCloud
  class AuthenticationRequest < Request
    def initialize user, password
      super :authenticate
      @method = :post
      @response = AuthenticationResponse
      headers['Authorization'] = "Basic #{Util.header_base64("#{user}:#{password}")}"
    end

  end
end