
class Round:
    def __init__(self, blue: int, green: int, red: int):
       self.blue = blue
       self.green = green
       self.red = red
       self.validity = self.red <= 12 and self.green <= 13 and self.blue <= 14
    
    def __str__(self) -> str:
        return f"blue: {self.blue}, green: {self.green}, red: {self.red}"

class Game:

    def __init__(self, gameNumber: int, rounds: list) -> None:
        self.gameNumber = gameNumber
        self.rounds = rounds

    def __str__(self) -> str:
        return (str(self.gameNumber) + str(self.rounds))
    
    def checkValidity(self):
        return all([round.validity for round in self.rounds])
    
    def minimum(self):
        min_red = 0
        min_green = 0
        min_blue = 0
        for round in self.rounds:
            if round.red > min_red:
                min_red = round.red
            if round.green > min_green:
                min_green = round.green
            if round.blue > min_blue:
                min_blue = round.blue
        return min_red * min_green * min_blue
            
                
                
        

def parseFile(file: str):    
    lines = file.splitlines()
    return [parseLine(line) for line in lines]


def parseLine(line: str):
    gameNumber = int(line.split(":")[0].split()[1])
    rounds = line.split(maxsplit=2)[2].split(";")
    return Game(gameNumber, (list(map(parseRound, rounds))))

    #print(gameNumber)
    #print(rounds)

def parseRound(rounds: str) -> list:
    rounds = rounds.split(',')
    red = 0
    green = 0
    blue = 0
    for round in rounds:
        round = round.strip()
        round = round.split()
        numberOfCubesX = int(round[0])
        match round[1]:
            case "red":
                red = numberOfCubesX
            case "green":
                green = numberOfCubesX
            case "blue":
                blue = numberOfCubesX
    return Round(blue, green, red)


def main():
    filepath = "input.txt"
    with open(filepath) as file:
        text = file.read()
        sum = 0
        for i, game in enumerate(parseFile(text)):
            if game.checkValidity():
                print(str(game.gameNumber) + " " + str(game.minimum()) + " valid")
            sum += game.minimum()
        print(sum)

if __name__ == "__main__":
    main()
    
    

