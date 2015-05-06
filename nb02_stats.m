clear all;
close all;
[x2,y2]=meshgrid(47.9:-0.0253:47.9-0.0253*1058,-127:0.0407:-127+0.0407*1626);
% indcirc=zeros(1627,1059);
% nbfcst = 1e3+8e3*rand(1627,1059);
% nbobs = 1e3+8e3*rand(1627,1059);
load('./nbfcst.mat','nbfcst');
load('./nbobs.mat','nbobs');
thresh=6.5e3;

% randnum=rand(1627,1059);
idfcst=medfilt2(nbfcst>thresh,[5 5]);
idobs=medfilt2(nbobs>thresh,[5 5]);
hit=0;
miss=0;
false=0;
null=0;

for i=1:1627
    for j=1:1059
        if idobs(i,j)==1
        indcirc=zeros(1627,1059);
            for ki=1:1627
                for kj=1:1059
                    if sqrt((x2(i,j)-x2(ki,kj))^2+(y2(i,j)-y2(ki,kj))^2)>=20
                    indcirc(i,j)=1;   
                    end
                end
            end
            [idx idy]=find(indcirc==1);
            idfcstsum=0;
            for i=1:numel(idx)
                idfcstsum=idfcstsum+idfcst(idx,idy);
            end
            if idfcstsum>1
            hit=hit+1;
            elseif idfcstsum<=1
            false=false+1;    
            end
            
        elseif idobs(i,j)==0
        indcirc2=zeros(1627,1059);
            for ki=1:1627
                for kj=1:1059
                    if sqrt((x2(i,j)-x2(ki,kj))^2+(y2(i,j)-y2(ki,kj))^2)>=20
                    indcirc2(i,j)=1;   
                    end
                end
            end
            [idx2 idy2]=find(indcirc2==1);
            idfcstsum2=0;
            for i=1:numel(idx2)
                idfcstsum2=idfcstsum2+idfcst(idx2,idy2);
            end
            if idfcstsum2==0
            null=null+1;
            elseif idfcstsum2>=1
            miss=miss+1;    
            end  
        end
            
        end
end
hit
miss
false
null
 
fig=figure;
set(fig,'Position',[100 100 1200 500]);
pcolor(y2,x2,double(idfcst-idobs))
shading flat
% axis square