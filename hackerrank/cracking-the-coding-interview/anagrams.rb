str_1 = 'abcde'
str_2 = 'bababef'

# I knew intersection would be helpful, but used
# https://stackoverflow.com/questions/38020334/ruby-array-intersection-with-duplicates
# to speed things up.

def char_counts(chars)
  chars.each_with_object(Hash.new(0)) { |c, memo| memo[c] += 1 }
end

chars_1 = str_1.split('')
count_1 = char_counts chars_1
chars_2 = str_2.split('')
count_2 = char_counts chars_2

intersected = (chars_1 & chars_2).flat_map { |c| [c]*[count_1[c], count_2[c]].min }

# Started with (str_1.size - intersected.size) + (str_2.size - intersected.size)
# but applied some commutativity / associativity to simplify.
puts str_1.size + str_2.size - 2 * intersected.size
