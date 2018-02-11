class Board
  WINNING_CONDITIONS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[7,5,3]]

  attr_accessor :winner

  def initialize
    @board = Array(1..9)
    @round = 0
    @winner = false
  end

  def play(place,marker)
    if @board[place - 1].is_a?(String) || place < 1 || place > 9
      return "invalid_place"
    end
    @board[place - 1] = marker
    @round += 1
    show_board
    @winner = winner?
  end

  def winner?
    WINNING_CONDITIONS.each do |conditions_set|
      if @board[conditions_set[0] - 1] == @board[conditions_set[1] - 1] && @board[conditions_set[0] - 1] == @board[conditions_set[2] - 1]
        return @board[conditions_set[0] - 1] == "X" ? "player1" : "player2"
      end
    end
    counter = 0
    @board.each do |place|
      counter += 1 if place.is_a? Integer
    end
    return counter == 0 ? "draw" : false
  end

  def show_board
    puts "Round: #{@round}".ljust(10) + "-------------".center(30)
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |".center(50)
    puts "-------------".center(50)
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |".center(50)
    puts "-------------".center(50)
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |".center(50)
    puts "-------------".center(50)
  end
end

class Player
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

board = Board.new

player1 = Player.new("X")
player2 = Player.new("O")

board.show_board

while !board.winner
  loop do
    puts "Player 1: "
    place = gets.chomp
    break if board.play(place.to_i,player1.marker) != "invalid_place"
    puts "Invalid choice"
  end
  break if board.winner
  loop do
    puts "Player 2: "
    place = gets.chomp
    break if board.play(place.to_i,player2.marker) != "invalid_place"
    puts "Invalid choice"
  end
end
puts "Winner: #{board.winner}"
