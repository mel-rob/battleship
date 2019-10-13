gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_board
    @player.create_player
    assert_instance_of Board, @player.player_board
  end

  def test_it_has_cruiser
    @player.create_player
    assert_instance_of Ship, @player.player_cruiser
    assert_equal "Cruiser", @player.player_cruiser.name
  end

  def test_it_has_submarine
    @player.create_player
    assert_instance_of Ship, @player.player_submarine
    assert_equal "Submarine", @player.player_submarine.name
  end

end
