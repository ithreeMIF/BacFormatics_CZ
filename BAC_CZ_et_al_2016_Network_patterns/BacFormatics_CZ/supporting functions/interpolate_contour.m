

function [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour(cell_centerline,dist_cell_centerline,jumps_coeff,Nbreaks,span)

if nargin==2
    jumps_coeff=5;
    Nbreaks=10 ;
     span=20;
end
 

 
b=length(dist_cell_centerline);
c=jumps_coeff;

Counter=1;
while round(b/c)-b/c~=0
      Counter=-Counter;
      if   Counter>0
    dist_cell_centerline(end)=[];
    cell_centerline(end,:)=[];
    
      else
       dist_cell_centerline(1)=[];  
         cell_centerline(1,:)=[];
       
      end
    b=length(dist_cell_centerline) ;
end


 


vec_length=length(dist_cell_centerline);

% cell_centerline=fliplr(cell_centerline);
 
% 
% save all
% pause


dist_cell_centerline=dist_cell_centerline/2;

% 
% figure
%   plot(dist_cell_centerline)
% hold on
% dist_cell_centerline=smooth(dist_cell_centerline,50,'rloess' );
 

%  y =  dist_cell_centerline(1:(vec_length/2))+dist_cell_centerline((vec_length/2+1):vec_length) ;
   y1 =  dist_cell_centerline(1:(vec_length/2)) ;
   y2 =  rot90(rot90(dist_cell_centerline((vec_length/2+1):vec_length)));
   
   
   
   
   
  y1=smooth(y1, span,'rlowess' )  ;  
  y2=smooth(y2, span,'rlowess' )  ;  
%    
%    
%    y1=smooth(y1,20);
% y2=smooth(y2,20);
   
   
   xy1 =  cell_centerline(1:(vec_length/2),:);
   xy2 =  rot90(rot90(cell_centerline((vec_length/2+1):vec_length,:)));
   
   xy1=sqrt((xy1(:,1)-xy1(1,1)).^2+(xy1(:,2)-xy1(1,2)).^2);
   xy2=sqrt((xy2(:,1)-xy2(1,1)).^2+(xy2(:,2)-xy2(1,2)).^2);
%   figure
%   hold on
%  scatter( xy1,y1)
%     scatter( xy2,y2)
%     
%     
    xy=(xy1+xy2)/2;
    
    
%     
%      scatter(xy,(y1+y2)/2 ) 
    
  
 
y=(y1+y2)/2;
% figure
% y =smooth(y ,20  );%scatter(xy,y ,'+')
y=smooth(y, span,'rlowess' )  ;   

breaks = linspace(min(xy),max(xy),Nbreaks  ); % 41 breaks, 40 pieces
pp  = splinefit(xy,y,breaks);  
xx = linspace(xy(2),max(xy),Nbreaks  );
y  = ppval(pp ,xx);
  
vec=abs(1-y./pp.breaks) ;
[~,ind_min_vec]=min(vec);
 min_y=y(ind_min_vec) ;

vec1=abs(xy1-min_y);
[~,ind_min_vec1]=min(vec1) ;
 
vec2=abs(xy2-min_y);
[~,ind_min_vec2]=min(vec2); 

ind_min_vec2=vec_length-ind_min_vec2-2;

 dist_cell_centerline2= dist_cell_centerline;
 
  dist_cell_centerline2(ind_min_vec2:end)=[];
  dist_cell_centerline2(1:ind_min_vec1)=[];

% figure
% 
% 
% plot( dist_cell_centerline2)
% hold on

dist_cell_centerline2=smooth(dist_cell_centerline2,50 );

dist_cell_centerline(ind_min_vec1+1:ind_min_vec2-1)=dist_cell_centerline2 ;


%   plot(dist_cell_centerline,'.') 
%   yf = fft(y1);    yf(3:end-2) = 0;  y1 = real(ifft(yf)); plot(y1,'.')
 





p1_cir_ind=ind_min_vec1;
p1_R=  dist_cell_centerline(p1_cir_ind) ;
p1_cir_coor=[cell_centerline(p1_cir_ind,1) cell_centerline(p1_cir_ind,2)];

p2_cir_ind=ind_min_vec2;
p2_R=  dist_cell_centerline(p2_cir_ind) ;
p2_cir_coor=[cell_centerline(p2_cir_ind,1) cell_centerline(p2_cir_ind,2)];

% 
% p1_cir_ind=30
% p1_R=  dist_cell_centerline(p1_cir_ind)/2;
% p1_cir_coor=[cell_centerline(p1_cir_ind,1) cell_centerline(p1_cir_ind,2)];
% 
% p2_cir_ind=170
% p2_R=  dist_cell_centerline(p2_cir_ind)/2;
% p2_cir_coor=[cell_centerline(p2_cir_ind,1) cell_centerline(p2_cir_ind,2)];

jj=1;
for ii=1:jumps_coeff:max(size(cell_centerline))-1
    
    x1=  cell_centerline(ii,1);
    y1=  cell_centerline(ii,2);
    x2=  cell_centerline(ii+1,1);
    y2=  cell_centerline(ii+1,2);
    
     
    x3 = (x1 + x2) / 2  ;
    y3 = (y1 + y2) / 2  ;
    
    a = y1 - y2  ;
    b = x2 - x1  ;
    
    norm = sqrt(a*a + b*b)  ;
    a = a / norm  ;
    b = b / norm  ;
    
    
    if ii<=p1_cir_ind %within range of circle 1
        L=sqrt((p1_cir_coor(1)-cell_centerline(1,1))^2+(p1_cir_coor(2)-cell_centerline(1,2))^2) ;%const
        x=L-sqrt((x3-cell_centerline(1,1))^2+(y3-cell_centerline(1,2))^2) ;%const
        dist=p1_R*sqrt(1-(x/L)^2); 
        x4 = x3 + a * dist  ;
        y4 = y3 + b * dist; 
        x5 = x3 - a * dist  ;
        y5 = y3 - b * dist; 
        cell_mesh(jj,:)=[x4 y4 x5 y5];
    elseif ii>p1_cir_ind & ii<p2_cir_ind %within range of body
        dist= dist_cell_centerline(ii);
%         scatter (y3,x3,'square','.b');
        x4 = x3 + a * dist  ;
        y4 = y3 + b * dist; 
        x5 = x3 - a * dist  ;
        y5 = y3 - b * dist; 
        cell_mesh(jj,:)=[x4 y4 x5 y5];
    elseif ii>=p2_cir_ind %within range of circle 2 
        L=sqrt((p2_cir_coor(1)-cell_centerline(end,1))^2+(p2_cir_coor(2)-cell_centerline(end,2))^2); %const
        x=L-sqrt((x3-cell_centerline(end,1))^2+(y3-cell_centerline(end,2))^2) ;%const
        dist=p2_R*sqrt(1-(x/L)^2);  
        x4 = x3 + a * dist  ;
        y4 = y3 + b * dist; 
        x5 = x3 - a * dist  ;
        y5 = y3 - b * dist; 
        cell_mesh(jj,:)=[x4 y4 x5 y5];
    end 
    
    jj=jj+1;
end

 cell_mesh(cell_mesh<1)=1;