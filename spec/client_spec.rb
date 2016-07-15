require("rspec")
require("pg")
require("task")

DB = PG.connect({:dbname => 'hair_salon_test'})

RSPEC.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do
end  
