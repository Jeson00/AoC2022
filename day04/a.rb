readData = File.open("day4In")
data = readData.read
input = data.lines

total = 0

for pair in input do
    i = 0
    s = String.new
    while pair[i] != "-" do
        s = s + pair[i]
        i += 1
    end
    elf11 = s.to_i
    s = ""
    i += 1

    while pair[i] != "," do
        s = s + pair[i]
        i += 1
    end
    elf12 = s.to_i
    s = ""
    i += 1

    while pair[i] != "-" do
        s = s + pair[i]
        i += 1
    end
    elf21 = s.to_i
    s = ""
    i += 1

    while i < pair.length && pair[i] != "\n" do
        s = s + pair[i]
        i += 1
    end
    elf22 = s.to_i

    if elf11 <= elf21 && elf12 >= elf22 || elf11 >= elf21 && elf12 <= elf22 then
        total += 1
    end
end

puts total