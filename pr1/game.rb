if ARGV.length != 2
  puts "Use: [rock/scissors/paper] [rock/scissors/paper]"
  exit
end

player_choice = ARGV[0].downcase
computer_choice = ARGV[1].downcase

valid_choices = ["rock", "scissors", "paper"]
unless valid_choices.include?(player_choice) && valid_choices.include?(computer_choice)
  puts "Invalid data entered. Valid values: rock, scissors, paper."
  exit
end

if player_choice == computer_choice
  puts "Draw! Both players chose #{player_choice}."
elsif (player_choice == "rock" && computer_choice == "scissors") ||
      (player_choice == "scissors" && computer_choice == "paper") ||
      (player_choice == "paper" && computer_choice == "rock")
  puts "You won! You chose #{player_choice}, and computer chose #{computer_choice}."
else
  puts "You lose! You chose #{player_choice}, and computer chose #{computer_choice}."
end