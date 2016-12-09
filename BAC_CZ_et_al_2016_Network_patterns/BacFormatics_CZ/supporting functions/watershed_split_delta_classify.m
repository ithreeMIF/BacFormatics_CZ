%% ________________BacFormatics Code starts here:________________  
function matrix_out=watershed_split_delta_classify(matrix_in)  
 
%  figure(1)
%  imagesc(matrix_in)
%  save all
% %  

matrix_in=watershed_split(matrix_in);

if max(max(bwlabel(matrix_in,4)))==2
    
    L=bwlabel(matrix_in,4);
    D1=L; D2=L;
    D1(D1~=1)=0;
    D2(D2~=2)=0;
    
   D1=watershed_split(D1)    ;
   D2=watershed_split(D2)  ;
   matrix_out=double(D1)+double(D2);
   matrix_out(matrix_out>0)=1;
else
   matrix_out= matrix_in;
   
end

 

%  
%  figure(2)
%  imagesc(matrix_out)
%   pause
% %  














function matrix_out=split_segment(matrix_in)

% figure(1)
% imagesc(matrix_in)
% save matrix_in matrix_in
% pause
matrix_out=matrix_in;
se = strel('disk',1);                  
erodedBW = imerode(matrix_in,se);                  
jj=1;                  
while max(max(bwlabel(erodedBW)))==1 && jj<6                  
erodedBW = imerode(erodedBW,se);   
jj=jj+1;                  
end                  
if   (max(max(erodedBW )) == 0  )                  
return                  
end                  
% erodedBW=bwareaopen( erodedBW,10);                  
mask_em = bwlabel_max(erodedBW,2);  % select 2 largest segments                  
hy = fspecial('sobel');                  
hx = hy';                  
Iy = imfilter(double(matrix_in), hy, 'replicate');                  
Ix = imfilter(double(matrix_in), hx, 'replicate');                  
gradmag = sqrt(Ix.^2 + Iy.^2);                  
gradmag2 = imimposemin(gradmag,   mask_em);                  
L = watershed(gradmag2);     
%  figure(1)
%  imagesc(L)
%  pause
 
if length( unique(L))~=1 
 
  matrix_in(L==0)=0;  
% matrix_in =bwareaopen(matrix_in,20);                  
matrix_in=bwlabel_max(matrix_in,2);   


    
matrix_bw3=bwlabel(matrix_in );
 

    L1=length(find(ismember(matrix_bw3,1)));L2=length(find(ismember(matrix_bw3,2)));
   
  if (abs(L1-L2))/(L1+L2)<0.2  
matrix_out=matrix_in; 
  end
end
 
% 
% 
% 

 
function matrix_out=watershed_split(matrix_bw)                  
                   
% code was adopted from MATLAB demo for watershed segmentation:                  
 
 
L=bwlabel(matrix_bw,4); 
stats=regionprops(L,  'Eccentricity', 'EquivDiameter','MajorAxisLength','MinorAxisLength','Area','Orientation'  );                  
 

 

  

 
 
matrix_bw2=   flipdim( imrotate( matrix_bw,-stats(1).Orientation),1); 
peak_1=sum(matrix_bw2);   peak_2=sum(matrix_bw');                        
 
  
peak_1=  smooth(peak_1,40)     ;     
peak_2=  smooth(peak_2,40)     ;  
 
 
 
peak_1(isnan( peak_1))=0;   peak_2(isnan( peak_2))=0;       



IND1=findpeaks_BACWrapper(peak_1) ;    npeaks_1 =peak_1(IND1) ;
IND2=findpeaks_BACWrapper(peak_2) ;    npeaks_2 =peak_2(IND2) ;
IND11=findpeaks_BACWrapper(-peak_1) ;    npeaks_11 =max(peak_1(IND11)) ;
IND22=findpeaks_BACWrapper(-peak_2) ;    npeaks_22 =max(peak_2(IND22)); 

  

     
 
z1=abs((npeaks_11-mean(npeaks_1))./(npeaks_11+mean(npeaks_1))) ;
z2=abs((npeaks_22-mean(npeaks_2))./(npeaks_22+mean(npeaks_2))) ;
 
 



% %    MM(1,1)= stats(1).Eccentricity;  
% %    MM(1,2)=stats(1).EquivDiameter; 
% %    MM(1,3)=stats(1).MajorAxisLength;  
%    MM(1,4)= stats(1).MinorAxisLength;  
%    MM(1,5)= stats(1).MinorAxisLength/stats(1).MajorAxisLength; 
%    MM(1,6)= stats(1).Area;
% % MM(1,7)=length(npeaks_1) ;
% % MM(1,8)=length(npeaks_2) ;
% MM(1,9)=z1;
% MM(1,10)=z2; 



   MM(1,1)= stats(1).MinorAxisLength;  
   MM(1,2)= stats(1).MinorAxisLength/stats(1).MajorAxisLength; 
   MM(1,3)= stats(1).Area; 
MM(1,4)=z1;
MM(1,5)=z2; 


%  save all
% 
% figure(101)
% imagesc(matrix_bw)
% 
% matrix_out= matrix_bw;
% pause
load species
load M
 
 [Class,Error]=classify(MM, M, species) ;
   if  strcmp(Class,'double')==1 
       matrix_out=split_segment(matrix_bw);
       
   else
       matrix_out= matrix_bw;
   end



