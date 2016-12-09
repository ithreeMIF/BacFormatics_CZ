function [vec_out1,vec_out2]=allocate_nans(Ind,sizeX)
vec_out1=zeros(1,sizeX);
vec_out2=[];

%     8    13    14    15    18
%     8    13    14    15    
%     8    13    14    
%     8    13    
%     8    
%     
%     1
%      ***************  
%     
%     
%    13    14    15    18
%    13    14    15
%    13    14 
%    13 
%    
%    3
%    
%   *************** send ii 2 steps forwared
%     14    15    18
%      14    15 
%       14 
%     2
%       
%       15    18
%       15
%       1
%     **************  
%       18
%       1
%     
 
ii=1;Counter=1;
while ii<length(Ind)+1 
  
     v1=Ind(ii:end) ;
    
     maxi=1;
    for jj=0:length(v1)-1
     
    v2=v1(1:end-jj) ;
    
      try
    if mean(diff(v2) == ones(1,length(v2)-1))==1
       if  maxi<length(v2) 
           maxi=length(v2) ;
       end 
    end 
      end
    
    
    
    
    
    end
    
 
       
vec_out1(Ind(ii)+maxi)=maxi+1;
vec_out2(Counter)=Ind(ii)+maxi ;
  Counter=Counter+1;
     
 
  ii=ii+maxi ;
  
      
    
end
