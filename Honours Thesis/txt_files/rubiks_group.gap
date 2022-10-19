gap> Order( G );
43252003274489856000
gap> corners := Orbit( G, 1 ); # corner stickers
[ 1, 6, 40, 27, 8, 35, 16, 41, 32, 25, 48, 3, 11, 24, 46, 33, 43, 17, 30, 14, 19, 9, 22, 38 ]
gap> Orbit( G, 2 ); # edge stickers
[ 2, 5, 12, 7, 36, 10, 47, 4, 28, 45, 34, 13, 29, 44, 20, 42, 26, 21, 37, 15, 31, 18, 23, 39 ]
gap> GC := Action( G, corners );
<permutation group with 6 generators>
gap> GChom := ActionHomomorphism( G, corners ); # transitive action on corner stickers (relabels)
<action homomorphism>
gap> NrMovedPoints( GC );
24
gap> Order( GC );
88179840
gap> F;
(6,25,43,16)(7,28,42,13)(8,30,41,11)(17,19,24,22)(18,21,23,20)
gap> GChom( F ); # image of F under action on corner stickers
(2,10,17,7)(5,19,8,13)(14,23,18,21)
gap> MB := MaximalBlocks( GC, corners );
[ [ 1, 6, 22 ], [ 2, 13, 18 ], [ 3, 15, 20 ], [ 4, 12, 16 ], [ 5, 10, 21 ], [ 7, 8, 23 ], [ 9, 11, 24 ], [ 14, 17, 19 ] ]
gap> MBorig := List( [ 1..8 ], i -> corners{MB[i]} ); # maximal block using original labelling
[ [ 1, 35, 9 ], [ 6, 11, 17 ], [ 40, 46, 14 ], [ 27, 3, 33 ], [ 8, 25, 19 ], [ 16, 41, 22 ], [ 32, 48, 38 ], [ 24, 43, 30 ] ]
gap> GCB := Action( GC, MB, OnSets );
Group([ (1,2,4,3), (1,3,6,5), (1,5,8,2), (3,4,7,6), (5,6,7,8), (2,8,7,4) ])
gap> GCBhom := ActionHomomorphism( GC, MB ); # primitive action on corners (action on blocks)
<action homomorphism>
gap> NrMovedPoints( GCB );
8
gap> Order( GCB );
40320
gap> Factorial(8); # Thus GCB is Sym(8)
40320
gap> GChom(F);
(2,10,17,7)(5,19,8,13)(14,23,18,21)
gap> GCBhom(last); # image of F under primitive action on corners
(2,5,8,6)
gap> List( [ 2, 5, 8, 6 ], i -> MBorig[i] ); # convert to original labelling
[ [ 6, 11, 17 ], [ 8, 25, 19 ], [ 24, 43, 30 ], [ 16, 41, 22 ] ]