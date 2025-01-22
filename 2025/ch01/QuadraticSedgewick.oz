%%%
%%%   Name:               QuadraticSedgewick.oz
%%%
%%%   Started:            Mon Jan 20 04:35:37 2025
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

   Args = {Application.getArgs plain}

   if {Length Args} == 2 then
      B = {ReadNumber {Nth Args 1} StringToFloat}
      C = {ReadNumber {Nth Args 2} StringToFloat}
   in
      if B == nil orelse C == nil then
         {System.showInfo "Suck it!"}
         {Application.exit 1}
      else
         Discriminant = B * B - 4.0 * C
         D = {Sqrt Discriminant}
      in
         {System.showInfo "Root 1: "#(~B + D)/2.0}
         {System.showInfo "Root 1: "#(~B - D)/2.0}

         {Application.exit 0}
      end
   end
end
