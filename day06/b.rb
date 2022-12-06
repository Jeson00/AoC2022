readData = File.open("day6In")
data = readData.read
input = data

check = false
i = 13
str = input[0..12]
arr = Array.new(26, 0)

for c in str.each_char do
    arr[c.ord - 97] += 1
end

while !check do
    c = input[i]
    str = str + c
    arr[str[-1].ord - 97] += 1
    check = true
    for j in arr do
        if j > 1
            check = false
        end
    end

    c = str.slice!(0)
    arr[c.ord - 97] = arr[c.ord - 97] - 1
    i += 1
end

puts i