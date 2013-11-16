require 'protocol_buffers'
module RubyiCloud
  module ProtocolBuffers
    class Backups < ::ProtocolBuffers::Message
      required :string, :psid, 1
      repeated :hex, :udids, 2 # custom type
      optional :bool, :todo, 3 # TODO: figure out meaning of this boolean
    end
  end
end
