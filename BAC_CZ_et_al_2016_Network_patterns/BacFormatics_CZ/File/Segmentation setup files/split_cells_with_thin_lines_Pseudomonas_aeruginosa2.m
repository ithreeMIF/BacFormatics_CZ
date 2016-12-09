   function [matrix_out] = split_cells_with_thin_lines_Pseudomonas_aeruginosa2(matrix_in,matrix_Filtered)
% clear all
%
%    save matrix_in matrix_in
%  save matrix_Filtered matrix_Filtered

%  pause
% 
% load matrix_in
% load  matrix_Filtered



% step 1. deal branches points:
matrix=matrix_in;
matrix(matrix>1)=1;
matrix2=bwmorph(matrix,'thin',inf); 
matrix3=zeros(size(matrix2));
matrix_branchpoints= bwmorph(matrix2,'branchpoints' );
matrix4=double(matrix2)- double(matrix_branchpoints);
L=bwlabel(matrix4,8); stats=regionprops(L,'Orientation');


matrix0=L*nan;
for ii=1: size(stats,1)
    matrix0(L==ii)=stats(ii).Orientation;
end
 

%  IGNORE IMAGE EDGE:S
matrix_branchpoints(1,:)=0;matrix_branchpoints(end,:)=0; matrix_branchpoints(:,1 )=0;matrix_branchpoints(:,end )=0;
matrix_branchpoints(2,:)=0;matrix_branchpoints(end-1,:)=0; matrix_branchpoints(:,2 )=0;matrix_branchpoints(:,end-1 )=0;
% X Y corrdiantes of branches pixels in matrix
[X,Y]=find(matrix_branchpoints);  
for ii=1:length(X)
    clc
    x=X(ii);
    y=Y(ii);
    ROI=abs(matrix0(x-1:x+1,y-1:y+1));
    matrix_val=[];
    ROI2=zeros(3,3); 
    val=ROI(~isnan(ROI)); 
    if length(val)>=2
        unique_val=unique(val) ;
        
        if length(unique_val)==1
            unique_val=unique(val) ; 
            ROI2(ROI==unique_val)=1;
            ROI2(ROI==unique_val)=1; 
            ROI2=bwmorph(ROI2,'bridge',inf)
            matrix3(x-1:x+1,y-1:y+1)  =ROI2; 
        end 
        if length(unique_val)~=1
            for nn=1:length(unique_val)
                for mm=1:length(unique_val)
                    if nn==mm
                        matrix_val(nn,mm)=inf;
                    else
                        matrix_val(nn,mm)=abs(abs(unique_val(nn))-abs(unique_val(mm)));
                    end
                end
            end  
            Ind2=find(ismember(matrix_val,min(min(matrix_val))));
            Ind2=Ind2(1);
            if matrix_val(Ind2)<15 
                [nn,mm]=ind2sub(size(matrix_val),Ind2) ;
                mm_unique_val=unique_val(mm);
                nn_unique_val=unique_val(nn); 
                ROI2(ROI==mm_unique_val)=1;
                ROI2(ROI==nn_unique_val)=1; 
                ROI2=bwmorph(ROI2,'bridge',inf);
                matrix3(x-1:x+1,y-1:y+1)  =ROI2; 
%                 disp('CASE UNDER DEVELOPMENT'); 
            end
        end
    end
end 
matrix4=matrix4+matrix3; 
matrix2=bwmorph(matrix4,'spur',2); 
matrix2=bwmorph(matrix2,'close',1); 
matrix=double(matrix); 

% step 2: find thin lines and split upon critiria (default ws set by R.S.)
edgeim =    matrix2 ; 
edgelist  = edgelink(edgeim); % Fit line segments to the edgelists
edgelist = cleanedgelist(edgelist, 7);%remove short segments
edgeim = edgelist2image(edgelist, size(edgeim));
[rj, cj, ~, ~] = findendsjunctions( edgeim );

global GFP;
GFP{1} = [300 5 0.03];
GFP{2} = [250 4 0.03];
GFP{3} = [200 3 0.03];  
curve=edgelist; 
curve_num=size(curve,2);

for ii=1:curve_num
    temp=curve{ii};
    curve_start(ii,:)=temp(1,1:2 ); 
    temp=curve{ii};
    curve_end(ii,:)=temp(end,1:2 );
