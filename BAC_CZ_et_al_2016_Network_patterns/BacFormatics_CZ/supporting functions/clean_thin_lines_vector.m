   function Path= clean_thin_lines_vector( matrix_thin_temp,matrix_endpoints)
  
 ROI_thin=matrix_thin_temp; 
 ROI_endpoints=matrix_endpoints;

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

[ii,jj]=find(ismember(distance_matrix,max(distance_matrix(:))));
ii=ii(1);jj=jj(1);



[X1,Y1]=find(ismember(L_ROI_endpoints,ii));
[X2,Y2]=find(ismember(L_ROI_endpoints,jj));





L_temp1=bwdistgeodesic(ROI_thin,Y1,X1,'quasi-euclidean');
L_temp2=bwdistgeodesic(ROI_thin,Y2,X2,'quasi-euclidean');


D=  L_temp1+L_temp2 ;



Counter=1;
Path=[];
val=[];
ind=[];


Path(Counter,1)=X1;
Path(Counter,2)=Y1;


Counter=2;
while true
%       figure(1)
%      imagesc(D)
    D(X1,Y1)=inf;
    
    ind(:,1)= [X1-1 Y1-1];
    ind(:,2)= [X1  Y1-1];
    ind(:,3)=[X1+1 Y1-1];
    ind(:,4)=[X1-1 Y1];
    ind(:,5)=[X1 Y1];
    ind(:,6)= [X1+1  Y1];
    ind(:,7)=[X1-1 Y1+1];
    ind(:,8)=[X1 Y1+1];
    ind(:,9)= [X1+1 Y1+1];
    
    
    try
        val(:,1)=D(X1-1,Y1-1);
    catch
        val(:,1)=inf;
    end
    
    try
        val(:,2)= D(X1,Y1-1);
    catch
        val(:,2)=inf;
    end
    
    try
        val(:,3)=D(X1+1,Y1-1);
    catch
        val(:,3)=inf;
    end
    
    try
        val(:,4)=D(X1-1,Y1);
    catch
        val(:,4)=inf;
    end
    
    try
        val(:,5)=D(X1,Y1);
    catch
        val(:,5)=inf;
    end
    
    try
        val(:,6)= D(X1+1,Y1);
    catch
        val(:,6)=inf;
    end
    
    try
        val(:,7)=D(X1-1,Y1+1);
    catch
        val(:,7)=inf;
    end
    
    try
        val(:,8)=D(X1,Y1+1);
    catch
        val(:,8)=inf;
    end
    
    try
        val(:,9)= D(X1+1,Y1+1);
    catch
        val(:,9)=inf;
    end 
    
    min_ind=find(ismember(val,nanmin(val))) ;
    X1=ind(1,min_ind );
    Y1=ind(2,min_ind ); 
    Path(Counter,1)=X1;Path(Counter,2)=Y1; 
    Counter=Counter+1;
    if X1==X2 & Y1==Y2
        break
    end
end





