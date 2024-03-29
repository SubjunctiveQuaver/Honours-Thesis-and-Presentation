gap> Base := BaseOfGroup( G );
[ 1, 3, 6, 8, 2, 4, 5, 7, 12, 13, 14, 15, 16, 21, 23, 24, 29, 31 ]
gap> Length( Base );
18
gap> H := FreeGroup("u","l","f","r","b","d");
<free group on the generators [ u, l, f, r, b, d ]>
gap> h := GroupHomomorphismByImages( H, G, GeneratorsOfGroup( H ), GeneratorsOfGroup( G ) );
[ u, l, f, r, b, d ] -> [ (1,3,8,6)(2,5,7,4)(9,33,25,17)(10,34,26,18)(11,35,27,19),
  (1,17,41,40)(4,20,44,37)(6,22,46,35)(9,11,16,14)(10,13,15,12), (6,25,43,16)(7,28,42,13)(8,30,41,11)(17,19,24,
    22)(18,21,23,20), (3,38,43,19)(5,36,45,21)(8,33,48,24)(25,27,32,30)(26,29,31,28),
  (1,14,48,27)(2,12,47,29)(3,9,46,32)(33,35,40,38)(34,37,39,36), (14,22,30,38)(15,23,31,39)(16,24,32,40)(41,43,48,
    46)(42,45,47,44) ]
gap> x := Random( G ); # random element of Rubik's group
(1,27,32,6,43,14,22)(2,28,13,37,18,15,47,42,31)(3,38,17,24,46,41,9)(5,26)(7,44,39,23,45,34,21,20,12)(11,30,40,16,35,33,48)(29,36)
gap> PreImagesRepresentative( h, x ); # factorise into generators using GAP and stabiliser chains (equivalent to solving)
l*f^-1*l^-1*f*u*f*u^-1*f^2*l*f*l^-1*u^-1*l^-1*u*l*u^-1*l*u*f*u^-1*f^-1*l^-2*u*l*f^-1*l*f*(l^-1*u)^2*b^-1*u*b*l*u*l^-1*f^-1*l^-1*f*l^2*u*l^-1*u*l*b^-1*u^-1*b*l*d*f^2\
*d^-1*l*f^-1*u*l^-1*f*u^-1*l*d^-1*l*b*d*u^-2*b^-1*r^-1*b*u^-1*r*f^-1*u*d^-2
gap> Length( last );
78
gap> x = L*F^(-1)*L^(-1)*F*U*F*U^(-1)*F^2*L*F*L^(-1)*U^(-1)*L^(-1)*U*L*U^(-1)*L*U*F*U^(-1)*F^(-1)*L^(-2)*U*L*F^(-1)*L*F*(L^(-1)*U)^2*B^(-1)*U*B*L*U*L^(-1)*F^(-1)*L^(-1)*F*L^2*U*L^(-1)*U*L*B^(-1)*U^(-1)*B*L*D*F^2*D^(-1)*L*F^(-1)*U*L^(-1)*F*U^(-1)*L*D^(-1)*L*B*D*U^(-2)*B^(-1)*R^(-1)*B*U^(-1)*R*F^(-1)*U*D^(-2);
true