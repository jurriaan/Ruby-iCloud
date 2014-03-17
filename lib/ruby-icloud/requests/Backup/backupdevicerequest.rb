module RubyiCloud
  class BackupDeviceRequest < BackupDevicesRequest
    def initialize(udid)
      super()
      @response = BackupDeviceResponse
      @udid = udid
    end

    def prepare(client)
      super
      @uri += '/' + @udid
    end
  end
end
