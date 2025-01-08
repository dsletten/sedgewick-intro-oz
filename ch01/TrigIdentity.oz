%%%
%%%   Name:               TrigIdentity.oz
%%%
%%%   Started:            Fri Mar 29 00:44:08 2013
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

{Property.put 'print.floatPrecision' 17}

declare
Pi = 4.0 * {Atan 1.0}
fun {Square X}
   X * X
end
fun {SumSquares X Y}
   {Square X} + {Square Y}
end
proc {PrintIdentity Theta}
   {System.showInfo Theta#": "#{SumSquares {Cos Theta} {Sin Theta}}}
   if Theta < Pi then
      {PrintIdentity Theta + 0.01}
   end
end

{PrintIdentity 0.0}

for Theta in 0.0..Pi;0.01 do
   {System.showInfo Theta#": "#{SumSquares {Cos Theta} {Sin Theta}}}
end

