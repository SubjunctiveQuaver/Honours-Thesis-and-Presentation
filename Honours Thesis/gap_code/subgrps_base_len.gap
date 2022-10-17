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

GetSubgrpBase := function( r, G, opt... )
  # gets proper subgrps H of G which are the only candidates (up to conjugacy) for b(H) > r (using greedy base alg)
  # opt[1] = if only considering primitive subgrps, opt[2] = list of candidate subgrps found (for recursion)
  local onlyPrim, M, res, newRes, num, max, greedyBase;
  newRes := [ ];
  if Length( opt ) = 0 then
    onlyPrim := false;
    res := [ ];
  elif Length( opt ) = 1 then
    onlyPrim := opt[1];
    res := [ ];
  else
    onlyPrim := opt[1];
    res := opt[2];
  fi;
  num := 0;
  # compute maximal subgroups only up to conjugacy!
  max := MaximalSubgroupClassReps( G );

  Print( "Considered grp of size ", Size( G ), " with ", Size( GeneratorsOfGroup( G ) ), " gens:\n");
  Print( "Found ", Size( max ), " maximal subgroups (up to conj)\n" );
  for M in max do 
    if IsPrimitive( M ) or not onlyPrim then
      num := num + 1;
      greedyBase := GreedyBase( M );
      if Length( greedyBase ) > r then
        Add( res, M );
        Add( newRes, M );
      fi; # use greedy base alg
    fi;
  od;

  Print( "Considered ",  num, " maximal subgrps (up to conj)\n" );
  Print( "Found ", Size( newRes ), " subgrps that may have base of length > ", r, "\n" );
  Print( "GAP's base command finds bases of length:\n" );
  Display( List( newRes, M -> Size( BaseOfGroup( M ) ) ) );
  Print( "Greedy base alg finds bases of length:\n");
  Display( List( newRes, M -> Length( GreedyBase( M ) ) ) );
  for M in newRes do
    Print( "\n" );
    res := GetSubgrpBase( r, M, onlyPrim, res );
  od;
  return res;
end;

GetSubgrpAGLBase := function( d, opt... )
  # gets subgroups H of AGL(d,2) with b(H) = d+1 (only guess, using algorithm)
  # opt[1] = if only considering primitive subgrps
  local AffS, G, n, onlyPrim;
  if Length( opt ) = 0 then
    onlyPrim := true;
  else
    onlyPrim := opt[1];
  fi;
  AffS := AffineSpace( d, 2 );
  G := Action( AffineGroup( AffS ), Points( AffS ) ); # sets G = AGL(d,2) as perm group
  n := NrMovedPoints( G );
  if not n = 2^d then Error( "ops" ); fi;
  return GetSubgrpBase( d, G, onlyPrim );
end;
