module Test where

import A
import B

test :: IO ()
test = do
  putStrLn "this is a test"
  someFuncA
  someFuncB
