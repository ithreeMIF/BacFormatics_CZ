function [ matrix_out ] = imfill_bwlabel(matrix_in)
  
 L =bwlabel(matrix_in,4); 
 s=regionprops(L,'Boundingbox' ); 
matrix_out=zeros(size(matrix_in));
 
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
                    
                    ROI_L=  L(X1:X2,Y1:Y2) ;  
                    ROI_bw= ROI_L==ii; %Only the segment to be splitted
                    ROI_bw=imfill(ROI_bw,'holes'); 
                    matrix_out(X1:X2,Y1:Y2)=matrix_out(X1:X2,Y1:Y2)  + ROI_bw;
%                     figure(1)
%                     imagesc(matrix_out)
                end

 
   matrix_out(matrix_out>0)=1;