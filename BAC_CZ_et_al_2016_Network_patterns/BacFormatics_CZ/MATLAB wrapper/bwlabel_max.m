function [ matrix_out] = bwlabel_max(matrix_in,N,Mode)
% Function to label only N selected segments (selected by size)
% N number of segments
  matrix_out=matrix_in*0;
  
  if nargin<3
     Mode=4; %default
%      Mode=8;
 end
  if nargin<2
     N=1;
  end
 
 
   
 L=bwlabel(matrix_in,Mode); L(L==0)=nan;
         if isempty(L)~=1 
             if max(max(L))>0
                            z=hist(L(:),max(max(L)));
                            [~,b]=sort(z,'descend');
                                for ii=N+1:max(max(L))
                                     Index= ismember(L,b(ii)); 
                                     L(Index)=NaN;
                                end 
                             matrix_out= (uint8(L)./uint8(L));
             end 
         end
 