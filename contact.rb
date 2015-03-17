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
 
    def find(string) #return contact(s) or nil 
      string = Regexp.new(string,'i')
      all.select do |contact|
        (string =~ contact.fname) || (string =~ contact.lname) || (string =~ contact.email) 
      end
    end

    def all #returns array with all contacts
      all_array = ContactDatabase::read
      all_array.map {|contact| Contact.new(contact["fname"],contact["lname"],contact["email"],contact["id"].to_i) }   
    end
    
    def find_by_id(id)
      all.select{ |contact| contact.id == id }.first
    end

    def delete(id)
      ContactDatabase::delete(id)
    end

    def new?(email)
      find(email)
    end

    def update(contact)
      ContactDatabase::update(contact)
    end
  end
end


