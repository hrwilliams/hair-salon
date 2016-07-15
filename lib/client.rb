class Client
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end
end
