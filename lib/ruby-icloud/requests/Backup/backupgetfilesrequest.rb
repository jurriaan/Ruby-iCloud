module RubyiCloud
  class BackupGetFilesRequest < BackupDeviceRequest
    def initialize(udid, backup_id, files)
      super udid
      @method = :post
      @response = BackupGetFilesResponse
      @backup_id = backup_id

      body_io = StringIO.new
      files = files.reject { |file| file.size == 0 } # These are not returned
      files.map do |file|
        data = ProtocolBuffers::GetFilesRequest.new(hash: [file.chunkhash].pack('H*')).to_s
        ::ProtocolBuffers::Varint.encode(body_io, data.length)
        body_io << data
      end
      @body = body_io.string
    end

    def prepare(client)
      super
      @uri += '/' + @backup_id.to_s + '/getFiles'
    end
  end
end
