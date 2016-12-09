%  % % %% ________________BacFormatics Code starts here:________________  
    function matrix_out= Split_Xaxis_delta(ROI_bw, ROI_raw) 
    
    
    save ROI_bw ROI_bw
    save ROI_raw ROI_raw
    
%   load matrix_bw
% load matrix_Filtered
% 
% 
%  ROI_bw=matrix_bw; matrix_bw=[]; 
%  ROI_raw=matrix_Filtered;matrix_Filtered=[];
%  
%  
%  
 
 
 
 
 
ROI_bw=ROI_bw>0; ROI_bw=imfill(ROI_bw,'holes');
m=zeros(size(ROI_bw,1)+4,size(ROI_bw,2)+4); 
ROI_bw2=m;ROI_raw2=m;


ROI_bw2(2:end-3,2:end-3)=ROI_bw; 
ROI_raw2(2:end-3,2:end-3)=ROI_raw;

ROI_raw2(ROI_bw2==0)=0;
try
 
matrix1= ROI_bw2   ;   
matrix2=ROI_raw2;

  
%  save matrix1 matrix1
% % 
%   save matrix2 matrix2;
% 
% % 
% % sssssss
% % % save all
% % 
%   pause
% clear all
%   load matrix1
%   load matrix2

 figure(9)
 imagesc(matrix1)

 stats= regionprops(matrix1,'Orientation');   
 Orientation=stats.Orientation

    
         
        if  Orientation<90
            Orientation=Orientation-90 ;% imrotate rotate in a counterclockwise direction , so orientation angle must be negative
        elseif    Orientation>90
            
              Orientation=90-Orientation ;
        end
 Orientation
matrix11 =  imrotate2_BACWrapper(matrix1, Orientation,'crop');
matrix22 =  imrotate2_BACWrapper(matrix2, Orientation,'crop');
 
figure(999)
imagesc(matrix11 )
pause
matrix11=bwlabel_max(matrix11);
matrix22(matrix11==0)=0;

 v  =nansum(matrix22); 
v=smooth(v) ;
 
 
 if  sum(imregionalmax(v))==1 % only one peak, abort
     matrix11=matrix1;
       disp('could not detect local minima of x projected intensity')
       matrix_out=matrix_bw;
     return
 else
     disp('Can detect local minima of x projected intensity. Try to split in local minima of x projected intensity')
 end
 



max_ind=peakfinder_BACWrapper(v);
if length(max_ind)<2 
'less than 2 maxima. r.s to fix that'
pause
end
Start=min(max_ind);
End=max(max_ind);

 
W=round((End-Start)/8);
M=round((End+Start)/2);


v2=v(M-W:M+W) ;
 
 
v3=smooth(v2,length(v2)/2);
[~,ind]=min(v3);
% therfore the x location of the valley is:
ind=M-W-1+ind;
 


v=matrix11(:,ind);
IND=find(v);
y1=max(IND);y2=min(IND);
x1=ind;x2=ind;
 
 B=bwboundaries(matrix11);
xy=B{:};
x=xy(:,2);
y=xy(:,1);
[y,x]=poly2cw(y,x);
 
% figure
% for ii=1:size(x,1)
%     hold on
%      
%     scatter(y(ii),x(ii))
% pause
% end
% dddd
 
 boundaries_range=5; % cutoff value set by R.S
[~,xy_ind1]=min((x-x1).^2+(y-y1).^2); vec1_x=x(xy_ind1-boundaries_range:xy_ind1+boundaries_range); vec1_y=y(xy_ind1-boundaries_range:xy_ind1+boundaries_range);  
[~,xy_ind2]=min((y-y2).^2+(y-y2).^2); vec2_x=x(xy_ind2-boundaries_range:xy_ind2+boundaries_range); vec2_y=y(xy_ind2-boundaries_range:xy_ind2+boundaries_range);  
 
  
 
Min=1000;
for ii=1:length(vec1_x)
  for jj=1:length(vec2_x)  
      
%       figure(1)
%       matrix22(vec1_y(ii),vec1_x(ii))=-1;
%       matrix22(vec2_y(jj),vec2_x(jj))=-1;
%       
%       
% %       imagesc(matrix22);
      %
      
      x1=vec1_x(ii);
      y1=vec1_y(ii);
      x2=vec2_x(jj);
      y2=vec2_y(jj);
%           
%         hold on
%        scatter(x1,y1)
%        
%       pause
%       
      
      temp_dist=(vec1_x(ii)-vec2_x(jj))^2+(vec1_y(ii)-vec2_y(jj))^2;
      
       
      if temp_dist<Min
          Min=temp_dist;
          x1=vec1_x(ii);
          y1=vec1_y(ii);
          x2=vec2_x(jj);
          y2=vec2_y(jj);
          
          
          
      end
  end
end
       





[x ,y]=bresenham_BACWrapper(x1,y1,x2,y2);

if size(x,1)>size(x,2)
    x=x';
end

if size(y,1)>size(y,2)
    y=y';
end

xy=sub2ind(size(matrix11),y,x);
% ROI_bw=double(ROI_bw);
matrix11(xy)=0;


  
       

%  =intensity_split_function([x1 x2],[y1 y2],logical(matrix11) ,double(matrix22));   
% )
%  sss

matrix11 =  imrotate2_BACWrapper(matrix11,  -Orientation,'crop');

%  
% % 
% % 
% % 
% 
%  Close
%    figure
%  imagesc(matrix1)
%  hold on
%  scatter(y1,x1)
% %   scatter(y2,x2)
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
catch
    matrix_out=ROI_bw;
end


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
