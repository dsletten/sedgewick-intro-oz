%%%
%%%   Name:               LeapYear.oz
%%%
%%%   Started:            Wed Mar 27 01:27:03 2013
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
fun {IsLeapYear Year}
   (Year mod 4 == 0 andthen Year mod 100 \= 0) orelse Year mod 400 == 0
end

{Browse {IsLeapYear 1999}}
{Browse {IsLeapYear 2000}}
{Browse {IsLeapYear 2100}}
{Browse {IsLeapYear 2012}}
