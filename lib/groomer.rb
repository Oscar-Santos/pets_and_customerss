class Groomer

  attr_reader :name,
              :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customers_w_o_b
    @customers.find_all do |customer|
      customer.outstanding_balance > 0
    end
  end

  def number_of_pets(type)
    result = @customers.map do |customer|
      customer.pets
    end.flatten
    result.count do |pet|
      pet.type == type
    end
  end
end
