%%%
%%%   Name:               UseThree.oz
%%%
%%%   Started:            Sun Jan  5 02:09:33 2025
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
   fun {CommifyList L}
      case {Length L}
      of 0 then ""
      [] 1 then L.1
      [] 2 then {Nth L 1}#" and "#{Nth L 2}
      else {FoldLTail L.2
            fun {$ X Y}
               case Y.2
               of nil then X#", and "#Y.1
               else X#", "#Y.1
               end
            end
            L.1}
      end
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 0 then
      {System.showInfo "Nothing to see here."}
   else
      {System.printInfo "Hi "}
      {System.printInfo {CommifyList {Reverse Args}}}
      {System.showInfo "."}
   end
   
   {Application.exit 0}
end