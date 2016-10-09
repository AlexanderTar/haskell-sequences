module Main where

import Sequences.Data.KeyPad
import qualified Sequences.Recursive.PathFinder as R
import qualified Sequences.DP.PathFinder as DP

import Control.Monad
import System.Environment( getArgs, getProgName )
import System.Console.GetOpt

main :: IO ()
main = do
  o <- parseArgs
  putStrLn $ show $ execute (optMode o) (optLength o) (optVowels o)

execute :: Int -> Int -> Int -> Integer
execute 1 l v = R.countAllPaths l v
execute 2 l v = DP.countAllPaths l v
  
data Options = Options {
    optMode   :: Int
  , optLength :: Int
  , optVowels :: Int
  } deriving Show

defaultOptions = Options {
    optMode  = 1
  , optLength = 17
  , optVowels = 2
  }

options :: [OptDescr (Options -> Either String Options)]
options =
  [ Option ['m'] ["mode"]
      (ReqArg (\g opts ->
        case reads g of
          [(mode, "")] | mode >= 1 && mode <= 2 -> Right opts { optMode = mode }
          _ -> Left "-- mode must be either 1 or 2"
        ) "MODE")
      "algorithm mode. 1 - recursive, 2 - DP"
  , Option ['l'] ["length"]
      (ReqArg (\s opts ->
        case reads s of
          [(sequenceLength, "")] | sequenceLength >= 1 -> Right opts { optLength = sequenceLength }
          _ -> Left "-- sequence length must be positive"
        ) "LENGTH")
      "sequence length"
  , Option ['v'] ["num-vowels"]
      (ReqArg (\s opts ->
        case reads s of
          [(vowels, "")] | vowels >= 0 -> Right opts { optVowels = vowels }
          _ -> Left "-- number of allowed vowels must be non-negative"
        ) "NUM-VOWELS")
      "number of vowels allowed"
  ]

parseArgs :: IO Options
parseArgs = do
  argv <- getArgs
  progName <- getProgName
  let header = "Usage: " ++ progName ++ " [OPTION...]"
  let helpMessage = usageInfo header options
  case getOpt RequireOrder options argv of
    (opts, [], []) ->
      case foldM (flip id) defaultOptions opts of
        Right opts -> return opts
        Left errorMessage -> ioError (userError (errorMessage ++ "\n" ++ helpMessage))
    (_, _, errs) -> ioError (userError (concat errs ++ helpMessage))
