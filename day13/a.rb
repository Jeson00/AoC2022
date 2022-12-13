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

def compare (frst, scnd)
    if frst.empty? && scnd.empty?
        return nil
    elsif !frst.empty? && scnd.empty?
        return false
    elsif frst.empty? && !scnd.empty?
        return true
    elsif frst[0].kind_of?(Array) && scnd[0].kind_of?(Array)
        result = compare(frst[0], scnd[0])
        if result == nil
            frst.slice!(0)
            scnd.slice!(0)
            return(compare(frst, scnd))
        else
            return result
        end
    elsif frst[0].kind_of?(Integer) && scnd[0].kind_of?(Array)
        temp = [frst.shift]
        frst.unshift(temp)
        return compare(frst, scnd)
    elsif frst[0].kind_of?(Array) && scnd[0].kind_of?(Integer)
        temp = [scnd.shift]
        scnd.unshift(temp)
        return compare(frst, scnd)
    elsif frst[0] < scnd[0]
        return true
    elsif frst[0] > scnd[0]
        return false
    else
        frst.shift
        scnd.shift
        return compare(frst, scnd)
    end
end

readData = File.open("day13In")
data = readData.read
input = data.lines

comps = []
while !input.empty? do
    bar = []
    input[0].slice!(0)
    bar.push(parse(input.slice!(0))[0])
    input[0].slice!(0)
    bar.push(parse(input.slice!(0))[0])
    comps.push(bar)
    input.slice!(0)
end

total = 0

for i in 0..comps.length - 1 do
    if compare(comps[i][0], comps[i][1])
        total += 1
        total += i
        puts i
    end
end

print total