Exercise 1

Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
Turn this array into a hash where the names are the keys and the values are the positions in the array.

Solution 1

flintstones = Hash.new

%w(Fred Barney Wilma Betty Pebbles BamBam).each_with_index { |name, index|
  flintstones[name] = index
}

flintstones


Exercise 2

Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
Solution 2
One solution would be to assign a variable to an initial value of 0 and then iterate through the Hash adding each value in turn to the total.

total_ages = 0
ages.each { |_,age| total_ages += age }
total_ages # => 6174

Another option would be to use a Enumerable#inject method.

ages.values.inject(:+) # => 6174
This uses ages.values to make an array, then uses the inject method which is part of the Enumerable module.
 The strange-looking parameter to inject is simply a variety of the inject method which says "apply the + operator to 
 the accumulator and object parameters of inject".

As we have previously discussed, Enumerable is included in Array, and it can be useful to augment your knowledge of what 
you can do with arrays by studying Enumerable. When faced with a problem such as this one however, don't get tempted to go 
'method hunting' in order to reach a solution. As demonstrated, even if you don't know the #inject method, the problem can be 
solved equally well by using #each to iterate through the Hash; you could even use a basic loop to reach the same result.

Exercise 3

In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
throw out the really old people (age 100 or older).

Solution 3
ages.keep_if { |_, age| age < 100 }
You could also use #select! here. When using similar methods however, it is important to be aware of the subtle differences 
in their implementation. For example, the Ruby Documentation for Hash#select! tells us that it is "Equivalent to Hash#keep_if,
 but returns nil if no changes were made", though in this case that wouldn't have made any difference.

 Exercise 4

Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
Solution 4
ages.values.min


Exercise 5

In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Find the index of the first name that starts with "Be"

Solution 5
flintstones.index { |name| name[0, 2] == "Be" }


Exercise 6

Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Solution 6
flintstones.map! do |name|
  name[0, 3]
end

This could also be done in a single line:

flintstones.map! { |name| name[0,3] }


Exercise 7

Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
Solution 7
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

Exercise 8

What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
Solution 8
first one...

1
3
second one...

1
2
To better understand what is happening here, we augment our loop with some additional "debugging" information:

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end
The output is:

"0  [1, 2, 3, 4]  1"
"1  [2, 3, 4]  3"
From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by #each is compared against the current length of the array rather than its original length.

In our first example, the removal of the first item in the first pass changes the value found for the second pass.

In our second example, we are shortening the array each pass just as in the first example...but the items removed are beyond the point we are sampling from in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.
Exercise 9

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"
would be:

words = "The Flintstones Rock"
Write your own version of the rails titleize implementation.

Solution 9
words.split.map { |word| word.capitalize }.join(' ')
Exercise 10

Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

Hint
Try using a case statement along with Ruby Range objects in your solution
Solution 10
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
