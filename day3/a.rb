readData = File.open("day3In")
data = readData.read
input = data.lines

counting = Array.new(53, false)
total = 0

for items in input do
    items = items.sub("\n", "")
    half1 = items[0..items.length/2-1]
    half2 = items[items.length/2..items.length-1]
    for i in 0..half1.length - 1 do
        if half1[i].ord <= 90 then
            counting[half1[i].ord - 38] = true
        else
            counting[half1[i].ord - 96] = true
        end
    end

    for i in 0..half2.length - 1 do
        if half2[i].ord <= 90 && counting[half2[i].ord - 38]
            total += half2[i].ord - 38
            counting[half2[i].ord - 38] = false
        elsif half2[i].ord > 90 && counting[half2[i].ord - 96]
            total += half2[i].ord - 96
            counting[half2[i].ord - 96] = false
        end
    end
    counting = Array.new(53, false)
end

puts total