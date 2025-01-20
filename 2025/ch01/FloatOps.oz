%%%
%%%   Name:               FloatOps.oz
%%%
%%%   Started:            Thu Jan 16 22:13:57 2025
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
%%%   Notes:
%%%
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

   proc {PrintResult A B Op R}
      {System.showInfo A#" "#Op#" "#B#" = "#R}
   end

   Args = {Application.getArgs plain}

   if {Length Args} \= 2 then
      {System.showInfo "Your future is bleak!"}
      {Application.exit 1}
   else
      A = {ReadNumber {Nth Args 1} StringToFloat}
      B = {ReadNumber {Nth Args 2} StringToFloat}
   in
      if A == nil orelse B == nil then
         {System.showInfo "Suck it!"}
         {Application.exit 1}
      else
         Sum = A + B
         Difference = A - B
         Product = A * B
         Quotient = A / B
         Power = {Pow A B}
      in
         {PrintResult A B "+" Sum}
         {PrintResult A B "-" Difference}
         {PrintResult A B "*" Product}
         {PrintResult A B "div" Quotient}
         {PrintResult A B "**" Power}
         
         {Application.exit 0}
      end
   end
end