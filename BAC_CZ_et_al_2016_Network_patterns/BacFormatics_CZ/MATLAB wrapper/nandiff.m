
  function [Vec_out]=nandiff(vec_in)
  vec_in0=vec_in;
%   The function treat 0 numbers as values

%   The function has 4 stages
%   1. Preproccesing:
% assuming the vector:
% vec_in=[11    12    13    14    15    16    17   NaN    19    21    23    29   NaN   NaN   NaN    21     4   NaN     7]
% that needs to caluclate the difference without the NaNs , and to cover
% the missing points, or the function can be feeded with the next input vector:
% vec_in=[ NaN  11    12    13    14    15    16    17  19    21    23    29   NaN   NaN   NaN NaN ]
% (no missing points that can be recovered) 



vec_ones= ~isnan(vec_in);
Ind0= find(vec_ones);



if isempty(Ind0)==1
    Vec_out=vec_in; 
    return
end
% Ind=[ 1     2     3     4     5     6     7     9    10    11    12    16    17    19]
% Ind=[  2     3     4     5     6     7     8     9    10    11    12
  

% trim the end: 
if Ind0(end)~=length(vec_in0) %need to trim the end 
    vec_in(Ind0(end)+1:end)=[];
end
 
if Ind0(1)~=1 %need to trim the beginning 
    vec_in(1:Ind0(1)-1)=[];
end

%   vec_in=[ 11    12    13    14    15    16    17    19    21 23 29]
    
    
% stage 2: counts missings points
    

 
Ind=find(isnan(vec_in));% Ind=[8    13    14    15    18]; 

 [vec_nans,Ind2]=allocate_nans(Ind,length(vec_in));

 if isempty(Ind2)%not nans values to recover
    % stage 3: calculate diff 
   z2=vec_in; z3=diff(z2);

vec_out=nan(size(z2));  vec_out(2:end)=z3; 
 else
% stage 3: calculate diff
z2=vec_in;z2(Ind)=[]; z3=diff(z2);

z33=nan(size(z2)); z33(2:end)=z3;z3=z33;



z4=nan(size(vec_in)); 
% z5=setxor(1:length(vec_in),Ind);
z4(setxor(1:length(vec_in),Ind))=z3;
 % stage 4 (optional): consider the counts of missing points
z4(Ind2)=z4(Ind2)./vec_nans(Ind2);
  
for ii=2:length(z4)-1 
    Index=length(z4)-ii+1;
    if isnan(z4(Index))
        z4(Index)=z4(Index+1);
    end
end

vec_out=z4; 
 end
 
 % stage 5 adding the trimed beggining and end (if were removed)
 
 
 Vec_out=nan(size( vec_in0));
 
 Vec_out(Ind0(1):Ind0(end))= vec_out;
 
 
 
 
 