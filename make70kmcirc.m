clear all;
close all;
[x2,y2]=meshgrid(-100:0.5:100,-100:0.5:100);
indcirc=zeros(401,401);
for i=1:401
    for j=1:401
        if sqrt(x2(i,j)^2+y2(i,j)^2)<=70
            indcirc(i,j)=1;
        else
            indcirc(i,j)=0;
        end
    end
end

pcolor(x2,y2,double(indcirc))
shading flat
axis square