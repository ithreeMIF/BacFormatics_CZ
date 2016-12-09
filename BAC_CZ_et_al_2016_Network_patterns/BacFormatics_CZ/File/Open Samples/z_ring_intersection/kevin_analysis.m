
% new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');                  
% if isequal(new_dir,0)  %$#1                  
% h = msgbox('User selected Cancel','Aborted');                  
% return;                  
% end                  
% pathname=strcat(new_dir,'\');                  
%  handles.pathname=pathname;                  
% 
% jj=1;
% [list_of_folders]=read_list_of_folders(pathname) %maybe 1, maybe more
% if isempty(list_of_folders)==1
%     return
% end
% h =waitbar(0.5,'Please wait....');
% set(h ,'color','w');
% clear filename_str 
% while size(list_of_folders,2)>0
%     'loop 1'
%     [temp_list_of_folders]=read_list_of_folders(char(list_of_folders(1)));
%     % if      isempty(strfind(char(list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(list_of_folders(1)),'Pos'))~=1 )
%     filename_str(jj)= list_of_folders(1) ; jj=jj+1;
%     % end
%     list_of_folders(1)=[]
%     while size(temp_list_of_folders,2)>0
%         'loop 2'
%         [temp2_list_of_folders]=read_list_of_folders(char(temp_list_of_folders(1)));
%         % if  isempty(strfind(char(temp_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp_list_of_folders(1)),'Pos'))~=1 )
%         filename_str(jj)= temp_list_of_folders(1) ; jj=jj+1;
%         % end
%         temp_list_of_folders(1)=[] ;
%         while size(temp2_list_of_folders,2)>0
%             'loop 3'
%             [temp3_list_of_folders]=read_list_of_folders(char(temp2_list_of_folders(1)));
%             % if  isempty(strfind(char(temp2_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp2_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp2_list_of_folders(1)),'Pos'))~=1 )
%             filename_str(jj)= temp2_list_of_folders(1) ; jj=jj+1;
%             % end
%             temp2_list_of_folders(1)=[] ;
%             while size(temp3_list_of_folders,2)>0
%                 'loop 4'
%                 [temp4_list_of_folders]=read_list_of_folders(char(temp3_list_of_folders(1)));
%                 % if  isempty(strfind(char(temp3_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp3_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp3_list_of_folders(1)),'Pos'))~=1 )
%                 filename_str(jj)= temp3_list_of_folders(1) ; jj=jj+1;
%                 % end
%                 temp3_list_of_folders(1)=[]
%                 while size(temp4_list_of_folders,2)>0
%                     'loop 5'
%                     [temp5_list_of_folders]=read_list_of_folders(char(temp4_list_of_folders(1)));
%                     % if  isempty(strfind(char(temp4_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp4_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp4_list_of_folders(1)),'Pos'))~=1 )
%                     filename_str(jj)= temp4_list_of_folders(1) ; jj=jj+1;
%                     % end
%                     temp4_list_of_folders(1)=[]  ;
%                 end
%             end
%         end
%     end
% end
% 
% 
% clear filename_str2
% kk=1;
% for ii=1:size(filename_str,2)
%     
%     temp_str =filename_str(ii);
%    dir_filename=dir(char(temp_str));
%     for jj=1:size(dir_filename,1)
%         if  strfind(char(dir_filename(jj).name),'BacFormatics_EXP')==1
%           filename_str2(kk)=  strcat(temp_str,'\',dir_filename(jj).name);
% kk=kk+1;
%             break
%         end  
%     end
%     
% end




 
clear  diff_vec_stack
clear  listbox
Counter=1;
for nn=1:size(filename_str2,2) %per experiment
 
    
    
    data_file=importdata(char(filename_str2(nn)))  ;
    Raw_listbox= data_file(1).cdata;
    n=length(Raw_listbox);   
    
    
    iii=1;
    diff_vec=nan;
    
    
    
    
    for   ii=1:n %per frame
        try
        file_name= char(Raw_listbox(ii));
        full_file_name= char(strcat(data_file(2).cdata{1,3}, file_name,'_ch00_Segmented.tif'));
        bw_cell=double(imread(full_file_name)) ;
        
        
        
        file_name= char(Raw_listbox(ii));
        full_file_name= char(strcat(data_file(2).cdata{2,3}, file_name,'_ch01_Segmented.tif'));
        bw_ring=double(imread(full_file_name)) ;
        
        
        %                      figure(1)
        %                      imagesc( bw_cell)
        %                      figure(2)
        %                      imagesc(bw_ring)
        
        
        L=bwlabel(bw_cell,4);
        if max(L(:))>0
            
            
            
            stats=regionprops(L, 'BoundingBox','PixelIdxList');
            
            
            
            zero_MATRIX=double(zeros(size(L))) ;
            
            
            
            for jj=1:size(stats,1) %per cell
                
                try
                    
                temp=zero_MATRIX;
                temp(stats(jj).PixelIdxList)=1;
                
                
                XY=stats(jj).BoundingBox  ;
                X1=round(XY(2))  ;
                Y1=round(XY(1))  ;
                X2=round(XY(2)+XY(4)) ;
                Y2=round(XY(1)+XY(3)) ;
                
                ROI_cell  = temp(X1:X2,Y1:Y2);
                ROI_ring  = bw_ring(X1:X2,Y1:Y2);
                ROI_ring(ROI_cell==0)=0;
                
                
                
                if max( ROI_ring(:))>0
                
                
                    
        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_cell); 
        ROI_perim=bwperim(ROI_cell);
       
        [cell_centerline,dist_cell_centerline]=interpolate_backbone(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y);
        
       [cell_mesh]=interpolate_contour(cell_centerline,dist_cell_centerline,1);  
        
   
        
        span=5;Repeats =2;
        for mm=1:Repeats
            cell_mesh(:,1)=smooth(cell_mesh(:,1), span,'rlowess' )  ;
            cell_mesh(:,2)=smooth(cell_mesh(:,2), span,'rlowess' )  ;
            cell_mesh(:,3)=smooth(cell_mesh(:,3), span,'rlowess' )  ;
            cell_mesh(:,4)=smooth(cell_mesh(:,4), span,'rlowess' )  ;
            %
            dist_cell_centerline=sqrt((cell_mesh(:,3)-cell_mesh(:,1)).^2+(cell_mesh(:,4)-cell_mesh(:,2)).^2);
            cell_mesh =interpolate_contour( [(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2],dist_cell_centerline,1);
            
        end
     
        
        
        
        cell_centerline=[(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2];
        d=diff(cell_centerline,1,1);
        l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
      
        
      
              
            ROI_ring=bwmorph(ROI_ring,'thin',inf);
           
            
            while sum(ROI_ring(:))>2
                ROI_ring=bwmorph(ROI_ring,'thin',inf);
                ROI_ring2=bwmorph(ROI_ring,'endpoints');
                ROI_ring(ROI_ring2==1)=0;
            end
            
            if sum(ROI_ring(:))==2
                
                 [x_ring, y_ring]=find(ROI_ring);
                 
                 x_ring=x_ring(1);y_ring=y_ring(1);                
                vec_dis=((cell_centerline(:,1)-x_ring).^2+(cell_centerline(:,2)-y_ring).^2) ;
                [min1,ind1]=min(vec_dis);
                 [x_ring, y_ring]=find(ROI_ring);
                x_ring=x_ring(2);y_ring=y_ring(2);                
                vec_dis=((cell_centerline(:,1)-x_ring).^2+(cell_centerline(:,2)-y_ring).^2) ;
                [min2,ind2]=min(vec_dis);
                
                if min2<min1
                    ind=ind2;
                else
                    ind=ind1;
                end
                
                
                
            elseif sum(ROI_ring(:))==1
                
                [x_ring, y_ring]=find(ROI_ring);
                x_ring=x_ring(1);y_ring=y_ring(1);                
                vec_dis=((cell_centerline(:,1)-x_ring).^2+(cell_centerline(:,2)-y_ring).^2) ;
                [~ ,ind ]=min(vec_dis);
                
            else
                'problem'
                pause
            end
            
%             we dont have a differnce between the two sides





%             inspection:
%             
%             figure(1)
%             cla
%             imagesc( ROI_cell+ROI_ring)
%             hold on
%             [~,middle_ind]=min(abs(l-max(l)/2));
%             temp_Centroid=[cell_centerline(middle_ind,1) cell_centerline(middle_ind,2)];
%             
%             scatter(temp_Centroid(2),temp_Centroid(1))
%             x_ring_interpulated=cell_centerline(ind,1);
%             y_ring_interpulated=cell_centerline(ind,2);
%             scatter( y_ring_interpulated, x_ring_interpulated)
%             
%             line(cell_centerline(:,2),cell_centerline(:,1),'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',2)  ;
%             
                  Diff=abs((l(ind)-l(end)/2)/l(end));
                        if iii==1
                            diff_vec=Diff;
                            iii=iii+1;
                        else
                               
                                  diff_vec(end+1:end+length(Diff))= Diff;
                                    iii=iii+1;
                               
                        end 
                        end
                    end
            end
        end
        end
                
    end 
     diff_vec_stack(Counter).cdata=diff_vec;  
     Counter=Counter+1;
end
 
 


maxi=0;
for ii=1:size( diff_vec_stack,2)
    if maxi<length( diff_vec_stack(ii).cdata)
        maxi=length( diff_vec_stack(ii).cdata);
    end
end
Data_Cell_diff=nan( maxi,ii);
for ii=1:size( diff_vec_stack,2)
Data_Cell_diff( 1:length( diff_vec_stack(ii).cdata),ii )= diff_vec_stack(ii).cdata;
figure(1)
imagesc(Data_Cell_diff)
 
end

% try
%     a=1:4:64
%     Data_Cell_diff2=Data_Cell_diff(:,a) 
% end
% xlswrite('Data_Cell_diff1.xlsx',Data_Cell_diff2)

% 
% 

