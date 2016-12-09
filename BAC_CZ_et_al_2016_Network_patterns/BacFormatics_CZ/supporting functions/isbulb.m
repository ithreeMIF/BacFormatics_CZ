function [ output_args ] =isbulb(ROI)
output_args=0;
ROI_thin=bwmorph(ROI,'thin');
ROI_endpoints=bwmorph(ROI_thin,'endpoints');
if sum(ROI_endpoints(:))<3
    disp('less than 4 termination points. Segment is not a bulb')
    return
end

L=bwlabel(ROI,4);
s=regionprops(L,'Boundingbox','Orientation','MinorAxisLength','Area');
if  s.MinorAxisLength<30
    %     disp('MinorAxisLength < 30 pixels.  Segment is not one cell')
    return
end
if  s.Area<1000
    %     disp('	Area < 500 pixels.  %segment is not a bulb')
    return
end

Orientation=s.Orientation;

if  Orientation<90
    Orientation=Orientation-90 ;% imrotate rotate in a counterclockwise direction , so orientation angle must be negative
elseif    Orientation>90
    Orientation=90-Orientation ;
end
ROI=imrotate(ROI,-Orientation);
v  =nansum(ROI);
max_ind=peakfinder_BACWrapper(v);
if sum(imregionalmax(v))==1 & length(max_ind)==1
    %         disp('Can`t detect multiple local minima of x projected intensity. Segment is not a bulb!')
    return
end

output_args=1;


