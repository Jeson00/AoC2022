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

def scene(forest, org, top, left, bot, right, x, y, tot)
    if top
        if y == 0
            return tot
        elsif forest[y - 1][x] >= org
            return tot + 1            
        else
            return scene(forest, org, true, false, false, false, x, y - 1, tot + 1)
        end
    end

    if left
        if x == 0
             return tot
        elsif forest[y][x - 1] >= org 
            return tot + 1             
        else
            return scene(forest, org, false, true, false, false, x - 1, y, tot + 1)
        end
    end

    if bot
        if y == forest.length - 1
             return tot
        elsif forest[y + 1][x] >= org
            return tot + 1             
        else
            return scene(forest, org, false, false, true, false, x, y + 1, tot + 1)
        end
    end

    if right
        if x == forest[y].length - 1
             return tot
        elsif forest[y][x + 1] >= org
            return tot + 1             
        else
            return scene(forest, org, false, false, false, true, x + 1, y, tot + 1)
        end
    end
end

result = 0
xCord = 0
yCord = 0

for l in 1..forest.length - 2 do
    for i in 1..forest[l].length - 2 do
        topS = scene(forest, forest[l][i], true, false, false, false, i, l, 0)
        leftS = scene(forest, forest[l][i], false, true, false, false, i, l, 0)
        botS = scene(forest, forest[l][i], false, false, true, false, i, l, 0)
        rightS = scene(forest, forest[l][i], false, false, false, true, i, l, 0)
        print 
        if topS * leftS * botS * rightS > result
            result = topS * leftS * botS * rightS
            xCord = i
            yCord = l
        end
    end
end

puts result
puts xCord
puts yCord