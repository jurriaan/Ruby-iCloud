module RubyiCloud
  class BackupResponse < ProtoBufResponse
    def parse
      super(RubyiCloud::ProtocolBuffers::BackupDevices)
    end
    
    def process client
      
    end
  end
end