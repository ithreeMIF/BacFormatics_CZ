%% ________________BacFormatics Code starts here:________________  
function [matrix]=Filter_file(matrix,strel_value,strel_type, fspecial_value,fspecial_type,ii,X,pathname_Raw,Raw_filename,track_what)                
% Matlab user can easily  add more filter options upon demand. Instructions are as the following:                  
% Open Filter_file.m located in supporting functions library with Matlab editor.                  
%  Add indexed case. For instance, if there are 20 cases, add case 21.                  
% For this case add the next format:                  
% case 21                  
%  if nargin==0                  
%                  matrix(11)={  ‘user given name for the operation'}                  
%         else                  
%             matrix(:,:,1)=operation added by the user                  
%          end                  
% %Example:                  
% %case 11                  
%        %    if   nargin==0                  
%        %       matrix(11)={  'Canny edge detection'}                  
%        %   else                  
%        %        matrix(:,:,1)=Canny(matrix(:,:,1));                  
%        %   end                  
% Whereas nargin==0 is used to give the function name,                  
% matrix(:,:,1) is the returned output  (filtered image),                  
% 11 is the case index                  
% Canny is the function used on input matrix                  
% matrix can be in 3-D format                  
% 4. Save and exit the Filter_file.m .                  
% 5. Open BacFormatics_F.m with Matlab editor.                  
% 6. Add to the indexed case under  F_popup_function slider setting. This settings are depended on the  maximum  input value. i.e.:                  
%             eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
%             eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
% 7. Save and exit BacFormatics_F.m .    

% imagesc(matrix(300:550,800:1050,1))


if nargin==0                  
a=1;                  
b=40; %40 estamted as the limit for the last case                  
matrix= {                  
'Select:'                  
}                  
else                  
a=X;                  
b=X;                  
end   


 

for iii=a:b                  
switch iii                  
case 2                  
if nargin==0                  
matrix(2)={'2-imclose- morphological closing operation (dilation followed by a erosion)'}                  
else                  
SE = strel(strel_type,strel_value) ;                  
matrix(:,:,1) = imclose(matrix(:,:,1),SE) ;                  
end                  
case 3                  
if nargin==0                  
matrix(3)={'3-imopen- morphological openning operation (erosion followed by a dilation)'}                  
else                  
SE = strel(strel_type,strel_value) ;                  
matrix(:,:,1) = imopen(matrix(:,:,1),SE) ;                  
end                  
case 4                  
if nargin==0                  
matrix(4)={ '4-Top Hat net filter- linear feature detection'}                  
else                  
switch strel_value
    case 0
SE = [1 1 1 1];  
matrix1=imtophat(matrix(:,:,1),SE);   
matrix2=imtophat(matrix(:,:,1),SE');   
SE = [1 0 0; 0 1 0; 0 0 1];  
matrix11=imtophat(matrix(:,:,1),SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix(:,:,1),SE); 

    case 1
        
     SE = [1];  
matrix1=imtophat(matrix(:,:,1),SE);   
matrix2=imtophat(matrix(:,:,1),SE');   
SE = [1];  
matrix11=imtophat(matrix(:,:,1),SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix(:,:,1),SE);    
        
    case 2
        SE = [1 1];  
matrix1=imtophat(matrix(:,:,1),SE);   
matrix2=imtophat(matrix(:,:,1),SE');   
SE = [1 0; 0 1];  
matrix11=imtophat(matrix(:,:,1),SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix(:,:,1),SE); 
        
    case 3
        SE = [1 1 1];  
matrix1=imtophat(matrix(:,:,1),SE);   
matrix2=imtophat(matrix(:,:,1),SE');   
SE = [1 0 0; 0 1 0; 0 0 1];  
matrix11=imtophat(matrix(:,:,1),SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix(:,:,1),SE); 
        
    case 4
        
        SE = [1 1 1 1];  
matrix1=imtophat(matrix(:,:,1),SE);   
matrix2=imtophat(matrix(:,:,1),SE');   
SE = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];  
matrix11=imtophat(matrix(:,:,1),SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix(:,:,1),SE); 
        
    case 5
        SE = [1 1 1 1 1];  
matrix1=imtophat(matrix(:,:,1),SE);   
matrix2=imtophat(matrix(:,:,1),SE');   
SE = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0  0 1]; 
matrix11=imtophat(matrix(:,:,1),SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix(:,:,1),SE); 
end
%    SE = [1 1 1];  
% matrix1=imtophat(matrix(:,:,1),SE);   
% matrix2=imtophat(matrix(:,:,1),SE');   
% SE = [1 0 0; 0 1 0; 0 0 1];  
% matrix11=imtophat(matrix(:,:,1),SE);  
% SE=flipdim(SE,1);
% matrix22=imtophat(matrix(:,:,1),SE); 
%         
   
 
matrix1=double(matrix1);matrix1=matrix1./max(max(matrix1)); 
matrix2=double(matrix2);matrix2=matrix2./max(max(matrix2)); 
matrix11=double(matrix11);matrix11=matrix11./max(max(matrix11)); 
matrix22=double(matrix22);matrix22=matrix22./max(max(matrix22));  

temp=matrix1+ matrix2 + matrix11 +matrix22 ;

 matrix(:,:,1)=uint8(temp.*255);



end   

case 5                  
if nargin==0                  
matrix(5)={ '5-imclearborder- to clear border)'}                  
else                  
matrix(:,:,1) = imclearborder(matrix(:,:,1)) ;                  
end 

case 6                  
if nargin==0                  
matrix(6)={ '6-noisecomp- noise diffusion correction algorithm'}                  
else                  
a=floor( strel_value/10);                  
b=round(5*( strel_value/10-floor(strel_value/10)));                  
matrix(:,:,1) =  noisecomp_BACWrapper(matrix(:,:,1) ,a,b);                  
end    

case 7                  
if nargin==0                  
matrix(7)={'7-rangefilt'}                  
else                  
% matrix(:,:,1)= rangefilt(matrix(:,:,1)) ;      
a=im2bw(matrix(:,:,1),0.99);
BW=bwdist(a);  



L=zeros(size(a));  L(BW==2)=1;;L(BW==1)=1; A=a;A=A-L;A(A~=1)=0 ;



L = bwlabel(A,4);                  
stats = regionprops(L,'Area');                  
idx = find([stats.Area] > 50);                  
a = ismember(L,idx);   
matrix(:,:,1)=uint8(a*255);

end   



case 8                  
if nargin==0                  
matrix(8)={'8-stdfilt'}                  
else                  
matrix(:,:,1) = stdfilt(matrix(:,:,1));                  
end   


case 9                  
if nargin==0                  
matrix(9)={'9-wiener2 deconvolution-    lowpass filter'}                  
else      
    tic
matrix(:,:,1) = wiener2(matrix(:,:,1),[strel_value,strel_value]) ;                  
toc

end  


case 10                  
if nargin==0                  
matrix(10)={'10-imfilter'}                  
else                  
if fspecial_value~=0                  
H = fspecial(fspecial_type,fspecial_value);                  
matrix(:,:,1) = imfilter(matrix(:,:,1),H,'replicate');                  
end                  
end  


case 11                  
if nargin==0                  
matrix(11)={'11-Canny edge detection'}                  
else                  
temp=edge(matrix(:,:,1),'log' ); 
% temp=(temp);
matrix(:,:,1)=temp;

 
% BW = edge(I,'log');figure ;imagesc(BW);hold on;plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)
%  
%  
% BW = edge(I,'canny');figure ;imagesc(BW);hold on;plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)


end   


case 12                  
if nargin==0                  
matrix(12)={'12-convolution filter'}                  
else                  
if fspecial_value~=0                  
try                  
H = fspecial(fspecial_type,strel_value,fspecial_value);                  
catch                  
if strel_value==0                  
strel_value=1;                  
end                  
H = fspecial(fspecial_type,strel_value);                  
end                  
matrix(:,:,1) = conv2(matrix(:,:,1),H,'same'); %convolution                  
end                  
end  


case 13                  
if nargin==0                  
matrix(13)={'13-Smoothing using median filter-  reduce noise and preserve edges' }                  
else                  
%     to add smooting:                  
matrix(:,:,1) =medfilt2(matrix(:,:,1));                  
end 


case 14                  
if nargin==0                  
matrix(14)={'14-Bottom-hat filtering- enhance contrast'   }                  
else                  
%     to add smooting:                  
SE = strel(strel_type,3) ;                  
matrix(:,:,1)  = imsubtract(imadd(matrix(:,:,1),imtophat(matrix(:,:,1),SE)), imbothat(matrix(:,:,1),SE));                  
end 


case 15 
if nargin==0                  
matrix(15)={'15-matrix-mean(mean(matrix))'     }                  
else                  
%     to add smooting:                  
  matrix(:,:,1)=matrix(:,:,1)-mean(mean(matrix(:,:,1)));    

 
% % matrix(:,:,1)=255*155-matrix(:,:,1) ;
%  a=matrix(:,:,1);
%  a(a<(min(min(a))*0.001))=0;
%  a(a~=0)=1;
 
 
%  matrix(:,:,1)=a;

end  


case 16                  
if nargin==0                  
matrix(16)={'16-Channel unmiximg'     }                  
else                  
temp=uint8(double(matrix(:,:,1))./(double(matrix(:,:,2))).*fspecial_value) ;                  
temp(temp<0)==0;                  
matrix(:,:,1)=temp;                  
end 


case 17                  
if nargin==0                  
matrix(17)={'17-Channel_1\Channel_2'     }                  
else                  
matrix=my_unmix(matrix, strel_value/100);                  
end 
%%%%%%%%%%%%%%%%%


case 18                  
if nargin==0                  
matrix(18)={'18-convert to 8 bits'     }                  
else 
temp=double(matrix(:,:,1)) ;
 
temp=255*(temp./(max(max(temp)))); 

temp=uint8(temp);
matrix(:,:,1)=temp;
 
end
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%


case 19                  
if nargin==0                  
matrix(19)={'19-invert image (to 8 bits)'     }                  
else 
temp=double(matrix(:,:,1)) ;
 
temp=255*(temp./(max(max(temp)))); 

temp=uint8(temp);
matrix(:,:,1)=255-temp;  
end
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
    case 20                 
if nargin==0                  
matrix(20)={'20-Local intensity maxima'     }                  
else 
    
temp=matrix(:,:,1) ;  
% SE = strel(strel_type,strel_value) ;                  
    
%apply a max filter



% This examples uses a maximum filter with a [5 5] neighborhood. This is equivalent to imdilate(image,strel('square',5)).
%  try one of these three options:
 temp2 = ordfilt2(temp,25,true(5));
%   temp2 = ordfilt2(temp,0.8,SE);

% temp3 = ordfilt2(temp,fspecial_type,true(5)); temp2(temp3==temp2)= 0;
% temp3 = ordfilt2(temp,fspecial_type,SE);   temp2(temp3==temp2)= 0;
 
 
temp2(temp2~=temp)=0;


% 
% [rows,cols]=size(temp);
% b=(cols-1)/2;
% temp2(:,[1:b end-b+1:end])=0;
% b=(rows-1)/2;
% temp2([1:b end-b+1:end],:)=0;
figure(1)
imagesc(temp2)

return
  temp2(temp2<50)=0;  
matrix(:,:,1)=temp2; 
 





figure
imagesc(temp )
  hold on
  temp2(temp2>0)=1;
  
  
  
  [b,a]=find(temp2);
%  
%             plot(a,b,'m.',     'MarkerSize',5)
         
           
      
  temp3=bwmorph(temp2,'bridge',10)   ;
  temp4=bwlabel(temp3);
stats=regionprops(temp4,'Centroid'); 
  X=[0 0];            
for jj=1:length(stats)                  
 X(jj,:)=stats(jj).Centroid ;
end    
    
% 
%  [b,a]=find(temp3);
%  
            plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)                      
 
%           figure
%           [temp3,~]=kmeans_BACWrapper(temp3,100 );
%            imagesc(temp3)
%             
%             
           
%             scatter( a,b  ,'MarkerFaceColor' ,'m' )    ;
%           
    I=temp;        
% Close            
 
      temp6=   edge(I,'canny') ;
      
   
             figure
             imagesc(temp6)
             hold on
               plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)           
end
%%%%%%%%%%%%%%%%%

 


 

case 21                  
if nargin==0                  
matrix(21)={'21-mask'     }                  
else 
 full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'));
 bw=imread_cross(full_filename); 
 temp=matrix(:,:,1)   ; 
 temp(bw==1)=0;
 
% temp11=uint8(255*(temp./(max(max(temp))))); 
%  
%  temp11=     im2bw(temp11 , 0.45);
%  
%  temp0=temp; 
% temp=255-temp;  
%  
% SE = strel('disk',3) ;                  
% temp2=imtophat(temp ,SE);     
% temp2=temp2-mean(mean(temp2));  
% level = graythresh(temp2);      temp2=im2bw(temp2,level);     
% temp2=bwareaopen(temp2,100,4);    
% temp2= imfill_bwlabel(temp2);  
% 
%   temp2= temp2.*temp11;
% 
% 
% 
%  temp2=uint8(temp2);
% temp3=double(matrix(:,:,1)) ; 
% temp3=255*(temp3./(max(max(temp3)))); 
%  
% temp3=uint8(temp3);
%  temp3=255-temp3;
%  
%  
% z= 255-(uint8(temp0)+(temp3.*temp2))   ; 
% z=im2bw(z,0.65);
matrix(:,:,1)= temp ;
end

 case 22                 
if nargin==0                  
matrix(22)={'22-remove proportional intensity'     }                  
else 
     
matrix(:,:,1)=matrix(:,:,1)-130;%fspecial_value ;  
end



case 23                 
if nargin==0                  
matrix(23)={'23-add external contour by mask'     }                  
else 
   temp=matrix(:,:,3)  ; 
   
temp=255-temp;  

SE = strel('disk',40) ;                  
temp2=imtophat(temp ,SE);     
temp2=temp2-mean(mean(temp2)); 

matrix=temp2;
return

level = graythresh(temp2);      temp2=im2bw(temp2,level);     
temp2=bwareaopen(temp2,100,4);   


  temp2= imfill_bwlabel(temp2); 
  temp2=uint8(temp2);   
 
% temp2=~temp2;  temp2=  bwdist(temp2); 
%    temp3(temp2==1)=255;  temp3(temp2==2)=255;  temp3(temp2==3)=255;  temp3(temp2==4)=255;  temp3(temp2==5)=255; 
            
  

temp3=matrix(:,:,1) ; 
% temp3=255*(temp3./(max(max(temp3))));  
% temp3=uint8(temp3);
%  temp3=255-temp3;
 
 
 
[B,L] = bwboundaries(temp2 ,4)   ;  
 for k = 1:length(B)
      b =B{k};
      bb=sub2ind(size(temp),b(:,1),b(:,2));
  temp3(bb)=255;
 end 
matrix(:,:,1)=   temp3     ;  
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 case 24                 
if nargin==0                  
matrix(24)={'24-Local intensity maxima-2'     }                  
else 
    
    
%   temp3=matrix(:,:,3)  ; 
% temp3=255*(temp3./(max(max(temp3)))); 
%  
% temp3=uint8(temp3);
%  temp3=255-temp3;
%  
  
%  
%  

temp=matrix(:,:,1);
T=strel_value;




SE = strel('disk',37) ;                  
  temp =imtophat(temp  ,SE); 
% This examples uses a maximum filter with a [5 5] neighborhood. This is equivalent to imdilate(image,strel('square',5)).
%  try one of these three options:
 temp2 = ordfilt2(temp,25,true(5));
%   temp2 = ordfilt2(temp,0.8,SE);

% temp3 = ordfilt2(temp,fspecial_type,true(5)); temp2(temp3==temp2)= 0;
% temp3 = ordfilt2(temp,fspecial_type,SE);   temp2(temp3==temp2)= 0;
 
 
temp2(temp2~=temp)=0;


% 
% [rows,cols]=size(temp);
% b=(cols-1)/2;
% temp2(:,[1:b end-b+1:end])=0;
% b=(rows-1)/2;
% temp2([1:b end-b+1:end],:)=0;
% 
  temp2(temp2<T)=0;  temp2(temp2>0)=1; 
%  matrix(:,:,1)=temp2;return 
%  



% 
% 
%   figure
%  imagesc(temp )
%  
%  return
%   hold on
   
  
  [b,a]=find(temp2);
       
           
      
  temp3=bwmorph(temp2,'bridge',10)   ;
  temp4=bwlabel(temp3);
stats=regionprops(temp4,'Centroid'); 
  X=[0 0];            
for jj=1:length(stats)                  
 X(jj,:)=stats(jj).Centroid ;
end    
   
temp=zeros(size(temp3)); 
bb=sub2ind(size(temp),round(X(:,2)),round(X(:,1)));
  temp(bb)=1; 
  
  
  
  
  
 temp2= temp.*matrix(:,:,1);
 temp2(temp2<T)=0;
 
  
  
  
%    figure
%     imagesc(temp )
%     return
%   hold on
%    plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)
%    
%    
%    

 matrix(:,:,1)=temp2*255;;
% plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)

