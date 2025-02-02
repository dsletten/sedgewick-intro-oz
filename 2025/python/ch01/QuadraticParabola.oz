%%%
%%%   Name:               QuadraticParabola.oz
%%%
%%%   Started:            Sun Jan 26 20:12:16 2025
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
   Parabola at 'Parabola.ozf'

define
   fun {ReadNumber S F}
      try
         {F S}
      catch _ then
         nil
      end
   end

   Args = {Application.getArgs plain}

   A = {ReadNumber {Nth Args 1} StringToFloat}
   B = {ReadNumber {Nth Args 2} StringToFloat}
   C = {ReadNumber {Nth Args 3} StringToFloat}


   P = {New Parabola init(a:A b:B c:C)}

   {System.showInfo "Root 1: "#{P firstRoot($)}}
   {System.showInfo "Root 1: "#{P secondRoot($)}}

   {Application.exit 0}
end