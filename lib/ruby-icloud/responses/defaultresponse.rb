module Cloud
  class DefaultResponse < Response
    def parse
      
    end
    def process client
      puts "Default Response!"
      # do nothing
    end
  end
end