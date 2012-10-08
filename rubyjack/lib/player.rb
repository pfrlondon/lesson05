

class Player
	# declare accessors to expose name and hand
	attr_accessor :name
	attr_accessor :hand
	attr_accessor :total
	attr_accessor :bust
	
	def initialize(name, deck, hand_size)
		# initialize accessors
		@name = name
		# assign player a reference to the global deck
		@deck = deck
		@hand = Array.new
		@total = 0
		@bust = false
		
		# put two cards in hand
		hand_size.times do draw end
	end

	def draw
		# add card to hand and re-total
		@hand << @deck.draw_card
		
		# re-total hand for new card
		count_hand
	end
	
	def show_hand
		# display hand 
		puts "\n#{@name} holds:"
		@hand.each do |card|
			puts card.display
		end
		
		# add total followed by two line returns to create visual space
		puts "Total: #{@total}\n\n"
	end
	
	def count_hand
		# initialize local variable to accrue new total
		total = 0

		# sort ranks high (King, 13) to low (Ace, 1) so the Ace value is determined (11 or 1)
		# after the total of the rest of the hand is known
		@hand.sort! {|a, b| b.rank <=> a.rank}

		# loop and total the hand
		@hand.each do |card|
			total = total + card.value
			# if new_total would bust and card is Ace, drop 10 (default Ace value is 11)
			if total > 21 && card.rank == 1
				total = total - 10
			elsif total > 21
				@bust = true
			end
		end

		# assign local value to player instance
		@total = total
	end
	
end