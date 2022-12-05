readData = File.open("day1In")
data = readData.read
word = String.new
input = Array.new
calories = 0
for i in 0..data.length - 1 do
    if data[i] == "\n" then
        if word.empty? then
            input.push(calories)
            calories = 0
        else
            calories += word.to_i
            word = ""
        end
    else
        word.concat(data[i])
    end
end
input.push(calories)

input = input.sort
puts input[-1]
puts input[-2]
puts input[-3]
puts input[-1] + input[-2] + input[-3]