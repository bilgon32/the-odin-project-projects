class Board
  def initialize; end

  def knight_moves(start_position, end_position)
    @queue = []
    @queue << Knight.new(start_position,nil)
    found = nil
    steps = []
    @queue.each do |knight|
      if knight.move1 == end_position
        found = Knight.new(knight.move1,knight)
        break
      elsif knight.move1
        @queue << Knight.new(knight.move1,knight)
      end
      if knight.move2 == end_position
        found = Knight.new(knight.move2,knight)
        break
      elsif knight.move2
        @queue << Knight.new(knight.move2,knight)
      end
      if knight.move3 == end_position
        found = Knight.new(knight.move3,knight)
        break
      elsif knight.move3
        @queue << Knight.new(knight.move3,knight)
      end
      if knight.move4 == end_position
        found = Knight.new(knight.move4,knight)
        break
      elsif knight.move4
        @queue << Knight.new(knight.move4,knight)
      end
      if knight.move5 == end_position
        found = Knight.new(knight.move5,knight)
        break
      elsif knight.move5
        @queue << Knight.new(knight.move5,knight)
      end
      if knight.move6 == end_position
        found = Knight.new(knight.move6,knight)
        break
      elsif knight.move6
        @queue << Knight.new(knight.move6,knight)
      end
      if knight.move7 == end_position
        found = Knight.new(knight.move7,knight)
        break
      elsif knight.move7
        @queue << Knight.new(knight.move7,knight)
      end
      if knight.move8 == end_position
        found = Knight.new(knight.move8,knight)
        break
      elsif knight.move8
        @queue << Knight.new(knight.move8,knight)
      end
    end
    step = found
    steps.unshift(step.position)
    while step.parent != nil
      steps.unshift(step.parent.position)
      step = step.parent
    end
    return steps
  end
end

class Knight
  attr_reader :position, :move1, :move2, :move3, :move4, :move5, :move6, :move7, :move8, :parent

  def initialize(position,parent)
    # position = [column,row]
    # position[0] = column
    # position [1] = row
    @position = position

    # The parent is set so we can trace back the steps taken until the answer
    @parent = parent

    # Each "move" represents one possible movement for the knight. It's set as
    # nil if it's not possible.

    # move 1 = -2,+1
    if (position[0] - 2).between?(0,7) && (position[1] + 1).between?(0,7)
      @move1 = [position[0] - 2, position[1] + 1]
    else
      @move1 = nil
    end

    # move 2 = -1,+2
    if (position[0] - 1).between?(0,7) && (position[1] + 2).between?(0,7)
      @move2 = [position[0] - 1, position[1] + 2]
    else
      @move2 = nil
    end

    # move 3 = +1,+2
    if (position[0] + 1).between?(0,7) && (position[1] + 2).between?(0,7)
      @move3 = [position[0] + 1, position[1] + 2]
    else
      @move3 = nil
    end

    # move 4 = +2,+1
    if (position[0] + 2).between?(0,7) && (position[1] + 1).between?(0,7)
      @move4 = [position[0] + 2, position[1] + 1]
    else
      @move4 = nil
    end

    # move 5 = +2,-1
    if (position[0] + 2).between?(0,7) && (position[1] - 1).between?(0,7)
      @move5 = [position[0] + 2, position[1] - 1]
    else
      @move5 = nil
    end

    # move 6 = +1,-2
    if (position[0] + 1).between?(0,7) && (position[1] - 2).between?(0,7)
      @move6 = [position[0] + 1, position[1] - 2]
    else
      @move6 = nil
    end

    # move 7 = -1,-2
    if (position[0] - 1).between?(0,7) && (position[1] - 2).between?(0,7)
      @move7 = [position[0] - 1, position[1] - 2]
    else
      @move7 = nil
    end

    # move 8 = -2,-1
    if (position[0] - 2).between?(0,7) && (position[1] - 1).between?(0,7)
      @move8 = [position[0] - 2, position[1] - 1]
    else
      @move8 = nil
    end

  end
end

board = Board.new
p board.knight_moves([3,3],[1,2])
puts "###########"
p board.knight_moves([0,0],[1,2])
puts "###########"
p board.knight_moves([0,0],[3,3])
puts "###########"
p board.knight_moves([3,3],[0,0])
