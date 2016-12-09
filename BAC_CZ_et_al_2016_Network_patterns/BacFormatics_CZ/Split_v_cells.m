    function ROI_out= Split_v_cells(ROI_bw, ROI_Filtered,ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y)
%   save all
   ROI_in=ROI_bw;
    ROI_out=ROI_bw;
    try
    my=round((pole1_y+pole2_y)/2); 
    mx=round((pole1_x+pole2_x)/2);        
         
%   figure
%  imagesc(ROI_bw)
%   hold on
%    scatter(my ,mx )
%               
 

% % step 1: get estimation of two sides of the cells:

[y ,x]=bresenham_BACWrapper(pole1_y,pole1_x,pole2_y,pole2_x); 
if size(x,1)>size(x,2)
    x=x';
end

if size(y,1)>size(y,2)
    y=y';
end 

xy=sub2ind(size(ROI_bw),x,y); 
ROI_bw(xy)=1; 
ROI_bw2=imfill(ROI_bw,'holes');
ROI_bw2(ROI_bw==1)=0;  
ROI_bw3=zeros(size(ROI_bw));
ROI_bw3(xy)=1; 
ROI_bw3=bwdist(ROI_bw3); 
 ROI_bw3(ROI_bw2==0)=0; 
 
 
 
  


[maxX,maxY]=find(ROI_bw3==max(ROI_bw3(:))); 
 maxY=maxY(1);
  maxX=maxX(1); 
  
%    scatter(maxY,maxX)
 
ROI_perim2=ROI_perim;
ROI_bw2=bwmorph(ROI_bw2,'thicken',3);
ROI_perim2(ROI_bw2==1)=0;  
 [xPerim2,yPerim2]=find(ROI_perim2);
 
 m1=(my-maxY)/(mx-maxX);
 m2=(my-yPerim2)./(mx-xPerim2) ;
 [~,ind]=nanmin(abs(m2-m1));
 ind=ind(1);
 yPerim2_p=yPerim2(ind);
 xPerim2_p=xPerim2(ind) ;
 
%   scatter(yPerim2_p,xPerim2_p) 
    
    
 boundaries_range=5; 
 ind=find(sqrt((xPerim2-xPerim2_p).^2+(yPerim2-yPerim2_p).^2)<boundaries_range);
 
 xPerim22=xPerim2(ind); yPerim22=yPerim2(ind);
 
%  scatter(yPerim22,xPerim22)
  
[~,ind]=min(sqrt((xPerim22-maxX).^2+(yPerim22-maxY).^2));
  
 ind=ind(1);
 
 x2=xPerim22(ind); y2=yPerim22(ind);
 x1=maxX;y1=maxY;
  


%  ROI_bw=intensity_split_function([y2 y1],[x2 x1], ROI_out , ROI_Filtered) ;
%  figure
% imagesc(ROI_bw)
% hold on
%   scatter(y1,x1)
%   scatter(y2,x2)
%   
%  if isempty(ROI_bw)
 [y ,x]=bresenham_BACWrapper(y1,x1,y2,x2);
     if size(x,1)>size(x,2)
         x=x';
     end
     if size(y,1)>size(y,2)
         y=y';
     end
     
     xy=sub2ind(size(ROI_bw),x,y);
     ROI_out(xy)=0; 
%      pause
%       
%  else
%      ROI_out=ROI_bw;
%  end 
%   
    end  
% figure
% imagesc(ROI_out)
% hold on
%   scatter(y1,x1)
%   scatter(y2,x2)
 
% If the output is two cell segments, than need to keep minimum ratio of area

L=bwlabel(ROI_out,4);

if max(L(:))==0 %use only two largest segments
        ROI_out=ROI_in;
        return
end

if max(L(:))==2 %use only two largest segments 
    L1=L==1;L1=sum(L1(:)); L2=L==2; L2=sum(L2(:));
    if (abs(L1-L2))/(L1+L2)>0.5
        ROI_out=ROI_in;
        return
    end
end
 

if max(L(:))>2 %use only two largest segments
        ROI_out=ROI_in;
        return
end

      