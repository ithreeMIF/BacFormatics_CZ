
function [ C ] = phasecolor_BACWrapper(theta, percentage )
 if  isnan(theta) | isnan(percentage)
    C=nan; 
     return
 end
%DO NOT EDIT_________________________________________________________________ 
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

 
%  Code is taken from phasecolor.m Copyrights of Tzu Yen Wong
% % wongt AT csse DOT uwa DOT edu DOT au
% % Department of Computer Science & Software Engineering
% % The University of Western Australia 
% % Oct 2003
   
 

    
    r = 100 ;
    hsvCircle = ones(2*r+1,2*r+1,3);
    xCoord = ones(2*r+1,1)*[1:2*r+1] - (r+1);    
    yCoord = flipud([1:2*r+1]'*ones(1,2*r+1)- (r+1));
    circle = xCoord.^2+yCoord.^2 < (r)^2;
    circle(:,:,2)=circle;
    circle(:,:,3)=circle(:,:,1);
    
   
    hsvCircle(:,:,1)=atan(yCoord./xCoord)*180/pi; 
    % make theta into range [0,360] instead of [-180,180]
    hsvCircle(:,1:r,1) = hsvCircle(:,1:r,1) + 180;      % 2nd, 3rd Quadrant
    hsvCircle(r+1:end,r+1:end,1) = hsvCircle(r+1:end,r+1:end,1) + 360; % 4th Quadrant
    
    % make angle into range [0,1] for hsv color
    hsvCircle(:,:,1) = hsvCircle(:,:,1)/360;
    
   
        
    rgbCircle=hsv2rgb(hsvCircle);
    rgbCircle=rgbCircle.*circle;
    rgbCircle=uint8(rgbCircle*255);
  
%       imagesc(rgbCircle)
%      hold on
%  
 
    angleRad=theta*pi/180;     
    try
        % sin and cosine work in Rad
        x =r+r*percentage*cos(angleRad);    y =r+percentage*r*sin(angleRad);
        catch
         x =r+r*percentage.*cos(angleRad);    y =r+percentage*r.*sin(angleRad);
    end
        x=round(x);y=round(y);
%   plot(x ,y ,'+m')
%  save x x
%  save y y
% save  rgbCircle rgbCircle


% save all
% try
%      C=[rgbCircle(x,y,1)/255 rgbCircle(x,y,2)/255 rgbCircle(x,y,3)/255];
% catch  
 C=[];
for ii=1:length(x)
    if ~isnan(x(ii)) &     ~isnan(y(ii))  
C(ii,:)=[rgbCircle(x(ii),y(ii),1) rgbCircle(x(ii),y(ii),2) rgbCircle(x(ii),y(ii),3)];
    else
        C(ii,:)=[nan nan nan];
    end
    
end 
% end

C=double(C);C=C/255 ;
 