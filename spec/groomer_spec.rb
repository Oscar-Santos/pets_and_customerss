require './lib/pet'
require './lib/customer'
require './lib/groomer'

RSpec.describe Groomer do
  it 'exists' do
    groomer = Groomer.new("The Hair Specialists")
    expect(groomer).to be_a(Groomer)
  end

  it 'has info' do
    groomer = Groomer.new("The Hair Specialists")
    expect(groomer.name).to eq("The Hair Specialists")
    expect(groomer.customers).to eq([])
  end

  it 'can add customers' do
    groomer = Groomer.new("The Hair Specialists")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 8)

    groomer.add_customer(joel)
    groomer.add_customer(billy)
    expect(groomer.customers).to eq([joel, billy])
  end

  it 'can find all customers with outstanding balances' do
    joel = Customer.new("Joel", 2)
    joel.charge(22)
    billy = Customer.new("Billy", 8)
    groomer = Groomer.new("The Hair Specialists")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    expect(groomer.customers_w_o_b).to eq([joel])
  end

  it 'can count number of pets of a given type' do
    joel = Customer.new("Joel", 2)
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    joel.adopt(lucy)
    billy = Customer.new("Billy", 8)
    venus = Pet.new({name: "Venus", type: :cat, age: 1})
    billy.adopt(venus)

    groomer = Groomer.new("The Hair Specialists")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    expect(groomer.number_of_pets(:cat)).to eq(2)

  end
end
