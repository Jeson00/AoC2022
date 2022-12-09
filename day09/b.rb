class Movement
    attr_accessor :tailPos
    attr_accessor :knotsX
    attr_accessor :knotsY

    def initialize()
        @knotsX = Array.new(10, 0)
        @knotsY = Array.new(10, 0)
        @tailPos = Array.new
    end

    def follow()
        for j in 1..9 do
            if @knotsX[j] == @knotsX[j - 1] && @knotsY[j] + 2 == @knotsY[j - 1]
                @knotsY[j] = @knotsY[j - 1] - 1
            elsif @knotsX[j] - 1 == @knotsX[j - 1] && @knotsY[j] + 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1]
                @knotsY[j] = @knotsY[j - 1] - 1
            elsif @knotsX[j] - 2 == @knotsX[j - 1] && @knotsY[j] + 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] + 1
                @knotsY[j] = @knotsY[j - 1] - 1
            elsif @knotsX[j] - 2 == @knotsX[j - 1] && @knotsY[j] + 1 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] + 1
                @knotsY[j] = @knotsY[j - 1]
            elsif @knotsX[j] - 2 == @knotsX[j - 1] && @knotsY[j] == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] + 1
            elsif @knotsX[j] - 2 == @knotsX[j - 1] && @knotsY[j] - 1 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] + 1
                @knotsY[j] = @knotsY[j - 1]
            elsif @knotsX[j] - 2 == @knotsX[j - 1] && @knotsY[j] - 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] + 1
                @knotsY[j] = @knotsY[j - 1] + 1
            elsif @knotsX[j] - 1 == @knotsX[j - 1] && @knotsY[j] - 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1]
                @knotsY[j] = @knotsY[j - 1] + 1
            elsif @knotsX[j] == @knotsX[j - 1] && @knotsY[j] - 2 == @knotsY[j - 1]
                @knotsY[j] = @knotsY[j - 1] + 1
            elsif @knotsX[j] + 1 == @knotsX[j - 1] && @knotsY[j] - 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1]
                @knotsY[j] = @knotsY[j - 1] + 1
            elsif @knotsX[j] + 2 == @knotsX[j - 1] && @knotsY[j] - 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] - 1
                @knotsY[j] = @knotsY[j - 1] + 1
            elsif @knotsX[j] + 2 == @knotsX[j - 1] && @knotsY[j] - 1 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] - 1
                @knotsY[j] = @knotsY[j - 1]
            elsif @knotsX[j] + 2 == @knotsX[j - 1] && @knotsY[j] == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] - 1
            elsif @knotsX[j] + 2 == @knotsX[j - 1] && @knotsY[j] + 1 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] - 1
                @knotsY[j] = @knotsY[j - 1]
            elsif @knotsX[j] + 2 == @knotsX[j - 1] && @knotsY[j] + 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1] - 1
                @knotsY[j] = @knotsY[j - 1] - 1
            elsif @knotsX[j] + 1 == @knotsX[j - 1] && @knotsY[j] + 2 == @knotsY[j - 1]
                @knotsX[j] = @knotsX[j - 1]
                @knotsY[j] = @knotsY[j - 1] - 1
            end
        end
        @tailPos.push([@knotsX[9], @knotsY[9]])
    end

    def result()
        puts knotsX[0].to_s + ", " + knotsY[0].to_s
        puts knotsX[1].to_s + ", " + knotsY[1].to_s
        puts knotsX[2].to_s + ", " + knotsY[2].to_s
        puts knotsX[3].to_s + ", " + knotsY[3].to_s
        puts knotsX[4].to_s + ", " + knotsY[4].to_s
        puts knotsX[5].to_s + ", " + knotsY[5].to_s
        puts knotsX[6].to_s + ", " + knotsY[6].to_s
        puts knotsX[7].to_s + ", " + knotsY[7].to_s
        puts knotsX[8].to_s + ", " + knotsY[8].to_s
        puts knotsX[9].to_s + ", " + knotsY[9].to_s
        @tailPos.uniq!
        return @tailPos.length
    end
end

if __FILE__ == $0
    readData = File.open("day9In")
    data = readData.read
    input = data.lines


    mv = Movement.new

    for l in input do
        if l[-1] == "\n"
            l.chop!
        end
    
        if l[0] == "U"
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.knotsY[0] += 1
                mv.follow
            end
        elsif l[0] == "L"
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.knotsX[0] -= 1
                mv.follow
            end
        elsif l[0] == "D"
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.knotsY[0] -= 1
                mv.follow
            end
        else
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.knotsX[0] += 1
                mv.follow
            end
        end
    end

    print mv.result
end
