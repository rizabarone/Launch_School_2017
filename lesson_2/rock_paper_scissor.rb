require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)
LETTER_CHOICES = %w(r p sc l sp)


def count
  tie = wins = losses = 0
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first,second)
     (first == 'rock' && second == 'scissors') ||
     (first == 'paper' && second == 'rock') ||
      (first == 'scissors' && second == 'rock') ||
      (first == 'lizard' && second == 'spock') ||
      (first == 'spock' && second == 'rock') ||
      (first == 'scissors' && second == 'lizard')
end

def display_results(player, computer)
  if win?(player,computer)
    prompt("You won!") 
  elsif win?(computer, player)
    prompt("Computer won!") 
  else
    prompt("It's a tie!")
  end
end


if VALID_CHOICES[choice] == VALID_CHOICES[computer_choice.sample] || VALID_CHOICES[choice] == LETTER_CHOICES[computer_choice.sample]
  tie += 1
elsif VALID_CHOICES[choice] == VALID_CHOICES[computer_choice.sample - 1] || VALID_CHOICES[choice] == LETTER_CHOICES[computer_choice.sample - 1]
  losses += 1
else
  wins += 1
end


puts "wins : #{wins}\nlosses : #{losses}\ndraw : #{tie}"
if wins > losses
  puts "You won the game"
elsif wins < losses
  puts "You lost!"
else
  puts "The game is a tie"
end

loop do
  choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}") 
      prompt("You can also put the following :#{LETTER_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()
  
   if VALID_CHOICES.include?(choice) || LETTER_CHOICES.include?(choice)
     break
   else
     prompt("That's not a valid choice.")
   end
end


 computer_choice = VALID_CHOICES.sample || LETTER_CHOICES.sample

 prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

 display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing.Goodbye!")