gap> G := Group([ (1,6)(2,7)(3,8)(4,5),(1,2),(1,3),(2,3),(6,7),(6,8),(7,8) ]); # generators
Group([ (1,6)(2,7)(3,8)(4,5), (1,2), (1,3), (2,3), (6,7), (6,8), (7,8) ])
gap> SC := StabChain( G, B ); # stabiliser chain of G with respect to base B
<stabilizer chain record, Base [ 4, 1, 2, 6, 7 ], Orbit length 2, Size: 72>
gap> StrongGeneratorsStabChain( SC ); # get strong generating set for G
[ (7,8), (6,7), (6,8), (2,3), (1,2), (1,3), (1,6)(2,7)(3,8)(4,5) ]
gap> SizeStabChain( SC ); # gets |G|
72
gap> OrbitStabChain( SC, 1 ); # gets 1^G
[ 1, 6, 2, 7, 3, 8 ]
gap> OrbitStabChain( SC, 4 ); # gets 4^G
[ 4, 5 ]
gap> IndicesStabChain( SC ); # gets indexes of stabilisers in chain SC
[ 2, 3, 2, 3, 2 ]
gap> ListStabChain( SC );
[ <stabilizer chain record, Base [ 4, 1, 2, 6, 7 ], Orbit length 2, Size: 72>,
  <stabilizer chain record, Base [ 1, 2, 6, 7 ], Orbit length 3, Size: 36>,
  <stabilizer chain record, Base [ 2, 6, 7 ], Orbit length 2, Size: 12>,
  <stabilizer chain record, Base [ 6, 7 ], Orbit length 3, Size: 6>,
  <stabilizer chain record, Base [ 7 ], Orbit length 2, Size: 2>,
  rec( generators := [  ], genlabels := [  ], identity := (),
      labels := [ (), (7,8), (2,3)(7,8), (1,6)(2,7)(3,8)(4,5), (6,7,8), (1,2,3)(6,7,8) ] ) ]
gap> ElementsStabChain( SC ); # lists all elements of G
[ (), (7,8), (6,7), (6,7,8), (6,8,7), (6,8), (2,3), (2,3)(7,8), (2,3)(6,7), (2,3)(6,7,8),
  (2,3)(6,8,7), (2,3)(6,8), (1,2), (1,2)(7,8), (1,2)(6,7), (1,2)(6,7,8), (1,2)(6,8,7),
  (1,2)(6,8), (1,2,3), (1,2,3)(7,8), (1,2,3)(6,7), (1,2,3)(6,7,8), (1,2,3)(6,8,7),
  (1,2,3)(6,8), (1,3,2), (1,3,2)(7,8), (1,3,2)(6,7), (1,3,2)(6,7,8), (1,3,2)(6,8,7),
  (1,3,2)(6,8), (1,3), (1,3)(7,8), (1,3)(6,7), (1,3)(6,7,8), (1,3)(6,8,7), (1,3)(6,8),
  (1,6)(2,7)(3,8)(4,5), (1,6)(2,7,3,8)(4,5), (1,6,2,7)(3,8)(4,5), (1,6,2,7,3,8)(4,5),
  (1,6,3,8,2,7)(4,5), (1,6,3,8)(2,7)(4,5), (1,6)(2,8,3,7)(4,5), (1,6)(2,8)(3,7)(4,5),
  (1,6,2,8,3,7)(4,5), (1,6,2,8)(3,7)(4,5), (1,6,3,7)(2,8)(4,5), (1,6,3,7,2,8)(4,5),
  (1,7,2,6)(3,8)(4,5), (1,7,3,8,2,6)(4,5), (1,7)(2,6)(3,8)(4,5), (1,7,3,8)(2,6)(4,5),
  (1,7)(2,6,3,8)(4,5), (1,7,2,6,3,8)(4,5), (1,7,2,8,3,6)(4,5), (1,7,3,6)(2,8)(4,5),
  (1,7)(2,8,3,6)(4,5), (1,7,3,6,2,8)(4,5), (1,7)(2,8)(3,6)(4,5), (1,7,2,8)(3,6)(4,5),
  (1,8,3,7,2,6)(4,5), (1,8,2,6)(3,7)(4,5), (1,8,3,7)(2,6)(4,5), (1,8)(2,6)(3,7)(4,5),
  (1,8,2,6,3,7)(4,5), (1,8)(2,6,3,7)(4,5), (1,8,3,6)(2,7)(4,5), (1,8,2,7,3,6)(4,5),
  (1,8,3,6,2,7)(4,5), (1,8)(2,7,3,6)(4,5), (1,8,2,7)(3,6)(4,5), (1,8)(2,7)(3,6)(4,5) ]
gap> SiftedPermutation( SC, (4,5) ); # result after sifting (4,5) through SC
(1,6)(2,7)(3,8)
gap> SiftedPermutation( SC, (1,2,3) );
()
gap> InverseRepresentative( SC, 4 ); # transversal element that maps 4 back to 4 in G
()
gap> InverseRepresentative( SC, 5 ); # transversal element that maps 5 back to 4 in G
(1,6)(2,7)(3,8)(4,5)
gap> # Analysing G_1 = Stab_G(4)
gap> SC1 := ListStabChain( SC )[2]; # considers subchain for G_1
<stabilizer chain record, Base [ 1, 2, 6, 7 ], Orbit length 3, Size: 36>
gap> OrbitStabChain( SC1, 1 ); # gets 1^{G_1}
[ 1, 2, 3 ]
gap> OrbitStabChain( SC1, 4 ); # gets 4^{G_1}
[ 4 ]
gap> OrbitStabChain( SC1, 5 ); # gets 5^{G_1}
[ 5 ]
gap> OrbitStabChain( SC1, 6 ); # gets 6^{G_1}
[ 6, 7, 8 ]
gap> ElementsStabChain( SC1 ); # lists all elements of G_1
[ (), (7,8), (6,7), (6,7,8), (6,8,7), (6,8), (2,3), (2,3)(7,8), (2,3)(6,7),
  (2,3)(6,7,8), (2,3)(6,8,7), (2,3)(6,8), (1,2), (1,2)(7,8), (1,2)(6,7),
  (1,2)(6,7,8), (1,2)(6,8,7), (1,2)(6,8), (1,2,3), (1,2,3)(7,8), (1,2,3)(6,7),
  (1,2,3)(6,7,8), (1,2,3)(6,8,7), (1,2,3)(6,8), (1,3,2), (1,3,2)(7,8), (1,3,2)(6,7),
  (1,3,2)(6,7,8), (1,3,2)(6,8,7), (1,3,2)(6,8), (1,3), (1,3)(7,8), (1,3)(6,7),
  (1,3)(6,7,8), (1,3)(6,8,7), (1,3)(6,8) ]
gap> InverseRepresentative( SC1, 3 ); # transversal element that maps 3 back to 1 in G_1
(1,3)
gap> # Random elements and membership
gap> g := Random( G ); # gets random element of G
(1,7,3,6)(2,8)(4,5)
gap> (4,5) in G; # checks membership in G
false
gap> (1,6,2,7,3,8)(4,5) in G; # checks membership in G
true
gap> H := Stabilizer( SymmetricGroup(8), [ 4, 5 ], OnTuples ) # H is the pointwise stabiliser of 4 and 5 in Sym(8)
Sym( [ 1, 2, 3, 6, 7, 8 ] )
gap> g := Random( H ); # gets random element of H
(1,8,6)(2,7)
gap> g in G; # checks membership in G
false
gap> g := Random( H ); # gets random element of H
(2,3)(6,7)
gap> g in G; # checks membership in G
true