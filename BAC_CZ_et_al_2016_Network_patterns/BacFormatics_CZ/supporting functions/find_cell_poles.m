function [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength) 

if nargin==1
FillGap=3;
MinLength=7;
end

 





%  this function returns the polar points of objects cells
matrix_thin_temp=bwmorph(ROI_bw ,'thin',inf);
matrix_endpoints=bwmorph( matrix_thin_temp,'endpoints');

if sum( matrix_endpoints(:))>2
    ctr  =clean_thin_lines_vector( matrix_thin_temp,matrix_endpoints);
    ctr=sub2ind(size(matrix_thin_temp),ctr(:,1),ctr(:,2));
    matrix_thin_temp= zeros(size(matrix_thin_temp)) ;
    matrix_thin_temp(ctr)=1;
    matrix_endpoints=bwmorph( matrix_thin_temp,'endpoints');
end


[x_endpoint,y_endpoint]=find( matrix_endpoints);
% x_endpoint_1=  x_endpoint(1);x_endpoint_2=  x_endpoint(2);
% y_endpoint_1=  y_endpoint(1);y_endpoint_2=  y_endpoint(2);


correction_coeff=0;
Stats=0;counter_thin1=15;
while  Stats==0 && MinLength-correction_coeff>3
    try
        ROI1= clean_thin_lines_vector_from_pointxy_by_npixels(matrix_thin_temp, x_endpoint(1),y_endpoint(1),counter_thin1 );
        [H1,T1,R1] = hough(ROI1);
        P1  = houghpeaks(H1,1,'threshold',ceil(0.3*max(H1(:))));
        lines1 = houghlines(ROI1,T1,R1,P1,'FillGap',FillGap,'MinLength',MinLength-correction_coeff); 
        xy1 = [lines1.point1; lines1.point2]; 
        Stats=1;
      end
    counter_thin1=counter_thin1+1;
    if counter_thin1>100
      correction_coeff=correction_coeff+1;
    end
end
correction_coeff=0;
Stats=0;counter_thin2=15;
while  Stats==0 && MinLength-correction_coeff>3
    try
        ROI2= clean_thin_lines_vector_from_pointxy_by_npixels(matrix_thin_temp, x_endpoint(2),y_endpoint(2),counter_thin2 );
        [H2,T2,R2] = hough(ROI2);
        P2  = houghpeaks(H2,1,'threshold',ceil(0.3*max(H2(:))));
        lines2 = houghlines(ROI2,T2,R2,P2 ,'FillGap',FillGap,'MinLength',MinLength-correction_coeff);
        xy2 = [lines2.point1; lines2.point2];
        Stats=1;
    end
    counter_thin2=counter_thin2+1;
    if counter_thin2>100
        correction_coeff=correction_coeff+1 
    end
end

 


ROI_perim=bwperim(ROI_bw); 
[xx3, yy3]=find(ROI_perim);
 

x2=xy1(2,2) ;
x1=xy1(1,2) ;
y2=xy1(2,1); 
y1=xy1(1,1) ;

% [x1,y1] close to the endpoint 
if ((x1-x_endpoint(1))^2+(y1-y_endpoint(1))^2)<=((x2-x_endpoint(1))^2+(y2-y_endpoint(1))^2)
x1=xy1(2,2) ;
x2=xy1(1,2) ;
y1=xy1(2,1) ;
y2=xy1(1,1)   ;
end


  


Slope1=angle_deg_2d_BACWrapper([0 1], [0 0], [y2-y1 x2-x1] );
x1=x2;
y1=y2;

contact_ind=find((xx3==x1 & yy3==y1));
if isempty(contact_ind)~=1
    ind=contact_ind(1);
else 
Slope_vec=[];
for nn=1:max(size(xx3))
    x2=xx3(nn);
    y2=yy3(nn);
    Slope_vec(nn)=angle_deg_2d_BACWrapper([0 1], [0 0], [y2-y1 x2-x1] )-Slope1;
end
[~,ind]=min(abs(Slope_vec));
ind=ind(1);
end
pole1_y=yy3(ind);
pole1_x=xx3(ind);
 
 




x2=xy2(2,2);
x1=xy2(1,2);
y2=xy2(2,1);
y1=xy2(1,1);
% [x1,y1] close to the endpoint 
if ((x1-x_endpoint(2))^2+(y1-y_endpoint(2))^2)<=((x2-x_endpoint(2))^2+(y2-y_endpoint(2))^2)
x1=xy2(2,2) ;
x2=xy2(1,2) ;
y1=xy2(2,1) ;
y2=xy2(1,1) ;
end
% Slope1=(y2-y1)/(x2-x1);
Slope1=angle_deg_2d_BACWrapper([0 1], [0 0], [y2-y1 x2-x1] );


x1=x2;
y1=y2;

contact_ind=find((xx3==x1 & yy3==y1));
if isempty(contact_ind)~=1
    ind=contact_ind(1);
else 
Slope_vec=nan(1,max(size(xx3)));
for nn=1:max(size(xx3))
    x2=xx3(nn);
    y2=yy3(nn);
    Slope_vec(nn)=angle_deg_2d_BACWrapper([0 1], [0 0], [y2-y1 x2-x1] )-Slope1;
end
[~,ind]=min(abs(Slope_vec));
ind=ind(1);
end
pole2_y=yy3(ind);
pole2_x=xx3(ind);

