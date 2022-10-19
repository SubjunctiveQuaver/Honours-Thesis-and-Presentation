GBase := GreedyBase( G );
[ 1, 2, 4, 3, 5, 7, 6, 12, 8, 13, 14, 15, 21, 16, 23, 24, 29, 39 ]
gap> Length( GBase );
18
gap> Stabilizer( G, GBase, OnTuples ); # verify that it is base
Group(())
gap> Stabilizer( G, [ 1, 2, 4, 3, 5, 7, 6, 12, 8, 13, 14, 15, 21, 16, 23, 24, 29 ], OnTuples ); # remove edge sticker; not a base
Group([ (31,45)(39,47) ])
gap> Stabilizer( G, [ 1, 2, 4, 3, 5, 7, 6, 12, 8, 13, 14, 15, 21, 16, 23, 24, 39 ], OnTuples ); # remove corner sticker; not a base
Group([ (29,36)(31,45) ])