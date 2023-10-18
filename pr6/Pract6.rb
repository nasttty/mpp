def ipv4?(ip)
  ip.split(".").select { |num| num.match?(/^\d+$/) && num.to_i.between?(0, 255) && num == num.to_i.to_s }.count == 4
end

loop do

  input = gets.chomp

  break if input == '-1'

  puts ipv4?(input)

end


