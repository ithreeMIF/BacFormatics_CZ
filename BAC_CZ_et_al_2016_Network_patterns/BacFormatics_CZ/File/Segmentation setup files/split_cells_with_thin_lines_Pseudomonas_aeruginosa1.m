 function [matrix_out] = split_cells_with_thin_lines_Pseudomonas_aeruginosa1(matrix_in,matrix_Filtered)
%          save matrix_Filtered matrix_Filtered
%           save matrix_in matrix_in
% % % %
%        pause
% % %
% 
% % %     clear all
%      load  matrix_in
%       load matrix_Filtered
% % % %
%  

%  matrix_in=bwmorph(matrix_in, 'spur',1);
% try
matrix_in=bwareaopen(matrix_in,60,4);
matrix_out=logical(zeros(size(matrix_in)));
%defaaults set by R.S:
FillGap=3;
MinLength=7;
Steps=0.5;
Npoints=1;
Spans=5;

Thick=1;

bw=matrix_in>0;


bw=bwmorph(bw,'thick',Thick);  %only option. In some cases can improve the accurcy
L=bwlabel(bw,4);
XY_data=regionprops(L,'BoundingBox', 'Centroid','BoundingBox','MajorAxisLength','MinorAxisLength','Orientation');

%

h3=timebar_BACWrapper('Splitting v-cells. Please wait....');
set(h3,'color','w');

% 
% figure(1)
% hold on
% imagesc(matrix_in)
% %


for jj=1:max(L(:))%197:197%249
    timebar_BACWrapper(h3,jj/max(L(:)))
    
    
    XY=XY_data(jj).BoundingBox;
    
    
    if (XY(1)+XY(3))>size(L,2)
        XY(1)=floor(XY(1));
    end
    if (XY(2)+XY(4))>size(L,1)
        XY(2)=floor(XY(2));
    end
    X1=round(XY(2)) ;
    Y1=round(XY(1));
    X2=round(XY(2)+XY(4));
    Y2=round(XY(1)+XY(3));
    ROI_bw=  L(X1:X2,Y1:Y2) ;
    ROI_bw=ROI_bw==jj;
    
    if sum(ROI_bw(:))>300
        
        
        ROI_Filtered=  matrix_Filtered(X1:X2,Y1:Y2) ;
        ROI_perim=bwperim(ROI_bw);
        ROI_bw2=ROI_bw;
        try 
            [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength);
        catch
            try
                ROI_bw2=bwmorph(ROI_bw,'thicken',1);
                [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw2,FillGap,MinLength);
            catch
                try
                    ROI_bw2=bwmorph(ROI_bw,'thicken',2);
                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw2,FillGap,MinLength);
                catch
                    try
                        ROI_bw2=bwmorph(ROI_bw,'thicken',3);
                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw2,FillGap,MinLength);
                    catch 
                    r=0.4*XY_data(jj).MajorAxisLength;
                    theta=XY_data(jj).Orientation;
                    if theta>=0 &  theta<=90 ;
                        theta=     -  theta +180;
                    end
                    if theta<0 &  theta>=-90;
                        theta =     -  theta +180;
                    end
                    x=XY_data(jj).Centroid(:,1);
                    y=XY_data(jj).Centroid(:,2);
                    pole1_y =  x  + r .* cosd( theta)  ;
                    pole1_x=   y + r .* sind( theta)   ;
                    pole2_y =  x  + r .* cosd( theta+180)  ;
                    pole2_x =  y  + r .* sind( theta+180)  ;
                    [Y,X]=find(ROI_perim);
                    [~,ind_min1]=min((((Y-pole1_y).^2)+((X-pole1_x).^2)));pole1_y=Y(ind_min1);pole1_x=X(ind_min1);
                    [~,ind_min2]=min((((Y-pole2_y).^2)+((X-pole2_x).^2)));pole2_y=Y(ind_min2);pole2_x=X(ind_min2);
                    
                    
                    
                end
            end
        end
end
        try
            
            [cell_centerline,~]=interpolate_backbone(ROI_bw2,pole1_x,pole1_y,pole2_x,pole2_y,Steps,Npoints*round(XY_data(jj).MajorAxisLength),Spans );
            
            x=cell_centerline(:,1);
            y=cell_centerline(:,2);
            
            x1=x(1);
            y1=y(1);
            x3=x(end);
            y3=y(end);
            %% The slope of the line connecting the two endpoints. The next code was taken from:
            % http://au.mathworks.com/matlabcentral/answers/250257-find-turning-point-in-data
            % (user: Hg)
            
            m = ( y3 - y1 )/( x3 - x1 );
            pm= - 1 / m;
            % Point on the curve (xc,yc), point on the line (xl,yl),searching for (x2,y2)
            dist_vec = nan(size(x));
            l=length(x);
            S=round(l/3);
            E=round(2*l/3);
            for kk = S:E
                xc = x(kk) ; yc = y(kk);
                yl = ( (m * xc) + (m^2 * yc) - (m * x1) + y1)/(1+ m^2);
                xl = xc - m*(yl - yc);
                d2 = (xl - xc)^2 + (yl - yc)^2;
                dist_vec(kk) = d2;
            end
            %%
            [~, idx] = nanmax(dist_vec);
            if length(idx)>2
                mid=round(length(idx)/2);
                idx=idx(mid);
            else
                idx=idx(1);
            end
            
            
            x2=x(idx);y2=y(idx);
            
%                    text(Y1+y2,x2+X1,num2str(jj),'Color','red')
            
            theta = angle_deg_2d_BACWrapper( [x1 y1],[x2 y2], [x3 y3]);
            if theta >180
                theta =360-theta;
            end
            
            if theta<120
                ROI_bw=Split_v_cells(ROI_bw, ROI_Filtered,ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y);
            end
            matrix_out(X1:X2,Y1:Y2)=matrix_out(X1:X2,Y1:Y2)+double(ROI_bw);
        catch
%                text(Y1+y2,x2+X1,num2str(jj),'Color','green')
            
            'could not interpolate backbone. Split abarent segment'
            
            ROI_bw =  split_segment_ROI_function( ROI_bw,ROI_Filtered);
            matrix_out(X1:X2,Y1:Y2)=matrix_out(X1:X2,Y1:Y2)+double(ROI_bw);
            
        end
        
        
    else
        matrix_out(X1:X2,Y1:Y2)=matrix_out(X1:X2,Y1:Y2)+double(ROI_bw);
%            text(Y1+y2,x2+X1,num2str(jj),'Color','cyan')
    end
end



matrix3=bwlabel(matrix_out,4);
matrix4= matrix3;

matrix2=matrix_out*0;
matrix2(1:end,1:2)=1; matrix2(1:end,end-1:end)=1;
matrix2(2,1:end)=1; matrix2(end-1:end,1:end)=1;

matrix3=double(matrix2).*matrix3   ;


matrix3=matrix3(:);
matrix3(matrix3==0)=[];
matrix3=unique(matrix3);
matrix5= (ismember(matrix4,matrix3));

matrix_out(matrix5==1)=0;

close(h3)
% catch
% save all
% pause
% end
