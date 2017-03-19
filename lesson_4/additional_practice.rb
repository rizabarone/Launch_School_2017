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