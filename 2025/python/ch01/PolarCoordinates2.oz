%%%
%%%   Name:               PolarCoordinates2.oz
%%%
%%%   Started:            Sat Feb 22 22:47:58 2025
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

   fun {IsValid N}
      N \= nil
   end

   class PolarCoordinates
      attr r theta
      meth init(r:R theta:Theta)
         r := R
         theta := Theta
      end
      meth r($)
         @r
      end
      meth theta($)
         @theta
      end
   end

   fun {ToPolar X Y}
      fun {Hypotenuse X Y}
         {Sqrt X*X + Y*Y}
      end
   in
      {New PolarCoordinates init(r:{Hypotenuse X Y} theta:{Atan2 Y X})}
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 2 then
      X = {ReadNumber {Nth Args 1} StringToFloat}
      Y = {ReadNumber {Nth Args 2} StringToFloat}
   in
      if {IsValid X} andthen {IsValid Y} then
         Pc = {ToPolar X Y}
      in
         {System.showInfo "("#X#","#Y#") -> r: "#{Pc r($)}#" θ: "#{Pc theta($)}}
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
         