function [xl yl L_aff ind] = affine_length(x,y,L);
xu=[x(2)-x(1) ; (x(3:L)-x(1:L-2))/2 ; x(L)-x(L-1)];
yu=[y(2)-y(1) ; (y(3:L)-y(1:L-2))/2 ; y(L)-y(L-1)];
xuu=[xu(2)-xu(1) ; (xu(3:L)-xu(1:L-2))/2 ; xu(L)-xu(L-1)];
yuu=[yu(2)-yu(1) ; (yu(3:L)-yu(1:L-2))/2 ; yu(L)-yu(L-1)];

L_aff = floor(abs(sum((xu.*yuu-xuu.*yu).^(1/3))));
seg_al = 1.0;
al = 0; j = 1; t = seg_al;
for i=1:L
    al = al + (xu(i,1)*yuu(i,1)-xuu(i,1)*yu(i,1))^(1/3);
    if abs(al)-t>=0
        xl(j,1) = x(i,1);
        yl(j,1) = y(i,1);
        ind(j,1) = i;
        j = j+1;
        t = seg_al*j;
    end
end
%if L_aff>size(ind,1)
%    xl(L_aff,1) = x(L,1);
%    yl(L_aff,1) = y(L,1);
%    ind(L_aff,1) = L;
%end