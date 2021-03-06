require_relative 'spec_helper'

describe Battery do 
  before :each do 
    @battery = Battery.new
  end

  it 'should be an item' do
    expect(@battery).to be_a(Item)
  end

  it '#name' do
    expect(@battery.name).to eq("Battery")
  end

  it '#weight' do 
    expect(@battery.weight).to eq(25)
  end

end