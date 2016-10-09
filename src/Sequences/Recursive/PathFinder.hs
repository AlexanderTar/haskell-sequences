module Sequences.Recursive.PathFinder
    ( 
        countAllPaths
    ) where

import Sequences.Data.KeyPad
import Data.List

countAllPaths :: Int -> Int -> Integer
countAllPaths l v = countPaths l v defaultKeyPad

countPaths :: Int -> Int -> [Key] ->  Integer
countPaths l v m
    | l > 0     = foldl' (+) 0 $ map (countBranch l v) m
    | otherwise = 0

countBranch :: Int -> Int -> Key -> Integer
countBranch l v k
    | (v > 0 || isVowel k == 0) && l > 1  = countPaths (l - 1) (v - (isVowel k)) (keyMap k)
    |  v > 0 || isVowel k == 0            = 1
    | otherwise                           = 0
