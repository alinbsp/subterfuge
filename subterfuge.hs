module Main where
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

spaces :: Parser ()
spaces = skipMany1 space

readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of
    Left err -> "No match: " ++ show err
    Right val -> "Found value"


-- Basic return values
data LispVal = Atom String
            | List [LispVal]
            | DottedList [LispVal] LispVal
            | Number Integer
            | String String
            | Bool Bool

parseAtom :: Parser LispVal
parseAtom = do
    first <- letter <|> symbol
    rest <- (letter <|> digit <|> symbol)

main :: IO ()
main = do
    (expr:_) <- getArgs
    putStrLn (readExpr expr)