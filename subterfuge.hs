module Main where
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    putStrLn ("Subterfuge " ++ args !! 0)