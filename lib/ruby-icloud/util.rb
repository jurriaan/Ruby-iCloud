require 'base64'
module RubyiCloud
  class Util
    class << self
      def header_base64 input
        Base64.encode64(input).tr("\n",'')
      end
    end
  end
end
require 'plist'
#Plist key hack :D
module Plist
  class PKey
    alias :old_to_ruby :to_ruby
    def to_ruby
      old_to_ruby.to_sym
    end
  end
end

require 'protocol_buffers'
module ProtocolBuffers
  class Field
    class HexField < BytesField
      def deserialize(value)
        value.read.unpack('H*').first
      end
    end
    class TimestampField < Field
      include WireFormats::VARINT
      def deserialize(value)
        Time.at(super(value))
      end
      
      def valid_type?(value)
        value.is_a?(Time)
      end
    end
  end
end