% 
% 
%  temp=matrix(:,:,1);
% % % I=temp; 
% % % temp6=   edge(I,'log') ;  
% % figure 
% % imagesc(temp);hold on;plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)
% %  
% I=temp;
%  
%  level=graythresh(I);BW = im2bw(I,level);figure ;imagesc(BW);hold on;plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)
%  
 
 
 
% BW = edge(I,'log');figure ;imagesc(BW);hold on;plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)
%  
%  
% BW = edge(I,'canny');figure ;imagesc(BW);hold on;plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)

% 
%  matrix4=zeros(size(temp));
% % hold on
% for ii=1:length(X(:,1))
%  round(X(ii,2)) 
%  round(X(ii,1))
%    
%  matrix2=zeros(size(temp)); 
%     matrix2(round(X(ii,2)),round(X(ii,1)))=1;
%      matrix2=bwdist(matrix2,'chessboard');
% %      figure(5)
% %      imagesc(matrix2)
%      for jj=1:max(matrix2(:))
%          Ind=find(ismember(matrix2,jj));
%          vec=BW(Ind);
%          if sum(vec)/length(vec)>0.2
%              break
%          end
%      end
%      jj;
%      matrix4(matrix2<=jj)=255; 
%       
% %  figure(1)
% %  
% %  imagesc(matrix4)
%  
%  
% end
% 
% figure(1)
%  save all
%  imagesc(BW-matrix4)
% end
%  
 

 
 
