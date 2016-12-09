 function [nVDAC, VDAC, VDACe, thetadist] = vdorient_autocorr_BACWrapper(MATRIX_ori,C, nsmooth)
% %DO NOT EDIT_________________________________________________________________ 
% This file is located in BacFormatics open code library.
% All rights reserved to its original authors.
% Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
% Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
% Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer 
% in the documentation and/or other materials provided with the distribution.  
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
% THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
% INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
% OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
% THE POSSIBILITY OF SUCH DAMAGE. .
% Important: This file may include some code editing to enable incorporation with BacFormatics Toolbox
% ___________________________________________________________________________

 
%  Code is taken from 

% Inputs:
 
% nsmooth=0 _BACWrapper
 

% nsmooth - no of images to be used for moving average to perform smoothing
%         - 0 if no smoothing is to be applied
%
% Outputs:
% nOAC - vector; nOAC(i) is the number of cell trajectories that have lasted
%        at least i frames; note that even trajectories that start 
%        from frames other than starting frame are counted.
% OAC -  vector; OAC(i) is the orientational autocorrelation after i-frames
% OACe - vector; std. error on OAC(i)

 
NF = size(MATRIX_ori,1) ;%size(data,1);
nOAC = zeros(NF+nsmooth+1,1);
OAC = zeros(NF+nsmooth+1,1);
OACe = zeros(NF+nsmooth+1,1);
 
 
theta0 = zeros(NF+nsmooth+1,1);
    
    
for IF = 1:size(MATRIX_ori,2)
    
   temp= MATRIX_ori(:,IF);
   temp2=temp./temp; temp2(isnan(temp2))=0;
   
    Ind_0=find(ismember(temp2,0));
    temp(Ind_0)=[];
    
   KF=NF-length(Ind_0); 
   theta = theta0;
   theta(1:length(temp))=temp*pi/180;
   
 
        
        % forward-smoothing
        if nsmooth~=0
            for k = 1:KF+1
                %disp(num2str([KF k k+nsmooth NF+nsmooth+1]))
                theta(k) = mean(theta(k:k+nsmooth));
            end
        end
        
        
        
        
        
        
        nOAC(1:KF+1) = nOAC(1:KF+1)+1;
        temp = abs(theta(1:KF+1) - theta(1));
        idx = find(temp > pi/2);
        temp(idx) = pi - temp(idx);
        
       
        
        temp =  cos(temp) ;
        %plot(temp); pause
        OAC(1:KF+1) = OAC(1:KF+1) + temp;
        OACe(1:KF+1) = OACe(1:KF+1) + (temp).^2;
         
end
 

idx = find(nOAC); % only look at frame-diffs that have non-zero cells

OAC(idx) = OAC(idx)./nOAC(idx);
OACe(idx) =  OACe(idx)./nOAC(idx);
OACe(idx) = OACe(idx) - OAC(idx).^2;
OACe(idx) = sqrt(OACe(idx)./nOAC(idx));

nOAC = nOAC(idx);
OAC = OAC(idx);
OACe = OACe(idx);



% end
 
errorbar(0:(length(nOAC)-1),OAC,OACe,'-','Color',C)


 
  
 
 
