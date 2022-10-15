FactorisationPrint := function( SC, g ) # SC is stabiliser chain, encodes G
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
    Print( "i = ", i, ":\tt_", i, " = ", tInv^(-1), ",\th <- ", h, "\n" );
    fact := Concatenation( [ tInv^(-1) ], fact );
    SC := SC.stabilizer; # proceeds to next stabiliser in chain
  od;
  return [ h, i, fact ];
end;

StripPrint := function( SC, g ) # SC is stabiliser chain, encodes G
  local fact;
  fact := FactorisationPrint( SC, g );
  return [ fact[1], fact[2] ];
end;

MembershipPrint := function( SC, g ) # SC is stabiliser chain, encodes G
  return StripPrint( SC, g )[1] = ();
end;