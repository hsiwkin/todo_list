class List
  def initialize
    @all_tasks = []
  end

  def add_task(tasks)
    @all_tasks << tasks
  end

  def show_all_tasks
    @all_tasks.each do |task|
      puts task.description
    end
  end

  def save(filename)
    File.open(filename, 'w') do |file|
      @all_tasks.each do |task|
        file.puts task.description
      end
    end
  end

end

class Task
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

command, *params = ARGV
first_list = List.new

replace_filter = Task.new('Replace water filter')
walk_cat = Task.new 'Walk the cat'
paint_chimney = Task.new 'Paint the chimney'
build_robot = Task.new 'Build a robot'

first_list.add_task replace_filter
first_list.add_task walk_cat
first_list.add_task paint_chimney
first_list.add_task build_robot

case command
when 'add'
  first_list.add_task Task.new params.join(' ')
when 'complete'
  # TODO
when 'print'
  first_list.show_all_tasks
when 'read'
  filename = params.join ' '
  File.open(filename, 'r').each do |line|
    first_list.add_task Task.new(line.chomp)
  end
when 'save'
  filename = params.join ' '
  first_list.save filename
else
  puts 'don\'t know this command'
end
