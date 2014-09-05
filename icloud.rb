require './lib/ruby-icloud'
require 'pry'

def get_password
  prompt="Password: [typing will be hidden]"
  `read -s -p "#{prompt}" password; echo $password`.chomp
end

def get_username
  puts "Welcome! Please enter your iCloud username:"
  gets.chomp
end

c = RubyiCloud::Client.new

authorized = false
until authorized
  begin
    username = get_username
    password = get_password
    puts 'Authorizing..'
    authorized = c.authorize(username, password)
  rescue
    puts "I'm sorry, either your username or passowrd were incorrect."
    authorized = false
  end
end

p c.account_info


