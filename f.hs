module F where

import Data.Char (digitToInt)



cmpEvenNum :: (Integral a) => a -> a -> a
cmpEvenNum idx x
  | even idx = x*2
  | otherwise = x;


mult :: (Integral a) => (a -> a -> a) -> [a] -> [a]
mult fn x = reverse (zipWith fn [1..] (reverse x));


readCardNumber :: [Char] -> [Integer]
readCardNumber "" = []
readCardNumber (x:xs) = fromIntegral (digitToInt x):readCardNumber xs;


divArr :: (Integral a) => [a] -> [a]
divArr [] = []
divArr (x:xs)
  | x > 9 = div x 10 : rem x 10 : divArr xs
  | otherwise = x:divArr xs


validate :: [Char] -> Bool
validate x
  | rem (sum (divArr (mult cmpEvenNum (readCardNumber x)))) 10 == 0 = True
  | otherwise = False