%% ________________BacFormatics Code starts here:________________  
function matrix_out=watershed_split_delta3(matrix_in)  





 matrix_out=matrix_in;
try                  
matrix_in=matrix_in./max(max(matrix_in))  ;                  
end 
            
        
       
se = strel('disk',2);                  
erodedBW = imerode(matrix_in,se);   


 

 
 
 
jj=1;                  
while max(max(bwlabel(erodedBW)))==1 && jj<5                  
erodedBW = imerode(erodedBW,se);                  
jj=jj+1;                  
end


%  
if jj==10 || (max(max(erodedBW )) == 0  )                  
return                  
end                  
                
mask_em = bwlabel_max(erodedBW,2);  % select 2 largest segments                  
hy = fspecial('sobel');                  
hx = hy';                  
Iy = imfilter(double(mask_em), hy, 'replicate');                  
Ix = imfilter(double(mask_em), hx, 'replicate');                  
gradmag = sqrt(Ix.^2 + Iy.^2);                  
gradmag2 = imimposemin(gradmag,   mask_em);                  
L = watershed(gradmag2);     





if length( unique(L))~=1 
 
  matrix_in(L==0)=0;  
                
matrix_in=bwlabel_max(matrix_in,2,4);   
matrix =bwlabel(matrix_in,4);  
  matrix_out=logical(matrix);  
 
 
 
 