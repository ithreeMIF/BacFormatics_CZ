function [G W] = makeGFilter();

GaussianDieOff = .0001; 
pw = 1:100;
sig = 5;
for i = 1:3
    ssq = sig*sig;
    width = max(find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff));
    if isempty(width)
        width = 1;  
    end
    t = (-width:width);
    gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq); 
    gau=gau/sum(gau);
    G{i} = gau;
    W(i,1) = width;
    sig = sig-1;
end
%here = 1;