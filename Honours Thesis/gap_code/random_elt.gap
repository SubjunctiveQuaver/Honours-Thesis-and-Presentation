RandomElt := function( SC ) # SC is stabiliser chain, encodes G
  local g, o, t;
  g := ();  
  while SC.generators <> [ ] do
    o := Random( SC.orbit ); # uniformly random orbit element
    # get corresponding uniformly random element in transversal
    t := InverseRepresentative( SC, o )^(-1); 
    g := t * g;
    SC := SC.stabilizer; # proceeds to next stabiliser in chain
  od;
  return g;
end;