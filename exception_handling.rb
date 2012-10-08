$LOAD_PATH.unshift(File.dirname(__FILE__))

# 1. Write a method which receives the name of 
# a color as a string from the command line, 
# and then displays it in a string as 
# "You chose #{color}". 
#
# If the user chooses the color red though, 
# raise an exception which stops the 
# program and display a "No red, sorry" message.
# Write code to call your method, and test your result.

def check_colour

	puts "You chose #{colour}"

end

puts "Pick a colour, any colour..."
colour = $stdin.gets.chomp
check_colour(colour)


# 2. Modify your code in Task 1 to handle 
# the exception and display only the error message.

# 3. In the /lib folder, write a custom 
# ColorChoiceException class, which include a 
# default error message that can be overridden 
# when the exception is raised. 
