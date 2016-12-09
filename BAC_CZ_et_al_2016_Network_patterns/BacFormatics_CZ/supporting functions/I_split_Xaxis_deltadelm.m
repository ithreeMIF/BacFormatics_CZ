% % %% ________________BacFormatics Code starts here:________________  
  function matrix_out= I_split_Xaxis_delta(matrix_in, matrix_raw)     


% Close
% figure
%   load  matrix_in
%  load matrix_raw


% matrix_in= imrotate(matrix_in,  30 );
% matrix_raw= imrotate(matrix_raw,  30 );




matrix_bw=matrix_in; 
matrix_bw=matrix_bw>0;  
matrix_bw2=double(matrix_bw);
matrix_bw2=matrix_bw2./matrix_bw2;
matrix_raw= double(matrix_raw).*double(matrix_bw2);   
  


matrix1 =zeros(size(matrix_bw,1)+4,size(matrix_bw,2)+4); matrix1(2:end-3,2:end-3)=matrix_raw;    
matrix2 =zeros(size(matrix_bw,1)+4,size(matrix_bw,2)+4); matrix2(2:end-3,2:end-3)=matrix_bw;    

 

 stats= regionprops(matrix2,'Orientation');   
 Orientation=stats.Orientation +90;

      
        if  Orientation<0
            Orientation=Orientation+270 ;
        end


matrix11 = imrotate(matrix1, -Orientation,'crop');
matrix22 = imrotate(matrix2, -Orientation,'crop');


matrix22=bwlabel_max(matrix22);
 

 v  =nansum(matrix11);

 


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
 


v=matrix22(:,ind);
IND=find(v);
y1=max(IND);y2=min(IND);
x1=ind;x2=ind;
 
 B=bwboundaries(matrix22);
xy=B{:};
x=xy(:,2);
y=xy(:,1);
[y,x]=poly2cw(y,x);
% figure
% scatter(x,y)

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
%       imagesc(matrix22);
%       
      
       x1=vec1_x(ii);
          y1=vec1_y(ii);
          x2=vec2_x(jj);
          y2=vec2_y(jj);
          
%         hold on
%        scatter(x1,y1)
%        
%       pause
      
      
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
       
       

matrix0=zeros(size(matrix11));
matrix0(y1,x1)=1;
matrix0(y2,x2)=-1;

%   figure
%   imagesc(matrix0)
% 

% we have estimated location across two sides of the segment


 
 

matrix0 = imrotate(matrix0,  Orientation,'crop');


[x1,y1]=find(matrix0==1);x1=x1(1);y1=y1(1);
[x2,y2]=find(matrix0==-1);x2=x2(1);y2=y2(1);

 

% 
% 
% 
% 
%  Close
%  figure
%  imagesc(matrix1)
%  hold on
%  scatter(y1,x1)
%   scatter(y2,x2)
%  ddddd

  
  
  
[matrix_bw2]=intensity_split_function([y1 y2],[x1 x2],matrix2 ,matrix1);    
 



matrix_bw2 =bwareaopen(matrix_bw2,20);                  
matrix_bw2=bwlabel_max(matrix_bw2,2);    
matrix_bw3=bwlabel(matrix_bw2,4 );
% 
% 
    figure
% % 
  imagesc(matrix_bw3)
whos matrix_bw3


  L1=length(find(ismember(matrix_bw3,1)));L2=length(find(ismember(matrix_bw3,2)));
 
  if (abs(L1-L2))/(L1+L2)>0.5
      return
  end

matrix_out=matrix_bw3>0;
% matrix_out=   logical(double(matrix_bw2)+double(matrix_bw_therest));
matrix_out=matrix_out(2:end-3,2:end-3);    
