class Application

# attr_accessor

  def help
    puts "Here is a list of available commands:
       new  - Create a new contact
       list - List all contacts
       show - Show a contact
       find - Find a contact"
  end


  def user_input
    
    case ARGV[0]
    when "new"
      self.create
    when "list"
      Contact.all
    when "show"
      id = (ARGV[1].to_i) -1 #minus 1 adjust to ID to db array
      Contact.show(id) 
    when "find"
      Contact.find(ARGV[1].downcase)
    when "help"
      self.help
    else
      p "Option not found, try again"
         
    end
    
  end

  def create
    p "Please input contact full name:"
    contact_full_name = STDIN.gets.chomp
    p "Please input contact email:"
    contact_email = STDIN.gets.chomp
    contact_instance = Contact.create(contact_full_name, contact_email)
    

  end

end

