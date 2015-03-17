class Application

# attr_accessor

  def help
    puts "Here is a list of available commands:
       new  - Create a new contact
       list - List all contacts
       show 'id' - Show a contact
       find 'blah'- Find a contact
       delete  'id - Delete a contact'"
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
      contact_finded = Contact.find(ARGV[1].downcase) 
      contact_finded.each{|x| x.display}
    when "help"
      self.help
    when "phone"
      add_phone
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

  private

  def new?(email)
    Contact.new?(email)
  end

  def show_id
    id = (ARGV[1].to_i)
    raise "Empty input" if ARGV[1] == nil
    contact_to_show = Contact.find_by_id(id) 
    contact_to_show ? contact_to_show.display : (puts "ID not found!")
    rescue
    p "please input a contact id"
  end

  def delete(id)
    Contact.delete(id)
    list
  end

  def update(id)

    tobe_updated = Contact.find_by_id(id)
    tobe_updated.display
    p "what do you want to update in?(type email of name)"
    what_to_update = STDIN.gets.chomp
    return nil unless ["email", "name"].include? what_to_update
    p "type new #{what_to_update}:"
    new_data = STDIN.gets.chomp
    
    case what_to_update
    when "email"
      tobe_updated.email = new_data
    when "name"
      tobe_updated.name = new_data
    end

    Contact.update(tobe_updated)
    list
  end


end



