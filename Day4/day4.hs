


getInput :: FilePath -> IO ()
getInput f = do
    contents <- readFile f
    let result = show $ program (lines contents)
    print result


lineToNumbers :: [Char] -> Int
lineToNumbers s = calculatePoints (returnFormat head s') (returnFormat last s')
    where
        returnFormat f list = parseNumbers (f (splitOnBar list []))
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
calculatePoints m w = calculatePoints' m w [] 0

calculatePoints' :: [Int] -> [Int] -> [Int] -> Int -> Int
calculatePoints' [] w _ n                            = 0
calculatePoints' (m:ms) [] w n                       = n + calculatePoints ms w
calculatePoints' (m:ms) (w:ws) checked n | m == w    = calculatePoints' (m:ms) ws (checked ++ [w]) (n+1)
                                         | otherwise = calculatePoints' (m:ms) ws (checked ++ [w]) n


program :: [String] -> Int
program ss = sum $ map (exponent . lineToNumbers) ss
    where
        exponent n | n > 0     = 2 ^ (n-1) 
                   | otherwise = n

