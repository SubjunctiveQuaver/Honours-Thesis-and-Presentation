gap> G := Group([ (1,2), (3,4) ]);
Group([ (1,2), (3,4) ])
gap> IsTransitive( G );
false
gap> H := Group([ (), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]);
Group([ (), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ])
gap> IsTransitive( H );
true
gap> IsomorphismGroups( G, H );
[ (1,2), (3,4) ] -> [ (1,2)(3,4), (1,3)(2,4) ]