require_relative 'spec_helper'

describe Robot do

  describe '#scan' do
    before :each do
      @robot = Robot.new
      @robot_not_in_range = Robot.new
      @robot_not_in_range.position[4,5]
    end

    after :each do
      Robot.class_variable_set :@@robot_list, []
    end

    it 'should return true if another robot is within surroundings' do
      @robot_in_range = Robot.new
      @robot_in_range.move_up
      expect(@robot.scan).to be true
    end

    it 'should return false if no robots are within surroundings' do
      expect(@robot.scan).to be false
    end

  end
end