%%%%%%%%%%%%%%%%%












end

case 25                  
%           if   nargin==0                  
%              matrix(18)={  'mask XY section'}                  
%           else                  
%                temp=matrix(:,:,1);                  
%               temp(matrix(:,:,2)==0) =0;                  
%                matrix(:,:,1)=temp;                  
%          end                  
%         case 19                  
if   nargin==0                  
matrix(25)={'25-DIC and fluo to graysacle'}                  
else                  
 
    
    
    
temp=matrix(:,:,1);                  
a1=temp(1,:)                  
a2=temp(end,:)                  
a3=temp(:,1)                  
a4=temp(:,end)                  
aa=a1; aa(end+1:end+length(a2))=a2;a3=a3'; aa(end+1:end+length(a3))=a3;;a4=a4'; aa(end+1:end+length(a4))=a4;                  
aa=double(aa)                  
v1=mean(aa)- std(aa)                   
v2=mean(aa)+ std(aa)                   
temp(and((temp>v1),(temp<v2)))=0;                  
% temp=uint8(temp)                   
hy = fspecial('sobel');                  
hx = hy';                   
Iy = imfilter(double(temp ), hy, 'replicate');                  
Ix = imfilter(double(temp), hx, 'replicate');                  
matrix(:,:,1) = sqrt(Ix.^2 + Iy.^2);                  
matrix(:,:,1) =temp;                  
end



