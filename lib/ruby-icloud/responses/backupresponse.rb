module RubyiCloud
  class BackupResponse < Response
    def parse
      puts "TODO: figure out the protocol buffers"
    end
    
    def process client
      p @content
    end
  end
end