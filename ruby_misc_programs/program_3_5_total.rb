# program 3_5_total

def sub_total(multiple)
  num = 0
  st = 0
  while num < (1000 - multiple)
      num = num + multiple      
      st = st + num
  end
  return st
end

# do for multiple of 3, 5, 15

sub_total_3 = sub_total(3)
sub_total_5 = sub_total(5)
sub_total_15 = sub_total(15)

total = sub_total_3 + sub_total_5 - sub_total_15

puts "Sum of multiples of 3 and 5 below 1000  is", total
