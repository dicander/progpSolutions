import Data.Char
--popcount::Int->Int

match::String->Bool
match expression = 
    matchHelper expression 0 0

matchHelper::String->Int->Int->Bool
matchHelper [] left right = left == right
matchHelper (car:cdr) left right
    |right > left = False
    |car == '(' = matchHelper cdr (left + 1) right
    |car == ')' = matchHelper cdr left $ right + 1
    |otherwise   = matchHelper cdr left right

-- Ett vanligt fel var att bara räkna parenteser i slutet och inte i varje steg.
-- Den lösningen är fel men ger 2 tröstpoäng. Ett motexempel är ")("

-- 2:an, currying, se http://learnyouahaskell.com/higher-order-functions

identity::Int->[[Int]]
identity n = [ [fromEnum ( i == j) | i <- [1..n]] | j <- [1..n]]

identity2::Int->[[Int]]
identity2 n =
    [(take i (repeat 0))++[1]++(take (n-i-1) (repeat 0))|i<-[0..n-1]]

popcount 0 = 0
popcount n =
    n `mod` 2 + popcount (n `div` 2)

popcount2 n
    |n == 0 = 0
    |otherwise = n `mod` 2 + popcount2 (n `div` 2)

oneTimePad::String->String->String
oneTimePad plaintext key =
    let v = zip plaintext key in
        map (\(x,y)-> chr ((ord x + ord y) `mod` 128)) v

oneTimePadAlt::String->String->String
oneTimePadAlt w k = map (\x -> chr((ord (fst x) + (ord (snd x))) `mod` 128)) $zip w k


