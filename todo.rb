class List
  def initialize
    @all_tasks = []
  end

  def create_a_list
    # TODO
  end

  def add_task(tasks)
    @all_tasks << tasks
  end

  def show_all_tasks
    @all_tasks.each do |task|
      puts task.description
    end
  end

  def save_task
    # TODO
  end
end

class Task
  attr_reader :description

  def create_task_item
    # TOOD
  end

  def initialize(description)
    @description = description
  end
end

command, *task_description = ARGV
first_list = List.new

case command
when 'add'
  first_list.add_task Task.new task_description.join(' ')
when 'complete'
  # TODO
else
  # TODO
end

first_list.show_all_tasks

#
#
# replace_filter = Task.new('Replace water filter')
# walk_cat = Task.new 'Walk the cat'
# paint_chimney = Task.new 'Paint the chimney'
# build_robot = Task.new 'Build a robot'
#
# first_list.add_task replace_filter
# first_list.add_task walk_cat
# first_list.add_task paint_chimney
# first_list.add_task build_robot
#
# first_list.show_all_tasks