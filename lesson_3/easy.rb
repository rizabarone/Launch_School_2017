
=begin 
Question 1

What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

Solution: 1,2,2,3

Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it? 
put ! before something, like !user_name 
put ! after something, like words.uniq! 
put ? before something 
put ? after something 
put !! before something, like !!user_name 

Solution:
Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

!= means "not equals"
? : is the ternary operator for if...else
!!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
!<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.

Question 3

Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."

Solution:
advice.gsub!('important', 'urgent')

Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

Solution:
numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
(note that the array is operated on directly and the return value of the call is the removed item 2)

numbers.delete(1) # numbers is now [2, 3, 4, 5]
(note that the array is operated on directly and the return value of the call is the removed item 1)

Another thing to notice is that while both of these methods operate on the contents of the referenced array and modify it in place (rather than just returning a modified version of the array) these methods do NOT have the usual ! at the end of the method name for "modify in place" method names.

Question 5

Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.

Solution 5
(10..100).cover?(42)

Question 6

Starting with the string:
famous_words = "seven years ago..."
show two different ways to put the expected "Four score and " in front of it.
Solution:
"Four score and" + famous_words

or
famous_words.prepend("Four score and ")

or

"Four score and " << famous_words


Question 7

Fun with gsub:
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

eval(how_deep)

what will be the result?

Solution:

42

Question 8

If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

Solution:
flintstones.flatten!


Question 9

Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
Turn this into an array containing only two elements: Barney's name and Barney's number

Solution:

flintstones.assoc("Barney")

=end
