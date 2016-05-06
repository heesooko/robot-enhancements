require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

describe '.robot_list' do
 it 'should add new robot to list' do
  expect(Robot.robot_list).to include(@robot)
  end
end

end