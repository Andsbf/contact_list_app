# Helper file to setup our tests/specs for this program.
# NO NEED TO EDIT
    
require 'pry'
require 'rspec'
      
RSpec.configure do |config|
  config.color = true
   config.formatter = :documentation
  # config.format = :documentation
end

def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end
    
safely_require 'contact.rb'
safely_require 'application.rb'
safely_require 'contact_list.rb'