d := 4;; AffS := AffineSpace(d, 2);; AffG := AffineGroup(AffS);;
G := Action(AffG , Points(AffS));;
n := NrMovedPoints(G);;
maxSubgrpsList := MaximalSubgroups(G);

maxSubgrpsIter := Iterator(maxSubgrpsList);;
for maxSubgrp in maxSubgrpsIter do
    if IsPrimitive(maxSubgrp) then
        Print("Generators: ", GeneratorsOfGroup(maxSubgrp));;
        combiIter := IteratorOfCombinations([1..n], d+1);;
        for combi in combiIter do
            if IsTrivial(Stabilizer(maxSubgrp, combi, OnTuples)) then
                Print(" Base: ", combi);;
                break;;
            fi;;
        od;;
        Print("\n");;
    fi;;
od;;

k := 1;;
maxSubgrp := maxSubgrpsList[k];;
if IsPrimitive(maxSubgrp) then
    Print("Generators: ", GeneratorsOfGroup(maxSubgrp));;
    combiIter := IteratorOfCombinations([1..n], d+1);;
    for combi in combiIter do
        if IsTrivial(Stabilizer(maxSubgrp, combi, OnTuples)) then
            Print(" Base: ", combi);;
            break;;
        fi;;
    od;;
    Print("\n");;
fi;;
