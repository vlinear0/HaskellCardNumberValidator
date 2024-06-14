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


sFn :: String -> String
sFn "" = ""
sFn (x:xs)
    | x `elem` ['A'..'Z'] = sFn xs
    | otherwise = x:sFn xs


dubArr :: [a] -> [a]
dubArr [] = []
dubArr (x:xs) = x:x: dubArr xs;


hd :: [a] -> a
hd [] = error ("Null ptr exception")
hd (x:xs) = x;


fac :: (Integral a, Enum a) => a -> a
fac 0 = 1
fac x = x * fac(pred x)


main :: IO ()
main = do
    start <- getCPUTime
    let res = evenSum [1..1000000]
    end <- getCPUTime
    let diff = fromInteger (end-start)
    putStrLn $ "Runtime: " ++ show diff;



{-

        !Functions that have _type variables_ are called _polymorphic functions_

        ``` hs
        foo :: a -> a
        foo x = x;
        ```
-}