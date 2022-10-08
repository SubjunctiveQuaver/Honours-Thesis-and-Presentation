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