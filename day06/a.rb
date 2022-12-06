readData = File.open("day6In")
data = readData.read
input = data

check = false
i = 3
str = input[0..2]

while !check do
    c = input[i]
    str = str + c
    if str[0] != str[1] && str[0] != str[2] && str[0] != str[3] && str[1] != str[2] && str[1] != str[3] && str[2] != str[3]
        puts "hit"
        check = true
    else
        str.slice!(0)
    end
    i += 1
end

puts i