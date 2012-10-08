
# require code for Deck, User, and Dealer classes
require "lib/deck"
require "lib/user"
require "lib/dealer"

class Game
	
	# assign default user name if no name passed from command line
	def initialize(name)		
		# create new Deck object, and assign to instance variable
		@deck = Deck.new

		# create user and dealer objects, setting their name, passing them a reference
		# to the shared deck, and setting their hand size
		@user = User.new(name, @deck, 2)
		@dealer = Dealer.new("Dealer", @deck, 2)

		# set game state flag and reason string
		@game_over = false
		@game_over_reason = ""

		# initiate game play
		play_game
	end
	
	def play_game
		# display game startup message, including user and dealer names
		puts "Playing RubyJack with #{@user.name} (you) and #{@dealer.name} (dealer)."
		puts "The deck has been shuffled and hands drawn."

		# display initial hands
		@user.show_hand
		@dealer.show_hand

		# continue playing rounds until game_over is true
		while @game_over == false
			play_round
		end

		# display who won or lost
		puts @game_over_reason
	end
	
	def play_round
		# get user input to hit or stand, regardless of case
		puts "(H)it or (S)tand? Type H or S, then press Enter/Return"
		user_choice = $stdin.gets.chomp.upcase

		# user draws a card
		if (user_choice == "H")
			@user.draw
		# any choice but (S)tand repeats the round
		elsif (user_choice != "S")
			puts "\nPlease make a choice."
			play_round
		end

		# dealer stands on 17
		@dealer.draw unless @dealer.total > 16 

		# show the draw results
		@user.show_hand
		@dealer.show_hand
		check_hands(user_choice)

		# return to play_game method
	end
	
	def check_hands(user_choice)
		# player totals and bust status are managed by user and dealer (player) objects
		# user busted, set game over and reason
		if @user.bust == true
			@game_over = true
			@game_over_reason = "#{@user.name} busted ..."

		# dealer busted, set game over and reason
		elsif @dealer.bust == true
			@game_over = true
			@game_over_reason = "#{@dealer.name} busted, #{@user.name} wins!"

		# dealer stands at 17+, so if user has higher total, set game over and reason
		elsif @dealer.total > 16 && (@user.total > @dealer.total)
			@game_over = true
			@game_over_reason = "#{@user.name} wins!"

		# dealer stands at 17+, so if user chose to stand with same total, set game over and reason
		elsif @dealer.total > 16 && user_choice == "S" && (@user.total == @dealer.total) 
			@game_over = true
			@game_over_reason = "Push ... no one wins."

		# if user stands with lower total than dealer, user loses
		elsif @dealer.total > 16 && user_choice == "S" && (@user.total < @dealer.total) 
			@game_over = true
			@game_over_reason = "#{@user.name} loses."
			
		end			
		
		# return to play_hand method
	end

end