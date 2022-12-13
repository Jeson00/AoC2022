def parse(str)
    arr = []
    while !str.empty? do
        if str[0] == ","
            str.slice!(0)
        elsif str[0] == "]"
            str.slice!(0)
            return arr, str
        elsif str[0] == "["
            str.slice!(0)
            foo = parse(str)
            arr.push(foo[0])
            str = foo[1]
        elsif str[1] == "0"
            arr.push(10)
            str.slice!(0..1)
        else
            arr.push(str.slice!(0).to_i)
        end
    end
end

def compare (frst, scnd, pos)
    if frst.length == pos && scnd.length == pos
        return nil
    elsif frst.length > pos && scnd.length == pos
        return false
    elsif frst.length == pos && scnd.length > pos
        return true
    elsif frst[pos].kind_of?(Array) && scnd[pos].kind_of?(Array)
        result = compare(frst[pos], scnd[pos], 0)
        if result == nil
            return(compare(frst, scnd, pos + 1))
        else
            return result
        end
    elsif frst[pos].kind_of?(Integer) && scnd[pos].kind_of?(Array)
        temp = [frst.slice!(pos)]
        frst.insert(pos, temp)
        result = compare(frst, scnd, pos)
        frst.slice!(pos)
        frst.insert(pos, temp[0])
        return result
    elsif frst[pos].kind_of?(Array) && scnd[pos].kind_of?(Integer)
        temp = [scnd.slice!(pos)]
        scnd.insert(pos, temp)
        result = compare(frst, scnd, pos)
        scnd.slice!(pos)
        scnd.insert(pos, temp[0])
        return result
    elsif frst[pos] < scnd[pos]
        return true
    elsif frst[pos] > scnd[pos]
        return false
    else
        return compare(frst, scnd, pos + 1)
    end
end

def bSort()
    for i in 0..$comps.length - 1 do
        for j in 0..$comps.length - 2 do
            if !compare($comps[j], $comps[j + 1], 0)
                foo = $comps[j]
                $comps.slice!(j)
                $comps.insert(j + 1, foo)
            end
        end
    end
end

readData = File.open("day13In")
data = readData.read
input = data.lines

$comps = []
while !input.empty? do
    input[0].slice!(0)
    $comps.push(parse(input.slice!(0))[0])
    input[0].slice!(0)
    $comps.push(parse(input.slice!(0))[0])
    input.slice!(0)
end



# for a in $comps do
#     print a
#     print "\n"
# end

$comps.push([[2]], [[6]])

bSort
for a in $comps do
    print a
    print "\n"
end

print ($comps.index([[2]]) + 1).to_s + ", " + ($comps.index([[6]]) + 1).to_s + "\n"
print ($comps.index([[2]]) + 1) * ($comps.index([[6]]) + 1)