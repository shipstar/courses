#!/bin/ruby

def kangaroo(x1, v1, x2, v2)
  return 'YES' if x1 == x2
  return 'NO' if (x2 > x1 && v2 >= v1) || (x1 > x2 && v1 >= v2)

  kangaroo(x1 + v1, v1, x2 + v2, v2)
end

x1, v1, x2, v2 = gets.strip.split(' ')
x1 = x1.to_i
v1 = v1.to_i
x2 = x2.to_i
v2 = v2.to_i
result = kangaroo(x1, v1, x2, v2)
puts result;
