class Monkey
    attr_accessor :number
    attr_accessor :items
    attr_accessor :operation
    attr_accessor :opNum
    attr_accessor :testNum
    attr_accessor :onTrue
    attr_accessor :onFalse
    attr_accessor :inspections

    def initialize(number)
        @number = number
        @items = Array.new
        @operation = ""
        @opNum = 0
        @testNum = 0
        @onTrue = self
        @onFalse = self
        @inspections = 0
    end

    def inspect
        for i in @items do
            if @operation == "m"
                i = i * @opNum
            elsif @operation == "a"
                i += @opNum
            else
                i = i * i
            end

            i = i / 3
            if i % @testNum == 0
                @onTrue.items.push(i)
            else
                @onFalse.items.push(i)
            end

            @inspections += 1
        end
        @items = []
    end

    def out
        print "Monkey " + @number.to_s + ":\n"
        print "Items: "
        print @items
        print "\n"
        print "Operation: new = old "
        if @operation == "s"
            print "* old\n"
        elsif @operation == "a"
            print "+ " + @opNum.to_s + "\n"
        else
            print "* " + @opNum.to_s + "\n"
        end
        print "Test: divisible by " + @testNum.to_s + "\n"
        print "If true: throw to monkey " + @onTrue.number.to_s + "\n"
        print "If false: throw to monkey " + @onFalse.number.to_s + "\n"
        print "\n"
    end
end



if __FILE__ == $0
    readData = File.open("day11In")
    data = readData.read
    input = data.lines

    monkeys = Array.new

    for j in 0..7 do
        monkeys.push(Monkey.new(j))
    end

    for j in 0..7 do
        mon = input.slice!(0..5)

        mon[1].chop!
        while mon[1][-4] == "," || mon[1][-4] == ":"
            monkeys[j].items.push(mon[1][-2..-1].to_i)
            mon[1].slice!(-4..-1)
        end
        
        mon[2].chop!
        if mon[2][-1] == "d"
            monkeys[j].operation = "s"
        elsif mon[2][-3] == "+"
            monkeys[j].operation = "a"
            monkeys[j].opNum = mon[2][-1].to_i
        else
            monkeys[j].operation = "m"
            monkeys[j].opNum = mon[2][-1].to_i
        end

        # if j == 0
        #     monkeys[j].opNum = 19
        # end

        mon[3].chop!
        if mon[3][-2] == " "
            monkeys[j].testNum = mon[3][-1].to_i
        else
            monkeys[j].testNum = mon[3][-2..-1].to_i
        end

        mon[4].chop!
        monkeys[j].onTrue = monkeys[mon[4][-1].to_i]

        if mon[5][-1] == "\n"
            mon[5].chop!
        end
        monkeys[j].onFalse = monkeys[mon[5][-1].to_i]

        if !input.empty?
            input.slice!(0)
        end
    end

    for j in 0..19 do
        for m in monkeys do
        m.inspect
        end
    end

    for m in monkeys do
        print "Monkey " + m.number.to_s + ": " + m.inspections.to_s + "\n"
    end
end