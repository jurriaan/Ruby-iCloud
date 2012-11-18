module Cloud
  class ConfigurationRequest < Request
    def initialize req_type = :backupd
      super :configuration
      @response = ConfigurationResponse
      @req_type = req_type
    end
  end
end