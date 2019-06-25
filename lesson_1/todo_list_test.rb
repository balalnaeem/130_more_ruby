require 'simplecov'
SimpleCov.start

require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative "todo_list"

class TodoListTest < Minitest::Test


  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos.slice(1, 2), @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(@todos.slice(0, 2), @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_typer_error_raised
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi')}
    assert_raises(TypeError) { @list.add(:symbol) }
    assert_raises(TypeError) { @list.add([1, 2, 3]) }
    assert_raises(TypeError) { @list.add({a: 1, b: 2})}
  end

  def test_shovel_works
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100)}
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    @list.mark_done_at(2)

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @list.mark_done_at(2)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |task| task.done! }
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each_2
    assert_equal(@list, @list.each { |item| true })
  end

  def test_select
    @list.mark_done_at(0)
    done_tasks = @list.select { |task| task.done? }
    assert_equal(done_tasks.to_a, [@todo1])
  end
end
































