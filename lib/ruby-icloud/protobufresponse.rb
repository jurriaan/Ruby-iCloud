require 'protocol_buffers'
module RubyiCloud
  class ProtoBufResponse < Response
    def parse(definition_class)
      @content = definition_class.parse(content)
    rescue
      p content
    end

    def [](key)
      @content.send(key)
    end
  end
end
