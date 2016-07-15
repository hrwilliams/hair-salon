require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end  

  describe("#name=") do
    it("tells you its name") do
      stylist = Stylist.new({:name => "Tommy RR Barber", :id => nil})
      expect(stylist.name()).to(eq("Tommy RR Barber"))
    end
  end
end
