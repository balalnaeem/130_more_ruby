require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Dont tell anyone')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new('Todays List')
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel_operator
    new_todo = Todo.new('Code Like A MotherFucker')
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_method
    new_todo = Todo.new('Live Like A MotherFucker')
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
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
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
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
    removed = @list.remove_at(0)
    assert_equal(@todo1, removed)
  end

  def test_to_s
    output = <<~HEREDOC.chomp
    ---- Todays List ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Dont tell anyone
    HEREDOC
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~HEREDOC.chomp
    ---- Todays List ----
    [X] Buy milk
    [ ] Clean room
    [ ] Dont tell anyone
    HEREDOC
    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~HEREDOC.chomp
    ---- Todays List ----
    [X] Buy milk
    [X] Clean room
    [X] Dont tell anyone
    HEREDOC
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo}
    assert_equal(@todos, result)
  end

  def test_each_2
    result = @list.each { |todo| todo}
    assert(@list, result)
  end

  def test_select
    @list.mark_done_at(0)
    result = @list.select { |todo| todo.done? }
    assert_equal(@todo1, result.first)
  end

  def test_mark_all_done
    @list.mark_all_done
    done = @list.select { |todo| todo.done? }
    assert_equal(@list.item_at(0), done.item_at(0))
    assert_equal(@list.item_at(1), done.item_at(1))
    assert_equal(@list.item_at(2), done.item_at(2))
  end

  def test_mark_all_undone
    @list.mark_done_at(0)
    @list.mark_all_undone
    done = @list.select { |todo| !todo.done? }
    assert_equal(@list.item_at(0), done.item_at(0))
    assert_equal(@list.item_at(1), done.item_at(1))
    assert_equal(@list.item_at(2), done.item_at(2))
  end
end















