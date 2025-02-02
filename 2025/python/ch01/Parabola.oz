%%%
%%%   Name:               Parabola.oz
%%%
%%%   Started:            Thu Jan 23 03:58:41 2025
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
export
   Parabola

define
   proc {CalculateRoots A B C R1 R2}
      fun {Normalize X}
         if X == 0.0 then {Abs X}
         else X
         end
      end
      Discriminant = B * B - 4.0 * A * C
      D = {Sqrt Discriminant}
   in
      if B >= 0.0 then
         R1 = {Normalize (2.0 * C) / (~B - D)}
         R2 = {Normalize (~B - D) / (2.0 * A)}
      else
         R1 = {Normalize (~B + D) / (2.0 * A)}
         R2 = {Normalize (2.0 * C) / (~B + D)}
      end         
   end   

   class Parabola
      attr a:0.0 b:0.0 c:0.0 root1 root2
      meth init(a:A b:B c:C)
         a := A
         b := B
         c := C
         local Root1 Root2 in
            {CalculateRoots @a @b @c Root1 Root2}
            root1 := Root1
            root2 := Root2
         end
      end
      meth a($)
         @a
      end
      meth b($)
         @b
      end
      meth c($)
         @c
      end
      meth firstRoot($)
         @root1
      end
      meth secondRoot($)
         @root2
      end
   end
end
