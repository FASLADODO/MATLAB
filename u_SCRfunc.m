clscore=[];
sdscore=[];

 for pp=1:indexcnum
  llscore(pp)=gaussmf(cbox(pp),[0.5,5]).*1.5-0.5;   
 end
   if kkk==0       
     clscore=(nansum(llscore(:)));
   end
 
  for ppp=1:indexsnum
     if sbox(ppp)>=0
     ssscore(ppp)=gaussmf(sbox(ppp),[2,0]);
     elseif sbox(ppp)<=0
     ssscore(ppp)=gaussmf(sbox(ppp),[0.5,0]).*2-1;     
     end
 end
 
   if kkk==0   
     sdscore=(nansum(ssscore(:)));
   end