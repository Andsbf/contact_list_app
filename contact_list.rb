require_relative 'setup.rb'
require_relative 'contact'
require_relative 'contact_database'
require_relative 'application'
require 'pry'


raise "\n
List of available commands:\n
new  - Create a new contacts
list - List all contacts
show 'id' - Show a contact details, Eg. phone!
find 'blah'- Find a contact
phone 'id' - add phone to an contact
delete  'id' - Delete a contact\n" if ARGV[0].nil?

app = Application.new
app.user_input

  