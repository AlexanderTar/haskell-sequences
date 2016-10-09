module Sequences.DP.PathFinder
    ( 
        countAllPaths
    ) where

import Sequences.Data.KeyPad
import Data.List
import Data.Function.Memoize

instance Bounded Key where
    minBound = A
    maxBound = Any

instance Memoizable Key where
    memoize = memoizeFinite

snap :: (Int -> Int -> Int -> Key -> Integer) -> Int -> Int -> Int -> Key -> Integer

snap f maxV 1 v k
    | maxV == v = toInteger $ 1 - (isVowel k)
    | otherwise = 1

snap f maxV l v k
    | v < maxV || isVowel k == 0 = foldl' (+) 0 $ map (f maxV (l - 1) (v + (isVowel k))) (keyMap k)
    | otherwise = 0

snapshot :: Int -> Int -> Int -> Key -> Integer
snapshot = memoFix4 snap

countAllPaths :: Int -> Int -> Integer
countAllPaths l maxV = foldl' (+) 0 $ map (snapshot maxV l 0) defaultKeyPad
