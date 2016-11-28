# find largest palindrome from product of two 3-digit numbers.
# based upon codeblog.dhananjaynene.com
# very succinct program

max_p = 0
max_x = 0
max_y = 0
for x in 100..1000 do
  for y in 100..1000 do
    if (x*y).to_s == (x*y).to_s.reverse
      if max_p < (x*y)
        max_p = (x*y)
        max_x = x
        max_y = y
      end   
    end
  end
end

puts "Largest palindrome from product of two 3-digit numbers = #{max_p} from #{max_x} times #{max_y}"



