# Tic Tac Toe Project Plan

## Game class

# - Start
# - Get player names
# - Take turn
#   * Includes prompting user for data
# - End

# ## Board class

# - Draw new
# - Display a formatted board to cmd line
# - Update board with user data

# ## Player class

# - Create player with name
# - Randomly assigned X or O (may need to be a class variable to share between?)

# Game class
class Game
	xs_and_os = ['X','O']

	def initialize()
	end

	def start_game
		puts "Starting a new game!"
		get_player_names
	end

	def get_player_names
		puts "Player 1, please enter your name:"
		@player_1_name = gets.chomp
		x_or_o_index_1 = rand(0..1)

		# Create player here

		puts "Player 2, please enter your name:"
		@player_2_name = gets.chomp
		x_or_o_index_2 = x_or_o_index_1 == 0 ? 1 : 0

		# Create player here
		player_names = [@player_1_name, @player_2_name]
		player_names
	end

	def take_turn
		# TO COMPLETE
	end

	def end_game
		# TO COMPLETE
	end
end

class Player
	attr_reader :name

	def initialize(name, x_or_o)
		@name = name
		@x_or_o = x_or_o
	end
end