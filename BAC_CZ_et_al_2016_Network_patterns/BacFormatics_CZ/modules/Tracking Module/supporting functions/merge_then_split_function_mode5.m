
function merge_then_split_function_mode5(handles)
 
global  mode_5 spot_size spot_type N_frames
 
    SE=strel(spot_type,spot_size);
    track_what= get(handles.track_what1,'Value') ;
    box_Raw=get(handles.Raw_listbox,'string');
    box_cell_ind = handles.box_cell_ind; 
    h=timebar_BACWrapper('Render trajectories. Please wait....');
    for ii=1:N_frames 
        try
            timebar_BACWrapper(h,ii/N_frames) 
            if   isempty(box_cell_ind(ii).cdata)~=1
                filename=char(box_Raw(ii))   ; 
                full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ; 
                temp_Segmentation=imread_cross( full_filename_Segmentation);
                temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation); 
                bw=zeros(size(temp_Segmentation)); 
                temp_box_cell_ind=sub2ind(size(bw),box_cell_ind(ii).cdata(:,1),box_cell_ind(ii).cdata(:,2));
                bw(temp_box_cell_ind )=1; 
                temp_Segmentation(bw==1)=0; 
                bw =imclose(bw  ,SE ) ;
                bw =imfill(bw,'holes' ) ; 
                L=bwlabel(bw,4);
                if max(L(:))==1 %it was closed, now split 
                    s=regionprops(bw,'BoundingBox');  xy= s.BoundingBox ;
                    X1=round(xy(2)) ;
                    Y1=round(xy(1));
                    X2=round(xy(2)+xy(4));
                    Y2=round(xy(1)+xy(3)); 
                    ROI=bw(X1:X2,Y1:Y2) ;
                    ROI2 = middle_split_segment_ROI(ROI) ;
                    if max(max(bwlabel(ROI2,4)))==1
                        ROI2=   South_North_function(ROI) ;
                    end 
                    temp_Segmentation(X1:X2,Y1:Y2)= temp_Segmentation(X1:X2,Y1:Y2)+ROI2;
                end
                imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive  
            end
        end
    end 
    
    
    
    

 