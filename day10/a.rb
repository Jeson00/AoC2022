readData = File.open("day10In")
data = readData.read
input = data.lines

cycle = 0
total = 0
x = 1

for l in input do
    if l[0] == "n"
        cycle += 1
        if (cycle + 20) % 40 == 0
            total += x * cycle
            print cycle.to_s + ", " + (x * cycle).to_s + ", " + total.to_s + "\n"
        end
    else
        l.slice!(0..4)
        if l[-1] == "\n"
            l.chop!
        end

        cycle += 1
        if (cycle + 20) % 40 == 0
            total += x * cycle
            print cycle.to_s + ", " + (x * cycle).to_s + ", " + total.to_s + "\n"
        end

        cycle += 1
        if (cycle + 20) % 40 == 0
            total += x * cycle
            print cycle.to_s + ", " + (x * cycle).to_s + ", " + total.to_s + "\n"
        end

        x += l.to_i
    end
end