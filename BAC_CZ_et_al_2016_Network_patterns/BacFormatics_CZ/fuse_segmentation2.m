


% clear all

 load all


Raw_list=handles.data_file(1).cdata

out_of_focus_vec=[];

track_what=1

for n= 2: size(Raw_list,1)
    n
    
    
    
    if isempty(find(ismember(out_of_focus_vec,n))) %ignore out of focus
        
        try 
            eval(strcat('matrix0= Ch00_stack_Segmented(',num2str(n-1),').cdata;'))
            eval(strcat('matrix1= Ch00_stack_Segmented(',num2str(n),').cdata;')) 
        catch
            full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n-1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
            matrix0 =  imread(full_filename,'tif',1)   ;
            
            full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
            matrix1 =  imread(full_filename,'tif',1)   ;
        end
        
        
        
       centy1(:,4)=fast_ass( matrix0,matrix1,max_distance);
        
%         
%          
% %         
%         
%         L0=bwlabel(matrix0,4);
%         
%         stats0=regionprops(L0,'Area','Centroid','PixelList');
%         L1=bwlabel(matrix1,4);
%         stats1=regionprops(L1,'Area','Centroid','PixelList');
%         
%         
%         Area1 =cat(1,stats1.Area);
%         Area0 =cat(1,stats0.Area)  ;
%         
%         
%         Centroid1 =cat(1,stats1.Centroid);
%         Centroid0 =cat(1,stats0.Centroid)  ;
%         
%         centy1 = Centroid1;
%         
%         
%         
%         
%         
%         
%         
%         N=max(max(L0));
%         M=max(max(L1));
%         D=zeros(M,N);
%         
%         
% %         figure(6)
% %         imagesc(matrix0)
% %         hold on
%         
%         for nn=1:N
%             PixelList=sub2ind(size(matrix0),stats0(nn).PixelList(:,2),stats0(nn).PixelList(:,1));
% %             text(Centroid0(nn,1)  , Centroid0(nn,2)  , num2str(nn) , 'FontSize',10, 'Color','w');
% %             
%             
%             PixelList=L1(PixelList);
%             sizey=size(PixelList,1);
%             PixelList(PixelList==0)=[];
%             
%             vec=[];
%             for mm=1:M
%                 vec(mm)=size(find(PixelList==mm),1);
%             end
%             
%             vec=1-(vec./sizey);
%             
%             D(:,nn)=vec;
%         end
%         
%         
%         
%         
%         
%         
%         
%         
%         
%         
%         
%         
%         % treated, so that they can never generate a link.
% %         D( D <0.3 ) = Inf;
%           D( D>0.9 ) = Inf;
%         % Find the optimal assignment is simple as calling Yi Cao excellent FEX
%         % submission.
%         
%         
%         target_indices = munkres_BACWrapper(D);
%         % Set unmatched sources to -1
%         target_indices ( target_indices  == 0 ) = -1;
        
%         centy1(:,4)=target_indices;
        
        
        new_cells_vec=find(ismember(centy1(:,4),-1));
        matrix_out=logical(matrix1);
        
        
         
        for ii=1 :  length(new_cells_vec) %FOR EACH NEW CELL
            ii
            new_cell=new_cells_vec(ii);
            x=centy1(new_cell,1);  y=centy1(new_cell,2);
            
            %             xx(ii)=x;
            %             yy(ii)=y;
            %             figure(1)
%               
%             figure(1)
%             imagesc(matrix0)
%             hold on
%                text(x  , y  , 'new' , 'FontSize',10, 'Color','w');
% %                     
%             figure(2)
%             imagesc(matrix1)
%               hold on
%                text(x  , y  , 'new' , 'FontSize',10, 'Color','w');
%                  
             
            
            
            PixelList=sub2ind(size(matrix1),stats1(new_cell).PixelList(:,2),stats1(new_cell).PixelList(:,1)); 
            PixelList=L0(PixelList); 
            PixelList( PixelList==0)=[];
             
            vec=[];
               for mm=1:max(max(PixelList))
                vec(mm)=size(find(PixelList==mm),1);
               end
           
            if isempty(vec)~=1   
               
               
               
            [~,Parent_index_inframe0]=max(vec);
 
             brother_cell_index=find(ismember(centy1(:,4),Parent_index_inframe0));
             
      try        
                    bw0=logical(zeros(size(matrix_out)));
                    PixelList=stats1(new_cell).PixelList;
                    PixelList=sub2ind(size(bw0),PixelList(:,2),PixelList(:,1));
                    bw0(PixelList)=1;
                    
                    
                    PixelList=stats1(brother_cell_index).PixelList;
                    PixelList=sub2ind(size(bw0),PixelList(:,2),PixelList(:,1));
                    bw0(PixelList)=1;
      catch
          
%                  figure(1)
%                     hold on
%                     contour(bw0,[0 0],'m' ) %the parent in frame n-1 
%                     text(x  , y  , 'new' , 'FontSize',10, 'Color','w'); 
%                     
%                     figure(2)
%                     hold on
%                     contour(bw0,[0 0],'m' ) %the parent in frame n-1 
%                     text(x  , y  , 'new' , 'FontSize',10, 'Color','w');
%                     pause
%                     
      end
                       
                    
              
%                       
                    
                     
                    %
                    %                       figure(1)
                    %                       imagesc( bw0)
                    %                       hold on
                    %                         text(matrix(kk,4) , matrix(kk,5)  , num2str(matrix(kk,6)) , 'FontSize',10, 'Color','w');
                    %
                    %                          text(matrix(kk,1) , matrix(kk,2)  , num2str(matrix(kk,3)) , 'FontSize',10, 'Color','m');
                    %
                    %
%                     SE=strel('disk',2) ;
                    %
                    
                  
           
                    Bridge= bwmorph(bw0,'bridge',inf ) ; 
%                     figure(1)
%                     imagesc(Bridge)
                    
%                     figure(2)
%                     imagesc(bw0)
                    
                    
                    
                    Only_Bridge= xor(bw0,Bridge); 
                    Only_Bridge= bwmorph( Only_Bridge,'dilate',1 ) ;
                    Only_Bridge=imclose(Only_Bridge ,1 ) ;
                    Only_Bridge=imfill(Only_Bridge,'holes' ) ;  
                    
                    
                    


  bw0(Only_Bridge==1)=1;
  
  
         bw0=imclose(bw0 ,1 ) ;
                   bw0=imfill(bw0,'holes' ) ;  
                    
  
  
  
%                        figure(3)
%                     imagesc( bw0)
%                     
%                 
%                     
%                     pause
%                     
%                     
                    
                    
                    
                    % %
%                                             figure(2)
%                                            imagesc( bw0)
%                     pause
                    
                    
                    %                       hold on
                    %                         text(matrix(kk,4) , matrix(kk,5)  , num2str(matrix(kk,6)) , 'FontSize',10, 'Color','w');
                    %
                    %                          text(matrix(kk,1) , matrix(kk,2)  , num2str(matrix(kk,3)) , 'FontSize',10, 'Color','m');
                    %                     pause
                    %
                    
                    matrix_out(bw0==1)=1;
                    
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
                    matrix_out=255*uint8( matrix_out);
                    imwrite( matrix_out ,full_filename)
    end
end

