%% ________________BacFormatics Code starts here:________________  
function [full_filename,filename]=set_new_filename(  filename,Projected_by_Str,Projected_by_Value,track_what2,track_what3,segmentation_type, pathname )  
save all

if strcmp(pathname,'')% read file without path, and reconstruct it.Limitations:  currently doesnt support z sections. only ch00
    
    filename=char(filename)
 filename=regexprep(filename, '\', filesep) 
 filename=regexprep(filename, '/', filesep) ;

 ind=findstr(filename,filesep)
 ind=ind(end)
 
 filename2=filename(1:ind-1)
  filename3=filename(ind+1:end)
 if segmentation_type==2
     full_filename=char(strcat(filename2,filesep,'ch00_Filtered',filesep, filename3,'_ch00_Filtered.tif'))
 end
    
  if segmentation_type==3
     full_filename=char(strcat(filename2,filesep,'ch00_Segmented',filesep, filename3,'_ch00_Segmented.tif'))
 end
    
 
    
else


filename=char(filename)                  
if isempty(strfind(filename,'.tif'))~=1                  
filename=filename(1:max(strfind(filename, '_ch')-1))                  
end                  
if isempty(strfind(filename,'_z'))~=1                  
filename=filename(1:max(strfind(filename, '_z')-1))                  
end                  
if  isdir(char(pathname)) ~=1                  
mkdir(char(pathname))                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
Projected_by=regexprep(Projected_by, 'z', '') ;                  
Projected_by=str2double(Projected_by) ;                  
if segmentation_type==2                  
if isempty(Projected_by)~=1 && isnan(Projected_by)~=1                  
filename = char(strcat(filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what2-1),'_Filtered.tif'))  ;                  
mkdir(char(strcat(pathname ,  'z',filesep))) ;                  
full_filename =  char(strcat(pathname ,  'z',filesep,filename));                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
if findstr('By mean',Projected_by)                  
filename=regexprep(filename, '.tif', '') ;                  
filename= char(strcat(filename,'_ch0',num2str(track_what2-1),'_Filtered.tif')) ;                  
full_filename = char(strcat(pathname  ,filename));                  
end                  
end                  
if segmentation_type==3                  
if isempty(Projected_by)~=1 && isnan(Projected_by)~=1                  
str_takeoff= char(strcat('_z0',num2str(Projected_by),'_ch0',num2str(track_what2-1),'_Filtered.tif'))   ;                  
filename =regexprep(filename ,str_takeoff, '')  ;                  
filename =char(strcat( filename ,'_z0',num2str(Projected_by),'_ch0',num2str(track_what3-1),'_Segmented.tif'));                  
mkdir(char(strcat(pathname ,  'z',filesep)))                  
full_filename  =  char(strcat(pathname ,  'z',filesep,  filename ));                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
if findstr('By mean',Projected_by)                  
str_takeoff= char(strcat('_ch0',num2str(track_what2-1),'_Filtered.tif'))  ;                  
filename =regexprep(filename ,str_takeoff, '') ;                  
filename =char(strcat( filename ,'_ch0',num2str(track_what3-1),'_Segmented.tif')) ;                  
full_filename  =  char(strcat(pathname ,  filename ));                  
end                  
end                  
end

full_filename=regexprep(full_filename, '\', filesep) 
full_filename=regexprep(full_filename, '/', filesep) ;

