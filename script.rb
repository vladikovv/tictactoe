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
    puts 'Current board status: '
    puts '-----------'
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
    puts '---+---+---'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
    puts '---+---+---'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
    puts "-----------\n\n"
  end

  def game_over?
    # check all the rows for a possible victory
    3.times do |i|
      return true if @board[i].all? { |mark| mark == 'X' || mark == 'O' }
    end

    # check all the columns for a possible victory
    3.times do |i|
      return true if @board.transpose[i].all? { |mark| mark == 'X' || mark == 'O' }
    end

    # check main diagonal for a possible victory
    return true if 3.times.collect { |i| @board[i][i] }.all? { |mark| mark == 'X' || mark == 'O' }

    # check right diagonal for a possible victory
    return true if right_diagonal_values.all? { |mark| mark == 'X' || mark == 'O'}

    false
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

  def right_diagonal_values
    result = []
    i = 0
    while i < 3
      j = 0
      while j < 3
        result.push(@board[i][j]) if (i + j) == 2
        j += 1
      end
      i += 1
    end
    result
  end
end

class Player
  attr_accessor :mark, :name

  def initialize(mark, name)
    @mark = mark
    @name = name
  end
end

def game
  print "This will be a game of tic-tac-toe (commonly called sea chess in Bulgaria)) \n\n"
  # sleep(2)
  print 'Enter the name of the first player: '
  player_one = Player.new('X', gets.chomp)
  puts "#{player_one.name} will be using the 'X' mark!\n\n"

  # sleep(2)
  print 'Enter the name of the second player: '
  player_two = Player.new('O', gets.chomp)
  print "And #{player_two.name} will be using the 'O' mark!\n\n"

  # sleep(2)
  board = Board.new
  print "Currently the board looks like this: \n\n"
  board.pretty_print_board

  # sleep(2)
  print "Each player must select a number between 0 and 8.\n"
  # sleep(2)
  print "That will put his mark on that specific position on the board.\n"
  # sleep(2)
  print "The board will be printed after each turn so each player can keep track.\n"
  # sleep(2)
  print("The game begins .....\n\n")
  # sleep(5)
  print("NOW!!!11!!\n\n")
  # sleep(2)

  game_over = false
  current_player = player_one
  until game_over
    print("#{current_player.name}, pick a position on the board to place your mark: ")
    position = -1
    position = gets.chomp.to_i while position.negative? || position > 8
    board.place_mark(current_player.mark, position)
    board.pretty_print_board
    game_over = board.game_over?
    if game_over
      print("Game over! #{current_player.name} wins!")
      break
    end
    if current_player.name == player_one.name
      current_player = player_two
    elsif current_player.name == player_two.name
      current_player = player_one
    end
  end
end

game
