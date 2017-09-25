module WillTheyWork where

--1 Works (length returns Int which has typeclass Ord)
--2 Works (Num * Num -> Integer, Integer has typeclass Ord)
--3 Not work (Can't compare differing types)
--4 Works (Num + Num -> Integer, Integer has typeclass Ord)
