clear all;
close all;

% MTP='/home/ys/2014FebMT/REF'
% OUTMTP=$MTP"/out"
% OUTMTP2=$MTP"/txt_fcstout"
% HREF="HRRR_ReflectivityComposite"
% RREF="MergedReflectivityQCComposite"
% 
% #makeIndex.pl $OUTMTP code_index2.xml
% 
% 
% w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2/HRRR_015.dat -T "$RREF" -F "$HREF:015Minute" -t 15 -d"0 65" --verbose
fo = fopen('shell_script.sh','w');
fprintf(fo,'%s\n','MTP="/home/ys/2014FebMT/REF"');
fprintf(fo,'%s\n','OUTMTP=$MTP"/out"');
fprintf(fo,'%s\n','OUTMTP2=$MTP"/txt_fcstout"');
fprintf(fo,'%s\n','HREF="HRRR_ReflectivityComposite"');
fprintf(fo,'%s\n','RREF="MergedReflectivityQCComposite"');
fprintf(fo,'%s\n',' ');
w2fcst='w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2';
for i=1:5
fprintf(fo,'%s\n',[ w2fcst '/HRR_' num2str(15*i,'%03i') ...
     '.dat -T "$RREF" -F "$HREF:' num2str(15*i,'%03i') ... 
     'Minute" -t' num2str(15*i,'%i') ' -d "0 65" --verbose']);
end

% fid = fopen(['ADVWSR88D_' num2str(15*i,'%03i') '.dat']);
% data1 = textscan(fid,'%s',33,'delimiter','="', 'headerLines', 8);
% a=data1{1,1}
% fclose(fid);
% for ji=1:8
%     fprintf(fo,'%f,',str2num(a{3*ji}));
% end
% fprintf(fo,'\n');
% clear a;
% end
fclose(fo);