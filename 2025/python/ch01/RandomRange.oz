%%%
%%%   Name:               RandomRange.oz
%%%
%%%   Started:            Tue Feb 11 08:58:10 2025
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
   OS

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

   fun {RandomRange A B}
      if A > B then
         {RandomRange B A}
      else
%         {OS.srand 0}
%         {OS.srand {OS.time}}
         {OS.srand {Time.time}}     % ??!?!?!?!
         ({OS.rand} mod (B - A + 1)) + A
%         {OS.rand}
      end
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 2 then
      A = {ReadNumber {Nth Args 1} StringToInt}
      B = {ReadNumber {Nth Args 2} StringToInt}
   in
      if {All [A B] IsValid} then
         {System.showInfo "Random ["#A#","#B#"]: "#{RandomRange A B}}
      else
         {System.showInfo "Corrupt"}
         {Application.exit 1}
      end

      {Application.exit 0}
   end
end
   