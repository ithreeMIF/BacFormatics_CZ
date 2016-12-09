global MATRIX_data_displacement MATRIX_data_leading_polar_direction_angle


Close
  
 Counter=0;vec=[]
for ii=1:500%size(MATRIX_data_leading_polar_direction_angle,2)  
     
b= MATRIX_data_leading_polar_direction_angle(1:300,ii); 
 
if (length(find(~isnan(b)))/length(b))>0.80
    Counter=Counter+1
    vec(Counter)=ii 
end
end