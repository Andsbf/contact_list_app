## TODO: Implement CSV reading/writing
# require_relative 'contact.rb'
require 'csv'
require 'pg'

module ContactDatabase 


  CONN = PG::Connection.new(
                              host: 'ec2-23-23-215-150.compute-1.amazonaws.com',
                              user: 'wzmatxiwqinsmz',
                              password: 'Mf3EaZWWK3YtRXZTA3nNz49m3Z',
                              dbname: 'davsgajl46v1v9' 
                            )

  def self.add(contact)
    CONN.exec_params('INSERT INTO contacts (fname, lname, email)
                      VALUES ($1, $2, $3) returning id', [contact.fname, contact.lname, contact.email])
    
  end

  def self.read
    all=[]
    CONN.exec_params('SELECT * FROM contacts ORDER BY id') do |rows|
      rows.each do |row|
        all << row
      end
    end
  all
  end

  def self.delete(id)
    CONN.exec_params('DELETE FROM contacts WHERE id = $1',[id]) 
  end
  
  def self.update(contact)
    CONN.exec_params('UPDATE contacts SET fname = $1, lname = $2 ,email = $3 WHERE id = $4 returning id', [contact.fname, contact.lname, contact.email, contact.id])
  end

  def find_by_id(id)
    
  end

end