%%%%%%%%%%%%%%%%%

 


 

case 26                  
if nargin==0                  
matrix(26)={'26-mask with zero pixels on the sides'     }                  
else 
%     save all
temp1=double(matrix(:,:,1)) ; 
temp1(temp1>0)=1;


 temp2=double(matrix(:,:,3)); 
 
 


  SE = strel(strel_type,5) ;   
 temp3=uint8(255-255*(temp2./(max(max(temp2))))); 

 
 temp3=   imsubtract(imadd(temp3,imtophat(temp3,SE)), imbothat(temp3,SE));                  
temp2=edge(temp2,'log' );  


  SE =   strel('disk',1 ) ;    
  
%   
   temp1=temp1+temp2;
   temp1(temp1>0)=1;
   temp1=imclose(temp1,SE);
    temp3(temp1==1)=0; 
 
temp3=double(temp3);
temp3=255*( temp3./(max(max( temp3))));  
temp3=uint8(temp3);


 matrix(:,:,1)=  temp3   ; 
%  

end

case 27             
if   nargin==0                  
matrix(27)={  'function 27'}                  
else                  
%  matrix(:,:,1)= 
end


case 28             
if   nargin==0                  
matrix(28)={  '28-local minima 2'}                  
else     
    
    
      
%   temp3=matrix(:,:,3)  ; 
% temp3=255*(temp3./(max(max(temp3)))); 
%  
% temp3=uint8(temp3);
%  temp3=255-temp3;
%  
  
