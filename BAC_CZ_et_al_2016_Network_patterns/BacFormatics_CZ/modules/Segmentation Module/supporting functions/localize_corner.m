% Localize corners at lower scales down to sigma = 0.7
function [corner_out c2] = localize_corner(curve,curve_mode,curve_num,index,c1,S,curveAL,IND); % localize corners
%global GFP;
%GFP{1} = [300 7 0.02]; % col1 = affine-length, col2 = sigma, col3 = Threshold
%GFP{2} = [250 6 0.03];
%GFP{3} = [200 5 0.04];
%GFP{4} = [150 4 0.05];
%GFP{5} = [100 3 0.06];
%GFP{6} = [50 2 0.07];
%GFP{7} = [4 1 0.08];

corner_out = [];
c2 = [];
neighbor = 3;
%[GF width] = makeGFilter();
%final = 0;
GaussianDieOff = .0001; 
pw = 1:30;
for sig = max(S)-1:-1:1
    %if sig == 1
    %    final = 1;
    %end
    ssq = sig*sig;
    width = max(find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff));
    if isempty(width)
        width = 1;  
    end
    t = (-width:width);
    gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq); 
    gau=gau/sum(gau);
    for i=1:curve_num
        if sig ~= S(i,1)-1
            continue;
        else
        S(i,1) = S(i,1)-1;
        xL = curveAL{i}(:,1);
        yL = curveAL{i}(:,2);
        W=width;        
        L_aff = size(xL,1);
        if L_aff>W & size(index{i},1)>0
            %expand the ends to gaussian window                      
            if curve_mode(i,:)=='loop' % wrap around the curve by W pixles at both ends
                x1=[xL(L_aff-W+1:L_aff);xL;xL(1:W)];
                y1=[yL(L_aff-W+1:L_aff);yL;yL(1:W)];
            else % extend each line curve by W pixels at both ends
                x1=[ones(W,1)*2*xL(1)-xL(W+1:-1:2);xL;ones(W,1)*2*xL(L_aff)-xL(L_aff-1:-1:L_aff-W)];
                y1=[ones(W,1)*2*yL(1)-yL(W+1:-1:2);yL;ones(W,1)*2*yL(L_aff)-yL(L_aff-1:-1:L_aff-W)];
            end

            
            xx=conv(x1,gau);
            xx=xx(W+1:L_aff+3*W);
            yy=conv(y1,gau);
            yy=yy(W+1:L_aff+3*W);
            
            Xu=[xx(2)-xx(1) ; (xx(3:L_aff+2*W)-xx(1:L_aff+2*W-2))/2 ; xx(L_aff+2*W)-xx(L_aff+2*W-1)];
            Yu=[yy(2)-yy(1) ; (yy(3:L_aff+2*W)-yy(1:L_aff+2*W-2))/2 ; yy(L_aff+2*W)-yy(L_aff+2*W-1)];
            Xuu=[Xu(2)-Xu(1) ; (Xu(3:L_aff+2*W)-Xu(1:L_aff+2*W-2))/2 ; Xu(L_aff+2*W)-Xu(L_aff+2*W-1)];
            Yuu=[Yu(2)-Yu(1) ; (Yu(3:L_aff+2*W)-Yu(1:L_aff+2*W-2))/2 ; Yu(L_aff+2*W)-Yu(L_aff+2*W-1)];
            Xuuu=[Xuu(2)-Xuu(1) ; (Xuu(3:L_aff+2*W)-Xuu(1:L_aff+2*W-2))/2 ; Xuu(L_aff+2*W)-Xuu(L_aff+2*W-1)];
            Yuuu=[Yuu(2)-Yuu(1) ; (Yuu(3:L_aff+2*W)-Yuu(1:L_aff+2*W-2))/2 ; Yuu(L_aff+2*W)-Yuu(L_aff+2*W-1)];
            
            a = Xu.*Yuu-Xuu.*Yu;
            b = Xuuu.*Yu-Xu.*Yuuu;
            
            Xt = Xu./(a.^(1/3));
            Yt = Yu./(a.^(1/3));
            Xtt = ((Xu.*b)./(3*(a.^(5/3)))) + (Xuu./(a.^(2/3)));
            Ytt = ((Yu.*b)./(3*(a.^(5/3)))) + (Yuu./(a.^(2/3)));
            
            K=abs((Xt.*Ytt-Xtt.*Yt)./((Xt.*Xt+Yt.*Yt).^1.5));
            K=ceil(K*100)/100;
            ct = size(index{i},1);
            for j=1:ct
                %sig1 = sig
                %i1 = i
                %j1 = j
                %if (sig == 1 & i == 1)
                %    here = 1;
                %end
                [m ind] = max(K(W+index{i}(j,1)-neighbor:W+index{i}(j,1)+neighbor));
                ind = ind + index{i}(j,1) - neighbor-1;
                if (ind>0 & ind<=L_aff)
                    index{i}(j,1) = ind;
                    c1{i}(j,1) = m;
                end
            end            
        end
        end
    end
