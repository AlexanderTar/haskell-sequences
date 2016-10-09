# KnightSequences

This is Haskell implementation of popular Knight Sequences problem. Current solution consists of 2 algorithms: brute-force recursive and bottom-up DP with memoization.

Solution is using Stack build system. To build on system of your choice run

    stack build
    
Command-line parameters to run project

    stack exec pathfinder -- -m MODE -l SEQUENCE-LENGTH -v NUM-VOWELS-ALLOWED
    
Default values for command-line options are: sequence length - 17, number of vowels allowed - 2, default algorithm - DP.
