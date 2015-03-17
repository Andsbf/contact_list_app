require_relative 'contact'
require_relative 'contact_database'
require_relative 'application'
require 'pry'

raise "type something after prog. name. Eg. help" if ARGV[0].nil?
app = Application.new
app.user_input

  