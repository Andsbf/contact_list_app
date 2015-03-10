require_relative 'contact_database'

class Contact

  include ContactDatabase  

  attr_accessor :name, :email

  def initialize(name="default-value", email="default-value")
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
 
    def find(string) #return contact(s) or nil 
      catalog = ContactDatabase::read
      contact_finded = []

      catalog.each_with_index do |row,index| 
  
        if row.grep( Regexp.new( string , "i") ) != [] 
         contact_finded << row
        end

      end
      contact_finded = nil if contact_finded == []
      contact_finded
    end

    def find_exactly(string,user_or_email) #return contact or nil 
      user_or_email == "email" ? (user_or_email = 0) : user_or_email = 1
      Contact::find(string).collect{ |x| x[user_or_email]==string}
    end


    def all
      
      ContactDatabase::print_all
    end
    
    def show(id)
      catalog = ContactDatabase::read

      catalog[id].each{|x| puts x}
    end
    
  end
 
end