%  
%  

temp=matrix(:,:,1);
SE = strel('disk',37) ;                  
  temp =imtophat(temp  ,SE); 
% This examples uses a maximum filter with a [5 5] neighborhood. This is equivalent to imdilate(image,strel('square',5)).
%  try one of these three options:

 temp=255-temp;
 temp2 = ordfilt2(temp,25,true(5));
%   temp2 = ordfilt2(temp,0.8,SE);

% temp3 = ordfilt2(temp,fspecial_type,true(5)); temp2(temp3==temp2)= 0;
% temp3 = ordfilt2(temp,fspecial_type,SE);   temp2(temp3==temp2)= 0;
 
 
temp2(temp2~=temp)=0;


% 
% [rows,cols]=size(temp);
% b=(cols-1)/2;
% temp2(:,[1:b end-b+1:end])=0;
% b=(rows-1)/2;
% temp2([1:b end-b+1:end],:)=0;
% 
  temp2(temp2<50)=0;  
% matrix(:,:,1)=temp2;s 
 



% 
% 
%   figure
%  imagesc(temp )
%  
%  return
%   hold on
  temp2(temp2>0)=1; 
  
  [b,a]=find(temp2);
       
           
      
  temp3=bwmorph(temp2,'bridge',10)   ;
  temp4=bwlabel(temp3);
