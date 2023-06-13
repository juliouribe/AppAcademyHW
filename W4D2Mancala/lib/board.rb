require("byebug")
PLAYER1_STORE = 6
PLAYER2_STORE = 13

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new() }
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups_with_stones = [0,1,2,3,4,5,7,8,9,10,11,12]
    cups_with_stones.each do |cup|
      @cups[cup] = [:stone]*4
    end
  end

  def valid_move?(start_pos)
    raise Exception.new("Invalid starting cup") if start_pos > 12
    if @cups[start_pos].empty? or @cups[start_pos].nil?
      raise Exception.new("Starting cup is empty")
    end
  end
  """
      12  11  10  9  8  7
  [store2]            [store1]
       1   2   3  4  5  6
  """

  def make_move(start_pos, current_player_name)
    # List of regular cup idxs.
    valid_spots = [0,1,2,3,4,5,7,8,9,10,11,12]
    # Depending on player add  their store idx to the cups available.
    if current_player_name == @name1
      valid_spots << PLAYER1_STORE
    else
      valid_spots << PLAYER2_STORE
    end
    # Grab the stones, empty out the cup, and place one stone at a time.
    stones = @cups[start_pos]
    @cups[start_pos] = []
    idx = start_pos + 1
    stones.each do |stone|
      # Place stone at current idx if its a fair spot.
      if valid_spots.include?(idx)
        @cups[idx] << stone
      # Otherwise place the stone at the next spot which should be fair.
      else
        idx = next_index_clean(idx)
        @cups[idx] << stone
      end
      idx = next_index_clean(idx)
    end
    if idx > 0
      idx = idx -1
    else
      idx = 13
    end
    self.render
    return self.next_turn(idx, current_player_name)
  end

  def next_index_clean(idx)
    # Increments idx but makes sure we stay on the board.
    idx += 1
    idx % 14
  end

  def next_turn(ending_cup_idx, current_player_name)
    # Switch if ending cup is empty.
    debugger if ending_cup_idx == 0
    if @cups[ending_cup_idx].empty?
      return :switch
    # If we finish on a player store.
    elsif [PLAYER1_STORE, PLAYER2_STORE].include?(ending_cup_idx)
      # Return prompt if its the current player's store
      if current_player_name == @name1 and ending_cup_idx == PLAYER1_STORE
        return :prompt
      elsif current_player_name == @name2 and ending_cup_idx == PLAYER2_STORE
        return :prompt
      end
    end
    ending_cup_idx
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
