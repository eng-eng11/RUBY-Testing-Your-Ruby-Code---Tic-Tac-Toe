require './player.rb'
require './board.rb'

class Game

  attr_reader :player_1, :player_2, :board, :current_player

  def initialize
    @selected_token = nil
    @player_1 = welcome_player("player_1")
    @player_2 = welcome_player("player_2")
    @board = Board.new()
    @current_player = @player_1
  end

  def play_turn
    location = get_location()
    board.update_field_values(current_player.token, location)
    current_player.add_cell(location)
  end

  def populate_display
    puts
    puts "LEGEND:"
    @board.draw_board(@board.legend_values)
    puts "Use the legend to pick a space!"
    puts
    puts "GAME BOARD:"
    @board.draw_board(@board.board_values)
    puts
  end

  def switch_player
    @current_player == @player_1  ? @current_player = @player_2 : @current_player = @player_1
  end

  def over?
    win_conditions = [[1,2,3], [4,5,6], [7,8,9],
                      [1,4,7], [2,5,8], [3,6,9],
                      [1,5,9], [3,5,7]]

    win_conditions.each do |condition|
      if (condition - current_player.cells_chosen).empty?
        puts "#{current_player.name} wins!"
        return true
      end
    end
    if board.board_values.none? { |value| value == " " }
      puts "Tie game, no winners!"
      return true
    end
    false
  end

  private

  def welcome_player(player)
    player_name = get_name(player)
    player_token = get_token(player_name)
    Player.new(player_name, player_token)
  end

  def get_name(player)
    puts "Welcome, #{player}, what is your name?"
    gets.chomp
  end

  def get_token(player_name)
    if @selected_token.nil?
      puts "Thanks #{player_name}! What token would you like, 'X' or 'O'?"
      token = gets.chomp.upcase
      while token != "X" && token != "O"
        puts "That is not a valid entry, please select 'X' or 'O'."
        token = gets.chomp.upcase
      end
      @selected_token = token
    else
      token = @selected_token == "X" ? "O" : "X"
      puts "#{player_name}, your token will be '#{token}'"
    end
    token
  end

  def get_location
    puts "Your turn, #{current_player.name}! Choose a space."
    location = gets.chomp.to_i
    until location.between?(1, 9) && @board.board_values[location - 1] == " "
      unless location.between?(1, 9)
        puts "You need to select a value from 1 to 9. Please select again:"
        location = gets.chomp.to_i
      end
      unless @board.board_values[location - 1] == " "
        puts "This location has already been selected. Try again:"
        location = gets.chomp.to_i
      end
    end
    location
  end

end
