tau := function( m, n )
  if m = 1 and n = 1 then return 1; fi;
  if m = 1 and n = 2 then return 3; fi;
  if m = 2 and n = 1 then return 2; fi;
  if m = 2 and n = 2 then return 4; fi;
  return 0;
end;

tauInv := function( i )
  if i = 1 then return [ 1, 1 ]; fi;
  if i = 3 then return [ 1, 2 ]; fi;
  if i = 2 then return [ 2, 1 ]; fi;
  if i = 4 then return [ 2, 2 ]; fi;
  return [ 0, 0 ];
end;

imprimActionD8 := function( i, g, w1, w2 )
  local m, n, w;
  m := tauInv( i )[1];
  n := tauInv( i )[2];
  if m^g = 1 then w := w1; else w := w2; fi;
  return tau( m^g, n^w );
end;

imprimActionD8List := function( g, w1, w2 )
  return [ imprimActionD8( 1, g, w1, w2 ), imprimActionD8( 2, g, w1, w2 ), imprimActionD8( 3, g, w1, w2 ), imprimActionD8( 4, g, w1, w2 ) ];
end;

imprimActionD8ListFull := function( )
  local perm, g, w1, w2, result;
  result := [];
  for g in SymmetricGroup(2) do
    for w1 in SymmetricGroup(2) do
      for w2 in SymmetricGroup(2) do
        perm := imprimActionD8List( g, w1, w2 );
        Add( result, [ g, w1, w2, perm, PermList(perm) ] );
      od;
    od;
  od;
  return result;
end;
