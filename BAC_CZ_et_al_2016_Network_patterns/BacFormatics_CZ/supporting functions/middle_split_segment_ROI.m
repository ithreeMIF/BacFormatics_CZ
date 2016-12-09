function  ROI_bw = middle_split_segment_ROI(ROI_bw)
% save ROI_bw ROI_bw
% pause
%   load ROI_bw
% % close all
%   figure(1)
%   imagesc(ROI_bw)
%    hold on
try
    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw);
catch
    try
        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,6,2);
    catch
        try
            [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,6,2);
        catch
            try
                [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,5,2);
            catch
                try
                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,4,1);
                catch
                    try
                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,3,1);
                    end
                end
            end
        end
    end
end






step=0.1;
Npoints=  200;
span=50;
ROI_perim=bwperim(ROI_bw);
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


L_ROI_perim3A=D==1;
matrix_endpoints=bwmorph(L_ROI_perim3A,'endpoints',inf);
if sum( matrix_endpoints(:))>2
    [x,y]=find(matrix_endpoints);
    
    for ii=1:length(x)
        for jj=1:length(y)
            dist_matrix(ii,jj)=sqrt((x(ii)-x(jj)).^2+(y(ii)-y(jj)).^2);
        end
    end
    [ind1,ind2]=find(ismember(dist_matrix,max(dist_matrix(:))));ind1=ind1(1);ind2=ind2(1);
    matrix_endpoints=logical(zeros(size(matrix_endpoints)));
    matrix_endpoints(x(ind1),y(ind1))=1;
    matrix_endpoints(x(ind2),y(ind2))=1;
end








cell_centerline= clean_thin_lines_vector( L_ROI_perim3A,matrix_endpoints);


cell_centerline_1=cell_centerline(1,:);
cell_centerline_end=cell_centerline(end,:);
dist_cell_centerline_1_to_p1= sqrt((cell_centerline_1(1)-pole1_x)^2+(cell_centerline_1(2)-pole1_y)^2)
dist_cell_centerline_end_to_p1= sqrt((cell_centerline_end(1)-pole1_x)^2+(cell_centerline_end(2)-pole1_y)^2)

if  dist_cell_centerline_1_to_p1> dist_cell_centerline_end_to_p1
    cell_centerline=flipdim(cell_centerline,1);
end




d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[l,i]=unique(l);

cell_centerline1=interp1(l,cell_centerline(i,:),linspace(0,l(end),floor(l(end)/step+1)),'linear');
cell_centerline1 = interparc(  Npoints,cell_centerline1(:,1),cell_centerline1(:,2)) ;



L_ROI_perim3B=D==2;
matrix_endpoints=bwmorph(L_ROI_perim3B,'endpoints',inf);
if sum( matrix_endpoints(:))>2
    [x,y]=find(matrix_endpoints);
    
    for ii=1:length(x)
        for jj=1:length(y)
            dist_matrix(ii,jj)=sqrt((x(ii)-x(jj)).^2+(y(ii)-y(jj)).^2);
        end
    end
    [ind1,ind2]=find(ismember(dist_matrix,max(dist_matrix(:))));ind1=ind1(1);ind2=ind2(1);
    matrix_endpoints=logical(zeros(size(matrix_endpoints)));
    matrix_endpoints(x(ind1),y(ind1))=1;
    matrix_endpoints(x(ind2),y(ind2))=1;
end
cell_centerline= clean_thin_lines_vector( L_ROI_perim3B,matrix_endpoints);


cell_centerline_1=cell_centerline(1,:);
cell_centerline_end=cell_centerline(end,:);
dist_cell_centerline_1_to_p1= sqrt((cell_centerline_1(1)-pole1_x)^2+(cell_centerline_1(2)-pole1_y)^2)
dist_cell_centerline_end_to_p1= sqrt((cell_centerline_end(1)-pole1_x)^2+(cell_centerline_end(2)-pole1_y)^2)

if  dist_cell_centerline_1_to_p1> dist_cell_centerline_end_to_p1
    cell_centerline=flipdim(cell_centerline,1);
end

d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[l,i]=unique(l);

cell_centerline2=interp1(l,cell_centerline(i,:),linspace(0,l(end),floor(l(end)/step+1)),'linear');
cell_centerline2 = interparc(  Npoints,cell_centerline2(:,1),cell_centerline2(:,2)) ;





cell_centerline=(cell_centerline1+cell_centerline2)/2;
cell_centerline(:,1) =smooth(cell_centerline(:,1),span,'rlowess' )  ;
cell_centerline(:,2) =smooth(cell_centerline(:,2),span,'rlowess' )  ;

 radiusCurvature=  radiusCurvature_BACWrapper(cell_centerline(:,1), cell_centerline(:,2));
%  
%  
%  return

%      plot(cell_centerline(:,2),cell_centerline(:,1),'.m');
%
 [Y1,X1]=find(L_ROI_perim3A);
[Y2,X2]=find(L_ROI_perim3B);


if  radiusCurvature<50 % split in curve, default value was set by R.S. 
    return
    
else
    
d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[~,middle_ind]=min(abs(l-max(l)/2));
 

% usually it is possible that the actuall split is one or even two ribs from the center so the distance is minimal there
% but it is hard to predict that
freedom_coeff=0; %coeff set by R.S
vec_range=(middle_ind-freedom_coeff):(middle_ind+freedom_coeff);


 
 



for ii=1:length(vec_range)
    iii=vec_range(ii);
    x= cell_centerline(iii,2);
    y=cell_centerline(iii,1);
    
    v1 =min(sqrt((X1-x).^2+(Y1-y).^2));
    v2 =min(sqrt((X2-x).^2+(Y2-y).^2));
    v(ii)= (v1+v2)/2;
end

[~,ind]=min(v);
ind=vec_range(ind);
x= cell_centerline(ind,2);
y=cell_centerline(ind,1);
 
%    scatter(x,y)

[~,ind1] =min(sqrt((X1-x).^2+(Y1-y).^2));

[~,ind2]=min(sqrt((X2-x).^2+(Y2-y).^2));

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
end
%   figure(2)
%   imagesc(ROI_bw)