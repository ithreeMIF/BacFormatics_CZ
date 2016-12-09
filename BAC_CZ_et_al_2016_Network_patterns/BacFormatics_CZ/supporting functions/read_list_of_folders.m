function [list_of_folders]=read_list_of_folders(folder_name)                  
folder_name2= folder_name  ;                  
find_ind=findstr(folder_name2, [filesep filesep]) ;                  
if isempty(find_ind)~=1                  
folder_name2 (find_ind)=[]  ;                  
end                   
list_of_folders=cellstr({});                  
dir_folder_name=dir(folder_name); jj=1;                  
for ii=1:size(dir_folder_name,1) %loop 1                  
if  dir_folder_name(ii).isdir==1                  
if length(dir_folder_name(ii).name)>2                  
list_of_folders(jj)=cellstr(strcat(folder_name2,filesep,dir_folder_name(ii).name));                  
temp_str = char(list_of_folders(jj)) ;                  
find_ind=findstr(temp_str, [filesep filesep]) ;                  
if isempty(find_ind)~=1                  
temp_str (find_ind)=[] ;                  
list_of_folders(jj)=  {temp_str}  ;                  
end                   
jj=jj+1;                  
end                  
end                  
end                 
 
 