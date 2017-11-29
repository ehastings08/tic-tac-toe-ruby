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
		print "Choice: >> "
		position = gets.chomp.to_i
		until ((1..9).to_a.include? position)
			puts "Please enter an integer between 1-9"
			print "Choice: >> "
			position = gets.chomp.to_i
		end

		# Update board based on position selection
		@board.update_board(position, player)
		# TO COMPLETE
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
		@board = Array.new(3,Array.new(3,"-"))
		@board_position_map = {
			1 => @board[0][0],
			2 => @board[0][1],
			3 => @board[0][2],
			4 => @board[1][0],
			5 => @board[1][1],
			6 => @board[1][2],
			7 => @board[2][0],
			8 => @board[2][1],
			9 => @board[2][2]
		}
	end

	def board
		@board
	end

	def display_board
		print "+++++++++++++++++\n"
		for i in 0...@board.length
			@board[i].each do |marker|
				print "#{marker}\t"
			end
			if i != @board.length-1
				print "\n"
			end
		end
		print "\n+++++++++++++++++\n"
	end

	# Update board accepts the marker's position
	def update_board(position, player)
		# DELETE
		puts "Running update_board on #{position}"
		puts "@board_position_map is #{@board_position}"
		puts "Current board is #{board}"
		puts "The board position for your user position is #{@board_position_map[position]}"
		# TO COMPLETE

		# Check to see if that position is taken
		


	end

	# TO COMPLETE
end



new_game = Game.new