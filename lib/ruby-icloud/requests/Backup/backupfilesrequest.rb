module RubyiCloud
  class BackupFilesRequest < BackupDeviceRequest
    def initialize(udid, backup_id, offset= 0, limit = 1000)
      super udid
      @response = BackupFilesResponse
      @backup_id = backup_id
      @offset = offset
      @limit = limit
    end

    def prepare client
      super
      @uri += "/" + @backup_id.to_s + "/listFiles?offset=#{@offset}&limit=#{@limit}"
    end
  end
end