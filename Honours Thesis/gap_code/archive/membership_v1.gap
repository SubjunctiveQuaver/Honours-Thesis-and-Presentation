Membership := function( SC, g ) # SC is stabiliser chain, encodes G
    local B, i, h, InOrbit, t;
    B := BaseStabChain( SC ); # gets base B
    i := 0;
    h := g;
    while SC.generators <> [ ] do
        i := i + 1;
        InOrbit := false;
        for t in SC.transversal do
            if B[i]^h = B[i]^t then
                InOrbit := true;
                h := h * Inverse( t );
                break; # skips checking other transversal elements
            fi;
        od;
        if InOrbit = false then
            return false;
        fi;
        SC := SC.stabilizer; # proceeds to next stabiliser in chain
    od;
    if h = () then
        return true;
    else
        return false;
    fi;
end;