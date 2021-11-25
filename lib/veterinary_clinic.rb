class VeterinaryClinic

  attr_reader :name,
              :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def pets_sorted_by_age
    result = @customers.map do |customer|
      customer.pets
    end.flatten
    result.sort_by do |pet|
      pet.age
    end.reverse
  end

  def number_of_pets(customer)
    @customers.count do |customer|
      customer.pets
    end
  end

end
