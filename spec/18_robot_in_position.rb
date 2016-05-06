require_relative 'spec_helper'

describe Robot do

  describe '#self.in_position' do
    before :each do
      @robot = Robot.new
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot3 = Robot.new
    end

    it 'should return all Robots with same cooordinates' do
      @robot.move_up
      expect(Robot.in_position(0,0)).to include(@robot1,@robot2,@robot3)
    end

  end
end
