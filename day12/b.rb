class Dijkstra
    
    def initialize(input)
        @input = input
        @graph = []
        @pq = []
        @done = []
        @start = []
    end

    def convert()
        for l in @input do
            arr = Array.new
            for c in l.each_char do
                if c == "S"
                    arr.push(-1)
                elsif c == "E"
                    arr.push(26)
                elsif c != "\n"
                    arr.push(c.ord - 97)
                end
            end
            @graph.push(arr)
        end
    end

    def findAllPath
        yE = @graph.index{|element| element.index(26) != nil}
        xE = @graph[yE].index(26)
        foo = []
        for k in 0..@graph.length - 1 do
            for l in 0..@graph[k].length - 1 do
                if @graph[k][l] == 0
                    @pq = []
                    @done = []
                    bar = findPath(l, k, xE, yE)
                    foo.push(bar[0])
                    print bar
                    print "\n"
                end
            end
        end
        foo.sort!
        print foo.first
        print "\n"
        print foo.last
    end


    def findPath(xS, yS, xE, yE)
        # @done = Array.new(@graph.length, Array.new(@graph[0].length, false))
        for i in 0..@graph.length - 1 do
            arr = Array.new()
            for j in 0..@graph[0].length - 1 do
                arr.push(false)
            end
            @done.push(arr)
        end

        @graph[yS][xS] = 0
        @graph[yE][xE] = 25

        for i in 0..@graph.length - 1 do
            for j in 0..@graph[i].length - 1 do
                @pq.push([8000, i, j, @graph[i][j]])
            end
        end

        ind = @pq.index {|element| element[1] == yS && element[2] == xS}
        s = @pq.slice!(ind)
        @pq.unshift(s)
        @pq[0][0] = 0

        while !@pq.empty? do
            point = @pq.shift
            y = point[1]
            x = point[2]
            h = point[3]
            @done[point[1]][point[2]] = true
            

            if point[1] == yE && point[2] == xE
                return point
            end

            if y > 0 && @graph[y - 1][x] <= h + 1 && !@done[y - 1][x] && @pq[@pq.index {|element| element[1] == y - 1 && element[2] == x}][0] > point[0]
                relax = @pq.slice!(@pq.index {|element| element[1] == y - 1 && element[2] == x})
                relax[0] = point[0] + 1
                # print relax
                # print "1\n"
                insert(relax)
            end

            if y < @graph.length - 1 && !@done[y + 1][x] && @graph[y + 1][x] <= h + 1 && @pq[@pq.index {|element| element[1] == y + 1 && element[2] == x}][0] > point[0]
                relax = @pq.slice!(@pq.index {|element| element[1] == y + 1 && element[2] == x})
                relax[0] = point[0] + 1
                # print relax
                # print "2\n"
                insert(relax)
            end

            if x > 0 && @graph[y][x - 1] <= h + 1 && !@done[y][x - 1] && @pq[@pq.index {|element| element[1] == y && element[2] == x - 1}][0] > point[0]
                relax = @pq.slice!(@pq.index {|element| element[1] == y && element[2] == x - 1})
                relax[0] = point[0] + 1
                # print relax
                # print "3\n"
                insert(relax)
            end

            if x < @graph[0].length - 1 && !@done[y][x + 1] && @graph[y][x + 1] <= h + 1 && @pq[@pq.index {|element| element[1] == y && element[2] == x + 1}][0] > point[0]
                relax = @pq.slice!(@pq.index {|element| element[1] == y && element[2] == x + 1})
                relax[0] = point[0] + 1
                # print relax
                # print "4\n"
                insert(relax)
            end
        end
    end

    def insert(element)
        if @pq.empty?
            @pq.push(element)
            return
        end
        
        k = 0
        while @pq[k][0] <= element[0] do
            k += 1
        end
        @pq.insert(k, element)
    end

    def printLab()
        for l in @graph do
            print l
            print "\n"
        end
    end
end


if __FILE__ == $0
    readData = File.open("day12In")
    data = readData.read
    input = data.lines

    dij = Dijkstra.new(input)
    dij.convert
    dij.findAllPath
end