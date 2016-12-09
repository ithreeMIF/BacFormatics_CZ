


clear all

load all


Raw_list=handles.data_file(1).cdata

out_of_focus_vec=[];

track_what=1

for n=41:42%size(Raw_list,1)
    
    if isempty(find(ismember(out_of_focus_vec,n))) %ignore out of focus
        
        full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n-1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
        matrix0 =  imread(full_filename,'tif',1)   ;
        matrix0 ( matrix0 > 0)=1;
        
        full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
        matrix1 =  imread(full_filename,'tif',1)   ;
        matrix1 ( matrix1 > 0)=1;
        
        
        
        
        %         Close
        %         figure(1);
        %         imagesc(matrix0)
        %         title(num2str(n-1))
        %         hold on
        %
        %         figure(2);
        %         imagesc(matrix1)
        %         title(num2str(n))
        %         hold on
        %
        
        
        L0=bwlabel(matrix0,4);
        
        stats0=regionprops(L0,'Area','Centroid','PixelList');
        L1=bwlabel(matrix1,4);
        stats1=regionprops(L1,'Area','Centroid','PixelList');
        
        
        Area1 =cat(1,stats1.Area);
        Area0 =cat(1,stats0.Area)  ;
        
        
        Centroid1 =cat(1,stats1.Centroid);
        Centroid0 =cat(1,stats0.Centroid)  ;
        
        centy1 = Centroid1;
        
        
        
        
        
        
        
        N=max(max(L0));
        M=max(max(L1));
        D=zeros(M,N);
        
        for nn=1:N
            PixelList=sub2ind(size(matrix1),stats0(nn).PixelList(:,2),stats0(nn).PixelList(:,1));
            
            
            
            PixelList=L1(PixelList);
            sizey=size(PixelList,1);
            PixelList(PixelList==0)=[];
            
            vec=[];
            for mm=1:M
                vec(mm)=size(find(PixelList==mm),1);
            end
            
            vec=vec./sizey;
            
            D(:,nn)=vec;
        end
        
        % treated, so that they can never generate a link.
        D( D ==0 ) = Inf;
        
        % Find the optimal assignment is simple as calling Yi Cao excellent FEX
        % submission.
        
        
        target_indices = munkres_TACWrapper(D);
        % Set unmatched sources to -1
        target_indices ( target_indices  == 0 ) = -1;
        
        centy1(:,4)=target_indices;
        
        
        new_cells_vec=find(ismember(centy1(:,4),-1));
        matrix_out=logical(matrix1);
        
        for ii=1 :  length(new_cells_vec) %FOR EACH NEW CELL
            new_cell=new_cells_vec(ii);
            x=centy1(new_cell,1);  y=centy1(new_cell,2);
            
            %             xx(ii)=x;
            %             yy(ii)=y;
            %             figure(1)
            Close
            figure(1)
            imagesc(matrix0)
            figure(2)
            imagesc(matrix1)
            vecX=centy1(:,1)-x;
            vecY=centy1(:,2)-y;
            vecXY= sqrt(vecX.^2+ vecY.^2) ;   %find closest centroid to the selected point
            
            ng_cells_ind_vec=find(vecXY<=50);
            ng_cells_ind_vec( ng_cells_ind_vec==new_cell)=[];
            
            
            if isempty( ng_cells_ind_vec)~=1
                matrix=[]; matrix_counter =1;
                
                for jj=1:length(ng_cells_ind_vec) %FOR EACH CLOSE CELL
                    ng_cells_ind1=ng_cells_ind_vec(jj);
                    ng_cells_ind0= centy1( ng_cells_ind1,4);
                    
                    if ng_cells_ind0~=-1
                        
                        matrix(matrix_counter,1)= Centroid1( ng_cells_ind1,1);
                        matrix(matrix_counter,2)=Centroid1( ng_cells_ind1,2);
                        matrix(matrix_counter,3)=Area1( ng_cells_ind1);
                        
                        matrix(matrix_counter,4)=Centroid0( ng_cells_ind0,1);
                        matrix(matrix_counter,5)=Centroid0( ng_cells_ind0,2);
                        
                        
                        text( matrix(matrix_counter,1)  ,  matrix(matrix_counter,2)  , num2str(matrix_counter) , 'FontSize',10, 'Color','w');
                        
                        
                        
                        
                        matrix(matrix_counter,6)=Area0( ng_cells_ind0);
                        
                        matrix(matrix_counter,7)=ng_cells_ind1;
                        matrix(matrix_counter,8)=ng_cells_ind0;
                        
                        matrix_counter =matrix_counter+1;
                        
                    end
                end
                
                
                if  isempty(matrix)~=1
                    
                    matrix(:,9)=(matrix(:,6)- matrix(:,3))./(matrix(:,6)+ matrix(:,3))
                    
                    %                 Ind_to_remove=find(isnan(matrix(:,9))); matrix(Ind_to_remove,:)=[];
                    % %                 Ind_to_remove=find(matrix(:,9)<0.1);  matrix(Ind_to_remove,:)=[];
                    
                end
                
                
                
                if  isempty(matrix)~=1
                    
                    bw0=logical(zeros(size(matrix_out)));
                    PixelList=stats1(new_cell).PixelList;
                    PixelList=sub2ind(size(bw0),PixelList(:,2),PixelList(:,1));
                    bw0(PixelList)=1;
                    bw00= bw0;
                    
                    
                    
                    
                    for k =1:size(matrix,1)
                        
                        bw2=logical(zeros(size(matrix_out)));
                        PixelList=stats0( matrix(k ,8)).PixelList;
                        PixelList=sub2ind(size(bw2),PixelList(:,2),PixelList(:,1));
                        bw2(PixelList)=1;
                        
                        bw=bw0.*bw2;
                        
                        
                        matrix(k ,10)=sum(sum(bw))/sum(sum(bw2));
                        
                    end
                    
                    [~,k   ]          =    max(matrix(:,10));
                    
                    %              parent
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    PixelList=stats0(matrix(k ,8)).PixelList;
                    bw1 =logical(zeros(size(matrix_out)));
                    PixelList=sub2ind(size(bw1),PixelList(:,2),PixelList(:,1));
                    bw1(PixelList)=1;% the parent
                    
                    
                    
                    
                    
                    for kk=1:size(matrix,1)
                        
                        bw2=logical(zeros(size(matrix_out)));
                        PixelList=stats1( matrix(kk,7)).PixelList;
                        PixelList=sub2ind(size(bw2),PixelList(:,2),PixelList(:,1));
                        bw2(PixelList)=1;
                        
                        bw=bw1.*bw2;
                        
                        
                        matrix(kk,11)=sum(sum(bw))/sum(sum(bw2));
                        
                    end
                    
                    [~,kk]          =    max(matrix(:,11));
                    
                    PixelList=stats1( matrix( kk,7)).PixelList;
                    
                    
                    PixelList=sub2ind(size(bw2),PixelList(:,2),PixelList(:,1));
                    bw0(PixelList)=1;
                    
                    
                    
                    
                    %                         figure(1)
                    %                         text(matrix(kk,4) , matrix(kk,5)  , num2str(matrix(kk,6)) , 'FontSize',10, 'Color','w');
                    %                         figure(2)
                    %                         text(matrix(kk,1) , matrix(kk,2)  , num2str(matrix(kk,3)) , 'FontSize',10, 'Color','m');
                    %
                    
                    figure(1)
                    hold on
                    contour(bw1,[0 0],'m' ) %the parent in frame n-1
                    %      contour(bw00,[0 0],'c' ) %the new cell in frame n
                    
                    contour(bw00 ,[0 0],'c' ) %the new cell in frame n
                    text(x  , y  , 'new' , 'FontSize',10, 'Color','w');
                    
                    text( matrix(k ,4)  ,  matrix(k ,5)  , 'parent' , 'FontSize',10, 'Color','w');
                    
                    
                    
                    
                    
                    
                    
                    figure(2)
                    hold on
                    contour(bw1,[0 0],'m' ) %the parent in frame n-1
                    %      contour(bw00,[0 0],'c' ) %the new cell in frame n
                    
                    contour(bw00 ,[0 0],'c' ) %the new cell in frame n
                    text(x  , y  , 'new' , 'FontSize',10, 'Color','w');
                    
                    text( matrix(k ,4)  ,  matrix(k ,5)  , 'parent' , 'FontSize',10, 'Color','w');
                    
                    
                    pause
                    
                    %
                    %                       figure(1)
                    %                       imagesc( bw0)
                    %                       hold on
                    %                         text(matrix(kk,4) , matrix(kk,5)  , num2str(matrix(kk,6)) , 'FontSize',10, 'Color','w');
                    %
                    %                          text(matrix(kk,1) , matrix(kk,2)  , num2str(matrix(kk,3)) , 'FontSize',10, 'Color','m');
                    %
                    %
                    SE=strel('disk',2) ;
                    %
                    bw0= imclose(bw0,SE ) ;
                    % %
                    %                       figure(2)
                    %                       imagesc( bw0)
                    %                       hold on
                    %                         text(matrix(kk,4) , matrix(kk,5)  , num2str(matrix(kk,6)) , 'FontSize',10, 'Color','w');
                    %
                    %                          text(matrix(kk,1) , matrix(kk,2)  , num2str(matrix(kk,3)) , 'FontSize',10, 'Color','m');
                    %                     pause
                    %
                    
                    matrix_out(bw0==1)=1;
                    
                end
                
            end
        end
        
        
        
        
        
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %         spliting
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        %
        %
        %         end_cells_vec=setxor(1:size(Centroid0,1),centy1(:,4)); end_cells_vec( end_cells_vec==-1)=[];
        %
        %         matrix_out=matrix1;
        %
        %         for ii=1:length(new_cells_vec) %FOR EACH NEW CELL
        %             new_cell=new_cells_vec(ii);
        %             x=centy1(new_cell,1);  y=centy1(new_cell,2);
        %
        %             xx(ii)=x;
        %             yy(ii)=y;
        %             figure(1)
        %             text(x  , y  , 'new' , 'FontSize',10, 'Color','w');
        %
        %             vecX=centy1(:,1)-x;
        %             vecY=centy1(:,2)-y;
        %             vecXY= sqrt(vecX.^2+ vecY.^2) ;   %find closest centroid to the selected point
        %
        %             ng_cells_ind_vec=find(vecXY<=50);
        %             ng_cells_ind_vec( ng_cells_ind_vec==new_cell)=[];
        %
        %
        %             if isempty( ng_cells_ind_vec)~=1
        %                 matrix=[]; matrix_counter =1;
        %
        %                 for jj=1:length(ng_cells_ind_vec) %FOR EACH CLOSE CELL
        %                     ng_cells_ind1=ng_cells_ind_vec(jj);
        %                     ng_cells_ind0= centy1( ng_cells_ind1,4);
        %
        %                     if ng_cells_ind0~=-1
        %
        %                         matrix(matrix_counter,1)= Centroid1( ng_cells_ind1,1);
        %                         matrix(matrix_counter,2)=Centroid1( ng_cells_ind1,2);
        %                         matrix(matrix_counter,3)=Area1( ng_cells_ind1);
        %
        %                         matrix(matrix_counter,4)=Centroid0( ng_cells_ind0,1);
        %                         matrix(matrix_counter,5)=Centroid0( ng_cells_ind0,2);
        %                         matrix(matrix_counter,6)=Area0( ng_cells_ind0);
        %
        %                         matrix(matrix_counter,7)=ng_cells_ind1;
        %                         matrix(matrix_counter,8)=ng_cells_ind0;
        %
        %                         matrix_counter =matrix_counter+1;
        %
        %                     end
        %                 end
        %                 matrix(:,9)=(matrix(:,6)- matrix(:,3))./(matrix(:,6)+ matrix(:,3))
        %
        %                 Ind_to_remove=find(isnan(matrix(:,9))); matrix(Ind_to_remove,:)=[];
        %                 Ind_to_remove=find(matrix(:,9)<0.1);  matrix(Ind_to_remove,:)=[];
        %
        %                 if  isempty(matrix)~=1
        %
        %                     bw0=zeros(size( matrix_out));
        %                     PixelList=stats1(new_cell).PixelList;
        %                     PixelList=sub2ind(size(bw0),PixelList(:,2),PixelList(:,1));
        %                     bw0(PixelList)=1;
        %
        %
        %                     for kk=1:size(matrix,1)
        %                         PixelList=stats1( matrix(kk,7)).PixelList;
        %                         PixelList=sub2ind(size(bw0),PixelList(:,2),PixelList(:,1));
        %                         bw0(PixelList)=1;
        %
        %
        %                         figure(1)
        %                         text(matrix(kk,4) , matrix(kk,5)  , num2str(matrix(kk,6)) , 'FontSize',10, 'Color','w');
        %                         figure(2)
        %                         text(matrix(kk,1) , matrix(kk,2)  , num2str(matrix(kk,3)) , 'FontSize',10, 'Color','m');
        %
        %                     end
        %
        %
        %                     SE = strel('disk',2 ) ;
        %                     bw0=   imclose( bw0,SE) ;
        %
        %                     matrix_out=double(matrix_out)+bw0;
        %                     matrix_out( matrix_out>0)=255;
        %                 end
        %
        %             end
        %         end
        %
        %
        %
        
        
        
        
        
        
        
        
        
        
        
        
        %
        %
        %         figure(5)
        %         imagesc(   matrix_out )
        %         hold on
        %         title(['frame: ' num2str(n)])
        %         %
        %         for ii=1:length(new_cells_vec) %FOR EACH NEW CELL
        %             text(xx(ii)  , yy(ii)  , 'new' , 'FontSize',10, 'Color','w');
        %         end
        %         %              pause
        % %
        %          matrix_out=255*uint8( matrix_out);
        %          imwrite( matrix_out ,full_filename)
    end
end

