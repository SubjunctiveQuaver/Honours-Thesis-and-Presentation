G := Group([ (1,6)(2,7)(3,8)(4,5), (1,2), (1,3), (2,3), (6,7), (6,8), (7,8) ]); # generators
B := [ 4, 1, 2, 6, 7];
SC := StabChain( G, B ); # stabiliser chain of G with respect to base B