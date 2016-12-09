   function matrix11= I_split_Xaxis_delta2(matrix1, matrix2)  
% save matrix1 matrix1
% 
% save matrix2 matrix2;
% 
% 
% sssssss
% % save all
% 
% % pause
% clear all
% load matrix1
% load matrix2


 stats= regionprops(matrix1,'Orientation');   
 Orientation=stats.Orientation +90;

      
        if  Orientation<0
            Orientation=Orientation+270 ;
        end


matrix11 =  imrotate2_BACWrapper(matrix1, -Orientation,'crop');
matrix22 =  imrotate2_BACWrapper(matrix2, -Orientation,'crop');
 


matrix11=bwlabel_max(matrix11);
matrix22(matrix11==0)=0;


 v  =nansum(matrix22);

 


% to find the stat point:
v2=cumsum(v);
v3=-v2; v3(v3==0)=1; v3(v3<0)=nan;
v3=cumsum(v3);
Start=nanmax(v3);
% to find the end point we flip the vector:
v2=cumsum(flip(v));
v3=-v2; v3(v3==0)=1; v3(v3<0)=nan;
v3=cumsum(v3);
End=length(v3)-nanmax(v3);


% we estimate that the distance between Start and End is  equal to width of
% two cells so focus on one width:
W=round((End-Start)/4);
v2=v(Start+W:End-W);
v3=smooth(v2,length(v2)/2);
[~,ind]=min(v3);
% therfore the x location of the valley is:
ind=Start+W+ind;
 


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
 
[~,xy_ind1]=min((x-x1).^2+(y-y1).^2); vec1_x=x(xy_ind1-5:xy_ind1+5); vec1_y=y(xy_ind1-5:xy_ind1+5);  
[~,xy_ind2]=min((y-y2).^2+(y-y2).^2); vec2_x=x(xy_ind2-5:xy_ind2+5); vec2_y=y(xy_ind2-5:xy_ind2+5);  
 
 
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

matrix11 =  imrotate2_BACWrapper(matrix11,  Orientation,'crop');

%  
% % 
% % 
% % 
% 
%  Close
%  figure
%  imagesc(matrix1)
%  hold on
%  scatter(y1,x1)
% %   scatter(y2,x2)
% %  ddddd
% 
% figure
%  
%  imagesc(matrix1)
%  
% figure
%  
%  imagesc(matrix11)
%  
%  
% %   
% %   
% %   
% [matrix_bw2]=intensity_split_function([y1 y2],[x1 x2],matrix2 ,matrix1);    
%  
% 
% 
% 
                   
matrix11=bwlabel_max(matrix11,2);   
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
