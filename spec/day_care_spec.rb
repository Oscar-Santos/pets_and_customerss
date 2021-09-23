require 'rspec'
require './lib/day_care'
require './lib/customer'
require './lib/pet'

describe DayCare do
  it 'test_it_exists' do
    day_care = DayCare.new("The Dog Spot")
    expect(day_care).to be_a DayCare
  end

  it 'test_it_has_a_name' do
    day_care = DayCare.new("The Dog Spot")
    expect(day_care.name).to eq("The Dog Spot")
  end

  it 'test_it_starts_with_no_customers' do
    day_care = DayCare.new("The Dog Spot")
    expect(day_care.customers).to eq([])
    end

  it 'test_it_can_add_customers' do
    day_care = DayCare.new("The Dog Spot")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    day_care.add_customer(joel)
    day_care.add_customer(billy)
    expect(day_care.customers).to eq([joel, billy])
  end

  it 'test_it_can_list_unfed_pets' do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 3)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)
    day_care = DayCare.new("The Dog Spot")
    day_care.add_customer(joel)
    day_care.add_customer(billy)
    lucy.feed

    expect(day_care.unfed_pets).to eq([samson, molly])
  end

  it 'test_it_can_find_customer_by_id' do
    joel = Customer.new("Joel", 2)
    joel.charge(10)
    billy = Customer.new("Billy", 3)
    day_care = DayCare.new("The Dog Spot")
    day_care.add_customer(joel)
    day_care.add_customer(billy)
    expect(day_care.customer_by_id(2)).to eq joel
  end
end
