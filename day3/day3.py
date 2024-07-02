def findNeighbours(col: int, row: int, array: list):
    limit = array[row].size()
    hasNeighbour = False
    for i in range(-1, 2):
        if i > -1 and i < limit:
            for j in range(-1, 2):
                if j > -1 and j < limit:
                    pos = str(array[i][j])
                    if pos.isalpha() and not pos == '.':
                        hasNeighbour = True
    if hasNeighbour:
        return array[i][j]
    elif array[i][j] == ",":
        return ","
    else:
        return "."





def main():
    with open("input.txt") as file:
        myfile = file.read()
    lines = myfile.split("\n")
    linesWithChars = []
    for line in lines:
        linesWithChars.append([x for x in line])
    print(lines[1])


if __name__ == "__main__":
    main()