   function ROI_out = Split_ROI_Otsu(ROI_bw, ROI_Filtered)
   
   
   
   
   
%    not to loose more than 90% of area,
   
   
   
   
   
% figure
% imagesc(ROI_bw)
%     save all
%     pause
% %  clear all
%   load all
% 

ROI_Filtered=double(ROI_Filtered).*double(ROI_bw);
ROI_Filtered=ROI_Filtered./(max(ROI_Filtered(:)));
ROI_Filtered= uint16( 65535*ROI_Filtered);
v=ROI_Filtered(:);
v(v==0)=[];
ROI_Filtered(ROI_Filtered==0)=min(v);
level = graythresh(ROI_Filtered);

  
ROI_out=im2bw(ROI_Filtered,level+0.02*level);
ROI_out=bwareaopen(ROI_out,80);
ROI_out=imfill(ROI_out,'holes');



ROI_bw(ROI_out==1)=0;
ROI_bw=logical(ROI_bw);
 
se = strel('disk',1 );        
ROI_bw = imerode(ROI_bw,se);
ROI_bw=bwareaopen(ROI_bw,80);
ROI_bw=imfill(ROI_bw,'holes');
 
ROI_out(ROI_bw==1)=1;
% ROI_out=double(ROI_out);
% 
% %   figure
% % % 
% %   imagesc(ROI_out)
% % 


