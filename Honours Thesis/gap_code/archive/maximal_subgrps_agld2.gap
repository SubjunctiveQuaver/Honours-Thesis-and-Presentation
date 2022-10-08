LoadPackage("FinInG");

GreedyBase := function( G, opt... ) # G is perm group (natural action), opt[1] is partial base
    local B, S, OLen, LargestOrbitList, LargestOrbitPos, b;
    if Length( opt ) = 0 then
        B := [ ]; # if not given then start with empty base
    else
        B := opt[1];
    fi;
    S := Stabilizer( G, B, OnTuples );
    while IsTrivial( S ) = false do
        # evaluate orbits in S and get element from a largest orbit
        OLen := OrbitLengthsDomain( S );
        LargestOrbitList := PositionsProperty( OLen, n -> ( n = Maximum( OLen ) ) );
        LargestOrbitPos := Random( LargestOrbitList );
        b := OrbitsDomain( S )[LargestOrbitPos][1];
        # add to base
        Add(B, b);
        S := Stabilizer( S, b );
    od;
    return B;
end;

getStuff := function( d )
  local AffS, G, n, M, noBase, combiIter, combi, res, nr, max;
  AffS := AffineSpace( d, 2 );
  G := Action( AffineGroup( AffS ), Points( AffS ) );
  n := NrMovedPoints( G );
  if not n = 2^d then Error( "ops" ); fi;
  res := [ ];
  nr := 0;
  # compute maximal subgroups only up to conjugacy!
  # max := MaximalSubgroupClassReps( G );

  # use this to get all subgroups... could be many!
  max := List( ConjugacyClassesSubgroups( G ), Representative );

  Print( "Found ", Size( max ), " maximal subgroups (up to conj) of AGL(", d, ",2)\n" );
  for M in max do 
    if IsPrimitive( M ) then
      nr := nr + 1;
      noBase := true;
      combiIter := IteratorOfCombinations( [1..n], d );
        for combi in combiIter do
          if IsTrivial( Stabilizer( M, combi, OnTuples ) ) then
            noBase := false;
            break;
          fi;
        od;
      if noBase then Add( res, M ); fi;
    fi;
  od;

  Print( "Considered ", nr, " maximal subgroups (up to conj) that are primitive\n" );
  Print( "Found ", Size( res ), " grps that have base of length greater than ", d, "\n" );
  Print( "GAP's base command finds base of length:\n");
  Display( List( res, M -> Size( BaseOfGroup( M ) ) ) );
  Print( "Greedy base alg finds base of length:\n");
  Display( List( res, M -> Length( GreedyBase( M ) ) ) );
  return res;
end;
