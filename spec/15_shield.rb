require_relative 'spec_helper'

describe Robot do 
  before :each do 
    @robot = Robot.new
  end

    describe '#wound' do
      it 'should drain from the shield points first' do
        @robot.wound(30)
        expect(@robot.shield_points).to eq(20)
        expect(@robot.health).to eq(100)
      end

      it 'should drain from health once shield points are drained' do
        @robot.wound(70)
        expect(@robot.shield_points).to eq(0)
        expect(@robot.health).to eq(80)
      end
    end

end
  