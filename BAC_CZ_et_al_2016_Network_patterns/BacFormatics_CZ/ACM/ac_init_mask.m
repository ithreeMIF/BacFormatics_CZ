function [ out ] = ac_init_mask( imSize,num,margin,shape )
% imSize: the size of the image to be segmented
% num: a 2-element vector to specify the number of elements
% shape: is the shape of elements.
% Prepared by Bin Wang, oct. 2010.

out = zeros(imSize);
ele_width = (imSize(2)-(num(2)+1)*margin)/num(2);
ele_height = (imSize(1)-(num(1)+1)*margin)/num(1);

[x,y] = meshgrid(1:size(out,2),1:size(out,1));
cx = zeros(1,num(2));
cy = zeros(1,num(1));
for i = 1:num(2)
    cx(i) = i*(margin+ele_width)-ele_width/2.0;
end
for i = 1:num(1)
    cy(i) = i*(margin+ele_height)-ele_height/2.0;
end

if strcmpi(shape,'circle')
    radius = min(ele_width,ele_height)/2.0;
    for i=1:numel(cx)
        for j = 1:numel(cy)
            out(((x-cx(i)).^2 + (y-cy(j)).^2) <= radius^2) = 1;
        end
    end
elseif strcmpi(shape,'patch')
    radius = min(ele_width,ele_height)/2.0;
    for i=1:numel(cx)
        for j = 1:numel(cy)
            out(abs(x-cx(i)) + abs(y-cy(j)) <= radius) = 1;
        end
    end
elseif strcmpi(shape,'rectangle')
    for i=1:numel(cx)
        for j = 1:numel(cy)
            out(cx(i)-ele_width/2:cx(i)+ele_width/2,cy(j)-...
                ele_height/2:cy(j)+ele_height/2) = 1;
        end
    end
else
    disp('need to assign the shape');
    return;
end
out = double(out);
end

