clear all;
close all;
[fdatem] = textread('listdatem1.dat', '%d \n');
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');
re=['nw'; 'nc'; 'ne'; 'sw'; 'sc'; 'se'];
subregion=['NW'; 'NC'; 'NE'; 'SW'; 'SC'; 'SE'];



  fo = fopen([ './imgarch.html'],'w');  
  fprintf(fo,'%s\n','<html>');
  fprintf(fo,'%s\n','<head>');
  fprintf(fo,'%s\n','<title>REALTIME SALCD NOWCAST - WDSS-II/NSSL</title>');
  fprintf(fo,'%s\n','</head>');

  fprintf(fo,'%s\n',' <h1>IMAGE ARCHIVE: NOWCASTING using SALIENT CROSS-DISSOLVE in WDSS-II</h1>');
  fprintf(fo,'%s\n','<body>');
  fprintf(fo,'%s\n','<font size="3"><a href="../index.html">Back to main</a> </font>');
  fprintf(fo,'%s\n','</br>');
    


% for ii=1:numel(fdate)

for ii=14:-1:8
    fprintf(fo,'%s\n','<p>');
    fprintf(fo,'%s\n',[ '<font size="4">' num2str(fdate(ii),'%08d') '(CONUS) </font>']);
    for ij=1:24
    fprintf(fo,'%s\n',['<font size="3"><a href="../html/bnindex' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html">' num2str(ij-1,'%02d') '</a> </font>']);
    end
%     fprintf(fo,'%s\n','</p>');
fprintf(fo,'%s\n','</br>');
    
    for kk=1:6
%     fprintf(fo,'%s\n','<p>');
    fprintf(fo,'%s\n',[ '<font size="4">' num2str(fdate(ii),'%08d') '(' subregion(kk,:) ') </font>']);
    for ij=1:24
    fprintf(fo,'%s\n',['<font size="3"><a href="../html/bnindex' re(kk,:) num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html">' num2str(ij-1,'%02d') '</a> </font>']);
    end
    fprintf(fo,'%s\n','</br>');

    end
fprintf(fo,'%s\n','</p>');
fprintf(fo,'%s\n','</br>');
% fprintf(fo,'%s\n','</br>');        
    
end
    fprintf(fo,'%s\n','<!--end container--></div>');
    
    fprintf(fo,'%s\n','</body>');
    fprintf(fo,'%s\n','</html>');
    fclose(fo);
    
