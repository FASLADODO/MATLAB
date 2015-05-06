clear all;
close all;
[fdatem] = textread('listdatem1.dat', '%d \n');
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');


for ii=1:numel(fdate)
% for ii=1:1
    
    for ij=1:24
    fo = fopen([ './buxton/bxsh' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.sh'],'w');  

    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb1/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb2/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb3/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb4/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb5/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb6/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* --ext .png']);
    
    if ij>=24
        oij=ij-24;
        ofdate=fdate2;
    else
        oij=ij;
        ofdate=fdate;
    end
    
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/nat/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb1/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb2/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb3/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb4/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb5/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb6/' num2str(ofdate(ii),'%08d') '-' num2str(oij,'%02d') '* --ext .png']);
    
     if ij+1>=24
        oij=ij-24;
        ofdate=fdate2;
    else
        oij=ij;
        ofdate=fdate;
     end   
    
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/nat/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb1/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb2/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb3/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb4/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb5/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    fprintf(fo,'%s\n',[' pngquant --force /home/yunsung.hwang/opr_HRR/sb6/' num2str(ofdate(ii),'%08d') '-' num2str(oij+1,'%02d') '* --ext .png']);
    
    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
    for k=1:6
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
    end
    
    if ij==24 
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate2(ii),'%08d') '-' num2str(ij-1+2-24,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
        for k=1:6
        fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate2(ii),'%08d') '-' num2str(ij-1+2-24,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
        end    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate2(ii),'%08d') '-' num2str(ij-1+1-24,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
        for k=1:6
        fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate2(ii),'%08d') '-' num2str(ij-1+1-24,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
        end 
    elseif ij==23
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate(ii),'%08d') '-' num2str(ij-1+1,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
        for k=1:6
        fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate(ii),'%08d') '-' num2str(ij-1+1,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
        end    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate2(ii),'%08d') '-' num2str(ij-1+2-24,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
        for k=1:6
        fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate2(ii),'%08d') '-' num2str(ij-1+2-24,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
        end 
    else        
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate(ii),'%08d') '-' num2str(ij-1+1,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
        for k=1:6
        fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate(ii),'%08d') '-' num2str(ij-1+1,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
        end    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/nat/' num2str(fdate(ii),'%08d') '-' num2str(ij-1+2,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/nat/']);
        for k=1:6
        fprintf(fo,'%s\n',['cp /home/yunsung.hwang/opr_HRR/sb' num2str(k) '/' num2str(fdate(ii),'%08d') '-' num2str(ij-1+2,'%02d') '* /www/www.nssl.noaa.gov_wrf/nowcast/png/sb' num2str(k) '/']);  
        end    
    end
    
    
    
    
    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindex' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindex.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1.html']);
    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexnw' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexnw.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexnc' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexnc.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexne' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexne.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexsw' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexsw.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexsc' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexsc.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexse' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexse.html']);
    
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1nw' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1nw.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1nc' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1nc.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1ne' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1ne.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1sw' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1sw.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1sc' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1sc.html']);
    fprintf(fo,'%s\n',['cp /home/yunsung.hwang/html/nindexm1se' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html /www/www.nssl.noaa.gov_wrf/nowcast/opr/nindexm1se.html']);
    
    
    
    fclose(fo);
    end
    end
