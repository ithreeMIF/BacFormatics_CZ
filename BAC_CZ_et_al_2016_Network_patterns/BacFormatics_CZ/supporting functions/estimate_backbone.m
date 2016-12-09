

function [cell_centerline,dist_cell_centerline]=estimate_backbone(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y,step,Npoints,span )

ROI_perim2=uint8(ROI_perim);
ROI_perim2 = bw_gridel(ROI_perim2,pole1_x,pole1_y);
ROI_perim2 = bw_gridel(ROI_perim2,pole2_x,pole2_y);
D=bwlabel(ROI_perim2);
if max(D(:))>2
 
    ROI_perim2=bwlabel_max(ROI_perim2,2,8);
    D=bwlabel(ROI_perim2);
    
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
        X1=X(ii) ;
        Y1=Y(ii) ;
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
dist_cell_centerline_1_to_p1= sqrt((cell_centerline_1(1)-pole1_x)^2+(cell_centerline_1(2)-pole1_y)^2);
dist_cell_centerline_end_to_p1= sqrt((cell_centerline_end(1)-pole1_x)^2+(cell_centerline_end(2)-pole1_y)^2) ;
if  dist_cell_centerline_1_to_p1> dist_cell_centerline_end_to_p1
    cell_centerline=flipdim(cell_centerline,1);
end
d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[l,i]=unique(l);
cell_centerline1=interp1(l,cell_centerline(i,:),linspace(0,l(end),floor(l(end)/step+1)),'linear');

 
 
 
cell_centerline1 = interparc(  Npoints,cell_centerline1(:,1),cell_centerline1(:,2),'linear') ;
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
dist_cell_centerline_1_to_p1= sqrt((cell_centerline_1(1)-pole1_x)^2+(cell_centerline_1(2)-pole1_y)^2);
dist_cell_centerline_end_to_p1= sqrt((cell_centerline_end(1)-pole1_x)^2+(cell_centerline_end(2)-pole1_y)^2);
if  dist_cell_centerline_1_to_p1> dist_cell_centerline_end_to_p1
    cell_centerline=flipdim(cell_centerline,1);
end
d=diff(cell_centerline,1,1);
l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
[l,i]=unique(l);
cell_centerline2=interp1(l,cell_centerline(i,:),linspace(0,l(end),floor(l(end)/step+1)),'linear');
cell_centerline2 = interparc(  Npoints,cell_centerline2(:,1),cell_centerline2(:,2),'linear') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


cell_centerline=(cell_centerline1+cell_centerline2)/2;
cell_centerline(end+1,:)=[pole2_y pole2_x];
cell_centerline=vertcat([pole1_y pole1_x],cell_centerline) ;

%    cell_centerline(1:10,:)=[];
%       cell_centerline(end:end-10,:)=[];
% scatter(cell_centerline(:,1),cell_centerline(:,2));

dist_cell_centerline=sqrt((cell_centerline2(:,1)-cell_centerline1(:,1)).^2+(cell_centerline2(:,2)-cell_centerline1(:,2)).^2); 
cell_centerline(:,1) =smooth(cell_centerline(:,1),span,'rlowess' )  ;
cell_centerline(:,2) =smooth(cell_centerline(:,2),span,'rlowess' )  ; 


 
dist_cell_centerline=vertcat(0,dist_cell_centerline) ;
dist_cell_centerline(end+1)=0;
ind=cell_centerline(:,1)<1;cell_centerline(ind,:)=[];dist_cell_centerline(ind)=[];
ind=cell_centerline(:,2)<1;cell_centerline(ind,:)=[];dist_cell_centerline(ind)=[];


