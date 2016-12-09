
 track_what=1
 global box_Raw
%  XY_data= handles.data_file(4).cdata.L(track_what).cdata;  
 
pathname_Segmentation=handles.data_file(2).cdata(track_what,3)                  
h=timebar_BACWrapper('Re-label cells before exporting to Houdini. Please wait....');                  
set(h,'color','w');       
 global N_frames
 start_track=1
 end_track=N_frames
for ii=start_track:end_track %2 Procced only if the complimantory Segmented file was found                  
timebar_BACWrapper(h,ii/(end_track-start_track+1))        
 

  
     
filename_Segmentation=box_Raw(ii) ;                  
full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;                  
full_filename_Segmentation=char(full_filename_Segmentation) ;                  
temp_Segmentation=imread( full_filename_Segmentation,1);     

 
L=bwlabel(temp_Segmentation ,4);     
    Border_matrix=[]; border_index_vector=[];
    for iii=1:max(L(:))
        temp_bw=L==iii; 
       
        
        
           B  = bwboundaries(temp_bw,'noholes');
            temp_Border=B{1};

             
                      
         
         
       if iii==1
           Border_matrix=temp_Border;
           border_index_vector=ones(size( temp_Border,1),1);
       else%
           Border_matrix(end+1:end+size(temp_Border,1),:)=temp_Border;  
           border_index_vector(end+1:end+size(temp_Border,1),:)=iii;  
       end    
    end 
    
      
    str=['c:\3_7\border_index_vector_' num2str(ii) '.chan'] ;
    save(str, 'border_index_vector', '-ASCII') 
    
   
    str=['c:\3_7\ConvexHull_matrix_' num2str(ii) '.chan'] ;
    save(str, 'Border_matrix', '-ASCII')
 
end              
             
      
close(h)                  
         