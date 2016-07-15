require('spec_helper')

describe(Client) do
  describe ('#name') do
    it ('tells you the client name') do
      test_client = Client.new({:name => 'H. Bag'})
      expect(test_client.name()).to(eq('H. Bag'))
    end
  end

  describe ("#==") do
  it("is the same client if it has the same name") do
    client1 = Client.new({:name => "H. Bag"})
    client2 = Client.new({:name => "H. Bag"})
    expect(client1).to(eq(client2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end
end
