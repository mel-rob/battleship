gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_player'
require 'pry'

class ComputerPlayerTest < Minitest::Test

  def setup
    @computer_player = ComputerPlayer.new
  end

  def test_it_exists
    assert_instance_of ComputerPlayer, @computer_player
  end

  def test_it_has_board
    @computer_player.create_player
    assert_instance_of Board, @computer_player.computer_board
  end

  def test_it_has_cruiser
    @computer_player.create_player
    assert_instance_of Ship, @computer_player.computer_cruiser
    assert_equal "Cruiser", @computer_player.computer_cruiser.name
  end

  def test_it_has_submarine
    @computer_player.create_player
    assert_instance_of Ship, @computer_player.computer_submarine
    assert_equal "Submarine", @computer_player.computer_submarine.name
  end
end
