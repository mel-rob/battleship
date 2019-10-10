gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_it_has_another_name
    assert_equal "Submarine", @submarine.name
  end

  def test_it_has_a_length
    assert_equal 3, @cruiser.length
  end

  def test_it_has_another_length
    assert_equal 2, @submarine.length
  end

  def test_it_has_a_health
    assert_equal 3, @cruiser.health
  end

  def test_it_has_another_health
    assert_equal 2, @submarine.health
  end

  def test_it_got_hit
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

  def test_another_got_hit
    @submarine.hit
    assert_equal 1, @submarine.health
  end

  def test_health_decreases_when_hit
    @cruiser.hit
    @cruiser.hit
    assert_equal 1, @cruiser.health
  end

  def test_another_health_decreases_when_hit
    @submarine.hit
    @submarine.hit
    assert_equal 0, @submarine.health
  end

  def test_sunk_when_health_equals_zero
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end

  def test_another_sunk_when_health_equals_zero
    @submarine.hit
    @submarine.hit
    assert_equal true, @submarine.sunk?
  end

end
