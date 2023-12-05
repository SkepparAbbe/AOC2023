


getInput :: FilePath -> IO [String]
getInput f = do
    contents <- readFile f
    return (lines contents)

lineToNumbers :: [Char] -> ([Int], [Int])
lineToNumbers s = (parseNumbers (head (splitOnBar s' [])), parseNumbers (last (splitOnBar s' [])))
    where
        s' = stripText s
        parseNumbers :: [Char] -> [Int]
        parseNumbers str = map read (words str)
        splitOnBar :: [Char] -> [Char] -> [[Char]]
        splitOnBar (c:cs) rest | c == '|' = rest : [cs]
        splitOnBar (c:cs) rest  = splitOnBar cs (rest ++ [c])

stripText :: String -> String
stripText (c:cs) | c == ':' = cs
stripText (c:cs)            = stripText cs

calculatePoints :: [Int] -> [Int] -> Int
calculatePoints [] ws = 0
calculatePoints (m:ms) ws = compareNumbers 

compareNumbers (m:ms) (w:ws)
compareNumbers (m:ms) [] = calculatePoints 
compareNumbers (m:ms) (w:ws) | m == w = calculatePoints (m:ms) ws + 1
compareNumbers (m:ms) (w:ws)          = calculatePoints (m:ms) ws



{- calculatePoints' :: [Int] -> [Int] -> Int -> Int
calculatePoints' (s:ss) (w:ws)   -}

program :: String -> Int
program s = uncurry calculatePoints (lineToNumbers s)