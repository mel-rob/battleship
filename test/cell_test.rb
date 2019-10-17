gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'


class CellTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B2")
    @cell_2 = Cell.new("C3")
    @cell_3 = Cell.new("C4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_it_has_coordinate
    assert_equal "B2", @cell_1.coordinate
  end

  def test_ship_starts_as_nil
    assert_equal nil, @cell_1.ship
  end

  def test_cell_empty_when_ship_placed
    assert_equal true, @cell_1.empty?

    @cell_1.place_ship(@cruiser)
    assert_equal false, @cell_1.empty?
  end

  def test_fired_upon_starts_as_false
    assert_equal false, @cell_1.fired_upon
  end

  def test_fired_upon_can_change
    @cell_1.fire_upon
    assert_equal true, @cell_1.fired_upon
  end

  def test_render_returns_correct_value
    assert_equal ".", @cell_1.render

    @cell_1.fire_upon
    assert_equal "M", @cell_1.render

    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
    assert_equal "S", @cell_2.render(true)
    assert_equal false, @cell_2.fired_upon

    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
    assert_equal true, @cell_2.fired_upon

    @cell_1.place_ship(@cruiser)
    @cell_3.place_ship(@cruiser)
    @cell_1.fire_upon
    @cell_3.fire_upon
    assert_equal "X", @cell_2.render
  end

end
