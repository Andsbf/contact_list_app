require_relative 'phone'
require 'active_record'

class Contact < ActiveRecord::Base

  has_many :phones
 
  def display   
    puts "#{id} - #{fname} #{lname}: #{email};"
    phones.each { |phone| puts "      #{phone.id} - #{phone.phone_type} phone : #{phone.num}" }
  end

end


