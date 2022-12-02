f = open("calories", "r")
myInput = f.readlines()

for i in range(0, len(myInput)):
    myInput[i] = myInput[i].replace("\n", "")

caloriesPerElve = []
calories = 0

for x in myInput:
    if x == '':
        caloriesPerElve.append(calories)
        calories = 0
    else:
        calories += int(x)

caloriesPerElve.append(calories)

maxi = 0

for x in caloriesPerElve:
    if x > maxi:
        maxi = x

print(maxi)

caloriesPerElve.sort()
topThree = caloriesPerElve[len(caloriesPerElve) - 3:len(caloriesPerElve)]
print(topThree)

total = 0

for x in topThree:
    total += x

print(total)
