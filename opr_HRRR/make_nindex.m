clear all;
close all;
[fdatem] = textread('listdatem1.dat', '%d \n');
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');


for ii=1:numel(fdate)
    for ij=1:24
     fo = fopen([ './html/nindex' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html'],'w');  
fprintf(fo,'%s\n','<title> YHWANG_NOWCAST </title>');
fprintf(fo,'%s\n','<h1>NOWCASTING using SALIENT CROSS-DISSOLVE in WDSS-II</h1>');
fprintf(fo,'%s\n','<script language="Javascript">');
fprintf(fo,'%s\n','function ShowPicture(id,Source) {');
fprintf(fo,'%s\n','if (Source=="1"){');
fprintf(fo,'%s\n','if (document.layers) document.layers[''+id+''].visibility = "show"');
fprintf(fo,'%s\n','else if (document.all) document.all[''+id+''].style.visibility = "visible"');
fprintf(fo,'%s\n','else if (document.getElementById) document.getElementById(''+id+'').style.visibility = "visible"');
fprintf(fo,'%s\n','}');
fprintf(fo,'%s\n','else');
fprintf(fo,'%s\n','if (Source=="0"){');
fprintf(fo,'%s\n','if (document.layers) document.layers[''+id+''].visibility = "hide"');
fprintf(fo,'%s\n','else if (document.all) document.all[''+id+''].style.visibility = "hidden"');
fprintf(fo,'%s\n','else if (document.getElementById) document.getElementById(''+id+'').style.visibility = "hidden"');
fprintf(fo,'%s\n','}');
fprintf(fo,'%s\n','}');
fprintf(fo,'%s\n','</script>');
 for k=1:8
    fprintf(fo,'%s',['<a href="#' num2str(k) '" onMouseOver="ShowPicture(' char(39) 'S' num2str(k) char(39) ...
        ',1)" onMouseOut="ShowPicture(' char(39) 'S' num2str(k) char(39) ',0)">' num2str(fdate(ii),'%08d')  '_' num2str(ij-1,'%02d') 'Z_' num2str(k)  'h</a>' ]);   
    fprintf(fo,'%s\n','</br>');
end
% <a href="#" onMouseOver="ShowPicture('S1',1)" onMouseOut="ShowPicture('S1',0)">20150420_18Z_01 h</a>
fprintf(fo,'%s\n','</br></br>');

if ij-2<0
oij=25;
ofdate=fdatem;
else
oij=ij;
ofdate=fdate;
    
end

for k=1:8
    fprintf(fo,'%s',['<a href="#' num2str(k+8) '" onMouseOver="ShowPicture(' char(39) 'S' num2str(k+8) char(39) ...
        ',1)" onMouseOut="ShowPicture(' char(39) 'S' num2str(k+8) char(39) ',0)">' num2str(ofdate(ii),'%08d')  '_' num2str(oij-1,'%02d') 'ET_' num2str(k)  'h</a>' ]);   
    fprintf(fo,'%s\n','</br>');
end
fprintf(fo,'%s\n','</br>');

% for k=1:8
%     fprintf(fo,'%s',['<a href="#' num2str(k+24) '" onMouseOver="ShowPicture(' char(39) 'S' num2str(k+24) char(39) ...
%         ',1)" onMouseOut="ShowPicture(' char(39) 'S' num2str(k+24) char(39) ',0)">' num2str(ofdate(ii),'%08d')  '_' num2str(oij-1,'%02d') 'ET_' num2str(k)  'h</a>' ]);   
%     fprintf(fo,'%s\n','</br>');
% end
fprintf(fo,'%s\n','</br>');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
fprintf(fo,'%s\n','<center> <IMG STYLE="background-color:white; position:absolute; TOP:500; LEFT:195; WIDTH:700; HEIGHT:120"  SRC="../png/bar.png" ALT="Z colorbar" > </center>');

for k=1:8
    fprintf(fo,'%s\n',['<div id="S' num2str(k) '"><img STYLE="background-color:black; position:absolute; TOP:80; LEFT:160; WIDTH:800; HEIGHT:400"  src="../png/nat/' ...
    num2str(fdate(ii),'%08d') '-' num2str(oij-1,'%02d') 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png"></div>']);   
%     fprintf(fo,'%s\n','</br>');
end
for k=1:8
    fprintf(fo,'%s\n',['<div id="S' num2str(k+8) '"><img STYLE="background-color:black; position:absolute; TOP:80; LEFT:160; WIDTH:800; HEIGHT:400"  src="../png/nat/' ...
    num2str(ofdate(ii),'%08d') '-' num2str(oij-1,'%02d') 'EchoTop_18_' num2str(k*60,'%04d') 'min.png"></div>']);   
%     fprintf(fo,'%s\n','</br>');
end
% for k=1:8
%     fprintf(fo,'%s\n',['<div id="S' num2str(k+16) '"><img STYLE="background-color:black; position:absolute; TOP:80; LEFT:160; WIDTH:800; HEIGHT:400"  src="../png/nat/' ...
%     num2str(ofdate(ii),'%08d') '-' num2str(oij-3,'%02d') 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png"></div>']);   
% %     fprintf(fo,'%s\n','</br>');
% end
% for k=1:8
%     fprintf(fo,'%s\n',['<div id="S' num2str(k+24) '"><img STYLE="background-color:black; position:absolute; TOP:80; LEFT:160; WIDTH:800; HEIGHT:400"  src="../png/nat/' ...
%     num2str(ofdate(ii),'%08d') '-' num2str(oij-4,'%02d') 'EchoTop_18_' num2str(k*60,'%04d') 'min.png"></div>']);   
% %     fprintf(fo,'%s\n','</br>');
% end
% 
% 

% fprintf(fo,'%s\n','<font color=?blue?> For more info on these semi-real time experimental high resolution nowcast, email Yunsung Hwang at yunsung.hwang@noaa.gov</font>');
fprintf(fo,'%s\n','</body>');
fprintf(fo,'%s\n','</html>');
    fclose(fo);
    end
    end
