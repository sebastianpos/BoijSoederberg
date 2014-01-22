# total:   7447  5760  4365  3230  2329  1622  1070   655   361     ?
# ------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|
#     4:    380   210   100    35     4     .     .     .     .     *
#     3:      *  7067  5550  4265  3195  2325  1622  1070   655   361
# ------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|
# twist:     -5    -4    -3    -2    -1     0     1     2     3     4
# -------------------------------------------------------------------
# Euler:  -4230 -3191 -2325 -1622 -1070  -655  -361  -170   -62   -15

#  total:  627 380 210 100  35   6  10  10   5   0   2   0   5  10  10   6  35 100 210 380 627
# --------------------------------------------------------------------------------------------
#      4:  627 380 210 100  35   4   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
#      3:    .   .   .   .   .   2  10  10   5   .   .   .   .   .   .   .   .   .   .   .   .
#      2:    .   .   .   .   .   .   .   .   .   .   2   .   .   .   .   .   .   .   .   .   .
#      1:    .   .   .   .   .   .   .   .   .   .   .   .   5  10  10   2   .   .   .   .   .
#      0:    .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   4  35 100 210 380 627
# --------------------------------------------------------------------------------------------
# degree:  -10  -9  -8  -7  -6  -5  -4  -3  -2  -1   0   1   2   3   4   5   6   7   8   9  10

# Read( "HorrocksMumford.g" );
LoadPackage( "GradedRingForHomalg" );;

R := HomalgFieldOfRationalsInDefaultCAS( ) * "x0..x4";;

S := GradedRing( R );;

A := KoszulDualRing( S, "e0..e4" );;

LoadPackage( "GradedModules" );;

## [EFS, Example 7.3]:
## A famous Beilinson monad was discovered by Horrocks and Mumford [HM]:

mat := HomalgMatrix( "[ \
e1*e4, e2*e0, e3*e1, e4*e2, e0*e3, \
e2*e3, e3*e4, e4*e0, e0*e1, e1*e2  \
]",
2, 5, A );

phi := GradedMap( mat, "free", "free", "left", A );;
IsMorphism( phi );

M := GuessModuleOfGlobalSectionsFromATateMap( 2, phi );

Q := CoefficientsRing( S );

S2 := Q * "y0..y4";

AssignGeneratorVariables( S2 );

phi := RingMap( [ y0^2, y1^2, y2^2, y3^2, y4^2 ], S, S2 );

P := Pullback( phi, M );

T := TateResolution( P, -12 , 12 );
#! <An acyclic cocomplex containing 24 morphisms of graded left modules at degrees [ -12 .. 12 ]>
B3 := BettiTable( T3 );
#!<A Betti diagram of <An acyclic cocomplex containing 24 morphisms of graded left modules at degrees [ -12 .. 12 ]>>
Display( B3 );
total:  2085 1387  864  500  285  195  172  159  135  100   62   35   25   25   35   62  100  135  159  172  195  285  500  864 1387    ?    ?    ?    ?
-----------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
    4:  2085 1385  854  470  215   75   20    4    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    0    0    0    0
    3:     *    .    2   10   30   70  120  152  155  135  100   60   25    5    .    .    .    .    .    .    .    .    .    .    .    .    0    0    0
    2:     *    *    .    .    .    .    .    .    .    .    .    .    2   10   20   20   10    2    .    .    .    .    .    .    .    .    .    0    0
    1:     *    *    *    .    .    .    .    .    .    .    .    .    .    .    .    .    5   25   60  100  135  155  152  120   70   30   10    2    0
    0:     *    *    *    *    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    4   20   75  215  470  854 1385
-----------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
twist:   -16  -15  -14  -13  -12  -11  -10   -9   -8   -7   -6   -5   -4   -3   -2   -1    0    1    2    3    4    5    6    7    8    9   10   11   12
--------------------------------------------------------------------------------------------------------------------------------------------------------
Euler:  2085 1385  852  460  185    5 -100 -148 -155 -135 -100  -60  -23    5   20   20    5  -23  -60 -100 -135 -155 -148 -100    5  185  460  852 1385


#Frage: Hängt der Pullback nur vom Grad der endlichen Abbildung ab? Ja

phi := RingMap( [ y0^2 + y1^2, y1^2, y2^2, y3^2, y4^2 ], S, S2 );
#!<A "homomorphism" of rings>
P := Pullback( phi, M );
#!<A graded left module presented by 94 relations for 19 generators>
T := TateResolution( P, -5 , 5 );
#!<An acyclic cocomplex containing 10 morphisms of graded left modules at degrees [ -5 .. 5 ]>
B := BettiTable( T );
#!<A Betti diagram of <An acyclic cocomplex containing 10 morphisms of graded left modules at degrees [ -5 .. 5 ]>>
Display( B );
total:   159  135  100   62   35   25   25   35   62  100  135    ?    ?    ?
-----------|----|----|----|----|----|----|----|----|----|----|----|----|----|
    4:     4    .    .    .    .    .    .    .    .    .    .    *    *    *
    3:     *  155  135  100   60   25    5    .    .    .    .    .    *    *
    2:     *    *    .    .    .    2   10   20   20   10    2    .    .    *
    1:     *    *    *    .    .    .    .    .    .    5   25   60  100  135
-----------|----|----|----|----|----|----|----|----|----|----|----|----|----|
twist:    -8   -7   -6   -5   -4   -3   -2   -1    0    1    2    3    4    5
-----------------------------------------------------------------------------
Euler:  -155 -135 -100  -60  -23    5   20   20    5  -23  -60 -100 -135 -155

