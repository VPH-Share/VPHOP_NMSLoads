function Tr=rotter(T,rot)
% ROTTER Rotates a coordinate system with 3 successive elementary rotations
%        TR=ROTTER(T,ROT) provides the new rotation matrix TR after the rotation
%        of the T matrix about X, Y, Z axes by the angles ROT. The rotations occur
%        strictly in the mentioned order and about the moving coordinate system.
%        It is mainly used to orient anatomical frames in the same standardized
%        direction, after the first definition using PLANAX
%----------------------------------------------------------------------------------
% INPUT:
% T   (9xNf)= rotation matrix of the rotation from the Local to the Global CS
%             (in 'xNf' format: each of the Nf columns 9x1 contains the three 3x1
%             columns of the 3x3 rotation matrix, one below the other)
% rot (3x1) = the 3 successive rotation angles about respectively the x, y, z axes.
%             Angles are in number of 'pi' RAD (ex. [-0.5;0;1] means -90 0 180 DEG
%----------------------------------------------------------------------------------
% OUTPUT:
% Tr  (9xNf)= rotation matrix of the rotation from the Local to the Global CS
%             (in 'xNf' format: each of the Nf columns 9x1 contains the three 3x1
%             columns of the 3x3 rotation matrix, one below the other)
%----------------------------------------------------------------------------------
% Auth: A Leardini 31/1/1995
% See : PLANAX, TERMOB, GES

rotr=rot*pi; % rotations in RAD
alfa=rotr(1);
beta=rotr(2);
gamma=rotr(3);
sa=sin(alfa);
ca=cos(alfa);
sb=sin(beta);
cb=cos(beta);
sg=sin(gamma);
cg=cos(gamma);
a11=cb*cg;
a12=-cb*sg;
a13=sb;
a21=sa*sb*cg+ca*sg;
a22=-sa*sb*sg+ca*cg;
a23=-sa*cb;
a31=-ca*sb*cg+sa*sg;
a32=ca*sb*sg+sa*cg;
a33=ca*cb;
A1=[a11 a21 a31];
A2=[a12 a22 a32];
A3=[a13 a23 a33];
T1=[T(1,:);T(4,:);T(7,:)];
T2=[T(2,:);T(5,:);T(8,:)];
T3=[T(3,:);T(6,:);T(9,:)];
Tr=[A1*T1;A1*T2;A1*T3;A2*T1;A2*T2;A2*T3;A3*T1;A3*T2;A3*T3];

