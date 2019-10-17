require './lib/board'

RSpec.describe "Board" do
  describe Board do
    let(:board) { Board.new }
    let(:grid) {[ 
                  ["*", "*", "*", "*", "*", "*", "*"],
                  ["*", "*", "*", "*", "*", "*", "*"],
                  ["*", "*", "*", "*", "*", "*", "*"],
                  ["*", "*", "*", "*", "*", "*", "*"],
                  ["*", "*", "*", "*", "*", "*", "*"],
                  ["*", "*", "*", "*", "*", "*", "*"]
                ]}
    
    it "generates the grid" do
      expect(board.grid.length).to_not eql(0)
    end

    it "generates the grid of 7 columns and 6 rows"do
      expect(board.grid).to eql(grid)
    end

    it "updates the grid" do
      grid[5][6] = "☺"
      expect(board.update_grid(6,"☺")).to eql(grid)
    end

    it "checks for valid move" do
      6.times {|index| board.grid[index][0] = "☺"}
      expect(board.is_valid_move?(0)).to eql(false)
    end

    it "returns the row number" do
      (-5..-2).each {|index| board.grid[-index][0] = "☺"}
      expect(board.send :get_row, 0).to eql(1)
    end

    it "returns the color in case of horizontal win" do
      4.times {|index| board.grid[3][index] = "☺"}
      expect(board.send :check_horizontal_win).to eql("☺")
    end

    it "returns empty string in case there is no horizontal win" do
      3.times {|index| board.grid[3][index] = "☺"}
      expect(board.send :check_horizontal_win).to eql("")
    end

    it "returns the color in case of vertical win" do
      4.times {|index| board.grid[index][0] = "☺"}
      expect(board.send :check_vertical_win).to eql("☺")
    end

    it "returns empty string in case there is no vertical win" do
      3.times {|index| board.grid[index][0] = "☺"}
      expect(board.send :check_vertical_win).to eql("")
    end

    it "returns the color in case of diagonal \\ win" do
      4.times {|index| board.grid[index][index] = "☺"}
      expect(board.send :check_diagonal_win).to eql("☺")
    end

    it "returns empty string in case there is no diagonal \\ win" do
      3.times {|index| board.grid[index][index] = "☺"}
      expect(board.send :check_diagonal_win).to eql("")
    end

    it "returns the color in case of diagonal / win" do
      board.grid[0][3] = "☺"
      board.grid[1][2] = "☺"
      board.grid[2][1] = "☺"
      board.grid[3][0] = "☺"
      expect(board.send :check_reverse_diagonal_win).to eql("☺")
    end

    it "returns empty string in case there is no diagonal / win" do      
      board.grid[1][2] = "☺"
      board.grid[2][1] = "☺"
      board.grid[3][0] = "☺"
      expect(board.send :check_reverse_diagonal_win).to eql("")
    end

  end
end