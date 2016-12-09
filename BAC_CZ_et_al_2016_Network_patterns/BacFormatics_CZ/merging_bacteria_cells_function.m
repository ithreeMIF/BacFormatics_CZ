function merging_bacteria_cells_function(data_file)
load species
load   M
Raw_list=data_file(1).cdata;
track_what=1;
N=size(Raw_list,1);

h =timebar_BACWrapper('merging. Pdatalease wait....');
set(h ,'color','w');
for n=2:N
    n;
    timebar_BACWrapper(h ,n/N)
    %     if isempty(find(ismember(out_of_focus_vec,n))) & isempty(find(ismember(out_of_focus_vec,n-1))) %ignore out of focus
    full_filename = [data_file(2).cdata{track_what,3},data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
    
    %             matrix1 =  imread_cross(full_filename,'tif',1)   ;  matrix1(  matrix1>0)=1;matrix1=logical(  matrix1);
    %             full_filename2 = [data_file(2).cdata{track_what,3},data_file(1).cdata{n-1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
    %             matrix0 =  imread_cross(full_filename2,'tif',1)   ;matrix0(  matrix0>0)=1;matrix0=logical(  matrix0);
    %
    %     full_filename = [data_file(2).cdata{track_what,3},data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
    %            eval(strcat('matrix1= Ch00_stack_Segmented(',num2str(n),').cdata;'))
    %             eval(strcat('matrix0= Ch00_stack_Segmented(',num2str(n-1),').cdata;'))
    % %         catch
    matrix1 =  imread_cross(full_filename)   ;
    full_filename2 = [data_file(2).cdata{track_what,3},data_file(1).cdata{n-1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
    matrix0 =  imread_cross(full_filename2)   ;
    %         end      try
    
    matrix1(  matrix1>0)=1;matrix1=logical(  matrix1);
    matrix0(  matrix0>0)=1;matrix0=logical(  matrix0);
    
    
    
    
    
    L0=bwlabel(matrix0,4);
    L1=bwlabel(matrix1,4);
    Area_n1=histc(L1(:),1:max(L1(:)));
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
    n0_unique_hist=histc(matrix22,n1_unique) ;
    
    
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
    D2=D>0.4;
    
    
    overlap_cells_ind=find(sum(D2,1)>1)  ;
    
    for nn=1:length(overlap_cells_ind)
        overlap_cells_temp=overlap_cells_ind(nn);
        temp_vec=find(D2(:,overlap_cells_temp));
        
        if max(size(temp_vec))==2
            
            
            bw01=zeros(size(matrix1));  bw02=zeros(size(matrix1));
            
            bw01(L1==temp_vec(1))=1;  bw02(L1==temp_vec(2))=1;
            bw0=bw01+bw02;
            
            
            bw =imclose(bw0 ,[0 1 0; 1 1 1; 0 1 0] ) ;
            bw =imfill(bw,'holes' ) ;
            
            if  max(max(bwlabel(bw,4)))==2 %couldnt connect
                
                bw01_bwdist=bwdist( bw01);
                bw02_bwdist= bw01_bwdist.*bw02;
                bw02_bwdist( bw02_bwdist==0)=nan;
                [x1,y1]=find(ismember( bw02_bwdist,nanmin( bw02_bwdist(:))));
                x1=x1(1);y1=y1(1);
                pixel_matrix=zeros(size(bw01));
                pixel_matrix(x1,y1)=1;
                bw01_bwdist=bwdist( pixel_matrix);
                bw01_bwdist= double(bw01_bwdist).*double(bw01);
                bw01_bwdist( bw01_bwdist==0)=nan;
                [x2,y2]=find(ismember( bw01_bwdist,nanmin( bw01_bwdist(:))));
                x2=x2(1);y2=y2(1);
                
                if sqrt((x1-x2)^2+ (y1-y2)^2)<4
                    [x , y]=bresenham_BACWrapper(x1,y1,x2,y2);
                    bw0(x,y)=1;
                    bw0=imclose(bw0,[0 1 0; 1 1 1; 0 1 0]);
                    bw = imfill(bw0,'holes' ) ;
                end
            end
            if   max(max(bwlabel(bw,4)))==1 % connected
                
                L=bwlabel(bw ,4);
                stats=regionprops(L,  'Eccentricity'  );
                if stats.Eccentricity>0.96
                    
                    %
                    %
                    %                         matrix_bw2=   flipdim( imrotate(bw ,-stats(1).Orientation),1);
                    %                         peak_1=sum(matrix_bw2);   peak_2=sum(bw');
                    %
                    %                         for ii=1:10
                    %                             peak_1=  smooth(peak_1)     ;
                    %                             peak_2=  smooth(peak_2)     ;
                    %                         end
                    %
                    %
                    %                         peak_1(isnan( peak_1))=0;   peak_2(isnan( peak_2))=0;
                    %
                    %
                    %
                    %                         IND1=findpeaks_BACWrapper(peak_1) ;    npeaks_1 =peak_1(IND1) ;
                    %                         IND2=findpeaks_BACWrapper(peak_2) ;    npeaks_2 =peak_2(IND2) ;
                    %                         IND11=findpeaks_BACWrapper(-peak_1) ;    npeaks_11 =max(peak_1(IND11)) ;
                    %                         IND22=findpeaks_BACWrapper(-peak_2) ;    npeaks_22 =max(peak_2(IND22));
                    %
                    %
                    %
                    %
                    %
                    %                         z1=abs((npeaks_11-mean(npeaks_1))./(npeaks_11+mean(npeaks_1))) ;
                    %                         z2=abs((npeaks_22-mean(npeaks_2))./(npeaks_22+mean(npeaks_2))) ;
                    %
                    %
                    %
                    %
                    %
                    %                         % %    MM(1,1)= stats(1).Eccentricity;
                    %                         % %    MM(1,2)=stats(1).EquivDiameter;
                    %                         % %    MM(1,3)=stats(1).MajorAxisLength;
                    %                         %    MM(1,4)= stats(1).MinorAxisLength;
                    %                         %    MM(1,5)= stats(1).MinorAxisLength/stats(1).MajorAxisLength;
                    %                         %    MM(1,6)= stats(1).Area;
                    %                         % % MM(1,7)=length(npeaks_1) ;
                    %                         % % MM(1,8)=length(npeaks_2) ;
                    %                         % MM(1,9)=z1;
                    %                         % MM(1,10)=z2;
                    %
                    %
                    %
                    %                         MM(1,1)= stats(1).MinorAxisLength;
                    %                         MM(1,2)= stats(1).MinorAxisLength/stats(1).MajorAxisLength;
                    %                         MM(1,3)= stats(1).Area;
                    %                         MM(1,4)=z1;
                    %                         MM(1,5)=z2;
                    %
                    %
                    %                         %  save all
                    %                         %
                    %                         % figure(101)
                    %                         % imagesc(matrix_bw)
                    %                         %
                    %                         % matrix_out= matrix_bw;
                    %                         % pause
                    %
                    %
                    %                         [Class,Error]=classify(MM, M, species)
                    
                    
                    
                    %                         if  strcmp(Class,'double')==1 %could be connected and detected as double
                    %                              figure(1)
                    %                              imagesc( bw)
                    %                              pause
                    matrix1(bw==1)=1;
                    %                         end
                end
            end
        end
    end
    imwrite(matrix1, full_filename )
end
close(h)

% ---------------------------------------------------
% ---------------------------------------------------