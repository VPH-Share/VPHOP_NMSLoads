function U=norm1(a)
% NORM1 Normalize a vector in a 3D space
%       U=NORM1(A) returns the unit vector of the 3D vector A
%--------------------------------------------------------------------
% INPUT:
% a     (3xNf) = a vector: each column contains the 3 components of the vector
%---------------------------------------------------------------------
% OUTPUT:
% U     (3xNf) = unit vector that contains the 3 components of the UNIT vector
%---------------------------------------------------------------------
% Auth: A Leardini 29/1/1992

te=sqrt(sum(a.*a)).^(-1);
U=a.*[te;te;te];

