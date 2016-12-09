% 1. open new figure

h=figure;

% 2. load and show raw image (optional) in gray color
load  raw_image
imagesc(raw_image)
colormap(gray)
hold on 
% 3. load matrixcolormap and set the colors deifned by matrixcolormap
% the matrixcolormap is the same length as p1 and p2, its derived from the theta angles

hh=get(h,'children')
load matrixColormap
set(hh ,'ColorOrder' , matrixColormap)
% 4. plot the lines
% p1 and p2 are polar points of each cell
load p1;load p2;
line([p2(:,1)  p1(:,1)]',[p2(:,2)  p1(:,2)]' )
