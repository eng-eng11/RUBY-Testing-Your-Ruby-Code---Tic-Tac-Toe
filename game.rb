# frozen_string_literal: true

require './player.rb'
require './board.rb'

class Game
  attr_reader :player_one, :player_two, :board, :current_player

  def initialize
    @selected_token = nil
    @player_one = Player.new('Player One', 'X')
    @player_two = Player.new('Player Two', 'O')
    @board = Board.new
    @current_player = @player_one
  end

  def play_turn
    location = obtain_location
    board.update_field_values(current_player.token, location)
    current_player.add_cell(location)
    0
  end

  def populate_display
    @board.draw_board(@board.board_values)
    0
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
    0
  end

  def over?(grid)
    win_conditions = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],
                      [1, 5, 9], [3, 5, 7]]

    var = if grid.empty?
            current_player.cells_chosen
          else
            grid
          end

    win_conditions.each do |condition|
      return true if (condition - var).empty?
    end
    if board.board_values.none? { |value| value == ' ' }
      puts 'Tie game, no winners!'
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
      while token != 'X' && token != 'O'
        puts "That is not a valid entry, please select 'X' or 'O'."
        token = gets.chomp.upcase
      end
      @selected_token = token
    else
      token = @selected_token == 'X' ? 'O' : 'X'
      puts "#{player_name}, your token will be '#{token}'"
    end
    token
  end

  def obtain_location
    # puts "Your turn, #{current_player.name}! Choose a space."
    location = 1
    until location.between?(1, 9) && @board.board_values[location - 1] == ' '
      unless location.between?(1, 9)
        puts 'You need to select a value from 1 to 9. Please select again:'
        location = gets.chomp.to_i
      end
      unless @board.board_values[location - 1] == ' '
        puts 'This location has already been selected. Try again:'
        location = gets.chomp.to_i
      end
    end
    location
  end
end
