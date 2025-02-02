%%%
%%%   Name:               Divides.oz
%%%
%%%   Started:            Sun Feb  2 01:09:28 2025
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
%%%   Notes: Ex. 1.2.11
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
      N \= nil andthen N > 0
   end
   
   Args = {Application.getArgs plain}

   if {Length Args} == 2 then
      M = {ReadNumber {Nth Args 1} StringToInt}
      N = {ReadNumber {Nth Args 2} StringToInt}
   in
      if {IsValid M} andthen {IsValid N} then
         {System.showInfo if (M mod N == 0) orelse (N mod M == 0) then "True" else "False" end}
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
         