%%%
%%%   Name:               Quadratic.oz
%%%
%%%   Started:            Fri Mar 22 01:40:20 2013
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
fun {Quadratic B C}
   Discriminant = B*B - 4.0*C
in
   if Discriminant == 0.0 then
      ~B / 2.0
   elseif Discriminant > 0.0 then
      D = {Sqrt Discriminant}
   in
      [(~B + D)/2.0 (~B - D)/2.0]
   else
      noRealRoots
   end
end

declare
fun {Quadratic B C}
   Discriminant = B*B - 4.0*C
   RealTerm = ~B/2.0
in
   if Discriminant == 0.0 then
      [RealTerm RealTerm]
   elseif Discriminant > 0.0 then
      D = {Sqrt Discriminant}
   in
      [RealTerm+D/2.0 RealTerm-D/2.0]
   else
      D = {Sqrt ~Discriminant}
   in
      [complex(RealTerm D/2.0) complex(RealTerm ~D/2.0)]
   end
end

{Browse {Quadratic ~3.0 2.0}}
{Browse {Quadratic ~1.0 ~1.0}}
{Browse {Quadratic 1.0 1.0}}
{Browse {Quadratic ~6.0 9.0}}

%%%
%%%    1.2.8 sqrt
%%%
{Browse {Quadratic 0.0 ~2.0}}
{Browse {Sqrt 2.0}}