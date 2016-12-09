clear all
load all


Raw_list=handles.data_file(1).cdata;
track_what=1;
N=size(Raw_list,1);
 
%   h =timebar_BACWrapper('merging. Please wait....');
% %   set(h ,'color','w');
for n=2:size(Raw_list,1)
%      timebar_BACWrapper(h ,n/N) 
%     if isempty(find(ismember(out_of_focus_vec,n))) & isempty(find(ismember(out_of_focus_vec,n-1))) %ignore out of focus 
            full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
         
            matrix1 =  imread(full_filename,'tif',1)   ;
            full_filename2 = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n-1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
            matrix0 =  imread(full_filename2,'tif',1)   ;
        
        L0=bwlabel(matrix0,4);
        L1=bwlabel(matrix1,4); 
        Area_n1=histc(L1(:),1:max(L1(:))); 
       
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
                 
                 if  max(max(bwlabel(bw,4)))==2
                try
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
                 [x y]=bresenham_BACWrapper(x1,y1,x2,y2);
                 bw0(x,y)=1; 
                   
                    end
                 bw0=imclose(bw0,[0 1 0; 1 1 1; 0 1 0]);
                 bw0= imfill(bw0,'holes' ) ; 
%                  
                 figure(1)
                 imagesc(bw0)
                 pause
            else
               bw0=bw; 
            end
%                   
                 
         
                matrix1(bw0==1)=1;
            end
        end 
%         imwrite(matrix1, full_filename )  
end 
% close(h)
box_Raw=get(handles.Raw_listbox,'string') ;
read_global_stack(handles,box_Raw,[1 0 0])

% -----