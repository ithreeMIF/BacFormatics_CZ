 
load matrix_bw
load matrix_Filtered 


figure(1)
imagesc(matrix_bw)


matrix_bw=matrix_bw>0;

NumL1=max(max(bwlabel(matrix_bw,4)))

matrix_bw2= Split_Xaxis_delta(matrix_bw, matrix_Filtered) ;
NumL2=max(max(bwlabel(matrix_bw2,4)))
figure(2)
imagesc(matrix_bw2)



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
                 disp('Could not plit segment')
                 matrix_bw2=matrix_bw;                 
            end
        end
    end
end


figure(2)
imagesc(matrix_bw)

pause