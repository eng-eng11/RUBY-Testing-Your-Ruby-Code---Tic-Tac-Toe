# frozen_string_literal: true

class Board
  ROWS = 6
  COLUMNS = 7
  attr_accessor :grid

  def initialize
    @grid = generate_grid
  end

  public

  def display_grid
    bottom = ''

    grid.each do |row|
      puts row.each { |cell| cell }.join('  ')
    end

    COLUMNS.times do |i|
      bottom << '  ' << (i + 1).to_s
    end
    puts bottom.strip
  end

  def update_grid(column, color)
    row = get_row(column)
    grid[row][column] = color
    display_grid
    grid
  end

  def is_valid_move?(column)
    row = ROWS - 1
    while row >= 0
      return true if grid[row][column] == '*'

      row -= 1
    end
    false
  end

  def all_win_check
    winner = ''
    if check_draw == false
      winner = check_horizontal_win
      winner = check_vertical_win if winner == ''
      winner = check_diagonal_win if winner == ''
      winner = check_reverse_diagonal_win if winner == ''
      return winner
    else
      return 'draw'
    end
  end

  private

  def generate_grid
    self.grid = []

    ROWS.times do
      row = []
      COLUMNS.times do
        row.push('*')
      end
      grid.push(row)
    end
    grid
  end

  def get_row(column)
    row = ROWS - 1
    while row >= 0
      return row if grid[row][column] == '*'

      row -= 1
    end
  end

  ##################--WIN CHECKS--#####################

  def check_horizontal_win(grid_copy = grid)
    # every row of the grid is passed to check_logic, the method in charge
    # of returning the winner color or empty string
    grid_copy.each do |row|
      winner = check_logic(row)
      return winner unless winner.empty?
    end
    ''
  end

  def check_vertical_win
    # vertical is the same as horizontal but with the grid transposed
    check_horizontal_win(grid.transpose)
  end

  def check_diagonal_win(reversed = false)
    # The reason behind the reversed grid is
    # that the diagonal "/" is the same as the "\" diagonal
    # if the grid is mirrored.
    # (ROWS-3) and (COLUMNS-3) is the diagonal long enough to hold 4 pieces
    winner = ''
    grid_copy = reversed ? get_grid_copy(true) : get_grid_copy(false)

    (ROWS - 3).times do |row|
      (COLUMNS - 3).times do
        diag = get_diag(grid_copy)
        winner = check_logic(diag)
        return winner unless winner.empty?

        grid_copy = delete_first_column(grid_copy)
      end
      grid_copy = reversed ? get_grid_copy(true) : get_grid_copy(false)
      grid_copy.slice!(0..row)
    end

    winner
  end

  def check_reverse_diagonal_win
    check_diagonal_win(true)
  end

  def check_draw
    full = true
    grid.each do |row|
      row.each do |cell|
        full = false if cell == '*'
      end
    end
    full
  end

  # to get a real copy without "referencing" the original array object
  # the array must be deeply copied with .dup
  def get_grid_copy(reversed)
    grid_copy = []
    if reversed
      grid.each { |row| grid_copy.push(row.dup.reverse) }
    else
      grid.each { |row| grid_copy.push(row.dup) }
    end
    grid_copy
  end

  def get_diag(grid_copy)
    diag = (0..grid_copy.length - 1).collect { |i| grid_copy[i][i] }
    # remove nils added by .collect
    diag.delete_if(&:nil?)
    diag
  end

  def delete_first_column(grid_copy)
    grid_copy.each do |row|
      row.slice!(0)
    end
    grid_copy
  end

  def check_logic(line)
    win_array = []
    winner = ''

    line.each do |cell|
      # if the cell is empty then everything before it doesn't matter
      if cell == '*'
        win_array = []
      else
        win_array.push(cell)
      end

      if win_array.length == 4
        if win_array.all? { |cell| cell == '☺' } || win_array.all? { |cell| cell == '☻' }
          winner = cell
        else
          win_array.slice!(0)
        end
      end
    end
    winner
  end
end
