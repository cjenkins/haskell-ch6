module ChapterExercises where

import Data.List (sort)

--1 c
--2 c
--3 a
--4 c
--5 a

--Does it typecheck?

--1 (No, needs deriving Show)
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

--2 (No, needs instance Eq for Mood)
data Mood = Blah | Woot deriving Show

instance Eq Mood where
  (==) Blah Blah = True
  (==) Woot Woot = True
  (==) _ _ = False

settleDown x = if x == Woot
                  then Blah
                  else x

--3 a) Woot | Blah
--3 b) Does not work, 9 not of type Mood
--3 c) Does not work, no implementation of Ord

--4 (s1 not enough args to construct sentence)
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool" "everywhere"
s2 = Sentence "Julie" "loves" "dogs"

--Given a datatype declaration, what can we do?

data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving( Eq, Show)

--1 Not type checks, String != Rocks, Bool != Yeah
-- phew = Papu "chases" True

--2 Type checks
truth = Papu (Rocks "chomskydoz")
             (Yeah True)

--3 Type checks
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

--4 Not type checks, Papu does not have typeclass Ord
--comparePapus :: Papu -> Papu -> Bool
-- comparePapus = p p' = p > p

--Match the types

--1
--Can't replace with i :: a.  That implies i can be any type (IE: Bool)
i :: Num a => a
i = 1

--2
--Can't replace with Num a => a.  Float is a Num but is also Fractional, Ord, etc.
f :: Float
f = 1.0

--3
--Can replace with Fractional.  Fractional is superset of Float.
f1 :: Fractional a => a
f1 = 1.0

--4
--Can replace with RealFrac.  RealFrac is a superset of Float.
f2 :: RealFrac a => a
f2 = 1.0

--5
--Can replace with Ord a.  Restricts what can be passed to freud but still works
freud :: Ord a => a -> a
freud x = x

--6
--Can replace with Int -> Int.  freud' only accepts Int but still works
freud' :: Int -> Int
freud' x = x

--7
--Can't replace with b -> b.  b -> b implies any type is acceptable (even beyond Int)
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX

--8
--Can't replace with Num a => a -> a.  Can take any type of Num, not just Int

--9
--Can replace with [Int] -> Int since Int has typeclass of Ord
jung :: [Int] -> Int
jung xs = head (sort xs)

--10
--Can replace with Ord a => a -> a since sort only cares that type is Ord
young :: Ord a => [a] -> a
young xs = head (sort xs)

--11
--Can't replace with Ord a => [a] -> a since mySort is [Char] -> Char
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)

--TypeKwanDo

--1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk ab a b = ab(a) == b

--2
arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b
arith ab i a = ab(a) 
