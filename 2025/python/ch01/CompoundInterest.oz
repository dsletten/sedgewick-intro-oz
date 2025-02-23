%%%
%%%   Name:               CompoundInterest.oz
%%%
%%%   Started:            Sun Feb 16 21:32:34 2025
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
%%%   Rate R must be scaled by 100.
%%%
%%%   Outputs:
%%%
%%%   Example:
%%%
%%%   Notes: Ex. 1.2.21
%%%
%%%   w/o FloatToString!!!
%%%   ozengine CompoundInterest.oza 5000 9 15
%%%   Amount: 19287.0
%%%   vs.
%%%   w/ FloatToString
%%%   ozengine CompoundInterest.oza 5000 9 15
%%%   Amount: 19287.1

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
      N \= nil andthen N > 0.0
   end

   fun {Compound P R T}
      P * {Exp R * T}
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 3 then
      [P R T] = {Map Args fun {$ S} {ReadNumber S StringToFloat} end}
   in
      if {All [P R T] IsValid} then
         try
%            {System.showInfo "Amount: "#{Compound P R / 100.0 T}}
            {System.showInfo "Amount: "#{FloatToString {Compound P R / 100.0 T}}}
         catch _ then
            {System.showInfo "Technical difficulties..."}
         end
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
         