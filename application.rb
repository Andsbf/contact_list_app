class Application

  def help
    puts "List of available commands:
          new  - Create a new contacts
          list - List all contacts
          show 'id' - Show a contact details, Eg. phone!
          find 'blah'- Find a contact
          phone 'id' - add phone to an contact
          delete  'id' - Delete a contact\n"
  end


  def user_input
    
    case ARGV[0]
    when "new"
      create_contact
    when "list"
      list #lists all contacts
    when "show"
      show_id(ARGV[1].to_i)
    when "find"
      return  (p "type something after find") if ARGV[1].nil?
      find (ARGV[1].downcase)
    when "help"
      self.help
    when "phone"
      add_phone(ARGV[1].to_i)
    when "delete"
      delete(ARGV[1].to_i)
    when "update"
      update(ARGV[1].to_i)
    else
      p "Option not found, try again"
    end
    
  end

  def create_contact
    p "Please input contact email:"
    email = STDIN.gets.chomp  

    if in_use?(email) == []
      p "Please input contact first name:"
      fname = STDIN.gets.chomp
      p "Please input contact last name:"
      lname = STDIN.gets.chomp
      Contact.create(fname: fname, lname: lname, email: email)
    else
      p "Email already exists in your contact list!"
    end
  end

  def find(string)
    result = Contact.where("fname LIKE ? OR lname LIKE ? OR email LIKE ?","%#{string}%","%#{string}%","%#{string}%")
    result.each { |contact| contact.display}
  end
    
  def list
    puts "ID |            contact"
    Contact.all.order(:fname).each { |contact| contact.display }
  end

  def in_use?(email) 
    Contact.where(email: email)
  end

  def show_id (id)
    Contact.find(id).display
  end

  def delete(id)
    Contact.find(id).display
    p "Are you sure?"
    confirmation = STDIN.gets.chomp.downcase
    binding.pry
    if ['yes','y'].include? confirmation
    Contact.find(id).destroy
    end
    
  end

  def update(id)

    return nil if id == 0
    
    tobe_updated = Contact.find(id)
    tobe_updated.display

    p "what do you want to update in?(type email of name)"
    what_to_update = STDIN.gets.chomp

    case what_to_update
    when "email"
      p "type new email:"
      new_data = STDIN.gets.chomp
      tobe_updated.update(email: new_data)
    when "name"
      p "type new first name:"
      new_data = STDIN.gets.chomp
      tobe_updated.update(fname: new_data)
    else
      raise "invalid Field"
    end
    tobe_updated.display
  end

  def add_phone(id)
    return nil if id == 0
    tobe_addphone = Contact.find(id)
    tobe_addphone.display

    puts "Digit Phone number?"
    phone_num = STDIN.gets.chomp
    p "type of phone?(mobile, home, office)"
    phone_type = STDIN.gets.chomp 
    
    tobe_addphone.phones.create(phone_type: phone_type, num: phone_num)
    
  end

end