end  
corner_out = get_corner(curve,curve_start,curve_end, curve_num);  
rj(end+1:end+length(corner_out(:,1)))=corner_out(:,1);
cj(end+1:end+length(corner_out(:,2)))=corner_out(:,2); 
Ind=sub2ind(size(edgeim),rj,cj);    edgeim(Ind)=0;
Ind=sub2ind(size(edgeim),rj+1,cj);    edgeim(Ind)=0;  Ind=sub2ind(size(edgeim),rj,cj+1);    edgeim(Ind)=0;
Ind=sub2ind(size(edgeim),rj-1,cj);    edgeim(Ind)=0;  Ind=sub2ind(size(edgeim),rj,cj-1);    edgeim(Ind)=0;

 
L=bwareaopen( edgeim,7,8); 
L_lines=bwlabel( L,8);
L_cells=bwlabel(matrix,4); 
% 
%   figure
%  imagesc(L_lines+L_cells)



s_cells=regionprops(L_cells,'PixelList');
XY=cat(1,s_cells.PixelList);
Ind=sub2ind(size(matrix),XY(:,2),XY(:,1));
Ind_val=L_cells(Ind);
Ind_val_lines=L_lines(Ind); 
matrix3=matrix*0;
for ii=1:max( Ind_val) 
    temp_Ind=find(Ind_val==ii);
    temp2= Ind_val_lines( temp_Ind);
    temp2=unique(temp2(temp2>0)) ;
    if isempty(temp2)~=1
        if length(temp2)>1
            Ind_Area=L_cells==ii; 
            if sum(Ind_Area(:))>500
                matrix3(Ind_Area)=1; %only segments to be splitted 
            end
        end
    end
end 
%  figure
%  imagesc( matrix3)
 
matrix2=L; % only lines of cells to be splitted
matrix= matrix  -matrix3;  %only segments NOT to be splitted
L =bwlabel(matrix3,4);  s=regionprops(L,'Boundingbox' );
for ii=1:size(s,1) 
    XY=s(ii).BoundingBox; 
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
    ROI2=matrix2(X1:X2,Y1:Y2);
    ROI3=L(X1:X2,Y1:Y2) ;
    ROI3(ROI3~=ii)=0; %Only the segment to be splitted
    ROI2= ROI2.*ROI3; 
    LL=bwlabel(ROI2,8); 
    maxi=max(LL(:));
     
    
    ROI_Filtered=  matrix_Filtered(X1:X2,Y1:Y2);
    ROI_Filtered(ROI3==0)=0;

 
    if   maxi>2 && maxi<=5 % most likely 2 cells and more
        ROI3= split_segment_ROI_function(ROI3,ROI_Filtered); 
  
        matrix(X1:X2,Y1:Y2)=matrix(X1:X2,Y1:Y2)+double(ROI3);
     
    elseif maxi>5 % most likely bulb of cells  
        D = bwdist(ROI3);                  
        DL = watershed(D);    
        ROI3( DL == 0)=0;    
        ROI3=bwlabel_max(ROI3, maxi);    
        matrix(X1:X2,Y1:Y2)=matrix(X1:X2,Y1:Y2)+double(ROI3);
    else
        matrix(X1:X2,Y1:Y2)=matrix(X1:X2,Y1:Y2)+double(ROI3);
    end
  
 
    
    %             ROI33=bwlabel_max(ROI3, maxi);
    %            matrix(X1:X2,Y1:Y2)=matrix(X1:X2,Y1:Y2)  + double(ROI3);
    %          end
    
    
    
    %      figure(2)
    %     imagesc(ROI33)
    %     title(num2str(maxi))
    %     pause
    
    
    
end


matrix=matrix>0;





matrix3=bwlabel(matrix,4);
matrix4= matrix3;

matrix2=matrix*0;
matrix2(1:end,1:2)=1; matrix2(1:end,end-1:end)=1;
matrix2(2,1:end)=1; matrix2(end-1:end,1:end)=1;

matrix3=matrix2.*matrix3   ;


matrix3=matrix3(:);
matrix3(matrix3==0)=[];
matrix3=unique(matrix3);
matrix5= (ismember(matrix4,matrix3));

matrix(matrix5==1)=0;





matrix_out=matrix;
 

