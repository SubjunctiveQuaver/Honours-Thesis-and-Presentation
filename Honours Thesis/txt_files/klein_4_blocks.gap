gap> H := Group([ (), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]);
Group([ (), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ])
gap> StructureDescription( H );
"C2 x C2"
gap> IsTransitive( H );
true
gap> IsPrimitive( H );
false
gap> Blocks( H, [ 1, 2, 3, 4 ] );
[ [ 1, 2 ], [ 3, 4 ] ]