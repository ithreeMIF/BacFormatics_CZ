function [x,y]= clean_thin_lines(ROI_thin,ROI_endpoints)
 
L_ROI_endpoints=bwlabel(ROI_endpoints);

distance_matrix=zeros([max(L_ROI_endpoints(:)) max(L_ROI_endpoints(:))]);

for ii=1:max(L_ROI_endpoints(:))
    [X,Y]=find(ismember(L_ROI_endpoints,ii));
    L_temp=bwdistgeodesic(ROI_thin,Y,X,'quasi-euclidean');
    
    for jj=1:max(L_ROI_endpoints(:))
        [X2,Y2]=find(ismember(L_ROI_endpoints,jj));
        distance_matrix(ii,jj)= L_temp(X2,Y2);
    end
end

maxi=max(max(distance_matrix));
[ii,jj]=find(ismember(distance_matrix,max(distance_matrix(:))));
ii=ii(1);jj=jj(1);

[X,Y]=find(ismember(L_ROI_endpoints,ii));
L_temp=bwdistgeodesic(ROI_thin,Y,X,'quasi-euclidean');

L_temp2=abs(L_temp-maxi/2);
[y,x]=  find(ismember( L_temp2,nanmin(nanmin( L_temp2))));
 x=x(1); y=y(1);
 

 