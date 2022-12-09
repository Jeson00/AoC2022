readData = File.open("day8In")
data = readData.read
input = data.lines

forest = Array.new

for l in input do
    arr = Array.new
    for c in l.each_char do
        if c != "\n"
            arr.push(c.to_i)
        end
    end
    forest.push(arr)
end

def visibility(forest, org, top, left, bot, right, x, y)
    if top
       if y == 0
            return true
       elsif forest[y - 1][x] < org
            return visibility(forest, org, true, false, false, false, x, y - 1)
       else
            return false
       end
    end

    if left
        if x == 0
             return true
        elsif forest[y][x - 1] < org
            return visibility(forest, org, false, true, false, false, x - 1, y)
        else
             return false
        end
    end

    if bot
        if y == forest.length - 1
             return true
        elsif forest[y + 1][x] < org
            return visibility(forest, org, false, false, true, false, x, y + 1)
        else
             return false
        end
    end

    if right
        if x == forest[y].length - 1
             return true
        elsif forest[y][x + 1] < org
            return visibility(forest, org, false, false, false, true, x + 1, y)
             return false
        end
    end
end

result = 0

for l in 1..forest.length - 2 do
    for i in 1..forest[l].length - 2 do
        if visibility(forest, forest[l][i], true, false, false, false, i, l) || visibility(forest, forest[l][i], false, true, false, false, i, l) || visibility(forest, forest[l][i], false, false, true, false, i, l) || visibility(forest, forest[l][i], false, false, false, true, i, l)
            result += 1
        end
    end
end

result += forest[0].length * 2 + (forest.length - 2) * 2

puts result