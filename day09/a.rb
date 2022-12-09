class Movement
    attr_accessor :tailPos
    attr_accessor :headX
    attr_accessor :headY

    def initialize()
        @headX = 0
        @headY = 0
        @tailX = 0
        @tailY = 0
        @tailPos = Array.new
    end

    def follow()
        if @tailX == @headX && @tailY + 2 == @headY
            @tailY = @headY - 1
        elsif @tailX - 1 == @headX && @tailY + 2 == @headY
            @tailX = @headX
            @tailY = @headY - 1
        elsif @tailX - 2 == @headX && @tailY + 1 == @headY
            @tailX = @headX + 1
            @tailY = @headY
        elsif @tailX - 2 == @headX && @tailY == @headY
            @tailX = @headX + 1
        elsif @tailX - 2 == @headX && @tailY - 1 == @headY
            @tailX = @headX + 1
            @tailY = @headY
        elsif @tailX - 1 == @headX && @tailY - 2 == @headY
            @tailX = @headX
            @tailY = @headY + 1
        elsif @tailX == @headX && @tailY - 2 == @headY
            @tailY = @headY + 1
        elsif @tailX + 1 == @headX && @tailY - 2 == @headY
            @tailX = @headX
            @tailY = @headY + 1
        elsif @tailX + 2 == @headX && @tailY - 1 == @headY
            @tailX = @headX - 1
            @tailY = @headY
        elsif @tailX + 2 == @headX && @tailY == @headY
            @tailX = @headX - 1
        elsif @tailX + 2 == @headX && @tailY + 1 == @headY
            @tailX = @headX - 1
            @tailY = @headY
        elsif @tailX + 1 == @headX && @tailY + 2 == @headY
            @tailX = @headX
            @tailY = @headY - 1
        end
        @tailPos.push([@tailX, @tailY])
    end

    def result()
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
                mv.headY += 1
                mv.follow
            end
        elsif l[0] == "L"
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.headX -= 1
                mv.follow
            end
        elsif l[0] == "D"
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.headY -= 1
                mv.follow
            end
        else
            l.slice!(0..1)
            for i in 1..l.to_i do
                mv.headX += 1
                mv.follow
            end
        end
    end

    print mv.result
end
