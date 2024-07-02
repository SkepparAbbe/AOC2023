numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
numbersToDigits = {"one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"}
digits = [str(x) for x in range(1, 10)]


def findFirst(str):
    positions = [(str.find(x), y) for x, y in numbersToDigits.items() if str.find(x) > -1]
    positions += [(str.find(x), x) for x in digits if str.find(x) > -1]
    print(positions) 
    return min(positions, key=lambda x: x[0])

def findLast(str):
    positions = [(str.rfind(x), y) for x, y in numbersToDigits.items() if str.find(x) > -1]
    positions += [(str.rfind(x), x) for x in digits if str.find(x) > -1]
    return max(positions, key=lambda x: x[0])


def main():
    filepath = "big_input.txt"
    firstlast = []
    with open(filepath) as file:
        lines = file.read().splitlines()
        for line in lines:
            number = str(findFirst(line)[1]) + str(findLast(line)[1])
            print(number)
            firstlast.append(int(number))
        print(sum(firstlast))



if __name__ == "__main__":
    main()

