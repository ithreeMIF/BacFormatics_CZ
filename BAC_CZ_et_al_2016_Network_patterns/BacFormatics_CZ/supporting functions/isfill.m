function out=isfill(bw) 
out=0;
bw2=imfill(bw,'holes');
bw2(bw==1)=0;




bw_perim=bwdist(bw,'chessboard');
bw2(bw_perim==1)=0; 
 
 







if ~sum(bw2(:))
    out=1;
    return
end 

[X,Y]=find(bw2);
L=bwlabel(bw,4);
for ii=1:length(X)
   try
    
    ROI=L(X-1:X+1,Y-1:Y+1);
    unique_ROI=unique(ROI);
    unique_ROI(unique_ROI==0)=[];
    
    if length(unique_ROI)>1
        bw2(X,Y)=0;
    end
    
    
   end
end






L=bwlabel(bw2);
s=regionprops(L,'Area');
Area=cat(1,s.Area);
ind=Area<20;
if isempty(ind)
    out=1;
    return
end


