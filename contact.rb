require_relative 'contact_database'
require_relative 'phone'
require 'active_record'


class Contact 
  include ContactDatabase 

  attr_accessor :fname, :lname, :email, :id, :phones

  def initialize(fname, lname, email, id=nil,phones=[])
    @fname = fname
    @lname = lname
    @email = email
    @id = id
    @phones = phones
  end
 
   def display_detail
    
    puts "#{id} - #{fname} #{lname}: \n#{email}; \nPhone(s):"
    phones.each {|x| x.display} 
  end

  def display
    
    puts "#{id} - #{fname} #{lname}: #{email};"
    
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
      contact = ContactDatabase::find_by_id(id)
      result = Contact.new(contact[0]["fname"],contact[0]["lname"],contact[0]["email"],contact[0]["id"].to_i)
      result.phones = contact.map { |contact| Phone.new(contact["type"], contact["num"], contact["id"]) }
      result
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


