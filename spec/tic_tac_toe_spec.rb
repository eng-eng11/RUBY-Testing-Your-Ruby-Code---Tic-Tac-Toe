# frozen_string_literal: true

require './board.rb'
require './game.rb'

# tests for the class Board
RSpec.describe Board do
  let(:board) { Board.new }

  describe '#draw_board' do
    it 'draw board appropriately' do
      str_a = "\t 1 | 2 | 3 \n\t---|---|---"
      str_b = "\n\t 4 | 5 | 6 \n\t---|---|---"
      str_c = "\n\t 7 | 8 | 9 "
      expect(board.draw_board([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq(str_a + str_b + str_c)
    end
  end

  describe '#update_field_values' do
    it 'update field values properly' do
      expect(board.update_field_values('X', 3)).to eq('X')
    end
  end
end

# tests for the class Game
RSpec.describe Game do
  let(:game) { Game.new }

  describe '#play_turn' do
    it 'sets a turn adequately returning 0 for success' do
      expect(game.play_turn).to eq([0])
    end
  end

  describe '#populate_display' do
    it 'populates the display appropriately returning 0 for success' do
      expect(game.populate_display).to eq(0)
    end
  end

  describe 'switch_player' do
    it 'successfully switch the player by returning 0 for success' do
      expect(game.switch_player).to eq(0)
    end
  end

  describe 'over?' do
    it 'successfully finish the game with the first winning condition' do
      expect(game.over?([1, 2, 3])).to eq(true)
    end

    it 'successfully finish the game with the second winning condition' do
      expect(game.over?([4, 5, 6])).to eq(true)
    end

    it 'successfully finish the game with the third winning condition' do
      expect(game.over?([7, 8, 9])).to eq(true)
    end

    it 'successfully finish the game with the fourth winning condition' do
      expect(game.over?([1, 4, 7])).to eq(true)
    end

    it 'successfully finish the game with the fifth winning condition' do
      expect(game.over?([2, 5, 8])).to eq(true)
    end

    it 'successfully finish the game with the sixth winning condition' do
      expect(game.over?([3, 6, 9])).to eq(true)
    end

    it 'successfully finish the game with the seventh winning condition' do
      expect(game.over?([1, 5, 9])).to eq(true)
    end

    it 'successfully finish the game with the eighth winning condition' do
      expect(game.over?([3, 5, 7])).to eq(true)
    end

    it 'continue the game if the given array is not one from the winning options' do
      expect(game.over?([1, 4, 9])).to eq(false)
    end
  end
end

# tests for the class Player
RSpec.describe Player do
  let(:player) { Player.new('Test name', 'X') }

  describe '#add_cell' do
    it 'correctly add the cell selected to the player selected cell' do
      expect(player.add_cell(3)).to eq([3])
    end
  end
end
