class List
  def initialize
    @all_tasks = []
    @save_dir = 'database.txt'
  end

  def add_task(tasks)
    @all_tasks << tasks
  end

  def show_all_tasks
    @all_tasks.each do |task|
      puts task.description
    end
  end

  def save(filename = @save_dir)
    File.open(filename, 'w') do |file|
      @all_tasks.each do |task|
        file.puts task.description
      end
    end
  end

  def console_api
    command, *params = ARGV
    first_list = List.new

    case command
    when 'add'
      add_task Task.new params.join(' ')
    when 'complete'
      # TODO
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
    else
      puts 'don\'t know this command'
    end
  end

end

class Task
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

my_list = List.new
my_list.console_api
my_list.save
