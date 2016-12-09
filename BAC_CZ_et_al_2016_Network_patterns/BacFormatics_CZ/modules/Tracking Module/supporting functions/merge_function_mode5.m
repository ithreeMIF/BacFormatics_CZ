 function merge_function_mode5(handles)
 
global  mode_5 spot_size spot_type N_frames 

    SE=strel('disk',spot_size);
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
                temp_Segmentation=imread( full_filename_Segmentation,1);
                temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation); 
                bw=zeros(size(temp_Segmentation)); 
                temp_box_cell_ind=sub2ind(size(bw),box_cell_ind(ii).cdata(:,1),box_cell_ind(ii).cdata(:,2))
                bw(temp_box_cell_ind )=1; 
                temp_Segmentation(bw==1)=0; 
                bw =imclose(bw  ,SE ) ;
                bw =imfill(bw,'holes' ) ;
                temp_Segmentation(bw ==1)=1; 
                imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive  
            end
        end
    end

 
