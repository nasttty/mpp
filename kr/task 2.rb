def is_prime? (number)

  return false if number < 2
  return true if number < 4

  return true if number ** 2 % 24 == 1

  false

end

loop do

  puts 'Введіть число: '
  number = gets.to_i

  break if number == -1

  if is_prime?(number)
    puts "#{number} - просте число."
  else
    puts "#{number} - не просте число."
  end

end