f = open("2022day2In", "r")
myInput = f.readlines()

for i in range(0, len(myInput)):
    myInput[i] = myInput[i].replace("\n", "")

total = 0

for x in myInput:
    match x:
        case 'A X':
            total += 4
        case 'A Y':
            total += 8
        case 'A Z':
            total += 3
        case 'B X':
            total += 1
        case 'B Y':
            total += 5
        case 'B Z':
            total += 9
        case 'C X':
            total += 7
        case 'C Y':
            total += 2
        case 'C Z':
            total += 6
        case _:
            print("Something went wrong")

print(total)

trueTotal = 0
for x in myInput:
    match x:
        case 'A X':
            trueTotal += 3
        case 'A Y':
            trueTotal += 4
        case 'A Z':
            trueTotal += 8
        case 'B X':
            trueTotal += 1
        case 'B Y':
            trueTotal += 5
        case 'B Z':
            trueTotal += 9
        case 'C X':
            trueTotal += 2
        case 'C Y':
            trueTotal += 6
        case 'C Z':
            trueTotal += 7
        case _:
            print("Something went wrong")

print(trueTotal)
