function [matrix_out]=spaps_smooth(matrix_in,level) 
%Function for spline smoothing of a 2-D input matrix
matrix_in=double(matrix_in);
sizexy=(size(matrix_in,1)+size(matrix_in,2))/2 ; 
x=-1:2/(sizexy-1):1; 
[~,matrix_out] = spaps({x,x},matrix_in,sizexy*level);  
 