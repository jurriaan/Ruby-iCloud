module RubyiCloud
  class BackupDeviceResponse < ProtoBufResponse
    def parse
      super(RubyiCloud::ProtocolBuffers::Backups)
    end
    
    def process client
      
    end
  end
end