class Application

# attr_accessor

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
      show_id
    when "find"
      return  (p "type something after find") if ARGV[1].nil?
      contact_finded = Contact.search(ARGV[1].downcase) 
      contact_finded.each{|x| x.display}
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
    if new?(email) == []
      p "Please input contact first name:"
      fname = STDIN.gets.chomp
      p "Please input contact last name:"
      lname = STDIN.gets.chomp
      Contact.create(fname, lname, email)
    else
      p "Email already exists in your contact list!"
    end
  end
    
  def list
    Contact.all.each { |contact| contact.display }
  end

  def new?(email)
    Contact.new?(email)
  end

  def show_id
    id = (ARGV[1].to_i)
    raise "Empty input" if ARGV[1] == nil
    contact_to_show = Contact.find_by_id(id) 
    contact_to_show ? contact_to_show.display_detail : (puts "ID not found!")
    rescue
      p "please input a contact id"
  end

  def delete(id)
    Contact.delete(id)
    list
  end

  def update(id)

    return nil if id == 0
    
    tobe_updated = Contact.find_by_id(id) 
    
    tobe_updated.display
    p "what do you want to update in?(type email of name)"
    what_to_update = STDIN.gets.chomp

    case what_to_update
    when "email"
      p "type new email:"
      new_data = STDIN.gets.chomp
      tobe_updated.email = new_data
    when "name"
      p "type new first name:"
      new_data = STDIN.gets.chomp
      tobe_updated.fname = new_data
    else
      raise "invalid Field"
    end

    Contact.update(tobe_updated)
    list
    rescue NoMethodError,"Invalid ID"
  end

  def add_phone(id)
    return nil if id == 0
    tobe_addphone = Contact.find_by_id(id)
    tobe_addphone.display

    puts "Digit Phone number?"
    phone_num = STDIN.gets.chomp
    p "type of phone?(mobile, home, office)"
    phone_type = STDIN.gets.chomp 
    phone_to_add = Phone.new(phone_type, phone_num,tobe_addphone.id)
    phone_to_add.save

  end

end



