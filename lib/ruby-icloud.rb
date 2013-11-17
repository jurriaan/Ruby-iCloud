require 'bundler/setup'
require './lib/ruby-icloud/util'
require './lib/ruby-icloud/client'
require './lib/ruby-icloud/response'
require './lib/ruby-icloud/plistresponse'
require './lib/ruby-icloud/jsonresponse'
require './lib/ruby-icloud/protobufresponse'
require './lib/ruby-icloud/request'

Dir[File.join(File.dirname(__FILE__),'ruby-icloud/protodef/**/*.rb')].each do |f|
  require File.expand_path(f)
end
Dir[File.join(File.dirname(__FILE__),'ruby-icloud/responses/**/*.rb')].each do |f|
  require File.expand_path(f)
end
Dir[File.join(File.dirname(__FILE__),'ruby-icloud/requests/**/*.rb')].each do |f|
  require File.expand_path(f)
end


