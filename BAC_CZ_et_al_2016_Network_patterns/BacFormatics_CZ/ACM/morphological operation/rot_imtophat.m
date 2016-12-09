function matrix_out =rot_imtophat(matrix_in) 
 SE = [1 1 1 1];  
matrix1=imtophat(matrix_in,SE);   
matrix2=imtophat(matrix_in,SE');   
SE = [1 0 0; 0 1 0; 0 0 1];  
matrix11=imtophat(matrix_in,SE);  
SE=flipdim(SE,1);
matrix22=imtophat(matrix_in,SE); 
matrix1=double(matrix1);matrix1=matrix1./max(max(matrix1)); 
matrix2=double(matrix2);matrix2=matrix2./max(max(matrix2)); 
matrix11=double(matrix11);matrix11=matrix11./max(max(matrix11)); 
matrix22=double(matrix22);matrix22=matrix22./max(max(matrix22));  

temp=matrix1+ matrix2 + matrix11 +matrix22 ;

 matrix_out=uint8(temp.*255);