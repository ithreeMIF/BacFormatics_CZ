 function   vecX= fast_ass( matrix0,matrix1,max_distance )
save all
max_distance=max_distance


L0=bwlabel(matrix0,4);
L1=bwlabel(matrix1,4);


Area_n1=histc(L1(:),1:max(L1(:)));



%
%
%
%

target_indices=[];
N0=max(max(L0));
N1=max(max(L1));
D=zeros(N1,N0);

 

matrix2= matrix0.*matrix1;
matrix22= (L1+L0/10000) ;
matrix22(matrix2==0)=0;
matrix22=matrix22(:);
n1_unique =unique(matrix22);


if   n1_unique(1)==0
    n1_unique(1)=[];
end
n1_unique_fix =fix( n1_unique);
n1_unique_fix_unique = unique( n1_unique_fix);



n0_unique_fix=round(10000*( n1_unique-n1_unique_fix ));
n0_unique_hist=histc(matrix22,n1_unique);


for ii=1:length(n1_unique_fix_unique)
    temp1=n1_unique_fix_unique(ii);
    Ind =find(n1_unique_fix==temp1) ;
    
    
    n0_unique_hist_ind= n0_unique_hist(Ind);
    n0_unique_fix_ind= n0_unique_fix(Ind);
    
    for jj=1:length(n0_unique_fix_ind)
        temp2=n0_unique_fix_ind(jj); %2
        D(temp1,temp2)=n0_unique_hist_ind(jj)/Area_n1(temp1);
    end
end


try
    overlap_cells_ind=find(sum(D>0.5,1)>1) ;
    for nn=1:length(overlap_cells_ind)
        overlap_cells_temp=overlap_cells_ind(nn);
        temp_vec=D( :,overlap_cells_temp);
        temp_max_ind=find(ismember(temp_vec,max(temp_vec)));
        temp_max_ind= temp_max_ind(1);
        max_val=D(temp_max_ind,overlap_cells_temp) ;
        D( :,overlap_cells_temp)=0;
        D(temp_max_ind,overlap_cells_temp)= max_val;
    end
end

[indX,indY]=find(D>0.5);
D2=D;
D(indX,:)=[];
D(:,indY)=[];








if isempty(D)~=1
    
    
    
    
    vecX=-ones(1,N1);
    vecX(indX)=indY;
    
    stats0=regionprops(L0,'Centroid');   stats0=cat(1,stats0.Centroid);
    stats1=regionprops(L1,'Centroid');   stats1=cat(1,stats1.Centroid);
    %
    indX_setxor=setxor(indX,1:N1);indX_setxor_CenroidX=stats1(indX_setxor,1);indX_setxor_CenroidY=stats1(indX_setxor,2);
    indY_setxor=setxor(indY,1:N0);indY_setxor_CenroidX=stats0(indY_setxor,1);indY_setxor_CenroidY=stats0(indY_setxor,2);
    
    
    
    
    
    
    
    D2=1-D;
%     D2(D2>0.8)=nan;
    D2(D2>0.95)=nan;
    
    vec=nanmean(D2,2);
    vec= find(isnan(vec));
    
    for ii=1:length(vec)
        temp=vec(ii);
        vec2=  sqrt((( indY_setxor_CenroidX - indX_setxor_CenroidX(temp)).^2+(indY_setxor_CenroidY- indX_setxor_CenroidY(temp)).^2));
        
        D2(temp,:)=vec2;
        
        
        %                   indY_setxor_Cenroid-
        
    end
    
    
    D2 ( D2 > max_distance) =inf;
    target_indices = munkres_BACWrapper(D2);
    
    for ii=1:length(target_indices)
        if target_indices(ii)~=0
            vecX(indX_setxor(ii))=         indY_setxor(target_indices(ii));
        end
    end
    
end
if isempty(D) 
    D2=1-D2;
    D2(D2>0.95)=inf;
      vecX= munkres_BACWrapper(D2);
      vecX(vecX==0)=-1; 
end


if size(vecX,2)>size(vecX,1); vecX=vecX'; end

