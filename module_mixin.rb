$LOAD_PATH.unshift(File.dirname(__FILE__))

# 1. In the /lib directory, 
# create a class named Song which 
# has attr_accessors of artist, title
# and duration. 
#
# Include and implement the Comparable module.
#
# Remember to require the song class file









song1 = Song.new("Number 1", "Tinchy Stryder", 215)
song2 = Song.new("Song 2", "Blur", 122)
song3 = Song.new("The Magic Number", "De La Soul", 196)

# should be Blur
puts "Should be Blur"
puts song2.artist

# should be The Magic Number
puts "Should be The Magic Number"
puts song3.title

# should be true
puts "Should be true"
puts song1 > song2

# should be false
puts "Should be false"
puts song2 == song3

# should be false
puts "Should be false"
puts song1 < song3

# should be true
puts "Should be true"
puts song3.between?(song1, song2)




puts "-------------------"

# 2. In the /lib directory, 
# create a class named Compilation which 
# accepts a list of objects passed 
# to its initializer method and 
# assigns them to an internal array called tracks
#
# Include and implement the Enumerable module.
#
# Remember to require the song class file


now_thats_what_i_call_numbers = Compilation.new(song1, song2, song3)



# Checks that the track length is 3 songs
puts "Should be 3"
puts now_thats_what_i_call_numbers.tracks.length


# Checks to see if compilation has Blur
has_blur = now_thats_what_i_call_numbers.any? do |song|
	song.artist == "Blur"
end

puts "Should be true"
puts has_blur


# goes over each song and returns the song's title
song_names = now_thats_what_i_call_numbers.map do |song|
	song.title
end

puts "Should be [Number 1, Song 2, The Magic Number]"
puts song_names


