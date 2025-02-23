%%%
%%%   Name:               PolarCoordinates.oz
%%%
%%%   Started:            Fri Feb 21 21:33:11 2025
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
%%%   Notes: Ex. 1.2.23
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

   fun {IsValid N}
      N \= nil
   end

   fun {Hypotenuse X Y}
      {Sqrt X*X + Y*Y}
   end

   fun {ToPolar X Y}
      [{Hypotenuse X Y} {Atan2 Y X}]
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 2 then
      X = {ReadNumber {Nth Args 1} StringToFloat}
      Y = {ReadNumber {Nth Args 2} StringToFloat}
   in
      if {IsValid X} andthen {IsValid Y} then
         [R Theta] = {ToPolar X Y}
      in
         {System.showInfo "("#X#","#Y#") -> r: "#R#" θ: "#Theta}
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
         