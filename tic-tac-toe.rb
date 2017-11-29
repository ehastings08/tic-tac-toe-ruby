#= Tic Tac Toe
#
#Creates a command line tic-tac-toe game for two human players using Ruby

#== Game class
#Can initialize a game, get player names & markers, and continue to take turns until a game is over
class Game
	def initialize()
		@in_progress = true
		start_game
	end

	def start_game
		puts "Starting a new game!"
		get_player_names_and_markers
	end

	def get_player_names_and_markers
		xs_and_os = ['X','O']

		puts "Player 1, please enter your name:"
		name_1 = gets.chomp
		x_or_o_index_1 = rand(0..1)
		@player_1 = Player.new(name_1, xs_and_os[x_or_o_index_1])
		puts "Thanks #{@player_1.name}, you will be #{@player_1.x_or_o}s"

		puts "Player 2, please enter your name:"
		name_2 = gets.chomp
		x_or_o_index_2 = x_or_o_index_1 == 0 ? 1 : 0
		@player_2 = Player.new(name_2, xs_and_os[x_or_o_index_2])
		puts "Thanks #{@player_2.name}, you will be #{@player_2.x_or_o}s"

		# Create board
		@board = Board.new
		# Take turns until game is over
		take_turn(@board, 1, @player_1)
		# TO COMPLETE
	end

	def take_turn(board, turn, player)
		puts "Starting turn number #{turn}."
		puts "#{player.name}, please enter the square you wish to play."
		puts "Squares are numbered 1-9 from top left to bottom right."
		@board.display_board

		# ADD BELOW - handling for when user puts in a taken position (if update_board returns false, repeat loop)
		print "Choice: >> "
		position = gets.chomp.to_i
		until ((1..9).to_a.include? position)
			puts "Please enter an integer between 1-9"
			print "Choice: >> "
			position = gets.chomp.to_i
		end

		# Update board based on position selection
		@board.update_board(position, player)
	end

	def end_game
		# TO COMPLETE
	end
end

#== Player class. Can create a player based on their name and marker symbol.
class Player
	attr_reader :name, :x_or_o

	def initialize(name, x_or_o)
		@name = name
		@x_or_o = x_or_o
	end
end

#== Board class. Keeps track of the current board using a two-dimensional array and displays it to the command line in a human-readable way.
class Board
	def initialize
		@board = {
			1 => "-",
			2 => "-",
			3 => "-",
			4 => "-",
			5 => "-",
			6 => "-",
			7 => "-",
			8 => "-",
			9 => "-"
		}
	end

	def board
		@board
	end

	def display_board
		print "+++++++++++++++++\n"
		@board.each_pair do |key, value|
			print "#{value}\t"
			print "\n" if (key % 3 == 0 && key != 9)
		end
		print "\n+++++++++++++++++\n"
	end

	# Update board accepts the marker's position and either returns an error message or updates the board with the selection
	def update_board(position, player)
		# DELETE
		puts "Player is #{player}"
		puts "Running update_board on #{position}"

		# TO COMPLETE

		# Check to see if that position is taken
		if (@board[position] == "X" || @board[position] == "O")
			puts "That position is already taken! Please try again."
			return false
		else
			# update the board
			@board[position] = player.x_or_o
			puts "Nice! Updated the board to add a #{player.x_or_o} to position #{position}"
			display_board
			return true
		end
	end

	# TO COMPLETE
end



new_game = Game.new