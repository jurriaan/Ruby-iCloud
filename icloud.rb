require './lib/ruby-icloud'
require 'pry'
if ARGV.length == 2
  c = RubyiCloud::Client.new
  puts 'Authorizing..'
  if c.authorize(ARGV[0], ARGV[1])
    puts "Welcome to iCloud, #{c.account_info[:fullName]}"
    p c.account_info
    # p c.process RubyiCloud::InitClientRequest
    binding.pry
  end
else
  puts 'Please supply mail and password'
end
