# find largest prime factor huge number

# algorithm taken from Pastbin.com

# lpf = largest prime factor
# x = given huge number

x = 600851475143
lpf = 2
while x > lpf
  if (x%lpf == 0)
    x = x/lpf
    lpf = 2
  else
    lpf = lpf + 1
  end
  # test puts " x = #{x}", "lpf = #{lpf}"
end

puts "Largest prime factor = #{lpf}"

