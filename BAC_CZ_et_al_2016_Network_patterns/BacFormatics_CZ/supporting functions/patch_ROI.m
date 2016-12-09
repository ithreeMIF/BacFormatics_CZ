


function [ ROI_bw ] = patch_ROI(ROI_bw,max_dist_between_concaves,max_pixel_between_concaves)

% figure(1)
% imagesc(ROI_bw)
try
STAT=1;
Counter=1;
while STAT & (Counter<100)
    [ROI_bw,STAT] = apply_patch(ROI_bw,max_dist_between_concaves,max_pixel_between_concaves);
    Counter=Counter+1; 
end
catch
    return
end
   
% figure(2)
% imagesc(ROI_bw) 
% % figure(11)
% % imagesc(ROI_bw)
% 
% pause

function [ ROI_bw,STAT ] = apply_patch(ROI_bw,max_dist_between_concaves,max_pixel_between_concaves)





B  = bwboundaries(ROI_bw,'noholes');
B=B{1}; B(end,:)=[];
B=rot90(rot90(B));

%important: need to start the border from the polar point, otherwise the
%start of the perimeter can fall on the middle of the convex and cause
%problems. part
span=5;
BB(:,1)=smooth(B(:,1), span )  ;
BB(:,2)=smooth(B(:,2), span  )  ;


 Vertices=BB;
 Lines=[(1:size(Vertices,1))' (2:size(Vertices,1)+1)']; Lines(end,2)=1;
 k=LineCurvature2D(Vertices,Lines); 
 N=LineNormals2D(Vertices,Lines);
 
%  figure(22)
%   imagesc(ROI_bw) 
%   hold on
%  plot([Vertices(:,1) Vertices(:,1)+k.*N(:,1)]',[Vertices(:,2) Vertices(:,2)+k.*N(:,2)]','g');
%  plot([Vertices(Lines(:,1),1) Vertices(Lines(:,2),1)]',[Vertices(Lines(:,1),2) Vertices(Lines(:,2),2)]','b'); 
%  axis equal;


%   
    
   

  y= Vertices(:,1)+k.*N(:,1) ;yy=y;
  x=Vertices(:,2)+k.*N(:,2)  ;xx=x;
  
  
  
  ind=find( k<=0.5); 
  if isempty(ind)~=1
      xx(ind)=[] ;
      yy(ind)=[] ;
  end
  
 
 if isempty(xx)==1
     STAT=0;
     return
 end
 
 
     
  if length(xx)==1 
      
      Centroid=[xx yy];
      
  elseif max(pdist([xx yy]))<max_dist_between_concaves
      %no problem, only one group
      [~,Centroid]=kmeans([xx yy],1) ;
  else
      Dist=sqrt((xx-xx(1)).^2+(yy-yy(1)).^2) ;
      ind_cluster1=find(Dist<max_dist_between_concaves)
      xxx=xx(ind_cluster1);yyy=yy(ind_cluster1); kkk=kk(ind_cluster1);
      [~,Centroid]=kmeans([xxx yyy],1) ;
  end
  
%      plot(Centroid(2),Centroid(1),'+c')
  
     
     
     
%      try
  Dist=sqrt((B(:,1)-Centroid(2)).^2+(B(:,2)-Centroid(1)).^2) ;   
%      catch
%          save all
%          'problem'
%          pause
%      end
  ind_on_B=find(ismember(Dist,min(Dist)));
  ind_on_B= ind_on_B(1);
 
  
 dist_matrix=[]; 
  for mm=1:max_pixel_between_concaves
      for mmm=1:max_pixel_between_concaves
          try
             
          ind_p1=ind_on_B-mm;
          ind_p2=ind_on_B+mmm;
  
  p1=[B(ind_p1,1) B(ind_p1,2)];
   p2=[B(ind_p2,1) B(ind_p2,2)]; 
   
   
%      plot(p1(1),p1(2),'+k')
%         plot(p2(1),p2(2),'+w')
%    title(num2str(sqrt((p1(1)-p2(1))^2+(p1(1)-p2(1))^2)))
   
   dist_matrix(mm,mmm)=sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2);
   area_matrix(mm,mmm)=polyarea(B(ind_p1:ind_p2,1),B(ind_p1:ind_p2,2));
   
   
  
          end
      end
  end
  

  
  if isempty(dist_matrix)
   STAT=0;
     return
  end


norm_matrix=area_matrix./dist_matrix;
%   figure(111)
%   imagesc(norm_matrix)
%   
[mm,mmm]=find(ismember(norm_matrix,max(max(norm_matrix))));


         ind_p1=ind_on_B-mm;
          ind_p2=ind_on_B+mmm;
  
  p1=[B(ind_p1,1) B(ind_p1,2)];
   p2=[B(ind_p2,1) B(ind_p2,2)]; 
   
   
    

   [x y]=bresenham_BACWrapper(B(ind_p1,1),B(ind_p1,2),B(ind_p2,1),B(ind_p2,2));
   ROI_bw(y,x)=1;
%    x
%    y
%    
%    figure(222)
%    imagesc(ROI_bw)
%    pause
%    bw0=imclose(bw0,[0 1 0; 1 1 1; 0 1 0]);
   ROI_bw = imfill(  ROI_bw,'holes' ) ;
 
STAT=1;
 