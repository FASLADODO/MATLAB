clear all;
close all;
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');
    fo = fopen([ './buxston_crontab_2015_APR2.txt'],'w');


j=8;    
% ftime=[12; 18; 24;];
for ii=6:numel(fdate)
    for ij=1:24
    a1=num2str(fdate(ii));
    a2=num2str(fdate2(ii));
%            if ij-1+1>=24
%         fprintf(fo,'%s\n',[ '45 ' num2str(ij-1+1-24,'%02d') ' ' a2(7:8) ' ' a2(5:6)  ' * bash /home/yunsung.hwang/bxsh/bxsh' num2str(fdate(ii),'%08d') ...
%         '_' num2str(ij-1,'%02d') '.sh > /home/yunsung.hwang/bxsh/log/' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.log 2>&1' ]);
%            else
%         fprintf(fo,'%s\n',[ '45 ' num2str(ij-1+1,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /home/yunsung.hwang/bxsh/bxsh' num2str(fdate(ii),'%08d') ...
%         '_' num2str(ij-1,'%02d') '.sh > /home/yunsung.hwang/bxsh/log/' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.log 2>&1' ]);
%        
%            end
           
        if ij-1+5>=24
        if ij-1+2>=24
        fprintf(fo,'%s\n',[ '06 ' num2str(ij-1+2-24,'%02d') ' ' a2(7:8) ' ' a2(5:6)  ' * bash /home/yunsung.hwang/bxsh/bxsh' num2str(fdate2(ii),'%08d') ...
        '_' num2str(ij-1+5-24,'%02d') '.sh > /home/yunsung.hwang/bxsh/log/' num2str(fdate2(ii),'%08d') '_' num2str(ij-1+5-24,'%02d') '.log 2>&1' ]);
        else
        fprintf(fo,'%s\n',[ '06 ' num2str(ij-1+2,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /home/yunsung.hwang/bxsh/bxsh' num2str(fdate2(ii),'%08d') ...
        '_' num2str(ij-1+5-24,'%02d') '.sh > /home/yunsung.hwang/bxsh/log/' num2str(fdate2(ii),'%08d') '_' num2str(ij+5-1-24,'%02d') '.log 2>&1' ]);
               end
           else
        fprintf(fo,'%s\n',[ '06 ' num2str(ij-1+2,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /home/yunsung.hwang/bxsh/bxsh' num2str(fdate(ii),'%08d') ...
        '_' num2str(ij-1+5,'%02d') '.sh > /home/yunsung.hwang/bxsh/log/' num2str(fdate(ii),'%08d') '_' num2str(ij+5-1,'%02d') '.log 2>&1' ]);
       
           end
           
           
           
%     fprintf(fo,'%s\n',[ '00 21 ' a1(7:8) ' ' a1(5:6) ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/opr' num2str(fdate(ii),'%08d')  '_18.sh > /localdata2/yunsung.hwang/opr_HRRR/log/' num2str(fdate(ii),'%08d') '_18.log 2>&1' ]);
%     fprintf(fo,'%s\n',[ '00 09 ' a2(7:8) ' ' a1(5:6) ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/opr' num2str(fdate2(ii),'%08d')  '_00.sh > /localdata2/yunsung.hwang/opr_HRRR/log/' num2str(fdate2(ii),'%08d') '_00.log 2>&1' ]);
    end
end
fclose(fo);
    