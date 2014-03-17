module RubyiCloud
  class BackupFilesResponse < Response
    def parse
      @content = Util.read_varint_encoded_protobuf(@content, ProtocolBuffers::File)
    end

    def process(client)
    end
  end
end
