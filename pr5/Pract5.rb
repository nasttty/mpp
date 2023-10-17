def to_rom (numb)

  numbers = { 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}

  if numb< 1 || numb > 3999
    return "Введене число не входить в діапазон (1-3999)"
  end

  if numbers.include?(numb)
    return numbers[numb]
  end

  result = ''
  n = numb.to_s.chars.map(&:to_i).reverse

  digit = 1

  n.each do |one|

    case one
    when 0
      digit *= 10
      next
    when 1..3
      result += numbers[digit] * one
    when 4
      result += numbers[digit * 5]
      result += numbers[digit]
    when 5
      result += numbers[digit * 5]
    when 9
      result += numbers[digit * 10]
      result += numbers[digit]
    else
      result += numbers[digit] * (one - 5)
      result += numbers[digit * 5]
    end

    digit *= 10 #перехід до наступного розряду

  end

  result.reverse

end


def to_arab(number)

  numbers = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
              'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10,
              'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }

  return 0 if number.empty?

  numbers.keys.each do |roman|
    if number.start_with?(roman)
      return numbers[roman] + to_arab(number[roman.length..-1])
    end
  end

end


loop do

  numb = gets.chomp

  break if numb == '-1'

  if numb[/^\d+$/]
    puts to_rom(numb.to_i)
  elsif numb[/^[IVXLCDM]+$/]
    puts to_arab(numb)
  else
    puts 'Некорректний ввід'
  end


end