stats=regionprops(temp4,'Centroid'); 
  X=[0 0];            
for jj=1:length(stats)                  
 X(jj,:)=stats(jj).Centroid ;
end    
   
temp=zeros(size(temp3)); 
bb=sub2ind(size(temp),round(X(:,2)),round(X(:,1)));
  temp(bb)=1; 
  
  
  
  
  
 temp2= temp.*matrix(:,:,1);
 temp2(temp2<140)=0;
 
  
  
  
%    figure
%     imagesc(temp )
%     return
%   hold on
%    plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)
%    
%    
%    

 matrix(:,:,1)=temp2*255;;
% plot(X(:,1),X(:,2),'r.',     'MarkerSize',7)

% 


%  matrix(:,:,1)= 
end

case 29             
if   nargin==0                  
matrix(29)={  '29-Tophat filter'}                  
else                     
SE = strel(strel_type,strel_value) ;                  
matrix(:,:,1)=imtophat(matrix(:,:,1),SE);    
end

case 30             
if   nargin==0                  
matrix(30)={  '30-imrode'}                  
else                  
SE = strel(strel_type,strel_value)                    
matrix(:,:,1) = imerode(matrix(:,:,1),SE) ; 
end

case 31             
if   nargin==0                  
matrix(31)={  '31-imdilate'}                  
else                  
SE = strel(strel_type,strel_value) ;                  
matrix(:,:,1) = imdilate(matrix(:,:,1),SE) ;  
end

