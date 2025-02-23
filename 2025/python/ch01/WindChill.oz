%%%
%%%   Name:               WindChill.oz
%%%
%%%   Started:            Tue Feb 18 22:14:04 2025
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

   fun {IsValid N P}
      N \= nil andthen {P N}
   end

   fun {WindChill T V}
      35.74 + 0.6215 * T + (0.4275 * T - 35.75) * {Pow V 0.16}
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 2 then
      T = {ReadNumber {Nth Args 1} StringToFloat}
      V = {ReadNumber {Nth Args 2} StringToFloat}
   in
      if {IsValid T fun {$ T} {Abs T} =< 50.0 end} andthen
         {IsValid V fun {$ V} 3.0 =< V andthen V =< 120.0 end} then
            {System.showInfo "Wind chill: "#{WindChill T V}}
%            {System.showInfo "Amount: "#{FloatToString {Compound P R / 100.0 T}}}
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
         