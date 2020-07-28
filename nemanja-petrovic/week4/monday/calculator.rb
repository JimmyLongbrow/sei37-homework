# def calculator
#   puts "a: "
#   a = gets.chomp.to_f
#   puts "b: "
#   b = gets.chomp.to_f
#   cal = gets.chomp
#   if cal == "+"
#     puts a+b
#   elsif cal == "-"
#     puts a-b
#   elsif cal == "*"
#     puts a*b
#   elsif cal == "/"
#     puts a/b
# end
#
# days_of_the_week = [Monday,
#   Tuesday,
#   Wednesday,
#   Thursday,
#   Friday,
#   Saturday,
#   Sunday]
#
# moved_day=days_of_the_week.pop
# days_of_the_week.unshift moved_day
#
# days_of_the_week.rotate! +1
#
#
# week_days =days_of_the_week[0..4]
# week_end=days_of_the_week[5..6]
# week_parts=[week_days,week_end]
#
# week_parts.first[3]
# week_parts.last.last
#
# week_parts.pop
#
# week_parts.first.sort!
# week_parts.flatten
# p week_parts
# # require 'pry';biding.pry = debbuger
# # ;s -l

# Array and Hash access
# A. Given the following data structure:
a = ["Anil", "Erik", "Jonathan"]
# How would you return the string "Erik"?
puts a.at(1)
# How would you add your name to the array?
a << "Nemo"
#or a.push "Nemo"
puts a
# B. Given the following data structure:
h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}
# How would you return the string "One"?
puts h[1]
# How would you return the string "Two"?
puts h[:two]
# How would you return the number 2?
puts h["two"]
# How would you add {3 => "Three"} to the hash?
h[3] = "Three"
# How would you add {:four => 4} to the hash?
h[:four] = 4
puts h
# C. Given the following data structure:
is = {true => "It's true!", false => "It's false"}
# What is the return value of is[2 + 2 == 4]?
if [2 + 2 == 4]
  puts true
end
# What is the return value of is["Erik" == "Jonathan"]?
if ["Erik" == "Jonathan"]
  puts true
end
# What is the return value of is[9 > 10]?
if [9 > 10]
  puts true
else false
end
# What is the return value of is[0]?
"Zero"
# What is the return value of is["Erik"]?
a[0]
# D. Given the following data structure:
# users = {
#   "Jonathan" => {
#     :twitter => "tronathan",
#     :favorite_numbers => [12, 42, 75],
#   },
#   "Erik" => {
#     :twitter => "sferik",
#     :favorite_numbers => [8, 12, 24],
#   },
#   "Anil" => {
#     :twitter => "bridgpal",
#     :favorite_numbers => [12, 14, 85],
#   },
# }
# How would you access Jonathan's Twitter handle (i.e. the string "tronathan")?
# How would you add the number 7 to Erik's favorite numbers?
# How would you add yourself to the users hash?
# How would you return the array of Erik's favorite numbers?
# How would you return the smallest of Erik's favorite numbers?
# How would you return an array of Anil's favorite numbers that are also even?
# How would you return an array of the favorite numbers common to all users?
# How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?