case 32             
if   nargin==0                  
matrix(32)={  '32-bio_preproc function'}                  
else                  
  matrix(:,:,1)= bio_preproc(matrix(:,:,1));
end

case 33             
if   nargin==0                  
matrix(33)={  '33-P.arug. pre-seg'}                  
else    
%    temp=matrix(:,:,1); 
%    temp(temp<10)=10; %remove effect of bright black spots in cells, cuttoff was set by R.S
%   matrix(:,:,1)=temp;
%  
%  
 
 
 
SE1 = strel(strel_type,1) ;
m1 = imerode(matrix(:,:,1),SE1) ;

SE2 = strel(strel_type,2) ;
m2 = imerode(matrix(:,:,1),SE2) ;

SE3 = strel(strel_type,3) ;
m3 = imerode(matrix(:,:,1),SE3) ;

SE4 = strel(strel_type,4) ;
m4 = imerode(matrix(:,:,1),SE4) ;

%
m1 =rot_imtophat(m1) ;
m2 =rot_imtophat(m2) ;
m3 =rot_imtophat(m3) ;
m4 =rot_imtophat(m4) ;


m1 =  noisecomp_BACWrapper(m1 ,19,4);
m2 =  noisecomp_BACWrapper(m2 ,19,4);
m3 =  noisecomp_BACWrapper(m3 ,19,4);
m4 =  noisecomp_BACWrapper(m4 ,19,4);



m1234=(m1+m2+m3+m4)/4 ;
m1234=noisecomp_BACWrapper(m1234 ,19,4);


SE = strel(strel_type,1) ;
m1234=  imdilate(m1234,SE) ;
m1234=  imerode(m1234,SE) ;


m1234=double(m1234);
m1234=uint8(255*(m1234./max(m1234(:))));

T=0.025; % T is a critical coefficient. If T is too low then to many small fragments are created. If T is too high then segemnts cells are connected to each  other
m1234=im2bw(m1234,T);
m1234=bwareaopen(m1234,40);



m1234=noisecomp_BACWrapper(m1234 ,19,4);

SE = strel(strel_type,1) ;
m1234=  imdilate(m1234,SE) ;
m1234=  imerode(m1234,SE) ;

matrix(:,:,1)=m1234;




 
end

case 34             
if   nargin==0                  
matrix(34)={  '34-P.arug. Close net'}                  
else
%     Dist_range: distance between termination points to be bridged
%     Theta_range: angle between termination points to be bridged
%     It is better to try to gap close termination points (small Dist_range) that are not in front of each other (large Theta_range)
% then to bride termination points that are far from each other (lare Dist_range)but are in front of each other (small Theta_range) 
    matrix_net_small_gaps_filled=create_net_function(matrix(:,:,1),10,60);
    matrix_net_small_gaps_filled=create_net_function(matrix(:,:,1),25,35,matrix_net_small_gaps_filled);
    matrix_net_large_gaps_filled=create_net_function(matrix(:,:,1),40,5,matrix_net_small_gaps_filled); 
    matrix(:,:,1)= matrix_net_large_gaps_filled; 
end

case 35             
if   nargin==0                  
matrix(35)={  '35-Pseudomonas aeruginosa pre-segmentation more splitting for trapped explosive cells'}                  
else                  

 
SE1 = strel(strel_type,1) ;
m1 = imerode(matrix(:,:,1),SE1) ;

SE2 = strel(strel_type,2) ;
m2 = imerode(matrix(:,:,1),SE2) ;

SE3 = strel(strel_type,3) ;
m3 = imerode(matrix(:,:,1),SE3) ;

