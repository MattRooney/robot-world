require 'sequel'
require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/robot_world_#{env}.sqlite3").create_table(:robots) do
    primary_key :id
    String  :name
    String  :city
    String  :state
    String  :birthday
    String  :hired
    String  :department 
  end
end
