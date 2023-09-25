def infix_to_rpn(expression)
  precedence = {
    '^' => 3,
    '*' => 2,
    '/' => 2,
    '+' => 1,
    '-' => 1
  }

  output = []
  stack = []

  tokens = expression.split(/\s+/)

  tokens.each do |token|
    if token.match?(/\d+/)
      output << token
    elsif token.match?(/[\+\-\*\/\^]/)
      while !stack.empty? && precedence[stack.last] >= precedence[token]
        output << stack.pop
      end
      stack.push(token)
    end
  end

  while !stack.empty?
    output << stack.pop
  end

  return output.join(' ')
end

print "Введіть математичний вираз: "
expression = gets.chomp
rpn_expression = infix_to_rpn(expression)
puts "Вираз у RPN: #{rpn_expression}"
