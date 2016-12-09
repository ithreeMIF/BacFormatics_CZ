% This script is the deom for using ACM (Chan-Vese model) to segment
% bacterial cells.
% Prepared by Bin Wang, 18 Oct. 2015

clc, close all; clear


raw = imread('example_t_2_ch00.tif');  
matrix =  bio_preproc(raw) ;  
bw= ac_evolve(matrix);
 figure;imagesc(bw)

% % render the final result on image to be segmented
% figure,imshow(im,[],'border','tight');hold on;
% contour(phi2,[0 0],'m'); hold off;
% 
       