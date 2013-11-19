module RubyiCloud
  class BackupKeysResponse < ProtoBufResponse
    def parse
      super(RubyiCloud::ProtocolBuffers::Keys)
    end
    
    def process client
      
    end
  end
end