-- |
-- Copyright   : (C) Keera Studios Ltd, 2013
-- License     : BSD3
-- Maintainer  : support@keera.co.uk
module Data.String.Extra
 (trim)
 where

-- | Auxiliary string functions. I can't believe no module declares these
-- FIXME: Check that no existing module declares these.
trim :: String -> String
trim = trimEnd . trimBeginning

trimBeginning :: String -> String
trimBeginning = dropWhile (== ' ')

-- FIXME: Use dropWhileEnd from 4.5.0.0
trimEnd :: String -> String
trimEnd = reverse . trimBeginning . reverse
