function [ output_args ] =isonecell(ROI)
output_args=1; %segment in one cell: 1 is true, 0 is false
L=bwlabel(ROI);
s=regionprops(L,'Boundingbox','Orientation','MinorAxisLength','Area');
if  s.MinorAxisLength>30
    disp('MinorAxisLength > 30 pixels.  Segment is not one cell')
    output_args=0;
    return
end
if  s.Area>1000
    disp('	Area > 1000 pixels.  Segment is not one cell')
    output_args=0;
    return
end


 Orientation=s.Orientation
% title(num2str(Orientation))
% 

if  Orientation<90
    Orientation=Orientation-90 ;% imrotate rotate in a counterclockwise direction , so orientation angle must be negative
elseif    Orientation>90
    
    Orientation=90-Orientation ;
end
ROI=imrotate(ROI,-Orientation); 
v  =nansum(ROI);
v=smooth(v) ;


if  sum(imregionalmax(v))==1 % only one peak, abort
    disp('could not detect local minima of x projected intensity') 
else
    max_ind=peakfinder_BACWrapper(v);
    if length(max_ind)<2
        disp('could not detect local minima of x projected intensity') 
    else
        disp('Can detect local minima of x projected intensity. Segment is not one cell')
        output_args=0;
        return
    end
end
%
%
%
% max_ind=peakfinder_BACWrapper(v);
% if length(max_ind)<2
% 'less than 2 maxima. r.s to fix that'
% pause
% end
% Start=min(max_ind);
% End=max(max_ind);
%
%
% W=round((End-Start)/8);
% M=round((End+Start)/2);
%
%
% v2=v(M-W:M+W) ;
%
%
% v3=smooth(v2,length(v2)/2);
% [~,ind]=min(v3);
% % therfore the x location of the valley is:
% ind=M-W-1+ind;
%


