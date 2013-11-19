require 'bundler/setup'

require './lib/ruby-icloud/util'
require './lib/ruby-icloud/client'
require './lib/ruby-icloud/response'
require './lib/ruby-icloud/plistresponse'
require './lib/ruby-icloud/jsonresponse'
require './lib/ruby-icloud/protobufresponse'
require './lib/ruby-icloud/request'

require "./lib/ruby-icloud/protodef/backup.rb"

require "./lib/ruby-icloud/responses/accountsettingsresponse.rb"
require "./lib/ruby-icloud/responses/authenticationresponse.rb"
require "./lib/ruby-icloud/responses/Backup/backupdevicesresponse.rb"
require "./lib/ruby-icloud/responses/Backup/backupdeviceresponse.rb"
require "./lib/ruby-icloud/responses/Backup/backupfilesresponse.rb"
require "./lib/ruby-icloud/responses/Backup/backupgetfilesresponse.rb"
require "./lib/ruby-icloud/responses/Backup/backupkeysresponse.rb"
require "./lib/ruby-icloud/responses/configurationresponse.rb"
require "./lib/ruby-icloud/responses/defaultresponse.rb"
require "./lib/ruby-icloud/responses/FindMyiPhone/initclientresponse.rb"
require "./lib/ruby-icloud/responses/FindMyiPhone/updateclientresponse.rb"

require "./lib/ruby-icloud/requests/accountsettingsrequest.rb"
require "./lib/ruby-icloud/requests/authenticationrequest.rb"
require "./lib/ruby-icloud/requests/Backup/backupdevicesrequest.rb"
require "./lib/ruby-icloud/requests/Backup/backupdevicerequest.rb"
require "./lib/ruby-icloud/requests/Backup/backupfilesrequest.rb"
require "./lib/ruby-icloud/requests/Backup/backupgetfilesrequest.rb"
require "./lib/ruby-icloud/requests/Backup/backupkeysrequest.rb"
require "./lib/ruby-icloud/requests/configurationrequest.rb"
require "./lib/ruby-icloud/requests/FindMyiPhone/initclientrequest.rb"
require "./lib/ruby-icloud/requests/FindMyiPhone/updateclientrequest.rb"