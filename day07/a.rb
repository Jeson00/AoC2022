class Fil
    attr_accessor :name
    attr_accessor :size

    def initialize(size, name)
        @size = size
        @name = name
    end

end


class Dir
    attr_accessor :name
    attr_accessor :parent
    attr_accessor :dirs

    def initialize(name, parent)
        @dirs = Array.new
        @files = Array.new
        @name = name
        @parent = parent
    end

    def addDir(newDir)
        @dirs.push(newDir)
    end

    def addFile(newFile)
        @files.push(newFile)
    end

    def calcSize()
        total = 0
        for f in @files do
            total += f.size
        end

        for d in @dirs do
            total += d.calcSize()
        end

        return total
    end

    def findDir(name)
        for d in @dirs do
            if d.name == name
                return d
            end
        end

        return nil
    end

    def showStruct(depth)

        print " " * depth * 3
        print @name
        print "\n"
        
        for f in @files do
            print " " * (depth + 1) * 3
            print f.size
            print " "
            print f.name
            print "\n"
        end

        for d in @dirs do
            d.showStruct(depth + 1)
        end

    end
end


def ls(currDir, inp)
    for l in inp do
        if l[0] == "d"
            l.slice!(0..3)
            if l[-1] == "\n"
                l.chop!
            end
            currDir.addDir(Dir.new(l, currDir))
        else
            foo = l.split
            currDir.addFile(Fil.new(foo[0].to_i, foo[1]))
        end
    end
end


def calcAllSizes(rot)
    arr = Array.new
    arr.push(rot.calcSize)
    if !rot.dirs.empty?
        for d in rot.dirs do
            arr = arr + calcAllSizes(d)
        end
    end

    return arr
end


if __FILE__ == $0
    readData = File.open("day7In")
    data = readData.read
    input = data.lines

    root = Dir.new("/", nil)
    cdir = root
    input.shift

    while !input.empty? do
        if input[0][0..3] == "$ ls"
            input.shift
            bar = Array.new
            while !input.empty? && input[0][0] != "$" do
                bar.push(input.shift)
            end
            ls(cdir, bar)
        elsif input[0][0..3] == "$ cd"
            input[0].slice!(0..4)
            if input[0][0..1] == ".."
                cdir = cdir.parent
            else
                if input[0][-1] == "\n"
                    input[0].chop!
                end
                cdir = cdir.findDir(input[0])
            end
            input.shift
        end
    end

    sizes = calcAllSizes(root)
    result = 0

    for s in sizes do
        if s <= 100000
            result += s
        end
    end

    puts result
end