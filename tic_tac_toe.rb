class Player
  attr_reader :name, :marker
  
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end


class Game
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @grid = Array.new(3) { Array.new(3) }
  end

  def run
    @current_player = @player_one

    loop do
      puts "#{@current_player.name}, make your choice."
      @current_choice = gets.chomp.to_i
      row = (@current_choice - 1) / 3
      column = (@current_choice - 1) % 3
      @grid[row][column] = @current_player
      print_grid

      if @current_player == @player_one
        @current_player = @player_two
      else 
        @current_player = @player_one
      end

      if check_winner
        break
      end

      if check_tie
        break
      end
    end
  end

  def print_grid
    print_cell(0, 0)
    print "|"
    print_cell(0, 1)
    print "|"
    print_cell(0, 2)

    puts "\n---+---+---"

    print_cell(1, 0)
    print "|"
    print_cell(1, 1)
    print "|"
    print_cell(1, 2)

    puts "\n---+---+---"

    print_cell(2, 0)
    print "|"
    print_cell(2, 1)
    print "|"
    print_cell(2, 2)
    puts ""
  end

  def print_cell(row, col)
    if @grid[row][col] != nil
      print " #{@grid[row][col].marker} "
    else
      print '   '
    end
  end

  def check_winner
    combinations = [
      @grid[0],
      @grid[1],
      @grid[2],
      [@grid[0][0], @grid[0][1], @grid[0][2]],
      [@grid[1][0], @grid[1][1], @grid[1][2]],
      [@grid[2][0], @grid[2][1], @grid[2][2]],
      [@grid[0][0], @grid[1][1], @grid[2][2]],
      [@grid[0][2], @grid[1][1], @grid[2][0]]
    ]

    winner_combination = combinations.find do |test|
      test == Array.new(3, @player_one) || test == Array.new(3, @player_two)
    end

    if winner_combination
      @winner = winner_combination[0]
    end
  end

  def check_tie
    if @grid.flatten.compact.length == 9
      puts "It's a tie!"
      true
    end
  end

end

puts "Insert name of Player 1:"
name_one = gets.chomp

puts "#{name_one}, choose your marker (can be letter or special character):"
marker_one = gets.chomp

player_one = Player.new(name_one, marker_one)

puts "Insert name of Player 2:"
name_two = gets.chomp

puts "#{name_two}, choose your marker (can be letter or special character):"
marker_two = gets.chomp

player_two = Player.new(name_two, marker_two)

# show the rules
puts "Each player will have to choose numbers from 1-9 to select the position of their symbol. \nPlease note that the numbers will disappear after the first turn. \nThe first to achieve three consecutive symbols wins."

# make the grid

puts " 1 | 2 | 3 "
puts "---+---+---"
puts " 4 | 5 | 6 "
puts "---+---+---"
puts " 7 | 8 | 9 "

game = Game.new(player_one, player_two)
game.run


