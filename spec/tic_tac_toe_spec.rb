# frozen_string_literal: true

require './game.rb'

describe Game do
<<<<<<< HEAD
  subject(:game) { Game.new() }
=======
  subject(:game) { Game.new }
>>>>>>> 4eee0904edacbc7d585849f94d935e39517acf1e

  describe '#switch_player' do
    it 'changes current_player to the other player' do
      player = game.current_player
      game.switch_player
      expect(game.current_player).not_to eq(player)
    end
  end

  describe '#over?' do
    it 'returns true when a win condition is met' do
      (1..3).each do |i|
        game.player_1.add_cell(i)
      end
      expect(game.over?).to be true
    end
  end
end

describe Board do
<<<<<<< HEAD
  subject(:board) { Board.new() }
=======
  subject(:board) { Board.new }
>>>>>>> 4eee0904edacbc7d585849f94d935e39517acf1e

  describe '#update_field_values' do
    it "add's a chosen location to the list of spaces taken" do
      board.update_field_values('x', 5)
      expect(board.board_values).to eq([' ', ' ', ' ', ' ', 'x', ' ', ' ', ' ', ' '])
    end
  end
end

describe Player do
<<<<<<< HEAD
  subject(:player) { Player.new('Ron', 'x') }
=======
  subject (:player) { Player.new('Ron', 'x') }
>>>>>>> 4eee0904edacbc7d585849f94d935e39517acf1e

  describe '#add_cell' do
    it "updates the player's list of cells taken" do
      player.add_cell(3)
      expect(player.cells_chosen).to eq([3])
    end
  end
end
