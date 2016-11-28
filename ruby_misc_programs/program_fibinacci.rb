# Euler -- Fibinacci 

# Sum of even terms less than 4m

#set starting values
a = 1
b = 2
c = 0
sum = 0

while true
  c = a + b
  if c > 4000000 
    # testing puts "c = ", c 
    break
  end

  # testing puts "c = #{a} + #{b}"
  if c%2 == 0 then sum = sum + c end # practice if on one line
  # testing puts "sum = #{sum}"
  # prepare terms for next calculation
  a = b
  b = c
  # testing puts "a = #{a}; b = #{b}"
end

# testing puts "c = ", c 
puts "Sum of even Fib terms less than 4m = #{sum}"

