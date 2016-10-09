module Sequences.Data.KeyPad
    ( 
        Key(..)
      , keyMap
      , isVowel
      , defaultKeyPad
    ) where

data Key = 
    A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | One | Two | Three | Any
    deriving (Eq, Show, Enum)

isVowel :: Key -> Int
isVowel A = 1
isVowel E = 1
isVowel I = 1
isVowel O = 1
isVowel _ = 0

keyMap :: Key -> [Key]
keyMap A = [H, L]                   -- A
keyMap B = [K, M, I]                -- B
keyMap C = [F, J, L, N]             -- C
keyMap D = [G, M, O]                -- D
keyMap E = [H, N]                   -- E
keyMap F = [C, M]                   -- F
keyMap G = [D, N, Two]              -- G
keyMap H = [A, E, K, O, One, Three] -- H
keyMap I = [B, L, Two]              -- I
keyMap J = [C, M]                   -- J
keyMap K = [B, H, Two]              -- K
keyMap L = [A, C, I, Three]         -- L
keyMap M = [F, B, D, J]             -- M
keyMap N = [G, C, E, One]           -- N
keyMap O = [D, H, Two]              -- O
keyMap One = [F, H, N]              -- 1
keyMap Two = [G, I]                 -- 2
keyMap Three = [L, H, J]            -- 3
keyMap Any = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, One, Two, Three] -- Any

defaultKeyPad :: [Key]
defaultKeyPad = keyMap Any
