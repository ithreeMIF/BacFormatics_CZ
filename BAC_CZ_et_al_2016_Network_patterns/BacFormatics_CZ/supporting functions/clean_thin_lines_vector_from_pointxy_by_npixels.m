function ROI= clean_thin_lines_vector_from_pointxy_by_npixels( ROI_thin,X1,Y1,npixels)
ROI_thin=logical(ROI_thin);
D=bwdistgeodesic(ROI_thin,Y1,X1,'quasi-euclidean');

Counter=1;
Path=[];
val=[];
ind=[];


Path(Counter,1)=X1 ;
Path(Counter,2)=Y1 ;

Counter=2;
while Counter<npixels & Counter<=sum(ROI_thin(:)) 
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
    Path(Counter,1)=X1;
    Path(Counter,2)=Y1;
    Counter=Counter+1 ;
end


Path=sub2ind(size(ROI_thin),Path(:,1),Path(:,2));
ROI= zeros(size(ROI_thin)) ;
ROI(Path)=1;



