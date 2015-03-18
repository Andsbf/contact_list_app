require 'active_record'

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  dbname: 'davsgajl46v1v9',
  user: 'wzmatxiwqinsmz',
  password: 'Mf3EaZWWK3YtRXZTA3nNz49m3Z',
  host: 'ec2-23-23-215-150.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

# ActiveRecord::Schema.define do
  # drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
  # drop_table :phones if ActiveRecord::Base.connection.table_exists?(:phones)
  # create_table :contacts do |t|
  #   t.column :fname, :string
  #   t.column :lname, :string
  #   t.column :mens_apparel, :boolean
  #   t.column :womens_apparel, :boolean
  #   t.timestamps
  # end
  # create_table :phones do |table|
  #   table.references :store
  #   table.column :first_name, :string
  #   table.column :last_name, :string
  #   table.column :hourly_rate, :integer
  #   table.timestamps
  # end
# end

puts "Setup DONE\n\n"
