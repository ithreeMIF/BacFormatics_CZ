function [ out ] = bio_whosbg( phi,areaRange )
% This function is an auxiliary function that determine wich region should be background or cells
% compared to phi<0 or phi>0
% prepared by Bin Wang, 18, Oct 2015.

bw1 = phi<0;
bw2 = phi>0;

CC1 = bwconncomp(bw1,4);
CC2 = bwconncomp(bw2,4);

% remove the small and big regons
P1 = regionprops(CC1,'Area');
P2 = regionprops(CC2,'Area');
idx1 = find([P1.Area]>areaRange(1) & [P1.Area]<areaRange(2));
idx2 = find([P2.Area]>areaRange(1) & [P2.Area]<areaRange(2));
L1 = labelmatrix(CC1);
L2 = labelmatrix(CC2);
bw1 = ismember(L1,idx1);
bw2 = ismember(L2,idx2);


CC1 = bwconncomp(bw1,4);
CC2 = bwconncomp(bw2,4);
L1 = labelmatrix(CC1);
L2 = labelmatrix(CC2);

if max(L1(:)) > max(L2(:))
    out = bw1;
else
    out = bw2;
end

end

