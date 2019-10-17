class Player

  @@count = 0
  attr_accessor :name, :color

  def initialize
    @name = get_name
    @color = get_color
  end

  def get_name
    @@count += 1
    puts "Enter your name"
    name = gets.chomp
  end

  def get_color
    color = @@count==1 ? "☺" : "☻"
    puts "Your color is #{color}"
    color = color.slice(0).upcase
  end

end
