  function  ROI_bw = middle_split_segment_ROI(ROI_bw)
% save ROI_bw ROI_bw
% pause
%   load ROI_bw
% % close all
%   figure(1)
%   imagesc(ROI_bw)
%    hold on
    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw);
         
        
        
        
        ROI_perim=bwperim(ROI_bw); 
        [cell_centerline,dist_cell_centerline]=interpolate_backbone(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y); 
       [cell_mesh]=interpolate_contour(cell_centerline,dist_cell_centerline,1);  
       
        
        span=5;Repeats =2;
        for iii=1:Repeats
            cell_mesh(:,1)=smooth(cell_mesh(:,1), span,'rlowess' )  ;
            cell_mesh(:,2)=smooth(cell_mesh(:,2), span,'rlowess' )  ;
            cell_mesh(:,3)=smooth(cell_mesh(:,3), span,'rlowess' )  ;
            cell_mesh(:,4)=smooth(cell_mesh(:,4), span,'rlowess' )  ;
            %
            dist_cell_centerline=sqrt((cell_mesh(:,3)-cell_mesh(:,1)).^2+(cell_mesh(:,4)-cell_mesh(:,2)).^2);
            cell_mesh =interpolate_contour( [(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2],dist_cell_centerline,1);
            
        end
     
        
        
        
        cell_centerline=[(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2];
        d=diff(cell_centerline,1,1);
        l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
        [~,middle_ind]=min(abs(l-max(l)/2));
        
        
        XX= cell_centerline(middle_ind,1);
        YY= cell_centerline(middle_ind,2);
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
         

 
ROI_perim=bwperim(ROI_bw);
ROI_perim2=uint8(ROI_perim); 

ROI_perim2 = bw_gridel(ROI_perim2,pole1_x,pole1_y);
ROI_perim2 = bw_gridel(ROI_perim2,pole2_x,pole2_y); 

D=bwlabel(ROI_perim2);
if max(D(:))>2
    'fix that more than two segments are possible!'
end
if max(D(:))==1
    'fix that only one segmet is possible!'
    
    fun=@minutie;
    L = nlfilter(ROI_perim,[3 3],fun);

    if max(L(:))==4
        'need to extend the function to coresponde to that case'
    end 
    [X,Y] =find(L==3); 
   for  ii=1:max(size(X)) 
       
       X1=X(ii)   ; 
       Y1=Y(ii)   ; 
        
       D=ROI_perim2;        D(X1,Y1)=0;
       D(X1-1,Y1-1)=1;   D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end
       
        D=ROI_perim2;         D(X1,Y1)=0;
       D(X1,Y1-1)=1;    D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end
       
        D=ROI_perim2;      D(X1,Y1)=0;
       D(X1+1,Y1-1)=1;    D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end 
       
        D=ROI_perim2;         D(X1,Y1)=0;
       D(X1-1,Y1)=1;    D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end
       
       D=ROI_perim2;         D(X1,Y1)=0;
       D(X1+1,Y1)=1;   D=bwlabel(D); 
       if max(max(bwlabel(D)))==2
           break
       end
       
       D=ROI_perim2;         D(X1,Y1)=0;
       D(X1-1,Y1+1)=1;    D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end
       
         D=ROI_perim2;        D(X1,Y1)=0;
        D(X1,Y1+1)=1;    D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end
       
       D=ROI_perim2;         D(X1,Y1)=0;
       D(X1+1,Y1+1)=1;    D=bwlabel(D);
       if max(max(bwlabel(D)))==2
           break
       end 
   end 
end
 

L_ROI_perim3A=D==1;  
L_ROI_perim3B=D==2; 

[Y1,X1]=find(L_ROI_perim3A);
[Y2,X2]=find(L_ROI_perim3B);


 
 
[~,ind1] =min(sqrt((X1-XX).^2+(Y1-YY).^2));

[~,ind2]=min(sqrt((X2-XX).^2+(Y2-YY).^2));
  
x1=X1(ind1);x2=X2(ind2);
y1=Y1(ind1);y2=Y2(ind2);



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
%   figure(2)
%   imagesc(ROI_bw)