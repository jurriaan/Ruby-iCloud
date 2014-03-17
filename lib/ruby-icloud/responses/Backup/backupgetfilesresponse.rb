module RubyiCloud
  class BackupGetFilesResponse < Response
    def parse
      @content = Util.read_varint_encoded_protobuf(@content, ProtocolBuffers::GetFilesResponse)
    end

    def process(client)
    end
  end
end
