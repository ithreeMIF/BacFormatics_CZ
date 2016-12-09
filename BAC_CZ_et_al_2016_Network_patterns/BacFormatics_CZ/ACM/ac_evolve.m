  function [bw] = ac_evolve(matrix) 
matrix=double(matrix);

% 
% 
% figure
% imagesc(matrix)
% 
% pause



% prepared by Bin Wang, 17 Oct. 2015
% evolve the closed curve to convergence 
 
% automatically initialize curve on a binary image 
num = [5,5];
margin = 5;
% create the binary image 
bw = ac_init_mask(size(matrix),num,margin,'circle');
% create the level set function phi in a pretty rough way
phi = double(8*(bw-.5));
% render the initial curves on the original image 
  
% set the defalut value of rendering parameters 
mu = .01 ;% This parameter controls the elastic of curve
nu = 0;
sigma = 5; % This parameter is for the regularization of Dirac function
epsilon = 5;% This parameter is for the regularization of Heaviside function
lambda = [.5,.5,.1] ;% This parameter is coefficient for inside/outside fitting terms, respectively
iter_num = 30; 
cellsize =[20,4000];% This parameter specify the range of normal size for bacterial cells
regmode ='direct'; % optioins: 'iteration' and 'direct'% This parameter controls the introduction mode of shape prior, 'iteration' for refine the 
fitting_num =10 ;% This parameter determines the numbers of iteration for involve shape prior
bFitting = 0 ;% This parameter determines whether involving the shape prior into segmentation 
time_step = 10 ;% This parameter is an artfifical variable for iteration (increamental value)

 
P = zeros(size(matrix));
for i = 1: iter_num 
    % evovle the curve via semi-implicit scheme for PDE, which allows a
    % large value for time_step.
    phi = semi_implicit_scheme( phi,matrix, time_step, mu, nu, lambda, sigma, epsilon, P ); 
    fprintf(1,'The segmentation procedure %d iteratios.\n',i);
end





% Determine which region (phi<0 or phi>0) the object is, and remove the background
bw = bio_whosbg(phi,cellsize); 
bw=bw<1; bw=~bw;
 
% figure
% imagesc(bw)
% pause
%  
