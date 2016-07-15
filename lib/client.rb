class Client

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end
end    
