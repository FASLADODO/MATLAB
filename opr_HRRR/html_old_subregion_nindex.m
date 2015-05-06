clear all;
close all;
[fdatem] = textread('listdatem1.dat', '%d \n');
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');


% for ii=1:numel(fdate)
for ii=8:24
    
    
    for ij=1:24
     fo = fopen([ './html/nindex' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html'],'w');  

    fprintf(fo,'%s\n','<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
    fprintf(fo,'%s\n','<html xmlns="http://www.w3.org/1999/xhtml">');
    fprintf(fo,'%s\n','<head> ');
    fprintf(fo,'%s\n','<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />');
    fprintf(fo,'%s\n','<title> YHWANG_NOWCAST </title>');
    fprintf(fo,'%s\n','<h1>NOWCASTING using SALIENT CROSS-DISSOLVE in WDSS-II</h1>');
    fprintf(fo,'%s\n','<style type="text/css">');

    fprintf(fo,'%s\n','#container {');
    fprintf(fo,'%s\n','	width: 140px;');
    fprintf(fo,'%s\n','	height: 500px;');
    fprintf(fo,'%s\n','	margin: 200 auto;');
    fprintf(fo,'%s\n','	padding: 0px 0px 20px;');
    fprintf(fo,'%s\n','	position: absolute;');
    fprintf(fo,'%s\n','	background: #999;');
    fprintf(fo,'%s\n','}');
    fprintf(fo,'%s\n','a span {display: none;} ');
    fprintf(fo,'%s\n','a:hover span#hovImg {');
    fprintf(fo,'%s\n','	position: absolute;');
    fprintf(fo,'%s\n','	left: 145px;');
    fprintf(fo,'%s\n','    	top: 20px;');
    fprintf(fo,'%s\n','	width: 96px;');
    fprintf(fo,'%s\n','	height: 96px;');
    fprintf(fo,'%s\n','	background-color: #ddc;');
    fprintf(fo,'%s\n','    	z-index: -1;');
    fprintf(fo,'%s\n','');
    fprintf(fo,'%s\n','	display: block;');
    fprintf(fo,'%s\n','}');
    fprintf(fo,'%s\n','figcaption {');
    fprintf(fo,'%s\n','	color: white;');
    fprintf(fo,'%s\n','	position: absolute;');
    fprintf(fo,'%s\n','	left: 00px;');
    fprintf(fo,'%s\n','	top: -30px;');
    fprintf(fo,'%s\n','height:30px;');
    fprintf(fo,'%s\n','width:500px;');
    fprintf(fo,'%s\n','line-height:30px;');
     fprintf(fo,'%s\n','background-color: black;');
    fprintf(fo,'%s\n','bottom:0px;');
    fprintf(fo,'%s\n','transition: bottom 0.5s ease;');
     fprintf(fo,'%s\n','}');
    fprintf(fo,'%s\n','figure:hover figcaption {');
    fprintf(fo,'%s\n','bottom:0;');
    fprintf(fo,'%s\n','}');
    
    fprintf(fo,'%s\n','</style>');
    fprintf(fo,'%s\n','</head>');
    fprintf(fo,'%s\n','<body>');
    fprintf(fo,'%s\n','<font size="3"><a href="../index.html">Back to main</a> </font>');
    fprintf(fo,'%s\n','    <center> <IMG STYLE="background-color:white; position:absolute; TOP:600px; LEFT:200px; WIDTH:700px; HEIGHT:120px"  SRC="../png/bar2.png" ALT="Z colorbar" > </center>');
    fprintf(fo,'%s\n',' <div id="container">');
    fprintf(fo,'%s\n',' <p>');
% % % % % % % % % % % % % % % % 
    fprintf(fo,'%s\n','</style>');
% % % % % % % % % % % % % % % %     
    fprintf(fo,'%s\n',['<div id="title"> ' num2str(fdate(ii),'%08d')  '_' num2str(ij-1,'%02d') 'UTC</div>']);
    ldtime=[num2str(fdate(ii),'%08d')  '-' num2str(ij-1,'%02d')];
    
    for k=1:5
        if ij-1+(-5+k)<1
            ofdate=fdatem;
            oij=ij-1+(-5+k)+24;
        else
            ofdate=fdate;
            oij=ij-1+(-5+k);
        end
        
        if oij>=24
            ofdate=fdate;
            oij=oij-24;
        end
        
        
    ldtime2=[num2str(ofdate(ii),'%08d')  '-' num2str(oij,'%02d')];
    fprintf(fo,'%s\n',[' &nbsp <a href="#">O_' num2str(-5+k) 'h<span id="hovImg"><img style="background-color:black; WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
    ldtime2 'MergedReflectivityQCComposite.png" alt="" /> <figcaption>Observed Reflectivity Composite at ' ...
    ldtime2 ' (UTC) </figcaption>' ...
    '</span></a>']);
    fprintf(fo,'%s\n','</br>');
    end
    
    for k=1:2
    fprintf(fo,'%s\n',[' &nbsp <a href="#">Z_' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
    ldtime 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /><figcaption>' num2str(k) ' h Reflectivity Composite Nowcast initialized at ' ...
    ldtime ' (UTC)' ' </figcaption>' ...
    '</span></a>']);
    if  ij+k>24
    odtime=[num2str(fdate2(ii),'%08d')  '-' num2str(oij+k-24,'%02d')];
    else    
    odtime=[num2str(fdate(ii),'%08d')  '-' num2str(oij+k,'%02d')];
    end 

    fprintf(fo,'%s\n',[' &nbsp <a href="#">O' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/'...
    odtime 'MergedReflectivityQCComposite.png" alt="" /><figcaption>Observed Reflectivity Composite at ' ...
    odtime ' (UTC) </figcaption>' ...
    '</span></a>']);
  
    fprintf(fo,'%s\n',[' &nbsp <a href="#">ET_' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
    ldtime 'EchoTop_18_' num2str(k*60,'%04d') 'min.png" alt="" /><figcaption>' num2str(k) ' h 18 dBZ Echo Top Height Nowcast initialized at ' ...
    ldtime ' (UTC)' ' </figcaption>' ...
    '</span></a>']);
    fprintf(fo,'%s\n','</br>');
    end
    
    
    for k=3:8
    fprintf(fo,'%s\n',[' &nbsp <a href="#">Z_' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
    ldtime 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /><figcaption>' num2str(k) ' h Reflectivity Composite Nowcast initialized at ' ...
    ldtime ' (UTC)' ' </figcaption>' ...
    '</span></a>']);

    fprintf(fo,'%s\n',['&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="#">ET_' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
    ldtime 'EchoTop_18_' num2str(k*60,'%04d') 'min.png" alt="" /><figcaption>' num2str(k) ' h 18 dBZ Echo Top Height Nowcast initialized at ' ...
    ldtime ' (UTC)' ' </figcaption>' ...
    '</span></a>']);
    fprintf(fo,'%s\n','</br>');
    end
    
    
    if ij-2<0
    oij=25;
    ofdate=fdatem;
    else
    oij=ij;
    ofdate=fdate; 
    end
    
    fprintf(fo,'%s\n',' </br> ');
    
    if ij-1-8<1
       ofdate2=fdatem;
       oij2=ij+-8+24;
    else
       ofdate2=fdate;
       oij2=ij+-8;
    end
       
    fprintf(fo,'%s\n',['<div id="title"> ' num2str(ofdate2(ii),'%08d')  '_' num2str(oij2-1,'%02d') 'UTC</div>']);
    ldtime3=[num2str(ofdate2(ii),'%08d')  '-' num2str(oij2-1,'%02d')];
    for k=1:8
    fprintf(fo,'%s\n',[' &nbsp <a href="#">Z_' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
    ldtime3 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /><figcaption>' num2str(k) ' h Reflectivity Composite Nowcast initialized at ' ...
    ldtime3 ' (UTC)' ' </figcaption>' ...
    '</span></a>']);
    if  oij2-1+k>=24
    ldtime4=[num2str(fdate(ii),'%08d')  '-' num2str(oij2-1+k-24,'%02d')];
    else    
    ldtime4=[num2str(ofdate2(ii),'%08d')  '-' num2str(oij2-1+k,'%02d')];
    end 
    fprintf(fo,'%s\n',['&nbsp &nbsp <a href="#">O_' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
        ldtime4 'MergedReflectivityQCComposite.png" alt="" /><figcaption>Observed Reflectivity Composite at ' ...
    ldtime4 ' (UTC) </figcaption>' ...
       '</span></a>']);
       fprintf(fo,'%s\n','</br>');

       
    ldtime=[num2str(fdate(ii),'%08d')  '-' num2str(ij-1,'%02d')];
       
    end
    
       fprintf(fo,'%s\n','<div id="title">Abbreviation </div>');
       fprintf(fo,'%s\n','<font size="1"><a> O:&nbsp Obseved Relfectivity</a></font>');
       fprintf(fo,'%s\n','</br>');
       fprintf(fo,'%s\n','<font size="1"><a> Z:&nbsp Nowcast Relfectivity</a></font>');
       fprintf(fo,'%s\n','</br>');
       fprintf(fo,'%s\n','<font size="1"><a> ET:&nbsp Nowcast Echo Top Height</a></font>');
%     ldtime2=[num2str(ofdate(ii),'%08d')  '-' num2str(oij,'%02d')];
%     fprintf(fo,'%s\n',[' &nbsp <a href="#">Z ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ldtime2 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
% 
%     fprintf(fo,'%s\n',[' &nbsp <a href="#">O ' num2str(-5+k) 'h<span id="hovImg"><img style="background-color:black; WIDTH:750px; HEIGHT:500px" src="../png/nat/' ...
%     ldtime2 'MergedReflectivityQCComposite.png" alt="" /></span></a>']);
%     fprintf(fo,'%s\n','</br>');
%     end
    
    
%     fprintf(fo,'%s\n',['<div id="title"> ' num2str(ofdate(ii),'%08d')  '_' num2str(oij-2,'%02d') 'UTC</div>']);
%     ldtime2=[num2str(ofdate(ii),'%08d')  '-' num2str(oij-2,'%02d')];
%     for k=1:8
%     fprintf(fo,'%s\n',[' &nbsp <a href="#">Z ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ldtime2 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
%     fprintf(fo,'%s\n',['&nbsp &nbsp <a href="#">ET ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:750px; HEIGHT:500px" src="../png/nat/' ldtime2 'EchoTop_18_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
%     fprintf(fo,'%s\n','</br>');
%     end
    fprintf(fo,'%s\n','</p>');
    fprintf(fo,'%s\n','<!--end container--></div>');
    fprintf(fo,'%s\n','</body>');
    fprintf(fo,'%s\n','</html>');
    fclose(fo);
    end
    end
