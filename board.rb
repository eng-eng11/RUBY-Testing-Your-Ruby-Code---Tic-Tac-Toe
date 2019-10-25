# frozen_string_literal: true

class Board
  attr_reader :legend_values, :board_values

  def initialize
    @legend_values = %w[1 2 3 4 5 6 7 8 9]
    @board_values = Array.new(9, ' ')
  end

  def draw_board(field_values)
    str_a = "\t #{field_values[0]} | #{field_values[1]} | #{field_values[2]} "
    str_b = "\n\t---|---|---"
    str_c = "\n\t #{field_values[3]} | #{field_values[4]} | #{field_values[5]} "
    str_d = "\n\t---|---|---"
    str_e = "\n\t #{field_values[6]} | #{field_values[7]} | #{field_values[8]} "
    str_a + str_b + str_c + str_d + str_e
  end

  def update_field_values(token, location)
    @board_values[location - 1] = token
  end
end
