class Phone < ActiveRecord::Base

  belongs_to :contact

  def display
    puts "#{phone_type} : #{num}"
  end
end
