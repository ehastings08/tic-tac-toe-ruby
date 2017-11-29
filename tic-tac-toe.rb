# Next step (in progress): Factor out turn taking into new methods in the Game class

#= Tic Tac Toe
#
#Creates a command line tic-tac-toe game for two human players using Ruby

#== Game class
#Can initialize a game, get player names & markers, and continue to take turns until a game is over
class Game
	attr_accessor :in_progress, :turn

	def initialize()
		@in_progress = true
		@turn = 1
		start_game
	end

	def start_game
		puts "Starting a new game!"
		create_board
		get_player_info
		run_game
	end

	def create_board
		@board = Board.new
	end

	def get_player_info
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
	end

	def run_game
		until @in_progress == false
			# Take turns until game is over
			if (turn % 2 == 1)
				take_turn(@player_1)
			else
				take_turn(@player_2)
			end
		end
	end

	def take_turn(player)
		if !@board.board_hash.values.include? "-"
			@in_progress = false
			end_game
		end

		puts "Starting turn number #{@turn}."
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

		attempt = @board.update_board(position, player)
		until attempt == true
			puts "Please enter an integer between 1-9"
			print "Choice: >> "
			position = gets.chomp.to_i
			attempt = @board.update_board(position, player)
		end

		puts "Turn complete!"
		@turn += 1
	end

	def end_game
		puts "Game over!"

		# Hah oh this isn't how tic tac toe works is it
		count_xs = @board.board_hash.values.select{|item| item == 'X'}.length
		count_os = @board.board_hash.values.select{|item| item == 'O'}.length
		winner_marker = count_xs > count_os ? "X" : "O"
		winner = @player_1.x_or_o == winner_marker ? @player_1 : @player_2

		puts "The winner is: #{winner.name}"
		puts "Thanks for playing!"
		exit
	end
end

#== Player class. Can create a player based on their name and marker symbol.
class Player
	attr_reader :name, :x_or_o

	def initialize(name, x_or_o)
		@name = name
		@x_or_o = x_or_o
		@mapping = {@x_or_o => @name}
	end
end

#== Board class. Keeps track of the current board using a two-dimensional array and displays it to the command line in a human-readable way.
class Board
	attr_accessor :board_hash

	def initialize
		@board_hash = {
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
		@board_hash
	end

	def display_board
		print "+++++++++++++++++\n"
		@board_hash.each_pair do |key, value|
			print "#{value}\t"
			print "\n" if (key % 3 == 0 && key != 9)
		end
		print "\n+++++++++++++++++\n"
	end

	# Update board accepts the marker's position and either returns an error message or updates the board with the selection
	def update_board(position, player)
		# Check to see if that position is taken
		if (@board_hash[position] == "X" || @board_hash[position] == "O")
			puts "That position is already taken! Please try again."
			return false
		else
			# update the board
			@board_hash[position] = player.x_or_o
			puts "Nice! Updated the board to add a #{player.x_or_o} to position #{position}"
			display_board
			return true
		end
	end
end



new_game = Game.new