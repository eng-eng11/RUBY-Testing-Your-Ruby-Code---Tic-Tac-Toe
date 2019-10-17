require_relative 'board.rb'
require_relative 'player.rb'

class Game

  attr_accessor :board, :player_1, :player_2, :current_player, :other_player
  def initialize
    @board = Board.new
    @player_1 = Player.new
    @player_2 = Player.new
    @current_player = player_1
    @other_player = player_2
  end

  def play
    check = ""    
    board.display_grid

    while(check.empty? && check != "draw")      
      puts "#{current_player.name} choose the column:"
      col = gets.chomp.to_i

      while !board.is_valid_move?(col-1)
        puts "Invalid move, try again: "
        col = gets.chomp.to_i
      end

      board.update_grid(col-1, current_player.color)
      check = board.all_win_check
      @current_player, @other_player = @other_player, @current_player
    end

    if check == "draw"
      puts "DRAWWW!!!"
    else      
      puts "#{other_player.name} WINS"
    end
  end
end