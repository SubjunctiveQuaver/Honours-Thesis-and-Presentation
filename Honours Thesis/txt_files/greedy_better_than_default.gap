gap> gens := [ (1,2)(3,4)(5,6)(7,8)(9,10)(11,12)(13,14)(15,16)(17,18)(19,20)(21,22)(23,24)(25,26)(27,28)(29,30)(31,32)(33,34)(35,36)(37,38)(39,40)(41,42)(43,44)(45,46)(47,
    48)(49,50)(51,52)(53,54)(55,56)(57,58)(59,60)(61,62)(63,64), (1,30)(2,29)(3,32)(4,31)(5,26)(6,25)(7,28)(8,27)(9,22)(10,21)(11,24)(12,23)(13,18)(14,17)(15,
    20)(16,19)(33,62)(34,61)(35,64)(36,63)(37,58)(38,57)(39,60)(40,59)(41,54)(42,53)(43,56)(44,55)(45,50)(46,49)(47,52)(48,51), (1,37)(2,38)(3,39)(4,40)(5,33)(6,
    34)(7,35)(8,36)(9,45)(10,46)(11,47)(12,48)(13,41)(14,42)(15,43)(16,44)(17,53)(18,54)(19,55)(20,56)(21,49)(22,50)(23,51)(24,52)(25,61)(26,62)(27,63)(28,64)(29,
    57)(30,58)(31,59)(32,60), (1,33)(2,34)(3,35)(4,36)(5,37)(6,38)(7,39)(8,40)(9,41)(10,42)(11,43)(12,44)(13,45)(14,46)(15,47)(16,48)(17,49)(18,50)(19,51)(20,
    52)(21,53)(22,54)(23,55)(24,56)(25,57)(26,58)(27,59)(28,60)(29,61)(30,62)(31,63)(32,64), (1,48)(2,47)(3,46)(4,45)(5,44)(6,43)(7,42)(8,41)(9,40)(10,39)(11,
    38)(12,37)(13,36)(14,35)(15,34)(16,33)(17,64)(18,63)(19,62)(20,61)(21,60)(22,59)(23,58)(24,57)(25,56)(26,55)(27,54)(28,53)(29,52)(30,51)(31,50)(32,49),
  (1,60)(2,59)(3,58)(4,57)(5,64)(6,63)(7,62)(8,61)(9,52)(10,51)(11,50)(12,49)(13,56)(14,55)(15,54)(16,53)(17,44)(18,43)(19,42)(20,41)(21,48)(22,47)(23,46)(24,
    45)(25,36)(26,35)(27,34)(28,33)(29,40)(30,39)(31,38)(32,37), (33,49)(34,50)(35,51)(36,52)(37,53)(38,54)(39,55)(40,56)(41,57)(42,58)(43,59)(44,60)(45,61)(46,
    62)(47,63)(48,64), (9,17,33)(10,18,34)(11,19,35)(12,20,36)(13,21,37)(14,22,38)(15,23,39)(16,24,40)(25,49,41)(26,50,42)(27,51,43)(28,52,44)(29,53,45)(30,54,
    46)(31,55,47)(32,56,48), (2,9)(3,17)(4,25)(5,33)(6,41)(7,49)(8,57)(11,18)(12,26)(13,34)(14,42)(15,50)(16,58)(20,27)(21,35)(22,43)(23,51)(24,59)(29,36)(30,
    44)(31,52)(32,60)(38,45)(39,53)(40,61)(47,54)(48,62)(56,63) ];
gap> G := Group( gens );
<permutation group with 9 generators>
gap> NrMovedPoints( G );
64
gap> Order( G );
3612672
gap> BaseOfGroup( G );
[ 1, 2, 3, 5, 9, 17, 33 ]
gap> Size( last );
7
gap> GreedyBase( G );
[ 1, 10, 19, 37, 11 ]
gap> Size( last );
5
gap> Stabilizer( G, last2, OnTuples ); # check that we indeed have a base
Group(())