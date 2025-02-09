%%%
%%%   Name:               Triangle.oz
%%%
%%%   Started:            Mon Feb  3 16:57:49 2025
%%%   Modifications:
%%%
%%%   Purpose:
%%%
%%%
%%%
%%%   Calling Sequence:
%%%
%%%
%%%   Inputs:
%%%
%%%   Outputs:
%%%
%%%   Example:
%%%
%%%   Notes: Ex. 1.2.12
%%%
%%%    https://en.wikipedia.org/wiki/Triangle_inequality
%%%
%%%    Explicitly: a + b > c  &  b + c > a  &  a + c > b
%%%    Equivalently: |a - b| < c < a + b
%%%    or
%%%    max(a, b, c) < a + b + c - max(a, b, c) => 2 max(a, b, c) < a + b + c
%%%    or
%%%    Area of triangle > 0.
%%%
    
functor
import
   Application
   System

define
   fun {ReadNumber S F}
      try
         {F S}
      catch _ then
         nil
      end
   end

   fun {IsValid N}
      N \= nil andthen N > 0
   end

   fun {IsTriangleSedgewick A B C}
      {Not A >= (B + C) orelse B >= (A + C) orelse C >= (A + B)}
   end

   fun {IsTriangle A B C}
      A < (B + C) andthen B < (A + C) andthen C < (A + B)
   end

   fun {IsTriangleAbs A B C}
      {Abs A - B} < C andthen C < A + B
   end

   fun {IsTriangleMax A B C}
      {Max A {Max B C}} * 2 < A + B + C
   end

   fun {GoldbergHeron A B C}
      %%
      %%    Assumes A ≥ B ≥ C
      %%    
      fun {Heron [A B C]}
         Product = (A + (B + C)) *
                   (C - (A - B)) *
                   (C + (A - B)) *
                   (A + (B - C))
      in
         if Product < 0.0 then 0.0
         else {Sqrt Product} / 4.0
         end
      end
   in
      {Heron {Sort [A B C] Value.'>'}}
   end

   fun {IsTriangleArea A B C}
      {GoldbergHeron {IntToFloat A} {IntToFloat B} {IntToFloat C}} > 0.0
   end
   
   Args = {Application.getArgs plain}

   if {Length Args} == 3 then
      A = {ReadNumber {Nth Args 1} StringToInt}
      B = {ReadNumber {Nth Args 2} StringToInt}
      C = {ReadNumber {Nth Args 3} StringToInt}
   in
      if {All [A B C] IsValid} then
         {System.showInfo if {IsTriangleSedgewick A B C} then "True" else "False" end}
         {System.showInfo if {IsTriangle A B C} then "True" else "False" end}
         {System.showInfo if {IsTriangleAbs A B C} then "True" else "False" end}
         {System.showInfo if {IsTriangleMax A B C} then "True" else "False" end}
         {System.showInfo if {IsTriangleArea A B C} then "True" else "False" end}
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
         