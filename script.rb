class Board
  def initialize
    @board = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    @coords_array = [[0, 0], [0, 1], [0, 2],
                     [1, 0], [1, 1], [1, 2],
                     [2, 0], [2, 1], [2, 2]]
  end

  def place_mark(mark, position)
    coords = get_coords_from_position(position)
    first_coord = coords[0]
    second_coord = coords[1]
    return false unless square_not_set?(coords)

    @board[first_coord][second_coord] = mark
  end

  def pretty_print_board
    puts '-----------'
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts '---+---+---'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts '---+---+---'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    puts "-----------\n\n"
  end

  private

  def get_coords_from_position(position)
    @coords_array[position]
  end

  def square_not_set?(coords)
    first_coord = coords[0]
    second_coord = coords[1]
    @board[first_coord][second_coord].is_a?(Integer)
  end
end

class Player
  attr_accessor :mark, :name

  def initialize(mark, name)
    @mark = mark
    @name = name
  end
end


