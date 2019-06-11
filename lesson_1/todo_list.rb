class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def undone!
    self.done = false
  end

  def done?
    @done
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    raise TypeError.new("Can only add Todo objects") unless task.is_a? Todo
    @todos << task
  end

  alias_method :<<, :add

  def each
    @todos.each do |item|
      yield(item)
    end
    self
  end

  def select
    new_list = TodoList.new('Selected')
    each do |item|
      new_list << item if yield(item)
    end
    new_list
  end

  def all_done
    select { |item| item.done? }
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def find_by_title(title)
    each do |item|
      return item if item.title == title
    end
    nil
  end

  def mark_done(str)
    find_by_title(str).done!
  end

  def mark_all_done
    each do |item|
      item.done!
    end
  end

  def mark_all_undone
    each do |item|
      item.undone!
    end
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each { |item| item.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map { |item| item.to_s }.join("\n")
    text
  end
end

todo1 = Todo.new('Buy Salmon')
todo2 = Todo.new('Code')
todo3 = Todo.new('Dont make a fuss')

list = TodoList.new('Todays Todos')

list.add(todo1)
list.add(todo2)
list << todo3

list.mark_all_undone

puts list.all_not_done








