module RubyiCloud
  class BackupFilesRequest < BackupDeviceRequest
    def initialize(udid, backup_id)
      super udid
      @response = BackupFilesResponse
      @backup_id = backup_id
    end

    def prepare client
      super
      @uri += "/" + @backup_id.to_s + "/listFiles"
    end
  end
end