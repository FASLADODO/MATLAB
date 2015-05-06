clear all;
close all;
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');
    fo = fopen([ './crontab_2015_APR2.txt'],'w');


j=8;    
% ftime=[12; 18; 24;];
% for ii=7:numel(fdate)
    for ii=6:21

    for ij=1:24
    a1=num2str(fdate(ii));
    a2=num2str(fdate2(ii));
    a3=num2str(fdate(ii));
%     num2str(str2num(a2(7:8))+1,'%02d')
           if ij-1+5>=24
               if ij-1+1==24
        fprintf(fo,'%s\n',[ '20 ' num2str(ij-1+1-24,'%02d') ' ' a2(7:8) ' ' a2(5:6)  ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/opr' num2str(fdate2(ii),'%08d') ...
        '_' num2str(ij-1+5-24,'%02d') '.sh > /localdata2/yunsung.hwang/opr_HRRR/log/' num2str(fdate2(ii),'%08d') '_' num2str(ij+5-1-24,'%02d') '.log 2>&1' ]);
               else
        fprintf(fo,'%s\n',[ '20 ' num2str(ij-1+1,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/opr' num2str(fdate2(ii),'%08d') ...
        '_' num2str(ij-1+5-24,'%02d') '.sh > /localdata2/yunsung.hwang/opr_HRRR/log/' num2str(fdate2(ii),'%08d') '_' num2str(ij+5-1-24,'%02d') '.log 2>&1' ]);
               end
           else
        fprintf(fo,'%s\n',[ '20 ' num2str(ij-1+1,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/opr' num2str(fdate(ii),'%08d') ...
        '_' num2str(ij-1+5,'%02d') '.sh > /localdata2/yunsung.hwang/opr_HRRR/log/' num2str(fdate(ii),'%08d') '_' num2str(ij+5-1,'%02d') '.log 2>&1' ]);
       
           end
          indt=7; 
         if ij-1+indt>=24
               if ij-1+2>=24
        fprintf(fo,'%s\n',[ '04 ' num2str(ij-1+2-24,'%02d') ' ' a2(7:8) ' ' a2(5:6)  ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/obs' num2str(fdate2(ii),'%08d') ...
        '_' num2str(ij-1+indt-24,'%02d') '.sh > /localdata2/yunsung.hwang/opr_HRRR/log/o' num2str(fdate2(ii),'%08d') '_' num2str(ij+indt-1-24,'%02d') '.log 2>&1' ]);
               else
        fprintf(fo,'%s\n',[ '04 ' num2str(ij-1+2,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/obs' num2str(fdate2(ii),'%08d') ...
        '_' num2str(ij-1+indt-24,'%02d') '.sh > /localdata2/yunsung.hwang/opr_HRRR/log/o' num2str(fdate2(ii),'%08d') '_' num2str(ij+indt-1-24,'%02d') '.log 2>&1' ]);
               end
           else
        fprintf(fo,'%s\n',[ '04 ' num2str(ij-1+2,'%02d') ' ' a1(7:8) ' ' a1(5:6)  ' * bash /localdata2/yunsung.hwang/opr_HRRR/bashshell/obs' num2str(fdate(ii),'%08d') ...
        '_' num2str(ij-1+indt,'%02d') '.sh > /localdata2/yunsung.hwang/opr_HRRR/log/o' num2str(fdate(ii),'%08d') '_' num2str(ij+indt-1,'%02d') '.log 2>&1' ]);
       
           end
           
    end
end
fclose(fo);
    