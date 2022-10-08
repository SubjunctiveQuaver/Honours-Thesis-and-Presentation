RandomElt := function( SC ) # SC is stabiliser chain, encodes G
  local g, t, MyRandom;
  g := ();
  # random element of list with holes
  MyRandom := L -> L[Random( Filtered( [ 1 .. Length( L ) ], i -> IsBound( L[i] ) ) )];
  while SC.generators <> [ ] do
    t := MyRandom( SC.transversal );
    g := t * g;
    SC := SC.stabilizer; # proceeds to next stabiliser in chain
  od;
  return g;
end;