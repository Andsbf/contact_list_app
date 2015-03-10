## TODO: Implement CSV reading/writing
# require_relative 'contact.rb'
require 'csv'

module ContactDatabase 

  def self.print_all
    # binding.pry
    i = 0
    puts ""
    CSV.foreach('contacts.csv') do |name,email|
      i += 1
      puts "#{i}: #{name} (#{email})"
    end
    puts "---\n#{self.length} record(s) total"
  end

  def self.add(contact)

    CSV.open('contacts.csv', 'a') do |csv_object|  
      csv_object << [contact.name, contact.email]
    end
  end

  def self.read
    CSV.read("contacts.csv")
  end

  private

  def self.length
    # binding.pry
    db = CSV.read("contacts.csv")
    db.length
  end

end


