module B
    ( someFuncB
    , fomeFuncImportedFromA
    ) where

import A

someFuncB :: IO ()
someFuncB = putStrLn "someFunc in module B"

fomeFuncImportedFromA :: IO ()
fomeFuncImportedFromA = someFuncA
