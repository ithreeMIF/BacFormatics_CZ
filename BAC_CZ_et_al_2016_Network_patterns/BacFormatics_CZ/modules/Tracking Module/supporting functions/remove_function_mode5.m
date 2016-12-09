function remove_function_mode5(handles)

global  mode_5 spot_size spot_type N_frames
SE=strel(spot_type,spot_size);
track_what= get(handles.track_what1,'Value') ;
box_Raw=get(handles.Raw_listbox,'string');
box_cell_ind = handles.box_cell_ind;
n=handles.n;



h=timebar_BACWrapper('Render trajectories. Please wait....');
for ii=1:N_frames
    
    
    try
        timebar_BACWrapper(h,ii/N_frames)
        
        
        if   isempty(box_cell_ind(ii).cdata)~=1
            filename=char(box_Raw(ii))   ;
            
            full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
            temp_Segmentation=imread_cross( full_filename_Segmentation);
            temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation);
            
            
            
            
            full_filename_Raw= char(strcat(handles.data_file(2).cdata(track_what,2),filename,'_ch0',num2str(track_what-1),'_Filtered.tif'));
            temp_Raw=imread_cross(  full_filename_Raw);
            
            
            bw=zeros(size(temp_Segmentation));
            
            
            
            
            temp_box_cell_ind=sub2ind(size(bw),box_cell_ind(ii).cdata(:,1),box_cell_ind(ii).cdata(:,2));
            bw(temp_box_cell_ind )=1;
            
            temp_Segmentation(bw==1)=0;
            
          
            
            imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive
            if get(handles.Automatic_labeling_option,'value')==2
                pushbutton27_Callback2(hObject, eventdata, handles,ii)
            end
        end
    end
end
