require_relative 'contact'
require_relative 'contact_database'
require_relative 'application'
require 'pry'

raise "\n
List of available commands:\n
new  - Create a new contact
list - List all contacts
show 'id' - Show a contact
find 'blah'- Find a contact
delete  'id' - Delete a contact\n" if ARGV[0].nil?
app = Application.new
app.user_input

  