require_relative 'lib/ruby-icloud'
if ARGV.length == 2
  c = Cloud::Client.new
  puts "Authorizing.."
  if c.authorize(ARGV[0], ARGV[1])
    puts "Welcome to iCloud, #{c.account_info[:fullName]}"
  end
else
  puts "Please supply mail and password"
end

