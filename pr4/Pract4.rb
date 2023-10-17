def split_pie(pie, slice_parts, piece_parts)

  slice_size = pie.size / slice_parts
  piece_size = pie[0].size / piece_parts

  return nil if slice_size * slice_parts != pie.size || piece_size * piece_parts != pie[0].size

  slices = pie.each_slice(slice_size).to_a

  slices.map { |slice| slice.map(&:chars).transpose.each_slice(piece_size).map(&:transpose).map {
    |part| part.map(&:join) } }.flatten(1)

end

def count_raisins(part)
  part.join.count('о') #символ кирилиці, а не латиниці
end

def area(part)
  part.size * part.first.size
end

pie = %w[
.о......
......о.
....о...
..о.....
]

factors = (1..(pie.size * pie[0].size)).select { |n| (pie.size * pie[0].size) % n == 0 }

best_solution = nil
best_width = 0

factors.product(factors).each do |slice_parts, piece_parts|
  parts = split_pie(pie, slice_parts, piece_parts)
  next if parts.nil?

  if parts.all? { |part| area(part) == area(parts.first) && count_raisins(part) == 1 }
    puts "Поділ на частини #{slice_parts}x#{piece_parts}:"
    parts.each_with_index do |part, index|
      puts "Кусочок #{index + 1}:"
      part.each { |row| puts row }
    end
    puts "\n"

    if parts.first.first.size > best_width
      best_solution = [slice_parts, piece_parts, parts]
      best_width = parts.first.first.size
    end
  end
end


if best_solution
  slice_parts, piece_parts = best_solution
  puts "Ліпше рішення: Поділ на частини #{slice_parts}x#{piece_parts}*"
  puts "Ширина: #{best_width}"
else
  puts "Рішень немає."
end
