

  function [cell_centerline,dist_cell_centerline]=interpolate_backbone2(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y,step,Npoints,span )


 if nargin==5 
step=0.1;
Npoints=  200;
span=100
 end
% try
%     close(7)
% end
% figure(7)
%  cla
ROI_perim2=uint8(ROI_perim);




% 
% ROI_perim2(pole1_x,pole1_y)=2;
% ROI_perim2(pole2_x,pole2_y)=2;
% %  imagesc(ROI_perim2 )
%  hold on

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
       
       X1=X(ii)     
       Y1=Y(ii) 
        
        
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
     
        
        
%  ROI_perim =bwlabel(ROI_perim );
       
%  imagesc(ROI_perim)
%     
end
 

L_ROI_perim3=D==1;
matrix_endpoints=bwmorph(L_ROI_perim3,'endpoints',inf);
cell_centerline= clean_thin_lines_vector( L_ROI_perim3,matrix_endpoints);


cell_centerline_1=cell_centerline(1,:);
cell_centerline_end=cell_centerline(end,:);
dist_cell_centerline_1_to_p1= sqrt((cell_centerline_1(1)-pole1_x)^2+(cell_centerline_1(2)-pole1_y)^2)
dist_cell_centerline_end_to_p1= sqrt((cell_centerline_end(1)-pole1_x)^2+(cell_centerline_end(2)-pole1_y)^2)

if  dist_cell_centerline_1_to_p1> dist_cell_centerline_end_to_p1
    cell_centerline=flipdim(cell_centerline,1);
end


% cell_centerline = bwtraceboundary(ROI_perim2,[pole1_x pole1_y;],'W',8,Inf,'clockwise');
% ind=find(cell_centerline(:,1)==pole1_x & cell_centerline(:,2)==pole1_y);
% cell_centerline(ind,:)=[];
% ind=find(cell_centerline(:,1)==pole2_x & cell_centerline(:,2)==pole2_y);
% cell_centerline(ind:end,:)=[];


d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[l,i]=unique(l);

cell_centerline=interp1(l,cell_centerline(i,:),linspace(0,l(end),floor(l(end)/step+1)),'linear');

cell_centerline1 = interparc(  Npoints,cell_centerline(:,2),cell_centerline(:,1)) ;
% scatter(cell_centerline1(:,1),cell_centerline1(:,2));








L_ROI_perim3=D==2;
matrix_endpoints=bwmorph(L_ROI_perim3,'endpoints',inf);
cell_centerline= clean_thin_lines_vector( L_ROI_perim3,matrix_endpoints);


cell_centerline_1=cell_centerline(1,:);
cell_centerline_end=cell_centerline(end,:);
dist_cell_centerline_1_to_p1= sqrt((cell_centerline_1(1)-pole1_x)^2+(cell_centerline_1(2)-pole1_y)^2)
dist_cell_centerline_end_to_p1= sqrt((cell_centerline_end(1)-pole1_x)^2+(cell_centerline_end(2)-pole1_y)^2)

if  dist_cell_centerline_1_to_p1> dist_cell_centerline_end_to_p1
    cell_centerline=flipdim(cell_centerline,1);
end





%
% cell_centerline = bwtraceboundary(ROI_perim2,[pole2_x pole2_y;],'W',8,Inf,'clockwise');
% ind=find(cell_centerline(:,1)==pole2_x & cell_centerline(:,2)==pole2_y);
% cell_centerline(ind,:)=[];
% ind=find(cell_centerline(:,1)==pole1_x & cell_centerline(:,2)==pole1_y);
% cell_centerline(ind:end,:)=[];
% cell_centerline=flipdim(cell_centerline,1);

d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[l,i]=unique(l);

cell_centerline=interp1(l,cell_centerline(i,:),linspace(0,l(end),floor(l(end)/step+1)),'linear');
cell_centerline2 = interparc(  Npoints,cell_centerline(:,2),cell_centerline(:,1)) ;
% scatter(cell_centerline2(:,1),cell_centerline2(:,2));


cell_centerline=(cell_centerline1+cell_centerline2)/2;
cell_centerline(end+1,:)=[pole2_y pole2_x];
cell_centerline=vertcat([pole1_y pole1_x],cell_centerline) ;

%    cell_centerline(1:10,:)=[];
%       cell_centerline(end:end-10,:)=[];
%

% scatter(cell_centerline(:,1),cell_centerline(:,2));

% cell_centerline2=

dist_cell_centerline=sqrt((cell_centerline2(:,1)-cell_centerline1(:,1)).^2+(cell_centerline2(:,2)-cell_centerline1(:,2)).^2);





cell_centerline(:,1) =smooth(cell_centerline(:,1),span,'rlowess' )  ; 
cell_centerline(:,2) =smooth(cell_centerline(:,2),span,'rlowess' )  ;
 
 






