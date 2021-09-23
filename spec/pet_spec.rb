require 'rspec'
require './lib/pet'

describe Pet do
  it 'test_it_exists' do
    samson = Pet.new({name: "Samson", type: :dog})
    expect(samson).to be_a Pet
  end

  it 'test_it_has_attributes' do
    samson = Pet.new({name: "Samson", type: :dog})
    expect(samson.name).to eq "Samson"
    expect(samson.type).to eq(:dog)
  end

  it 'test_it_is_not_fed_by_default' do
    samson = Pet.new({name: "Samson", type: :dog})
    expect(samson.fed?).to eq false
  end

  it 'test_it_can_be_fed' do
    samson = Pet.new({name: "Samson", type: :dog})
    samson.feed
    expect(samson.fed?).to eq true
  end
end
