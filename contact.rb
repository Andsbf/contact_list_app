require_relative 'contact_database'

class Contact

  include ContactDatabase  

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email

  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      contact_instance = Contact.new(name,email)
      ContactDatabase::add(contact_instance)
    end
 
    def find(string)
      catalog = ContactDatabase::read
      
      catalog.each_with_index do |row,index| 
  
        row.grep( Regexp.new( string , "i") ) != [] ? row.each{|i| puts"#{i}"} : "Contact not found" 
      end

    end
 
    def all
      # binding.pry
      ContactDatabase::print_all
    end
    
    def show(id)
      catalog = ContactDatabase::read

      catalog[id].each{|x| puts x}
    end
    
  end
 
end

