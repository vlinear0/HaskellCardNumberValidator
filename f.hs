{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
import System.CPUTime ( getCPUTime )


toIntList :: String -> [Int]
toIntList x = read ("[" ++ x ++ "]")

len :: [a] -> Int;
len [] = 0
len (_:xs) = succ(len xs);

fi :: Eq a => [a] -> a -> Bool;
fi [] _ = False
fi (x:xs) el
        | el == x = True
        | otherwise = fi xs el;

getArr :: Int -> [Int]
getArr 0 = []
getArr x = x:getArr (pred x);

evenSum :: Integral a => [a] -> a
evenSum [] = 0
evenSum (x:xs) = sum (filter even xs)

fltr :: (a -> Bool) -> [a] -> [a]
fltr _ [] = []
fltr fn (x:xs)
        | fn x = x:fltr fn xs
        | otherwise = fltr fn xs;

cmpArr :: Integral a => [a] -> [String]
cmpArr [] = []
cmpArr (x:xs)
        | even x = "Even":cmpArr xs
        | odd x = "Odd":cmpArr xs

dubArr :: [a] -> [a]
dubArr [] = []
dubArr (x:xs) = x:x: dubArr xs;

main :: IO ()
main = do
    start <- getCPUTime
    let res = evenSum [1..1000000]
    end <- getCPUTime
    let diff = fromInteger (end-start)
    putStrLn $ "Runtime: " ++ show diff