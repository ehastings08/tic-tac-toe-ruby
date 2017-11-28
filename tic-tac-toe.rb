# Game class
class Game
	def initialize()
		start_game
	end

	def start_game
		puts "Starting a new game!"
		get_player_names_and_markers
	end

	def get_player_names_and_markers
		xs_and_os = ['X','O']

		puts "Player 1, please enter your name:"
		@player_1_name = gets.chomp
		x_or_o_index_1 = rand(0..1)
		puts "Thanks #{@player_1_name}, you will be #{xs_and_os[x_or_o_index_1]}"

		puts "Player 2, please enter your name:"
		@player_2_name = gets.chomp
		x_or_o_index_2 = x_or_o_index_1 == 0 ? 1 : 0
		puts "Thanks #{@player_2_name}, you will be #{xs_and_os[x_or_o_index_2]}"

		# Create board
		@board = Board.new
		@board.display_board
		# Take turn
		# TO COMPLETE
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

class Board
	def initialize
		@board = Array.new(3,Array.new(3,"-"))
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

	def update_board
		# TO COMPLETE
	end

	# TO COMPLETE
end

new_game = Game.new