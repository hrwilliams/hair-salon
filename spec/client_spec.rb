require('spec_helper')

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Hair Bag", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe ('#name') do
    it ('lets you read the client name') do
      test_client = Client.new({:name => 'Hair Bag', :stylist_id => 1})
      expect(test_client.name()).to(eq('Hair Bag'))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:name => "Hair Bag", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end


  describe ("#==") do
    it("is the same client if it has the same name and stylist ID") do
      client1 = Client.new({:name => "Hair Bag", :stylist_id => 1})
      client2 = Client.new({:name => "Hair Bag", :stylist_id => 1})
    expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
      it "returns a client by its ID" do
        test_client = Client.new({:name => "Hair", :stylist_id => 1, :id => nil})
        test_client.save()
        test_client2 = Client.new({:name => "Harry", :stylist_id => 1, :id => nil})
        test_client2.save()
        expect(Client.find(test_client2.id())).to(eq(test_client2))
      end
    end

describe("#update") do
    it("lets you update clients in the database") do
      client = Client.new({:name => "Arnold", :stylist_id => 1, :id => nil})
      client.save()
      client.update({:name => "Alan"})
      expect(client.name()).to(eq("Alan"))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Client.new({:name => "Client guy", :stylist_id => 1, :id => nil})
      client.save()
      client2 = Client.new({:name => "Bob", :stylist_id => 1, :id => nil})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end
end
