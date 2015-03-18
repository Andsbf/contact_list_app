class Phone < ActiveRecord::Base

  attr_accessor :num, :type, :contact_id

  def initialize(type,num,contact_id)
    @type = type
    @num = num
    @contact_id = contact_id
  end

  def save
    ContactDatabase::add_phone(self)
  end

  def display
    puts "#{type} : #{num}"
  end
end
