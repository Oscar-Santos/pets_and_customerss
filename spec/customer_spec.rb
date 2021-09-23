require 'rspec'
require './lib/customer'
require './lib/pet'

describe Customer do
  it 'test_it_exists' do
    joel = Customer.new("Joel", 2)
    expect(joel).to be_an_instance_of(Customer)
  end

  it 'test_it_has_attributes' do
    joel = Customer.new("Joel", 2)
    expect(joel.name).to eq "Joel"
    expect(joel.id).to eq 2
  end

  it 'test_it_starts_with_no_pets' do
    joel = Customer.new("Joel", 2)
    expect(joel.pets).to eq([])
  end

  it 'test_it_can_adopt_pets' do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    expect(joel.pets).to eq([samson, lucy])
  end

  it 'test_its_outstanding_balance_starts_at_zero' do
    joel = Customer.new("Joel", 2)
    expect(joel.outstanding_balance).to eq 0
  end

  it 'test_it_can_charge_to_increase_outstanding_balance' do
    joel = Customer.new("Joel", 2)
    joel.charge(15)
    joel.charge(7)
    expect(joel.outstanding_balance).to eq 22
  end
end
