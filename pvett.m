function Mv=pvett(Av,Bv)
% PVETT Vector product of two vectors
%       MV=PVETT(AV,BV) return in MV the unit vector of the product
%       of the 2 3D vectors AV and BV
%---------------------------------------------------------------------
% INPUT:
% Av,Bv (3xNf) = 2 vectors: each column contains the 3 components of the vector
%---------------------------------------------------------------------
% OUTPUT:
% Mv    (3xNf) = unit vector that contains the 3 components of the product
%---------------------------------------------------------------------
% Auth: A Leardini 29/1/1992

Mv1=[Av(2,:).*Bv(3,:)-Av(3,:).*Bv(2,:);
    -Av(1,:).*Bv(3,:)+Av(3,:).*Bv(1,:);
     Av(1,:).*Bv(2,:)-Av(2,:).*Bv(1,:)];
% producing the UNIT vector of the product
Mv=norm1(Mv1);