SE4 = strel(strel_type,4) ;
m4 = imerode(matrix(:,:,1),SE4) ;

%
m1 =rot_imtophat(m1) ;
m2 =rot_imtophat(m2) ;
m3 =rot_imtophat(m3) ;
m4 =rot_imtophat(m4) ;


m1 =  noisecomp_BACWrapper(m1 ,7,2);
m2 =  noisecomp_BACWrapper(m2 ,7,2);
m3 =  noisecomp_BACWrapper(m3 ,7,2);
m4 =  noisecomp_BACWrapper(m4 ,7,2);



 matrix(:,:,1)=(m1+m2+m3+m4)/4 ;
% 
% m1234(m1234>0)=1;
% m1234=logical(m1234);
% m1234=bwareaopen(m1234,20);
% m1234=imclose(m1234,SE1) ;   
%  matrix(:,:,1)=uint8(255*m1234); 
% 
% SE = strel(strel_type,1) ;
% m1234=  imdilate(m1234,SE) ;
% m1234=  imerode(m1234,SE) ;
% 
% 
% m1234=double(m1234);
% m1234=uint8(255*(m1234./max(m1234(:))));
% 
% T=0.05; % T is a critical coefficient. If T is too low then to many small fragments are created. If T is too high then segemnts cells are connected to each  other
% m1234=im2bw(m1234,T);
% m1234=bwareaopen(m1234,40);
% 
% 
% 
% m1234=noisecomp_BACWrapper(m1234 ,19,4);
% 
% SE = strel(strel_type,1) ;
% m1234=  imdilate(m1234,SE) ;
% m1234=  imerode(m1234,SE) ;
% 
% matrix(:,:,1)=m1234;
% 





end

case 36             
if   nargin==0                  
matrix(36)={  '36-Pseudomonas aeruginosa Closing net more splitting for trapped explosive cells'}                  
else         
% Dist_range: distance between termination points to be bridged
% Theta_range: angle between termination points to be bridged
% It is better to try to gap close termination points (small Dist_range) that are not in front of each other (large Theta_range)
% then to bride termination points that are far from each other (lare Dist_range)but are in front of each other (small Theta_range)
% To get more  splitting need to change rhe settings:  
 

temp=double(matrix(:,:,3)) ;
temp=255*(temp./(max(max(temp)))); 
temp=uint8(temp);
matrix_raw=255-temp;   

    matrix_net_small_gaps_filled=create_net_function2(matrix(:,:,1), matrix_raw,10,90);
    matrix_net_large_gaps_filled=create_net_function2(matrix(:,:,1), matrix_raw,15,60,matrix_net_small_gaps_filled);
      matrix_net_large_gaps_filled=create_net_function2(matrix(:,:,1),matrix_raw,25,20,matrix_net_large_gaps_filled);
    matrix_net_large_gaps_filled=create_net_function2(matrix(:,:,1), matrix_raw,45,5,matrix_net_large_gaps_filled);  
     matrix(:,:,1)= matrix_net_large_gaps_filled; 
end

case 37             
if   nargin==0                  
matrix(37)={  'Cams P.A. filter'}                  
else                  
  matrix(:,:,1) = Cams_PA_filt( matrix(:,:,1));
  matrix(:,:,1) = uint8(matrix(:,:,1));
end

case 38             
if   nargin==0                  
matrix(38)={  'function 38'}                  
else                  
%  matrix(:,:,1)= 
end

case 39             
if   nargin==0                  
matrix(39)={  'function 39'}                  
else                  
%  matrix(:,:,1)= 
end

case 40             
if   nargin==0                  
matrix(40)={  'function 40'}                  
else                  
%  matrix(:,:,1)= 
end

case 41             
if   nargin==0                  
matrix(41)={  'function 41'}                  
else                  
%  matrix(:,:,1)= 
end

case 42             
if   nargin==0                  
matrix(42)={  'function 42'}                  
else                  
%  matrix(:,:,1)= 
end

case 43             
if   nargin==0                  
matrix(43)={  'function 43'}                  
else                  
%  matrix(:,:,1)= 
end
 





end                  
end                  
