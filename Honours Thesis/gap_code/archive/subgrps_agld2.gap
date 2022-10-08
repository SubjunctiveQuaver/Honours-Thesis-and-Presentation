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

getLargeBase := function( d, opt... )
  # gets subgroups H of AGL(d,2) with b(H) = d+1 (only guess, using algorithm)
  # opt[1] = current group considered, opt[2] = current subgroups found (for recursion)
  local AffS, G, n, M, noBase, res, newRes, nr, max;
  newRes := [ ];
  if Length( opt ) = 0 then
    # if group not given then start with AGL(d,2)
    res := [ ];
    AffS := AffineSpace( d, 2 );
    G := Action( AffineGroup( AffS ), Points( AffS ) );
    n := NrMovedPoints( G );
    # if not n = 2^d then Error( "ops" ); fi;
  elif Length( opt ) = 1 then
    res := [ ];
    G := opt[1];
  else
    res := opt[2];
    G := opt[1];
  fi;
  nr := 0;
  # compute maximal subgroups only up to conjugacy!
  max := MaximalSubgroupClassReps( G );

  Print( "Considered group of size ", Size( G ), " with ", Size( GeneratorsOfGroup( G ) ), " gens:\n");
  Print( "Found ", Size( max ), " maximal subgroups (up to conj)\n" );
  for M in max do 
    if IsPrimitive( M ) then
      nr := nr + 1;
      # if Size( BaseOfGroup( M ) ) > d then Add( res, M ); Add( newRes, M ); fi; # use GAP base command
      if Length( GreedyBase( M ) ) > d then Add( res, M ); Add( newRes, M ); fi; # use greedy base alg
    fi;
  od;

  Print( "Considered ", nr, " maximal subgroups (up to conj) that are primitive\n" );
  Print( "Found ", Size( newRes ), " grps that have base of length greater than ", d, "\n" );
  Print( "GAP's base command finds base of length:\n");
  Display( List( newRes, M -> Size( BaseOfGroup( M ) ) ) );
  Print( "Greedy base alg finds base of length:\n");
  Display( List( newRes, M -> Length( GreedyBase( M ) ) ) );
  for M in newRes do
    Print( "\n" );
    res := getLargeBase( d, M, res );
  od;
  return res;
end;
