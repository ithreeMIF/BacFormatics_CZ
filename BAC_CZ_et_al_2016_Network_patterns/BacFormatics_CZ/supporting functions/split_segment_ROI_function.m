 function ROI_out =  split_segment_ROI_function(matrix_bw,matrix_Filtered)
%   save matrix_bw matrix_bw
%   save matrix_Filtered matrix_Filtered
% load matrix_Filtered
% load matrix_bw
%  figure(1)
%   imagesc(matrix_bw)

%  If the output is two cell segments, than need to keep minimum ratio of area
ROI_in=matrix_bw;
matrix_bw=matrix_bw>0;


% if isonecell(matrix_bw)
%     disp('Segment  is one cell. Aboty spliting')
%    pause
%     matrix_bw2=matrix_bw;
%     return
% end

NumL1=max(max(bwlabel(matrix_bw,4)));
NumL2=NumL1;
try
matrix_bw2= Split_Xaxis_delta(matrix_bw, matrix_Filtered) ;
NumL2=max(max(bwlabel(matrix_bw2,4)));
end
 
if NumL1==NumL2
    disp(' Split_Xaxis_delta could not split the segment. Trying watershed_split_delta_classify instead')
    matrix_bw2= watershed_split_delta_classify(matrix_bw) ;
    NumL2=max(max(bwlabel(matrix_bw2,4)));
    if NumL1==NumL2
        disp('watershed_split_delta_classify could not split the segment. Trying Otsu instead')
        matrix_bw2= Split_ROI_Otsu(matrix_bw, matrix_Filtered) ;
        NumL2=max(max(bwlabel(matrix_bw2,4)));
        if NumL1==NumL2
            disp('Otsu could not split the segment. Trying South_North_function instead')
            matrix_bw2= South_North_function(matrix_bw) ;
            NumL2=max(max(bwlabel(matrix_bw2,4)));
            if NumL1==NumL2
              matrix_bw2=matrix_bw; 
            end
        end
    end
end

%  If the output is two cell segments, than need to keep minimum ratio of area
ROI_out=matrix_bw2;


L=bwlabel(ROI_out,4);

if max(L(:))==0 %use only two largest segments
        ROI_out=ROI_in; 
end

if max(L(:))==2 %use only two largest segments 
    L1=L==1;L1=sum(L1(:)); L2=L==2; L2=sum(L2(:));
    if (abs(L1-L2))/(L1+L2)>0.5
        ROI_out=ROI_in; 
    end
end
 

if max(L(:))>2 %use only two largest segments
        ROI_out=ROI_in; 
end