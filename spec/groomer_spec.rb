require 'rspec'
require './lib/groomer'
require './lib/customer'
require './lib/pet'

describe Groomer do
  it 'test_it_exists' do
    groomer = Groomer.new("The Hair Ball")
    expect(groomer).to be_a Groomer
  end

  it 'test_it_has_a_name' do
    groomer = Groomer.new("The Hair Ball")
    expect(groomer.name).to eq "The Hair Ball"
  end

  it 'test_it_starts_with_no_customers' do
    groomer = Groomer.new("The Hair Ball")
    expect(groomer.customers).to eq([])
  end

  it 'test_it_can_add_customers' do
    groomer = Groomer.new("The Hair Ball")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    expect(groomer.customers).to eq([joel, billy])
  end

  it 'test_it_can_count_the_number_of_pets_of_a_certain_type' do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 3)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)
    groomer = Groomer.new("The Hair Ball")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    expect(groomer.number_of_pets(:cat)).to eq 2
  end

  it 'test_it_can_list_customers_with_outstanding_balances' do
    joel = Customer.new("Joel", 2)
    joel.charge(10)
    billy = Customer.new("Billy", 3)
    groomer = Groomer.new("The Hair Ball")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    expect(groomer.customers_with_oustanding_balances).to eq([joel])
  end
end
