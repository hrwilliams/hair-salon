require("rspec")
require("pg")
require("client")

DB = PG.connect({:dbname => 'hair_salon_test'})

RSPEC.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do
  describe ("#==")
  it("is the same client if it has the same name") do
    client1 = Client.new({:name => "H. Bag"})
    client2 = Client.new({:name => "H. Bag"})
    expect(client1).to(eq(client2))
    end
  end
end
