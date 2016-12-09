function matrix_out =create_net_function2(matrix,matrix_raw,Dist_range,Theta_range,matrix_net_small_gaps_filled)
mean_intensity_of_cells=140;
alpha=0.4;%maximum ratio between the pixels  that in cells and out of the cells
% small alpha = less splitting
%  there is a tradeoff between over-splitting of good cells and a true seperation of overlapping cells


%  imclose has actually distructive effect on small thin lines segment tips (therefore imclose=less splitting)  
SE = strel('disk',1) ;                  
a = uint8(imclose(matrix,SE)); 
% a=matrix; 

matrix_thin=bwmorph(a,'thin',inf);



if nargin==5
    matrix_thin(matrix_net_small_gaps_filled==1)=1;
end


matrix_thin0=matrix_thin;
matrix_endpoints=bwmorph( matrix_thin,'endpoints',inf);


[YYY,XXX]=find(matrix_endpoints);



matrix_branch=bwmorph(matrix_thin ,'branchpoints');
matrix_thin2=matrix_thin;
matrix_thin2(matrix_branch==1)=0;
matrix_endpoints2=bwmorph( matrix_thin2,'endpoints',inf);

% 
% matrix_endpoints2(matrix_endpoints==1)=0;
[YY,XX]=find(matrix_endpoints2);


 
%   line( XX,YY ,'LineStyle','none','Marker','o'  ,'Color','g', 'MarkerSize',6)%Hitt  ;

 


for ii=1:length(XXX) 
%  try
%      figure(1)
%     cla
%     imagesc(matrix_thin)
%  hold on
 
        x1=XXX(ii);
        y1=YYY(ii);
        
        if x1>50 & y1>50 & (x1+50)<size(a,2) & (y1+50)<size(a,1) % don`t split near edges
%             line( x1,y1 ,'LineStyle','none','Marker','*'  ,'Color','c', 'MarkerSize',12)%Hitt  ;
        
        
        %       defin new m (shorcut for matrix ;) )
        Counter=1;
      
        m=matrix_thin0(y1-Counter:y1+Counter,x1-Counter:x1+Counter);
      
        while max(max(bwmorph(m,'branchpoints')))==0 & Counter<20 
         m=matrix_thin0(y1-Counter:y1+Counter,x1-Counter:x1+Counter);
         Counter=Counter+1;
        end
        if (max(max(bwmorph(m,'branchpoints')))==1 & Counter~=1)
            Counter=Counter-1;
             m=matrix_thin0(y1-Counter:y1+Counter,x1-Counter:x1+Counter);
        end
               if (max(max(bwmorph(m,'branchpoints')))==1 & Counter~=1)
            Counter=Counter-1;
             m=matrix_thin0(y1-Counter:y1+Counter,x1-Counter:x1+Counter);
             end
        
        m=bwlabel(m,8);
        
%           figure(3)
%           imagesc(m) 
% %         
         Middle= floor(size(m,1)/2)+1;
        m=m==m(Middle,Middle);
        
        
%           figure(2)
%           imagesc(m) 
% %         
%         
        stats=regionprops(m,'Centroid') ;
        
 
          Cx =stats.Centroid(1);
          Cy =stats.Centroid(2) ;
         
    
      
  
   if (Cx~=Middle & Cy~=Middle)     
%         p2=[Middle Middle]; p3=[Cx Cy]; 
      Theta1 =angle_deg_2d_BACWrapper([Middle+1 Middle],[Middle Middle],[Cx Cy])+180 ;
         
      if Theta1>=360
          Theta1=Theta1-360;
      end
                 
       
%       
%       if Range1<0
%           Range1=Range1+360;
%       end
%       Range2=Theta1+45;
%       if Range2>360
%           Range2=Range2-360;
%       end
                 
   
X=[];Y=[]; 

IND=find(sqrt((XX(:)-x1).^2+(YY(:)-y1).^2)<Dist_range); 
for j=1:length(IND) 
    jj=IND(j); 
    
    Theta2 =angle_deg_2d_BACWrapper([x1+1 y1],[x1 y1],[XX(jj) YY(jj)] ); 
     
    if  ~isnan(Theta2)
        
        %       There are 3 options:
        %       1. simply range between r2<theta2<r1
        if Theta1>Theta_range && Theta1<(360-Theta_range)
            Range1=Theta1-Theta_range;
            Range2=Theta1+Theta_range ;
            if  (Range1<Theta2 && Range2>Theta2)
                X(j)=XX(jj);   Y(j)=YY(jj); 
            end
        end
        
        if Theta1<Theta_range
            Range1=Theta1-Theta_range+360;
            Range2=Theta1+Theta_range ;
            if  (Range1<Theta2 || Range2>Theta2)
                X(j)=XX(jj);   Y(j)=YY(jj); 
            end
        end
        
        if Theta1>(360-Theta_range)
            Range1=Theta1-Theta_range;
            Range2=Theta1+Theta_range-360 ;
            if  (Range1<Theta2 || Range2>Theta2)
                X(j)=XX(jj);   Y(j)=YY(jj); 
            end
        end 
    end 
end

%              hold on 
%         line( X,Y ,'LineStyle','none','Marker','*'  ,'Color','m', 'MarkerSize',6)%Hitt  ;
%       
      
%         pause
%            Ind=  (X==x1 & Y==y1) ;
%            X(find(Ind))=[];
%            Y(find(Ind))=[];
%            
            % WE NEED TO DO SOME KIND OF GATING SO WE CAN ONLY USE POINTS THAT ARE IN THE SAME DIRECTION OF THE LAST PIXELS BEFORE THE ENDPOINT
        try    
              [~,ind]=nanmin(((X-x1).^2)+ ((Y-y1).^2)); 
             x2=X(ind(1)) ;
             y2=Y(ind(1)) ;
            
            
            
            [xx ,yy]=bresenham_BACWrapper(x1,y1,x2,y2);
            
             
            
            if size(xx,1)>size(xx,2)
                xx=xx';
            end
            
            if size(yy,1)>size(yy,2)
                yy=yy';
            end
            if length(xx)<Dist_range
                 xy=sub2ind(size(matrix_thin),yy,xx);
                 if length(xy)>2
                     
                     intensity_vec=matrix_raw(xy);
                     %    to reduce the chance that we split a cell rather to enchance its perimeter:
%                      
%                       figure(1)
%                      cla
%                      imagesc(matrix_Raw)
%                      hold on
%                      scatter(xx,yy)
%                      scatter(XXX,YYY)
%                      title(['var: ' num2str(var(intensity_vec))    ' std: ' num2str(std(intensity_vec)) ' mean: ' num2str(mean(intensity_vec))])
%                      xlim([min(xx)-10 max(xx)+10])
%                      ylim([min(yy)-10 max(yy)+10])
%                      pause(6)
                    intensity_vec=intensity_vec>mean_intensity_of_cells;
                    if sum(intensity_vec)<(alpha*length(intensity_vec))
                        vec=matrix_thin(xy);
                        vec2=vec; vec2(1:2)=0;
                        ind=find(vec2);
                        ind=ind(1) ;
                        matrix_thin(xy(1:ind))=1;
                    end
                 else
                    matrix_thin(xy)=1;
                 end 
            end
        end
end
end
%  end
end
matrix_out=matrix_thin  ;

