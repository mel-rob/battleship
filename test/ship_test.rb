gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

def setup
  @cruiser = Ship.new("Cruiser", 3)
end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

# Do we need this?
  def test_it_got_hit
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

# Is this duplicative of above?
  def test_health_decreases_when_hit
    @cruiser.hit
    @cruiser.hit
    assert_equal 1, @cruiser.health
  end

  def test_sunk_when_health_eqauls_zero
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end

end
