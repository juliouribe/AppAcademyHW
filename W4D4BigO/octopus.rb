def find_big_fish(array)
  big_fish = nil
  array.each do |fish|
    if big_fish.nil?
      big_fish = fish
    end
    if fish.length > big_fish.length
      big_fish = fish
    end
  end
  big_fish
end


fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh',
  'fiiiissshhhhhh']
puts "big fish"
p find_big_fish(fish)
puts

def slow_dance(target, array)
  array.each_with_index do |move, idx|
    return idx if target == move
  end
  false
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down",
  "left",  "left-up"]
puts "Slow dance"
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

new_tiles_data_structure = {
  "up"=> 0,
  "right-up"=> 1,
  "right"=> 2,
  "right-down"=> 3,
  "down"=> 4,
  "left-down"=> 5,
  "left"=> 6,
  "left-up"=> 7,
}
def fast_dance(move, hash)
  hash[move]
end

puts
puts "Fast dance"
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)

