require_relative 'contact_database'

class Contact

  include ContactDatabase 

  attr_accessor :fname, :lname, :email, :id

  def initialize(fname, lname, email, id=nil)
    @fname = fname
    @lname = lname
    @email = email
    @id = id

  end
 
  def display
    puts "#{id} - #{fname} #{lname}: #{email}"
  end
 
  ## Class Methods
  class << self
    def create(fname, lname, email)
      ContactDatabase::add(Contact.new(fname, lname, email))
    end
 
    def search(string) #return contact(s) or nil 
      search_result = ContactDatabase::search(string.downcase)
      search_result.map {|contact| Contact.new(contact["fname"],contact["lname"],contact["email"],contact["id"].to_i) }   
    end

    def all #returns array with all contacts
      all_array = ContactDatabase::read
      all_array.map {|contact| Contact.new(contact["fname"],contact["lname"],contact["email"],contact["id"].to_i) }   
    end
    
    def find_by_id(id)
      contact = ContactDatabase::find_by_id(id).first
      Contact.new(contact["fname"],contact["lname"],contact["email"],contact["id"].to_i)
    end

    def delete(id)
      ContactDatabase::delete(id)
    end

    def new?(email)
      search(email)
    end

    def update(contact)
      ContactDatabase::update(contact)
    end
  end
end


