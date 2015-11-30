require 'rspec'
require_relative '../todo'

describe 'Core User Stories' do
  before {
    @my_list = List.new

  }

  it 'should create a todo list' do
    # TODO
  end

  it 'should add tasks to the todo list' do
    # TODO
  end

  it 'should show all tasks in a list' do
    # TODO
  end


end

describe 'Secondary User Stories' do
  it 'should open a list from a text file' do
    # TODO
  end

  it 'Ashould save a list to a text file' do
    # TODO
  end
end

describe 'Reach User Stories' do
  it 'should update a task' do
    # TODO
  end

  it 'should mark a task completed' do
    # TODO
  end

  it 'should delete a task' do
    # TODO
  end
end