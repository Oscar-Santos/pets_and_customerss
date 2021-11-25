require './lib/pet'
require './lib/customer'
require './lib/veterinary_clinic'

RSpec.describe VeterinaryClinic do
  it 'exists' do
    veterinaryclinic = VeterinaryClinic.new("The Pet Doctors")
    expect(veterinaryclinic).to be_a(VeterinaryClinic)
  end

  it 'has info' do
    veterinaryclinic = VeterinaryClinic.new("The Pet Doctors")
    expect(veterinaryclinic.name).to eq("The Pet Doctors")
    expect(veterinaryclinic.customers).to eq([])
  end

  it 'can add customers' do
    veterinaryclinic = VeterinaryClinic.new("The Pet Doctors")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 10)

    veterinaryclinic.add_customer(joel)
    veterinaryclinic.add_customer(billy)
    expect(veterinaryclinic.customers).to eq([joel, billy])
  end

  it 'can list all pets sorted by age(oldest to youngest)' do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 10)
    venus = Pet.new({name: "Venus", type: :cat, age: 1})
    billy.adopt(venus)

    veterinaryclinic = VeterinaryClinic.new("The Pet Doctors")
    veterinaryclinic.add_customer(joel)
    veterinaryclinic.add_customer(billy)
    expect(veterinaryclinic.pets_sorted_by_age).to eq([lucy, samson, venus])
  end

  it 'can count the number of pets of a customer' do
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 10)

    veterinaryclinic = VeterinaryClinic.new("The Pet Doctors")
    veterinaryclinic.add_customer(joel)
    veterinaryclinic.add_customer(billy)
    expect(veterinaryclinic.number_of_pets(joel)).to eq(2)
  end
end
