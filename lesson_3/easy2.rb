=begin
  

Question 1

In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
see if "Spot" is present.

Bonus: What are two other hash methods that would work just as well for this solution?

Solution 1
ages.key?("Spot")

Question 2

Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
Convert the string in the following ways (code will be executed on original munsters_description above):

"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
Solution 2:
munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

Question 3

We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }
Solution 3:
ages.merge!(additional_ages)

Question 4

See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."
Solution 4

advice.match("Dino")
Question 5

Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
Solution 5:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Question 6

How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Solution 6:
flintstones << "Dino"

Question 7

In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
We could have used either Array#concat or Array#push to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

Solution 7
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
or

flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item

or
flintstones << "Dino" << "Hoppy"

Question 8

Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."
...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?

Solution 8:
advice.slice!(0, advice.index('house'))
or
advice.slice(0..38)
Question 9

Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"
Solution 9:
statement.count('t')

Question 10

Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"
Solution 10:
title.center(40)
