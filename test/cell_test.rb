gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'


class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_ship_starts_as_nil
    assert_equal nil, @cell.ship
  end

  def test_fired_upon_starts_as_false
    skip
    assert_equal false, @cell.fired_upon
  end

  def test_cell_empty?
    skip
    assert_equal true, @cell.empty?
    cruiser = Ship.new("Cruiser", 3)

    @cell.place_ship(cruiser)
    assert_equal false, @cell.empty?
  end


end
