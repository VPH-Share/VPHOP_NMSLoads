%Tale file legge le coordinate dei punti LE, ME, e CH
%tali punti sono stati presi nel builder
%e poi sono state esportate le cloud con le coordinate dei punti
%Il file LE_ME.lis contiene solo le coordinate di LE e ME
%il file CH.lis ha solo le coordinate del centro della testa
%dal builder si ottiene un file txt ricordarsi di cambiare estensione e mettere .lis

LE_ME=load('LE_ME.lis');

HJC=load('CH.lis');

%il file side.lis invece contiene 0 se dx, 1 se sx
side=load('side_femur.lis')

LE=[LE_ME(1,1);LE_ME(1,2);LE_ME(1,3)]
ME=[LE_ME(2,1);LE_ME(2,2);LE_ME(2,3)]
HJC=[HJC(1,1);HJC(1,2);HJC(1,3)]

% una volta fatta girare questo file, dalla command window di matlab
% si richiama la funzione [gRth,Tth]=thighBAF(HJC,ME,LE,side)

MIDEPIC=(LE+ME)/2;
Tth=MIDEPIC;
if side==0
    gRth=planax(LE,ME,HJC,MIDEPIC,HJC); %right thigh
else
    gRth=planax(ME,LE,HJC,MIDEPIC,HJC); %left thigh
end

A=[gRth(1,1), gRth(4,1),gRth(7,1)]
B=[gRth(2,1), gRth(5,1),gRth(8,1)]
C=[gRth(3,1), gRth(6,1),gRth(9,1)]

D=[A;B;C]
 
%save('MAT_ROT_ISB_GLOB.txt','D','-ASCII')
%save('MAT_ROT_ISB_GLOB.txt','D','-ascii')
nomefile_output='MAT_ROT_ISB_GLOB.txt'
fid=fopen(nomefile_output,'wt')
for i=1:3
    if i==1
fprintf(fid,'%f       %f       %f\n',D(i,:))
    else
        if i==2
    fprintf(fid,'%f       %f       %f\n',D(i,:))
        else
            if i==3
    fprintf(fid,'%f        %f       %f',D(i,:))
            end
        end
    end
end
fclose (fid)

%Legge il file che contiene le coordinate della testa del femore
%[HJC]=textread('CH.lis')
%[HJC]=load('CH.lis')
%HJC=[HJC(1,1);HJC(1,2);HJC(1,3)]

[MR_ISB_GLOBALE]=D;

A2=[10*MR_ISB_GLOBALE(1,1)]
B2=[10*MR_ISB_GLOBALE(2,1)]
C2=[10*MR_ISB_GLOBALE(3,1)]

D2=[10*MR_ISB_GLOBALE(1,2)]
E2=[10*MR_ISB_GLOBALE(2,2)]
F2=[10*MR_ISB_GLOBALE(3,2)]


W=HJC(1,1)+A2
Z=HJC(2,1)+B2
T=HJC(3,1)+C2

M=HJC(1,1)+D2
J=HJC(2,1)+E2
H=HJC(3,1)+F2

%Assembla la matrice
KP_ISB=[HJC(1,1),HJC(2,1),HJC(3,1);
    W,Z,T;
    M,J,H]

nomefile_output='KP_ISB.txt'
fid=fopen(nomefile_output,'wt')
for j=1:3
if j==1
fprintf(fid,'%f       %f       %f\n',KP_ISB(j,:))
else
        if j==2
		fprintf(fid,'%f       %f       %f\n',KP_ISB(j,:))
	else	
		if j==3
		fprintf(fid,'%f       %f       %f',KP_ISB(j,:))
		end
    end
end	
end
fclose (fid)
