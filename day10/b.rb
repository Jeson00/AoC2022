readData = File.open("day10In")
data = readData.read
input = data.lines

position = 0
x = 1
arr = Array.new(240, false)

for l in input do
    if l[0] == "n"
        if x - 1 == position || x == position || x + 1 == position
            arr[position] = true
            print "#"
        else
            print " "
        end
        if (position + 1) % 40 == 0
            print "\n"
            position = -1
        end
        position += 1
    else
        l.slice!(0..4)
        if l[-1] == "\n"
            l.chop!
        end

        if x - 1 == position || x == position || x + 1 == position
            arr[position] = true
            print "#"
        else
            print " "
        end
        if (position + 1) % 40 == 0
            print "\n"
            position = -1
        end
        position += 1

        if x - 1 == position || x == position || x + 1 == position
            arr[position] = true
            print "#"
        else
            print " "
        end
        if (position + 1) % 40 == 0
            print "\n"
            position = -1
        end
        position += 1
        x += l.to_i
    end
end