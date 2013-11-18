module RubyiCloud
  class BackupFilesResponse < Response
    def parse
      io = StringIO.new(@content)
      @content = []
      until io.eof? do
        length = ::ProtocolBuffers::Varint.decode(io)
        @content << ProtocolBuffers::File.parse(io.read(length))
        puts "!"
      end
    end
    
    def process client
      
    end
  end
end