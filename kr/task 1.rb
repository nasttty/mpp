def fac (number)

  total = 1
  number.downto(1) do |i|
    total = total * i
  end

  total

end

loop do

  puts 'Введіть число: '
  number = gets.to_i

  break if number == -1

  puts "#{number}! = #{fac(number)}"

end