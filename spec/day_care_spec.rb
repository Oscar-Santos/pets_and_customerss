require './lib/pet'
require './lib/customer'
require './day_care'

RSpec.describe DayCare do
  it 'exists' do
    daycare = DayCare.new("The Caring Guys")
    expect(daycare).to be_a(DayCare)
  end

  it 'has info' do
    daycare = DayCare.new("The Caring Guys")
    expect(daycare.name).to eq("The Caring Guys")
    expect(daycare.customers).to eq([])
  end

  it 'can add customers' do
    daycare = DayCare.new("The Caring Guys")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("billy", 8)

    daycare.add_customer(joel)
    daycare.add_customer(billy)
    expect(daycare.customers).to eq([joel, billy])
  end

  it 'can find customer by his id' do
    joel = Customer.new("Joel", 2)
    billy = Customer.new("billy", 8)

    daycare = DayCare.new("The Caring Guys")
    daycare.add_customer(joel)
    daycare.add_customer(billy)
    expect(daycare.customer_by_id(2)).to eq(joel)
  end

  it 'can list all unfed pets' do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    joel.adopt(samson)
    joel.adopt(lucy)
    samson.feed

    billy = Customer.new("billy", 8)
    venus = Pet.new({name: "Venus", type: :cat, age: 1})
    billy.adopt(venus)

    daycare = DayCare.new("The Caring Guys")
    daycare.add_customer(joel)
    daycare.add_customer(billy)
    expect(daycare.unfed_pets).to eq([lucy, venus])
  end
end
