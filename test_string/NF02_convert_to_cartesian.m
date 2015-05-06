% % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % Yunsung Hwang 2015 
% % % % % % % step 2: convert polar to cartesian
% % % % % % % file names can be changed
% % % % % % % (401,401,6) sized polar files are in ../mat/polar/
% % % % % % % mat files will be written in ../mat/cart/
% % % % % % % ttable contains info about "RADAR,YY,MM,DD
% % % % % % % % % % % % % % % % % % % % % % % %

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         
% % % % % % this is an ex version 
% % % % % % after converting NCDC to netcdf (from V06 to netcdf)
% % % % % % the folder /POLAR/ should contain files
% % % % % % also "header.m" should be changed!!!!
% %  PAR(0~1) 1.REF 2.VEL 3.WID 4.PHI 5.RHO 6.DIF 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


header;
     
for cindex=1:numel(ttable(:,1));

    PUTDAT=ttable(cindex,:);
    startm=startt(cindex);
    endm=endt(cindex);
    PARITP=[];
    for m=startm:endm
        mpolarout=[matPATH '/POLAR/polar' PUTDAT num2str(m,'%02i') '.mat']; 
        load(mpolarout, 'PARROT'); 
        mcartout=[matPATH '/CART/cart' PUTDAT num2str(m,'%02i') '.mat']; 
    
        pPARITP=zeros(401,401,6);
        PARITP=zeros(401,401,6);
        varnum=[1 2 3 4 5 6];
        for i=1:numel(varnum)
            a=double(PARROT(:,:,(varnum(i))));
            pPARITP(:,:,(varnum(i))) = griddata(x,y,a,xi2,yi2);
        end
        INDROT(:,:,1)=(pPARITP(:,:,1)>-999);   
        INDROT(:,:,2)=(pPARITP(:,:,2)>-100 & pPARITP(:,:,2)<100);
        INDROT(:,:,6)=(pPARITP(:,:,6)>=-5 & pPARITP(:,:,6)<8);
        INDROT(:,:,3)=(pPARITP(:,:,3)<999 &  pPARITP(:,:,3)>0);
        INDROT(:,:,4)=(pPARITP(:,:,4)<360 & pPARITP(:,:,4) >0);
        INDROT(:,:,5)=(pPARITP(:,:,5)<=1 & pPARITP(:,:,5) >0);
        for i=1:6
            for gg=1:401
                for aa=1:401
                if( INDROT(gg,aa,i) ==0  )
                pPARITP(gg,aa,i)=nan;
                end
                end
            end
        end
        PARITP(:,:,1) = (pPARITP(:,:,1));
        PARITP(:,:,2) = (pPARITP(:,:,2));
        PARITP(:,:,3) = (pPARITP(:,:,3));
        PARITP(:,:,4) = (pPARITP(:,:,4));
        PARITP(:,:,5) = (pPARITP(:,:,5));
        PARITP(:,:,6) = (pPARITP(:,:,6));
        save(mcartout, 'PARITP'); 
        clear PARITP PARITP;
    end 
end 