end

% define width and Gaussian function for sigma = 1 to findout final corner
% positions on the curves
sig = 1;
ssq = sig*sig;
width = max(find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff));
if isempty(width)
    width = 1;  
end
t = (-width:width);
gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq); 
gau=gau/sum(gau);

for i=1:curve_num
    %if final % think whether further localization with arbitrary parameter needed,
                 % if needed then execute all fllowing statements
    
    
                 W = width; % width if Gaussian filter at sigma = 1
                indd = IND{i};
                x = curve{i}(:,1);
                y = curve{i}(:,2);
                L=size(x,1);
            if curve_mode(i,:)=='loop' % wrap around the curve by W pixles at both ends
                x2=[x(L-W+1:L);x;x(1:W)];
                y2=[y(L-W+1:L);y;y(1:W)];
            else % extend each line curve by W pixels at both ends
                x2=[ones(W,1)*2*x(1)-x(W+1:-1:2);x;ones(W,1)*2*x(L)-x(L-1:-1:L-W)];
                y2=[ones(W,1)*2*y(1)-y(W+1:-1:2);y;ones(W,1)*2*y(L)-y(L-1:-1:L-W)];
            end
            
            xx2=conv(x2,gau);
            xx2=xx2(W+1:L+3*W);
            yy2=conv(y2,gau);
            yy2=yy2(W+1:L+3*W);
            Xu2=[xx2(2)-xx2(1) ; (xx2(3:L+2*W)-xx2(1:L+2*W-2))/2 ; xx2(L+2*W)-xx2(L+2*W-1)];
            Yu2=[yy2(2)-yy2(1) ; (yy2(3:L+2*W)-yy2(1:L+2*W-2))/2 ; yy2(L+2*W)-yy2(L+2*W-1)];
            Xuu2=[Xu2(2)-Xu2(1) ; (Xu2(3:L+2*W)-Xu2(1:L+2*W-2))/2 ; Xu2(L+2*W)-Xu2(L+2*W-1)];
            Yuu2=[Yu2(2)-Yu2(1) ; (Yu2(3:L+2*W)-Yu2(1:L+2*W-2))/2 ; Yu2(L+2*W)-Yu2(L+2*W-1)];
            K2=abs((Xu2.*Yuu2-Xuu2.*Yu2)./((Xu2.*Xu2+Yu2.*Yu2).^1.5));
            K2=ceil(K2*100)/100;
            ct = size(index{i},1);
            index1{i} = indd(index{i});
            for j=1:ct
                [m ind] = max(K2(W+index1{i}(j,1)-neighbor:W+index1{i}(j,1)+neighbor));
                ind = ind + index1{i}(j,1) - neighbor-1;
                if (ind>0 & ind<=L)
                    index1{i}(j,1) = ind;
                    c1{i}(j,1) = m;
                end
            end
     %   end
end
% find corner positions from planer curves
for i=1:curve_num
    for j=1:size(index1{i},1)
        corner_out = [corner_out;curve{i}(index1{i}(j,1),:)];
        c2 = [c2;c1{i}(j,1)];
    end
end
%%%