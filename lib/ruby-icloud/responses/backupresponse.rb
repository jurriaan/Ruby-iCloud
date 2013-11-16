module RubyiCloud
  class BackupResponse < ProtoBufResponse
    def parse
      super(RubyiCloud::ProtocolBuffers::Backups)
    end
    
    def process client
      
    end
  end
end