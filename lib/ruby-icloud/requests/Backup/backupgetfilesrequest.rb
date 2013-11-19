module RubyiCloud
  class BackupGetFilesRequest < BackupDeviceRequest
    def initialize(udid, backup_id)
      super udid
      @method = :post
      @response = BackupGetFilesResponse
      @backup_id = backup_id
    end

    def prepare client
      super
      @uri += "/" + @backup_id.to_s + "/getFiles"
    end
  end
end