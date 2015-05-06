clear all;
close all;
[fdate] = textread('../listdate1.dat', '%d \n');
% [fdate2] = textread('../ll2.dat', '%d \n');
ftime=[12; 15; 18;];
     
fo = fopen(['../exe/copySv2.sh'],'w');
for ij=1:3
 for ii=1:numel(fdate)

%     fo = fopen([ '../exe/yhwang' num2str(fdate(ii),'%08d') '_' num2str(ftime(ij),'%02d') '.sh'],'w');
        dt=[num2str(fdate(ii),'%08d') '_' num2str(ftime(ij),'%02d')];
        fprintf(fo,'%s\n',['mkdir /localdata2/yunsung.hwang/upload_UPWS/Z' dt ]);
        fprintf(fo,'%s\n',['cp -rf /localdata2/yunsung.hwang/UPWS/Z' dt '/SAL_* /localdata2/yunsung.hwang/upload_UPWS/Z' dt '/']);
        fprintf(fo,'%s\n',['cp -rf /localdata2/yunsung.hwang/UPWS/Z' dt '/SAL_0* /localdata2/yunsung.hwang/upload_UPWS/Z' dt '/']);
        fprintf(fo,'%s\n',['cp -rf /localdata2/yunsung.hwang/UPWS/Z' dt '/SALimage* /localdata2/yunsung.hwang/upload_UPWS/Z' dt '/']);
%         fprintf(fo,'%s\n',['cp -rf /localdata2/yunsung.hwang/UPWS/Z' dt '/MergedReflectivityQCComposite* /localdata2/yunsung.hwang/upload_UPWS/Z' dt '/']);
 end

end
     
fclose(fo);

