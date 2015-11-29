class List
  def initialize
    @all_tasks = {}
    @save_dir = 'database.txt'
    @new_id = 0
  end

  def add_task(task)
    @all_tasks[@new_id] = task
    @new_id += 1
  end

  def show_all_tasks
    @all_tasks.each do |_, task|
      puts task.description
    end
  end

  def complete(task_id)
    @all_tasks[task_id].completed = true if !@all_tasks[task_id].nil?
  end

  def delete(task_id)
    @all_tasks.delete(task_id)
  end

  def update(task_id, description)
    @all_tasks[task_id].description = description
  end

  def save(filename = @save_dir)
    File.open(filename, 'w') do |file|
      @all_tasks.each do |_, task|
        file.puts task.description
      end
    end
  end

  def console_api
    command, *params = ARGV
    first_list = List.new

    case command
    when 'add'
      add_task Task.new(params.join(' '))
    when 'complete'
      complete params.join(' ').to_i
    when 'print'
      show_all_tasks
    when 'read'
      filename = params.join ' '
      File.open(filename, 'r').each do |line|
        add_task Task.new(line.chomp)
      end
    when 'save'
      filename = params.join ' '
      save filename
    when 'delete'
      delete params.join(' ').to_i
    when 'update'
      update(params[0].to_i, params[1])
    else
      puts 'don\'t know this command'
    end
  end

end

class Task
  attr_accessor :description
  attr_accessor :completed

  def initialize(description)
    @description = description
    @completed = false
  end

end

my_list = List.new
my_list.console_api
my_list.save
