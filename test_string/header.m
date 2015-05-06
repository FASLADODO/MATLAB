clear all;
close all;

AZM=720;
Gate2=100*4;

   r=(0:400-1)*0.25;  
   rotaz=0:0.5:359.5;
   for j=1:Gate2
   for k=1:AZM
   x(j,k)=r(j)*sin(rotaz(k)*pi/180);
   y(j,k)=r(j)*cos(rotaz(k)*pi/180);
   end
   end
   
   [xi2,yi2] = meshgrid(-100:0.5:100,-100:0.5:100);

% clc

oriPATH=['../necdf'];
matPATH=['../mat'];

ttable=char( 'KOUN100611', ...
             'KOUN100707', ...
             'KOUN100712', ...             
             'KAMX120927', ...
             'KSJT130606', ...
             'KTLX130601', ...
             'KMQT120609', ... 
             'KTLX130309', ...
             'KDDC120330');
% startt=[12 2];
% endt=[15 5];
startt=[1 12 2 28 12 9 1 11 1];
endt=[11 18 10 39 21 15 10 20 10];

singleGF=[1 2 3 5 6 7]; 
multiGF=[4]; 

% % % % % this part is for choosing specific date for making training
% dataset

trncasest=1;
trncasend=1;
trnstartt=[13 2];
trnendt=[13 5];

         
% % for image-processing FTC % %
% % rotdegree determine degree increase i.e., 20 deg here
% % angint is angle interval where how many angle should be shifted
% % i.e., 0.5 means super resolution so 40 radius should be rotated

rotdegree=180/9;
angint=0.5;
rotAZ=round(rotdegree/0.5);
rotnum=round(180/rotdegree);
thrREF=5;
rotbackrad=deg2rad(rotdegree);
cellcsrthresh=0.5;
idcellscrthresh=0.5;
% ref cbox threshold ref sbox threshold
thrdREF=0.3; 
% thrdREF2=5; 
% cbdrefthrsh=0.5;
% sbdrefthrsh=0.2;

% header_case
% 

% 

cellthresh=5;
cbcellthrsh=0.8;



   







