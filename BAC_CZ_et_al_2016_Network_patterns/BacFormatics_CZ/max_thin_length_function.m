function max_thin_length= max_thin_length_function(ROI_thin,ROI_endpoints)
 
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

max_thin_length=max(max(distance_matrix));
 
 

 