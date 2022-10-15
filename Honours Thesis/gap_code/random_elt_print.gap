RandomEltPrint := function( SC ) # SC is stabiliser chain, encodes G
  local g, o, t, i;
  g := ();
  i := 0;
  while SC.generators <> [ ] do
    i := i + 1;
    o := Random( SC.orbit ); # uniformly random orbit element
    # get corresponding uniformly random element in transversal
    t := InverseRepresentative( SC, o )^(-1); 
    g := t * g;
    Print( "i = ", i,":\tt_i = ", t, "\tg <- ", g, "\n" );
    SC := SC.stabilizer; # proceeds to next stabiliser in chain
  od;
  return g;
end;