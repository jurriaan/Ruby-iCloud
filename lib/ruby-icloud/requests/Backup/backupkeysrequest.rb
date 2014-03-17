module RubyiCloud
  class BackupKeysRequest < BackupDeviceRequest
    def initialize(udid)
      super udid
      @response = BackupKeysResponse
    end

    def prepare(client)
      super
      @uri += '/getKeys'
    end
  end
end
