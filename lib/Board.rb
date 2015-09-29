class Board
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_string(string)
    # todo: error handling

    return nil unless string.length == 9

    grid = [0, 1, 2].map do |row_index|
      [0, 1, 2].map do |col_index|
        case string[row_index * 3 + col_index]
        when "x"
          :cross
        when "o"
          :naught
        when " "
          nil
        else
          return nil
        end
      end
    end

    Board.new(grid)
  end

  def to_wave_string
    flattened_grid.map do |x|
      case x
      when :cross
        "x"
      when :naught
        "o"
      when nil
        " "
      end
    end.join("")
  end

  def flattened_grid
    @grid.flatten
  end

  def count_mark(mark)
    flattened_grid.count(mark)
  end

  def is_valid?
    (count_mark(:naught) - count_mark(:cross)).abs < 2
  end

  def plausibly_the_turn_of_o?
    # what do I do if the board is invalid?
    count_mark(:naught) == count_mark(:cross) || count_mark(:naught) == count_mark(:cross) - 1
  end

  def make_move_for_o
    [0, 1, 2].each do |row|
      [0, 1, 2].each do |col|
        if @grid[row][col].nil?
          @grid[row][col] = :naught
          return
        end
      end
    end
  end
end

