# Examples
magazine = %w(the quick brown fox jumped over the lazy dog)
ransom = %w(the Lazy dog)

# Note: I think the implementation could be simplified using a multiset
# a la https://github.com/maraigue/multiset, but it didn't seem worth
# pulling in a whole data structure / library just for one problem.
#
# The following code should work, though:
#
# require 'multiset'
#
# magazine_words = Multiset.new magazine
# ransom_words = Multiset.new ransom
#
# puts magazine_words.superset?(ransom_words) ? 'Yes' : 'No'

words_available = magazine.each_with_object(Hash.new(0)) do |word, memo|
  memo[word] = memo[word] + 1
end

enough_words = true
ransom.each do |word|
  words_available[word] -= 1
  enough_words = false and break if words_available[word] < 0
end

puts enough_words ? 'Yes' : 'No'
