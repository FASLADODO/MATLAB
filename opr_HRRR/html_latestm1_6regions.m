clear all;
close all;
[fdatem] = textread('listdatem1.dat', '%d \n');
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');
re=['nw'; 'nc'; 'ne'; 'sw'; 'sc'; 'se'];
rwidth=[508; 508; 484; 474; 474; 435;];


for ii=1:numel(fdate)
    for ij=1:24
        for rr=1:6
     fo = fopen([ './html/nindexm1' re(rr,:) num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.html'],'w');  

    fprintf(fo,'%s\n','<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
    fprintf(fo,'%s\n','<html xmlns="http://www.w3.org/1999/xhtml">');
    fprintf(fo,'%s\n','<head> ');
    fprintf(fo,'%s\n','<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />');
    fprintf(fo,'%s\n','<title> YHWANG_NOWCAST </title>');
    fprintf(fo,'%s\n','<h1>NOWCASTING using SALIENT CROSS-DISSOLVE in WDSS-II</h1>');
    fprintf(fo,'%s\n','<style type="text/css">');

    fprintf(fo,'%s\n','#container {');
    fprintf(fo,'%s\n','	width: 130px;');
    fprintf(fo,'%s\n','	height: 500px;');
    fprintf(fo,'%s\n','	margin: 200 auto;');
    fprintf(fo,'%s\n','	padding: 0px 0px 20px;');
    fprintf(fo,'%s\n','	position: absolute;');
    fprintf(fo,'%s\n','	background: #999;');
    fprintf(fo,'%s\n','}');
    fprintf(fo,'%s\n','a span {display: none;} ');
    fprintf(fo,'%s\n','a:hover span#hovImg {');
    fprintf(fo,'%s\n','	position: absolute;');
    fprintf(fo,'%s\n','	left: 140px;');
    fprintf(fo,'%s\n','    	top: 0px;');
    fprintf(fo,'%s\n','	width: 96px;');
    fprintf(fo,'%s\n','	height: 96px;');
    fprintf(fo,'%s\n','	background-color: #ddc;');
    fprintf(fo,'%s\n','    	z-index: -1;');
    fprintf(fo,'%s\n','');
    fprintf(fo,'%s\n','	display: block;');
    fprintf(fo,'%s\n','}');
    fprintf(fo,'%s\n','</style>');
    fprintf(fo,'%s\n','</head>');
    fprintf(fo,'%s\n','<body>');
    fprintf(fo,'%s\n','    <center> <IMG STYLE="background-color:white; position:absolute; TOP:600px; LEFT:200px; WIDTH:700px; HEIGHT:120px"  SRC="../png/bar2.png" ALT="Z colorbar" > </center>');
    fprintf(fo,'%s\n',' <div id="container">');
    fprintf(fo,'%s\n',' <p>');


    
    if ij-3<0
    oij=24+ij;
    ofdate=fdatem;
    else
    oij=ij;
    ofdate=fdate; 
    end
    
    
    
    fprintf(fo,'%s\n',['<div id="title"> ' num2str(ofdate(ii),'%08d')  '_' num2str(oij-3,'%02d') 'UTC</div>']);
    ldtime=[num2str(ofdate(ii),'%08d')  '-' num2str(oij-3,'%02d')];
    for k=1:8
    fprintf(fo,'%s\n',[' &nbsp <a href="#">Z ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:' num2str(rwidth(rr),'%03d') 'px; HEIGHT:500px" src="../png/sb' num2str(rr)  '/' ldtime 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
    fprintf(fo,'%s\n',['&nbsp &nbsp <a href="#">ET ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:' num2str(rwidth(rr),'%03d') 'px; HEIGHT:500px" src="../png/sb' num2str(rr)  '/' ldtime 'EchoTop_18_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
    fprintf(fo,'%s\n','</br>');
    end
    
    if ij-3==0
    oij=24+ij;
    ofdate=fdatem;
    end
    
    
    
    fprintf(fo,'%s\n',' </br> ');
    fprintf(fo,'%s\n','</br> ');
    fprintf(fo,'%s\n','</br> ');
    fprintf(fo,'%s\n',['<div id="title"> ' num2str(ofdate(ii),'%08d')  '_' num2str(oij-4,'%02d') 'UTC</div>']);
    ldtime2=[num2str(ofdate(ii),'%08d')  '-' num2str(oij-4,'%02d')];
    for k=1:8
    fprintf(fo,'%s\n',[' &nbsp <a href="#">Z ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:' num2str(rwidth(rr),'%03d') 'px; HEIGHT:500px" src="../png/sb' num2str(rr)  '/' ldtime2 'MergedReflectivityQCComposite_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
    fprintf(fo,'%s\n',['&nbsp &nbsp <a href="#">ET ' num2str(k) 'h<span id="hovImg"><img style="background-color:black;   WIDTH:' num2str(rwidth(rr),'%03d') 'px; HEIGHT:500px" src="../png/sb' num2str(rr)  '/' ldtime2 'EchoTop_18_' num2str(k*60,'%04d') 'min.png" alt="" /></span></a>']);
    fprintf(fo,'%s\n','</br>');
    end
    fprintf(fo,'%s\n','</p>');
    fprintf(fo,'%s\n','<!--end container--></div>');
    fprintf(fo,'%s\n','</body>');
    fprintf(fo,'%s\n','</html>');
    fclose(fo);
        end
    end
    end
