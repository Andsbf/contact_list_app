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
      contact_finded = Contact.find(ARGV[1].downcase) rescue "Please type something after find"
      contact_finded.each{|x| puts "#{x[0]} : #{x[1]}" }
    when "help"
      self.help
    else
      p "Option not found, try again"
         
    end
    
  end

  def create
    p "Please input contact email:"
    contact_email = STDIN.gets.chomp
    return p "This Email already exist in you contact list!"  if Application::repeated_mail?(contact_email) 
    p "Please input contact full name:"
    contact_full_name = STDIN.gets.chomp
    contact_instance = Contact.create(contact_full_name, contact_email)
  
  end
  
  private

  def self.repeated_mail? contact_email_or_name
    
    Contact.find_exactly(contact_email_or_name,"email") ? true : false rescue false
      
  end

end



