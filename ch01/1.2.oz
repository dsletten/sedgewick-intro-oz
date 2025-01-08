%%%
%%%   Name:               1.2.oz
%%%
%%%   Started:            Tue Apr  2 02:15:30 2013
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

%%%
%%%    1.2.14
%%%
declare
fun {Divides M N}
   M >= 0 andthen N >= 0 andthen (M mod N == 0 orelse N mod M == 0)
end

{Browse {Divides 3 12}}
{Browse {Divides 60 5}}
{Browse {Divides 60 ~5}}
{Browse {Divides 3 0}}
{Browse {Divides 0 4}}
{Browse {Divides 3 11}}

%%%
%%%    1.2.15
%%%
declare
fun {Triangle A B C}
   {All [A B C] fun {$ N} N > 0 end} andthen
   A + B > C andthen
   A + C > B andthen
   B + C > A
end

{Browse {Triangle 3 4 5}}
{Browse {Triangle 5 12 13}}
{Browse {Triangle 1 2 2}}
{Browse {Triangle 0 0 0}}
{Browse {Triangle ~1 ~2 ~3}}
{Browse {Triangle 1 2 3}}

%%%
%%%    1.2.18
%%%
declare
fun {Distance X Y}
   {Sqrt {Pow X 2.0} + {Pow Y 2.0}}
end

{Browse {Distance 5.0 12.0}}
{Browse {Distance 3.0 4.0}}

%%%
%%%    1.2.19
%%%
declare
fun {RandomInt A B}
   if A == B then A
   elseif B < A then {RandomInt B A}
   else {OS.rand} mod (B - A + 1) + A
   end
end
% fun {RandomInt A B}
%    {OS.rand} mod ({Abs A - B} + 1) + {Min A B}
% end

{Browse {RandomInt 3 8}}
{Browse {RandomInt 8 3}}

%%%
%%%    1.2.20
%%%
declare
fun {RollDie}
   {RandomInt 1 6}
end
fun {RollDice}
   {RollDie} + {RollDie}
end

