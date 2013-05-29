module Data.List.Extra where

updateAt :: Int -> a -> [a] -> [a]
updateAt _ _ []     = []
updateAt 0 x (_:xs) = x : xs
updateAt i x (y:xs) = y : updateAt (i-1) x xs

deleteAt :: Int -> [a] -> [a]
deleteAt _ []     = []
deleteAt 0 (_:xs) = xs
deleteAt i (x:xs) = x : deleteAt (i-1) xs

elemAt :: Int -> [a] -> Maybe a
elemAt _ []     = Nothing
elemAt 0 (x:_)  = Just x
elemAt i (_:xs) = elemAt (i-1) xs

shiftLeftWith :: (a -> Bool) -> [a] -> [a]
shiftLeftWith f (x1:x2:xs)
 | f x2      = x2 : x1 : xs
 | otherwise = x1 : shiftLeftWith f (x2:xs)
shiftLeftWith _  xs = xs

shiftRightWith :: (a -> Bool) -> [a] -> [a]
shiftRightWith f (x1:x2:xs)
 | f x1      = x2 : x1 : xs
 | otherwise = x1 : shiftRightWith f (x2:xs)
shiftRightWith _ xs = xs

shiftLeftAt :: Int -> [a] -> [a]
shiftLeftAt i ls@(x1:x2:xs)
 | i < 1     = ls
 | i == 1    = x2 : x1 : xs
 | otherwise = x1 : shiftLeftAt (i - 1) (x2:xs)
shiftLeftAt _  xs = xs

shiftRightAt :: Int -> [a] -> [a]
shiftRightAt i ls@(x1:x2:xs)
 | i < 0     = ls
 | i == 0    = x2 : x1 : xs
 | otherwise = x1 : shiftRightAt (i - 1) (x2:xs)
shiftRightAt _  xs = xs
