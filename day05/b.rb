class Crain
    

    def initialize()
        @crates = [[],[],[],[],[],[],[],[],[]]
    end

    def iniStacks( stackStr )
        8.downto(0) { |i|
            for c in stackStr do
                if c[i * 4 + 1] != " "
                    @crates[i].push(c[i * 4 + 1])
                end
            end
        }

        for s in @crates do
            s.reverse!
        end
        print @crates
    end

    def rearrange( amount, from, to )
        foo = Array.new
        for i in 0..amount - 1 do
            foo.unshift(@crates[from].pop)
        end
        @crates[to] = @crates[to] + foo
    end

    def answer
        bar = Array.new
        for i in 0..8 do
            bar.push(@crates[i][-1])
        end
        return bar
    end

end

if __FILE__ == $0
    readData = File.open("day5In")
    data = readData.read
    input = data.lines
    crain = Crain.new
    stacks = Array.new

    while input[0][1] != "1" do
        stacks.push(input[0])
        input.delete_at(0)
    end

    input.delete_at(0)
    input.delete_at(0)

    crain.iniStacks(stacks)

    for i in input do
        i = i.delete_prefix("move ")
        if i[-1] == "\n"
            i = i.chop
        end

        t  = i[-1].to_i - 1

        i = i.chop()
        i = i.delete_suffix(" to ")

        f = i[-1].to_i - 1 

        i = i.chop()
        i = i.delete_suffix(" from ")

        a = i.to_i

        crain.rearrange(a, f, t)
    end

    print crain.answer()
end