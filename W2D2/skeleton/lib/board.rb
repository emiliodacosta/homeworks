class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_index do |i|
      if (i < 6) || (i > 6 && i < 13)
        cups[i] = [:stone, :stone, :stone, :stone]
      else
        cups[i] = []
      end
    end

  end

  def valid_move?(start_pos)
    if (start_pos > 12) || (start_pos == 6) || (start_pos < 0) || cups[start_pos].empty?
      raise "Invalid starting cup"
    else
      return true
    end
  end

  def make_move(start_pos, current_player_name)
    grabbed = @cups[start_pos].length
    if valid_move?(start_pos)
      n = 1
      @cups[start_pos] = []
      until grabbed == 0
        case current_player_name
        when @name1
          n += 1 if (start_pos + n) == 13
        when @name2
          n += 1 if (start_pos + n) == 6
        end
        if (start_pos + n) == 14
          start_pos = 0
          n = 0
        end
        @cups[start_pos + n] << :stone
        grabbed -= 1
        n += 1
      end
      render
      next_turn(start_pos + n)
    end


  end

  def next_turn(ending_cup_idx)
    :switch if cups[ending_cup_idx] = []
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
