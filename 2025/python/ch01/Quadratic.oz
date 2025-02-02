%%%
%%%   Name:               Quadratic.oz
%%%
%%%   Started:            Mon Jan 20 04:35:40 2025
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
   fun {ReadNumber S F}
      try
         {F S}
      catch _ then
         nil
      end
   end

   % proc {Quadratic A B C R1 R2}
   %    Discriminant = B*B - 4.0*A*C
   %    D = {Sqrt Discriminant}
   % in
   %    R1 = (~B + D) / (2.0 * A)
   %    R2 = (~B - D) / (2.0 * A)
   % end

   % Goldberg -- What Every Computer Scientist Should Know... pg. 162
   proc {QuadraticGoldberg A B C R1 R2}
      Discriminant = B * B - 4.0 * A * C
      D = {Sqrt Discriminant}
   in
      if B >= 0.0 then
         R1 = (2.0 * C) / (~B - D)
         R2 = (~B - D) / (2.0 * A)
      else
         R1 = (~B + D) / (2.0 * A)
         R2 = (2.0 * C) / (~B + D)
      end         
   end

   Args = {Application.getArgs plain}

   if {Length Args} == 3 then
      A = {ReadNumber {Nth Args 1} StringToFloat}
      B = {ReadNumber {Nth Args 2} StringToFloat}
      C = {ReadNumber {Nth Args 3} StringToFloat}
   in
      if A == nil orelse B == nil orelse C == nil then
         {System.showInfo "Suck it!"}
         {Application.exit 1}
      else
         R1 R2
      in
%         {Quadratic A B C R1 R2}
         {QuadraticGoldberg A B C R1 R2}
         {System.showInfo "Root 1: "#R1}
         {System.showInfo "Root 1: "#R2}

         {Application.exit 0}
      end
   end
end
