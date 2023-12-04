

getInput :: FilePath -> IO [String]
getInput f = do
    contents <- readFile f
    return (lines contents)

