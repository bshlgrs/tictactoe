class Board
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_string(string)
    grid = [0, 1, 2].map do |row_index|
      [0, 1, 2].map do |col_index|
        case string[row_index * 3 + col_index]
        when "x"
          :cross
        when "o"
          :naught
        when "+"
          nil
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
end

