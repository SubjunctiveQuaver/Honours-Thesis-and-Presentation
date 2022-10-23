gap> G_1368 := Stabilizer( G, [ 1, 3, 6, 8 ], OnTuples );
<permutation group of size 317842469683200 with 12 generators>
gap> Orbit( G_1368, 17 );
[ 17 ]
gap> Orbit( G_1368, 24 );
[ 24, 30, 43, 32, 38, 46, 48, 40, 14, 41, 16, 22 ]
gap> Set( Orbit( G_1368, 2 ) ) = Set( Orbit( G, 2 ) );
true