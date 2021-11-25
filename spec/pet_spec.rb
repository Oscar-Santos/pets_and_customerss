require './lib/pet'

RSpec.describe Pet do
  it 'exists' do
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    expect(samson).to be_a(Pet)
  end

  it 'has info' do
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    expect(samson.name).to eq("Samson")
    expect(samson.type).to eq(:dog)
    expect(samson.age).to eq(3)
  end

  it 'is not fed by default' do
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    expect(samson.fed?).to eq(false)
    samson.feed
    expect(samson.fed?).to eq(true)
  end
end
