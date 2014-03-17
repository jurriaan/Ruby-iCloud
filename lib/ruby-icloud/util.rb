require 'base64'
module RubyiCloud
  class Util
    class << self
      def header_base64(input)
        Base64.encode64(input).tr("\n", '')
      end

      def read_varint_encoded_protobuf(io_or_string, klass = ProtocolBuffers::File)
        io_or_string = StringIO.new(io_or_string) if io_or_string.is_a?(String)
        io = io_or_string
        contents = []
        until io.eof?
          length = ::ProtocolBuffers::Varint.decode(io)
          contents << klass.parse(io.read(length))
        end
        contents
      end
    end
  end
end

require 'plist'
# Plist key hack :D
module Plist
  class PKey
    alias_method :old_to_ruby, :to_ruby
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
