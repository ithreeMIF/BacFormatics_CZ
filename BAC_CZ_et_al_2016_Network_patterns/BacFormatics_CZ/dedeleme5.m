 figure
 global v1 v2 matrixColormap
% x = [0 1;1 1;0 0];
% y = [2 2;2 1;1 1];
 x=v1;
 y=v2;
  
 clear tcolor
 for ii=1:317
     
  tcolor(1,ii,1:3) = matrixColormap(ii,:);
     
 end
   
% tcolor(1,1,1:3) = [1 1 1];
% tcolor(1,2,1:3) = [.7 .7 .7];
patch(x,y ,tcolor)
