clear all;

a=[0 0 0; 0 5 0; 0 0 0];
bb=[1 2 3; 2 3 4; 4 5 6];
% kk=corr2(a,bb)
ccc=zeros(5,5);
ftccc=zeros(5,5);


b=[2 3 6 -5 6; 3 5 0 0 0; 1 -2 0 5 0; -3 5 0 0 0; -2 -3 -6 6 7];

dd(2,1)=b(2,1);
% 
% for i=2:4
%     for j=2:4
%     dd=zeros(3,3);
%     dd(1,1)=b(i-1,j-1);
%     dd(2,1)=b(i,j-1);
%     dd(3,1)=b(i+1,j-1);
%     dd(1,2)=b(i-1,j);
%     dd(2,2)=b(i,j);
%     dd(3,2)=b(i+1,j);
%     dd(1,3)=b(i-1,j+1);
%     dd(2,3)=b(i,j+1);
%     dd(3,3)=b(i+1,j+1);
%     ccc(i,j)=xcorr2(dd,a);
%     clear dd;
%   end
% end

% ccc=xcorr2(a,b)

    aa=zeros(9,1);
    
    aa(1,1)=a(2-1,2-1);
    aa(2,1)=a(2,2-1);
    aa(3,1)=a(2+1,2-1);
    aa(4,1)=a(2-1,2);
    aa(5,1)=a(2,2);
    aa(6,1)=a(2+1,2);
    aa(7,1)=a(2-1,2+1);
    aa(8,1)=a(2,2+1);
    aa(9,1)=a(2+1,2+1);
     

for i=2:4
    for j=2:4
    dd=zeros(9,1);
    dd(1,1)=b(i-1,j-1);
    dd(2,1)=b(i,j-1);
    dd(3,1)=b(i+1,j-1);
    dd(4,1)=b(i-1,j);
    dd(5,1)=b(i,j);
    dd(6,1)=b(i+1,j);
    dd(7,1)=b(i-1,j+1);
    dd(8,1)=b(i,j+1);
    dd(9,1)=b(i+1,j+1);
    rup=zeros(9,1);
        for k=1:9
        rup(k)=dd(k)*aa(k);
        end
    rsup2=sum(rup(:));
    aa2=aa.^2;
    dd2=dd.^2;
    rdown=(sum(aa2(:))*sum(dd2(:)))^0.5;
    clear dd;
    ccc(i,j)=rsup2/rdown;
   end
end

mem1=gaussmf(-10:10,[0.5,5]).*3-1;
mem2=gaussmf(-10:10,[2,0]).*0.5+0.5;
mem3=gaussmf(-10:10,[0.5,0]).*2-1;

for i=2:4
    for j=2:4
    cbox=[];
    sbox=[];
    
    cbox=b(i,j);
    sbox=zeros(1,8);
    indexcnum=numel(cbox);
    indexsnum=numel(sbox);
    
    sbox(1,1)=b(i-1,j-1);
    sbox(1,2)=b(i,j-1);
    sbox(1,3)=b(i+1,j-1);
    sbox(1,4)=b(i-1,j);
    sbox(1,5)=b(i+1,j);
    sbox(1,6)=b(i-1,j+1);
    sbox(1,7)=b(i,j+1);
    sbox(1,8)=b(i+1,j+1);
    
      kkk=0;   
      u_SCRfunc;
      ftccc(i,j)=(clscore+sdscore)/9;
%     ftccenter=mem1(center)
  end
end


% plot(-10:10,mem1)
% plot(-10:10,mem2)
% ylim([-1 2])
