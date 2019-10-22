# frozen_string_literal: true

class Player
  @count = 0
  attr_accessor :name, :color

  def initialize
    @name = obtain_name
    @color = obtain_color
  end

  def obtain_name
    @count += 1
    puts 'Enter your name'
    @name = gets.chomp
  end

  def obtain_color
    color = @count == 1 ? '☺' : '☻'
    puts "Your color is #{color}"
    @color = color.slice(0).upcase
  end
end
