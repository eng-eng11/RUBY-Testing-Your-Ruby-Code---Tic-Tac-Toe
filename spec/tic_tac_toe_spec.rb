# frozen_string_literal: true

require './game.rb'

describe Game do
  subject(:game) { Game.new }

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
        game.player_one.add_cell(i)
      end
      expect(game.over?).to be true
    end
  end
end

describe Board do
  subject(:board) { Board.new }

  describe '#update_field_values' do
    it "add's a chosen location to the list of spaces taken" do
      board.update_field_values('x', 5)
      expect(board.board_values).to eq([' ', ' ', ' ', ' ', 'x', ' ', ' ', ' ', ' '])
    end
  end
end

describe Player do
  subject(:player) { Player.new('Ron', 'x') }

  describe '#add_cell' do
    it "updates the player's list of cells taken" do
      player.add_cell(3)
      expect(player.cells_chosen).to eq([3])
    end
  end
end
