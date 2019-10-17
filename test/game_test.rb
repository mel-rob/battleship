gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_initializes_with_player_objects
    assert_instance_of Board, @game.player_board
    assert_instance_of Ship, @player_cruiser

    assert_equal "Cruiser", @player_cruiser.name
    assert_equal 3, @player_cruiser.length

    assert_equal "Submarine", @player_submarine.name
    assert_equal 2, @player_submarine.length
  end

  def test_it_initializes_with_computer_objects
    assert_instance_of Board, @computer_board
    assert_instance_of Ship, @computer_cruiser

    assert_equal "Cruiser", @computer_cruiser.name
    assert_equal 3, @computer_cruiser.length

    assert_equal "Submarine", @computer_submarine.name
    assert_equal 2, @computer_submarine.length
  end

  def test_computer_generates_valid_ship_placement
    @game.computer_place_ship(@computer_cruiser)
    assert_equal true, @player_board.valid_placement?(@computer_cruiser, @game.computer_place_ship(@computer_cruiser))

    @game.computer_place_ship(@computer_submarine)
    assert_equal true, @player_board.valid_placement?(@computer_submarine, @game.computer_place_ship(@computer_submarine))
  end

  def test_computer_can_place_ships
    @computer_board.place(@computer_cruiser, ["A1", "A2", "A3"])
    assert_equal 3, @computer_board.render(true).count("S")

    @computer_board.place(@computer_submarine, ["B1", "B2"])
    assert_equal 5, @computer_board.render(true).count("S")
  end

  def test_player_can_place_ships
    @player_board.place(@player_cruiser, ["A1", "A2", "A3"])
    assert_equal 3, @player_board.render(true).count("S")

    @player_board.place(@player_submarine, ["B2", "B3"])
    assert_equal 5, @player_board.render(true).count("S")
  end

  def test_computer_can_fire
    @player_board.place(@player_cruiser, ["A1", "A2", "A3"])
    @player_board.cells["A1"].fire_upon
    assert_equal 1, @player_board.render.count("H")

    @player_board.cells["B1"].fire_upon
    assert_equal 1, @player_board.render.count("H")
    assert_equal 1, @player_board.render.count("M")
  end

  def test_player_can_fire
    @computer_board.place(@computer_cruiser, ["A1", "A2", "A3"])
    @computer_board.cells["A1"].fire_upon
    assert_equal 1, @computer_board.render.count("H")

    @computer_board.cells["B1"].fire_upon
    assert_equal 1, @computer_board.render.count("H")
    assert_equal 1, @computer_board.render.count("M")
  end

end
