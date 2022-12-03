readData = File.open("day2In")
data = readData.read
input = data.lines
result = 0
for match in input do
    match = match.sub("\n", "")
    case match
        when "A X" then result += 3
        when "A Y" then result += 4
        when "A Z" then result += 8
        when "B X" then result += 1
        when "B Y" then result += 5
        when "B Z" then result += 9
        when "C X" then result += 2
        when "C Y" then result += 6
        when "C Z" then result += 7
        else puts "something went wrong"
        end
end

puts result