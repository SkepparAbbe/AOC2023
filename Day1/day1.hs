module Day1 where

import Data.Char(digitToInt, isAlpha, intToDigit)

parseFile :: FilePath -> IO()
parseFile f =
    do
        contents <- readFile f
        print (sum (map sumFirstLast (lines contents)))
    where        
        validNumbers :: [String]
        validNumbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] ++ [map intToDigit [1..9]]

sumFirstLast :: [Char] -> Int
sumFirstLast s = read (head (dropWhile isAlpha s) : [head (dropWhile isAlpha (reverse s))])



