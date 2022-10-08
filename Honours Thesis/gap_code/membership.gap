Factorisation := function( SC, g ) # SC is stabiliser chain, encodes G
  local B, i, h, tInv, fact;
  B := BaseStabChain( SC ); # gets base B
  i := 0;
  h := g;
  fact := [ ]; # factorisation
  while SC.generators <> [ ] do # while stabiliser not trivial
    i := i + 1;
    if not IsBound( SC.transversal[B[i]^h] ) then
      return [ h, i, fact ];
    fi;
    tInv := InverseRepresentative( SC, B[i]^h );
    h := h * tInv;
    fact := Concatenation( [ tInv^(-1) ], fact );
    SC := SC.stabilizer; # proceeds to next stabiliser in chain
  od;
  return [ h, i, fact ];
end;

Strip := function( SC, g ) # SC is stabiliser chain, encodes G
  local fact;
  fact := Factorisation( SC, g );
  return [ fact[1], fact[2] ];
end;

Membership := function( SC, g ) # SC is stabiliser chain, encodes G
  return Strip( SC, g )[1] = ();
end;