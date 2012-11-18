unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end

require_relative './ruby-icloud/util'
require_relative './ruby-icloud/client'
require_relative './ruby-icloud/response'
require_relative './ruby-icloud/plistresponse'
require_relative './ruby-icloud/request'
Dir[File.join(File.dirname(__FILE__),'ruby-icloud/responses/*.rb')].each do |f|
  require File.expand_path(f)
end
Dir[File.join(File.dirname(__FILE__),'ruby-icloud/requests/*.rb')].each do |f|
  require File.expand_path(f)
end


