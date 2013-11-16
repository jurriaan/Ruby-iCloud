require 'protocol_buffers'
module RubyiCloud
  module ProtocolBuffers
    class BackupDevices < ::ProtocolBuffers::Message
      required :string, :psid, 1
      repeated :hex, :udids, 2 # custom type
      optional :bool, :todo, 3 # TODO: figure out meaning of this boolean
    end
    
    class DeviceInfo < ::ProtocolBuffers::Message
      required :string, :name, 1
      required :string, :version, 2
      required :string, :build, 3
      required :int32, :unknown1, 4
      required :hex, :unknown, 5
      required :int32, :unknown2, 6
      required :int32, :unknown3, 7
    end
    
    class Backup < ::ProtocolBuffers::Message
      required :int32, :index, 1
      required :int64, :size, 2
      required :timestamp, :timestamp, 3
      required ::RubyiCloud::ProtocolBuffers::DeviceInfo, :device_info, 5
      required :timestamp, :timestamp2, 6
    end
    
    class DeviceType < ::ProtocolBuffers::Message
      required :string, :name, 1
      required :string, :version, 2
      required :string, :serial_number, 3
      required :string, :variant, 4
      required :string, :model, 5
      required :string, :full_name, 6
      required :string, :unknown, 7
    end
    
    class Backups < ::ProtocolBuffers::Message
      required :hex, :udid, 1
      required :int64, :total_size, 2

      repeated ::RubyiCloud::ProtocolBuffers::Backup, :backup, 3

      required ::RubyiCloud::ProtocolBuffers::DeviceType, :device_type, 4
      required :timestamp, :creation_time, 5
      
    end
  end
end
