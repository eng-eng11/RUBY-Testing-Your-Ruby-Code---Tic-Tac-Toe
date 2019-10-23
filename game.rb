class Player
  attr_reader   :name, :token, :cells_chosen

  def initialize(name, token)
    @name = name
    @token = token
    @cells_chosen = []
  end

  def add_cell(cell_number)
    @cells_chosen.push(cell_number)
  end
end
