function[avg] = Moving_Average(n,segmentation_type,trackwhat, start_MA_frame,end_MA_frame)

  
global Projected_by
global box_Raw 
  
    
jj = 1;
for ii = start_MA_frame : end_MA_frame
    filename=char(box_Raw(ii))  ; 
    matrix_out  = read_image2(ii,segmentation_type,Projected_by, filename,trackwhat)  ;
  
    if ii==start_MA_frame
        avg= double(matrix_out*0) ;
    end
    avg = ((avg*(jj-1)+double(matrix_out)))/jj ;  jj=jj+1 ;
end 
 
%     [temp,centy1] = read_image_visualization(handles,current_image,segmentation_type);
%           matrix_out= wfusimg(avg,temp,'db2',5,'mean','mean');  % if you dont have the Wavelet Toolbox

% matrix_out = temp;

 