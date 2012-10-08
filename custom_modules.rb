$LOAD_PATH.unshift(File.dirname(__FILE__))

# In the /lib directory, 
# create a module named AppUtilities 
# and save it as app_utilities.rb.
# 
# In your module, define two constants 
# named HOME_IP and APP_NAME. 

# Then use the utility method below  
# for removing a specified word from a sentence.

=begin

	def sentence_cleaner(sentence, bad_word)
		word_array = sentence.split(' ')
		new_sentence = ""
		word_array.each do |word|
			unless word == bad_word
				new_sentence = new_sentence + word + " "
			end
		end
		return new_sentence
	end

=end

# Once your app_utilities module is created,
# write the code needed below to load and use your module.

# Display both of your constants using puts

# Then, display the result of using 
# your sentence_cleaner utility method.










