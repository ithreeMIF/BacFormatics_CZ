function [ prior ] = ac_ellipsefit( bwPhi,varargin )

% Setting the default values to parameters
p = inputParser;
p.addParamValue('Area',[10,3000]);
% Parsing the input parameters
p.parse(varargin{:});
thldArea = p.Results.Area;

out = zeros(size(bwPhi));
% Step1: Remove the small and big regions out of the specified range
bwPhi = imopen(bwPhi,strel('disk',2));
% bwPhi = imclose(bwPhi,strel('disk',1));
CC = bwconncomp(bwPhi,4);
P = regionprops(CC,'EulerNumber');
idx = find([P.EulerNumber]==1);
bwPhi = ismember(labelmatrix(CC),idx);

CC = bwconncomp(bwPhi,4);
P = regionprops(CC,'Area','Centroid','Orientation','EulerNumber',...
    'MajorAxisLength','MinorAxisLength','Eccentricity');
idx = find([P.Area]>thldArea(1)...
    & [P.Area]<thldArea(2));



% idx_valid = find([P.Area]>thld.Area(1)...
%     & [P.Area]<thld.Area(2)...
%     & [P.MajorAxisLength]>thld.MajorAxisLength(1)...
%     & [P.MajorAxisLength]<thld.MajorAxisLength(2)...
%     & [P.MinorAxisLength]>thld.MinorAxisLength(1)...
%     & [P.MinorAxisLength]<thld.MinorAxisLength(2)...
%     & [P.Eccentricity]>thld.Eccentricity(1)...
%     & [P.Eccentricity]<thld.Eccentricity(2));
for i = 1:numel(idx)
    it = idx(i);
    centroid = P(it).Centroid;
    orientation = -P(it).Orientation;
    major = .45*P(it).MajorAxisLength;
    minor = .5*P(it).MinorAxisLength;
    ratio = major/minor;
    if ratio < 5
        ratio = 5;
    end
    out = out + draw_ellipse(centroid(2),centroid(1),...
        major,major/ratio,...
        orientation,...
        zeros(size(bwPhi)),1);
end

% Step3: remove the overlapped regions
% out = imopen(out==1,strel('disk',1));
prior = out==1;
end


