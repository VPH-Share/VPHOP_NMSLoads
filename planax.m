function R=planax(P1,P2,P3,P4,P5)
% PLANAX Definition of a local coordinate system from 5 marker trajectories
%        R=PLANAX(P1,P2,P3,P4,P5) returns the rotation matrix R of the
%        local coordinate system defined starting from coordinates
%        of the 5 non-collinear markers P1-P2-P3-P4-P5.
%        It is a generalization of the TERMOB sub, mainly due to the 
%        necessity of an Anatomical Frame definition that often needs
%        more than 3 anatomical landmarks.
%        x = unit vector of the orthogonal of P1-P2-P3 plane (screw direction)
%        y = unit vector of the projection of P4->P5 vector on that plane
%        z = unit vector of the vectorial product x ^ y
%        It works for Nf frames
%        Typical example:
%        ShankAntFram=planax(HeadFib,LatMal,MedMal,MidMal,TibTub);
%        Use ROTTER to rotate the resultant system in the suitable way
%------------------------------------------------------------------------------------
% INPUT:
% P1,P2,P3 (3xNf)= trajectories (x,y,z during time) of the 3 points
% P4,P5            expressed in the global coord. system
%------------------------------------------------------------------------------------
% OUTPUT:
% R        (9xNf)= rotation matrix of the rotation from the Local to the Global CS
%                  (in 'xNf' format: each of the Nf columns 9x1 contains the three 3x1
%                  columns of the 3x3 rotation matrix, one below the other)
%------------------------------------------------------------------------------------
% Ref.s: Cappozzo et al. Position and orientation in space of bones during movement:  -CAST
%                        anatomical frame definition and determination
%                        Clin. Biomechanics 1995 10(4): 171-178
% Auth: A Leardini 31/1/1995
% See : TERMOB, ROTTER, GES

A1=P1-P2;
A=norm1(A1);
B1=P3-P1;
B=norm1(B1);
R1=P5-P4;
R=norm1(R1);
x=pvett(B,A);
z=pvett(x,R);
y=pvett(z,x);
R=[x;y;z];


