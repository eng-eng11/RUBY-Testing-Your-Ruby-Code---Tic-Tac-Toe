class Board

  attr_reader :legend_values, :board_values

  def initialize
    @legend_values = ["1","2","3","4","5","6",'7',"8","9"]
    @board_values = Array.new(9, " ")
  end

  def draw_board (field_values)
    puts "\t #{field_values[0]} | #{field_values[1]} | #{field_values[2]} "
    puts "\t---|---|---"
    puts "\t #{field_values[3]} | #{field_values[4]} | #{field_values[5]} "
    puts "\t---|---|---"
    puts "\t #{field_values[6]} | #{field_values[7]} | #{field_values[8]} "
  end

  def update_field_values (token, location)
    @board_values[location - 1] = token
  end

end
