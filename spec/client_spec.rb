require('spec_helper')

describe(Client) do
  describe ('#name') do
    it ('tells you the client name') do
      test_client = Client.new({:name => 'Hair Bag'})
      expect(test_client.name()).to(eq('Hair Bag'))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Hair Bag"})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe ("#==") do
  it("is the same client if it has the same name") do
    client1 = Client.new({:name => "Hair Bag"})
    client2 = Client.new({:name => "Hair Bag"})
    expect(client1).to(eq(client2))
    end
  end


end
