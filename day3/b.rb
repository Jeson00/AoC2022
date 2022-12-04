readData = File.open("day3In")
data = readData.read
input = data.lines

elf1 = Array.new(53, false)
elf2 = Array.new(53, false)
total = 0

while !input.empty? do
    pack1 = input[0].sub("\n", "")
    for i in 0..pack1.length - 1 do
        if pack1[i].ord <= 90 then
            elf1[pack1[i].ord - 38] = true
        else
            elf1[pack1[i].ord - 96] = true
        end
    end

    input.delete_at(0)

    pack2 = input[0].sub("\n", "")
    for i in 0..pack2.length - 1 do
        if pack2[i].ord <= 90 then
            elf2[pack2[i].ord - 38] = true
        else
            elf2[pack2[i].ord - 96] = true
        end
    end

    input.delete_at(0)

    pack3 = input[0].sub("\n", "")
    for i in 0..pack3.length - 1 do
        if pack3[i].ord <= 90 && elf1[pack3[i].ord - 38] && elf2[pack3[i].ord - 38] then
            total += pack3[i].ord - 38
            elf1[pack3[i].ord - 38] = false
        elsif pack3[i].ord > 90 && elf1[pack3[i].ord - 96] && elf2[pack3[i].ord - 96] then
            total += pack3[i].ord - 96
            elf1[pack3[i].ord - 96] = false
        end
    end

    input.delete_at(0)
    elf1 = Array.new(53, false)
    elf2 = Array.new(53, false)
end

puts total