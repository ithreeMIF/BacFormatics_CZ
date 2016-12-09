function [ out ] = bio_preproc( im )
%image processing technuiqe written by R.S to enhance the cells`s pixels prior segmentaion
%that integrated edge detection and segmention of th "net" of the space
%between the cells
im = double(im);
% % convert the raw data into gray image
 im = mat2gray(im); 

SE = strel('disk',1);
matrix2  = imerode(im,SE);

% Invert image (to 8 bits)'
matrix3=double(matrix2) ;
matrix3=255*(matrix3./(max(max(matrix3))));
matrix3=uint8(matrix3);
matrix4=255-matrix3;

% 
matrix6=rot_imtophat(matrix2); %   enhancement of the empty background betwneen the cells ("net") using top-hat
matrix7= noisecomp_BACWrapper(matrix6,19,4); %   denoising the net to remove pixels from inside the cells

% bw=im2bw(matrix7,0.99);
bw=im2bw(matrix7,graythresh(matrix7));
matrix_dist=bwdist(bw);
L=zeros(size(bw));  
L(matrix_dist==2)=1;
L(matrix_dist==1)=1; 
temp=bw;temp=temp-L;
temp(temp~=1)=0 ;

CC = bwconncomp(temp,4);
L = labelmatrix(CC);
stats = regionprops(CC,'Area');
idx = find([stats.Area] > 50); %remove isloated pixels
matrix8 = ismember(L,idx) ;


temp2 = im ;  %the raw image
temp2 = edge(temp2,'log' ); %edge detection using Laplacian of Gaussian
temp1 = double(matrix8)+temp2; % merging the net with edges of the cell
temp1(temp1>0) = 1;
SE = strel('disk',1 ) ;
temp1 = imclose(temp1,SE);

temp3 = matrix4 ;  %the inversed raw image
SE = strel('disk',5) ;
temp3 = imsubtract(imadd(temp3,imtophat(temp3,SE)), imbothat(temp3,SE));
temp3 = double(temp3);
temp3 = 255*(temp3./(max(max( temp3))));
temp3 = uint8(temp3);

temp3(temp1==1)=0;
out = temp3;

end

