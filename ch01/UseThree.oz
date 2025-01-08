%%%
%%%   Name:               UseThree.oz
%%%
%%%   Started:            Thu Mar 21 01:37:47 2013
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

declare
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

{System.showInfo {CommifyList nil}}
{System.showInfo {CommifyList [a]}}
{System.showInfo {CommifyList [a b]}}
{System.showInfo {CommifyList [a b c]}}
{System.showInfo {CommifyList [a b c d e]}}
{System.showInfo {CommifyList ["Tom" "Dick" "Harry"]}}
{Browse {VirtualString.toString {CommifyList {Reverse ["Tom" "Dick" "Harry"]}}}}
