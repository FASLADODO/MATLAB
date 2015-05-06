clear all;
close all;
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');
[fdatem] = textread('listdatem1.dat', '%d \n');
j=8;
for ii=1:numel(fdate)
    for ij=1:24
    fo = fopen([ './somscript/som' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.sh'],'w');
    fprintf(fo,'%s\n','#!/usr/bin/expect -f');
   
    for k=1:8
     fprintf(fo,'%s\n','set timeout 120');
    fprintf(fo,'%s\n',['spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/' ...
        num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') 'MergedReflectivityQCComposite_' num2str(60*k,'%04i')  'min.png' ...
        ' /webhost/akahwang/http/png/"']);
    fprintf(fo,'%s\n','expect {');
    fprintf(fo,'%s\n','-re ".*sword.*" {');
    fprintf(fo,'%s\n','exp_send "Minys0727\r"');
    fprintf(fo,'%s\n','    }');
    fprintf(fo,'%s\n','}');
    fprintf(fo,'%s\n','expect eof');
    end
    
    fprintf(fo,'%s\n',[ 'cp /webhost/akahwang/http/src/opr' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') ...
        '.html /webhost/akahwang/http/nowcast/Zindex.html' ]);
    
    fclose(fo);
    end
end