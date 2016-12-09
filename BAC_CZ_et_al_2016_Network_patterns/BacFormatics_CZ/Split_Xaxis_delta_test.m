%  % % %% ________________BacFormatics Code starts here:________________  
%     function matrix_out= Split_Xaxis_delta(ROI_bw, ROI_raw)     
% load matrix_bw
% load matrix_Filtered
%     
  load ROI_bw
load ROI_raw

Close
figure(1)
imagesc(ROI_bw)
% step 1: get estimation of two sides of the cells:
 


 B=bwboundaries(ROI_bw);
xy=B{:};
x=xy(:,2);
y=xy(:,1);
[y,x]=poly2cw(y,x);
 

l1=round(length(x)/2);
l2=length(x);
cord1=1;
cord2=l1;

xy_cord1=[];xy_cord2=[];

for ii=1:l1 
    xy_cord1(ii,:)=[y(cord1) x(cord1)];
    xy_cord2(ii,:)=[y(cord2) x(cord2)];
    
    cord1=cord1+1;
    cord2=cord2+1;
end

    Dist=sqrt((xy_cord2(:,1)-xy_cord1(:,1)).^2+(xy_cord2(:,2)-xy_cord1(:,2)).^2);
    Dist=smooth(Dist);
    
    [~,min_ind]=min(Dist);
    
    
    hold on
    scatter(x(min_ind),y(min_ind))
    scatter(x(min_ind+l1),y(min_ind+l1))
    
    
    
    
 
    xy_ind1=min_ind;
    xy_ind2=min_ind+l1;
    
    boundaries_range=20;
    vec1_x=x(xy_ind1-boundaries_range:xy_ind1+boundaries_range); vec1_y=y(xy_ind1-boundaries_range:xy_ind1+boundaries_range);
    vec2_x=x(xy_ind2-boundaries_range:xy_ind2+boundaries_range); vec2_y=y(xy_ind2-boundaries_range:xy_ind2+boundaries_range);
    
    
  
  
  
  
temp_dist=[];
 
Min=1000;
for ii=1:length(vec1_x)
  for jj=1:length(vec2_x)  
      
    
      x1=vec1_x(ii);
      y1=vec1_y(ii);
      x2=vec2_x(jj);
      y2=vec2_y(jj);
       
      
      temp_dist(ii,jj)=(vec1_x(ii)-vec2_x(jj))^2+(vec1_y(ii)-vec2_y(jj))^2;
      
       
%       if temp_dist<Min
%           Min=temp_dist;
%           x1=vec1_x(ii);
%           y1=vec1_y(ii);
%           x2=vec2_x(jj);
%           y2=vec2_y(jj);
%           
%           
%           
%       end
  end
end
   figure
   imagesc(temp_dist)
   temp_dist2=medfilt2(temp_dist ); 
   temp_dist2(temp_dist2==0)=inf;
   temp_dist2=temp_dist2==min(temp_dist2(:));
   temp_dist(temp_dist2~=1)=0;
   temp_dist(temp_dist==0)=inf;
   temp_dist =temp_dist ==min(temp_dist (:));
 
   
  [indx, indy]=find(temp_dist);
  
   
  ii=indx(1)
  jj=indy(1)
  
  x1=vec1_x(ii);
  y1=vec1_y(ii);
  x2=vec2_x(jj);
  y2=vec2_y(jj);
  

[x ,y]=bresenham_BACWrapper(x1,y1,x2,y2);

if size(x,1)>size(x,2)
    x=x';
end

if size(y,1)>size(y,2)
    y=y';
end

xy=sub2ind(size(ROI_bw),y,x);
% ROI_bw=double(ROI_bw);
ROI_bw(xy)=0;

 
   figure
 imagesc(ROI_bw)
   hold on
   scatter(x1,y1)
    scatter(x2,y2)
%         scatter(x ,y )
% %  ddddd
% 
% figure
%  
%  imagesc(matrix1)
% %  
% figure
% %  
%   imagesc(matrix11)
%  pause
% %  
% %   
% %   
% %   
% [matrix_bw2]=intensity_split_function([y1 y2],[x1 x2],matrix2 ,matrix1);    
%  
% 
% 
% 
                   

matrix_out=bwlabel_max(matrix11,2);   
matrix_out=double(matrix_out(2:end-3,2:end-3)) ;
  


% % 
%     figure
% % % 
%   imagesc(matrix_bw3)
% whos matrix_bw3
% 
% 
%   L1=length(find(ismember(matrix_bw3,1)));L2=length(find(ismember(matrix_bw3,2)));
%  
%   if (abs(L1-L2))/(L1+L2)>0.5
%       return
%   end
% 
% matrix_out=matrix_bw3>0;
% % matrix_out=   logical(double(matrix_bw2)+double(matrix_bw_therest));
% matrix_out=matrix_out(2:end-3,2:end-3);    
