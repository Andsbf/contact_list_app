## TODO: Implement CSV reading/writing
# require_relative 'contact.rb'
require 'csv'
require 'pg'

module ContactDatabase 

# Psql:  heroku pg:psql --app heroku-postgres-05dfbfb3 HEROKU_POSTGRESQL_CRIMSON

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

  def self.find_by_id(id)
    CONN.exec_params('SELECT c.id, c.fname, c.lname, c.email, p.type, p.num
                      FROM contacts AS c LEFT OUTER JOIN phones AS p 
                      ON (c.id = p.contact_id) WHERE c.id = $1',[id])
  end

  def self.search(string)
    CONN.exec_params("SELECT * FROM contacts 
                      WHERE LOWER(fname) LIKE $1
                            OR LOWER(lname) LIKE $1 
                            OR LOWER(email) LIKE $1 ORDER BY id" ,["%#{string}%"])
  end

  def self.add_phone(phone)
      CONN.exec_params('INSERT INTO phones (contact_id, type, num)
                      VALUES ($1, $2, $3) returning id', [phone.contact_id, phone.type, phone.num])
  end
end


