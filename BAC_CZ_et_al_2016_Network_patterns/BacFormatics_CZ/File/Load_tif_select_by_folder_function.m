function [pathname,filename]=Load_tif_select_by_folder_function(handles)
pathname = uigetdir;
if isequal(pathname,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
pathname =strcat(pathname,filesep);
str=strcat(pathname,'*.tif');
dir_filename=dir(str);
jj=0;
for ii=1:size(dir_filename,1)
    if    isempty(findstr(dir_filename(ii).name,'tif'))~=1
        jj=jj+1 ;
    end
end
filename_str=cell(jj,1);
jj=1;
for ii=1:size(dir_filename,1)
    if    isempty(findstr(dir_filename(ii).name,'tif'))~=1
        filename_str(jj)=cellstr(dir_filename(ii).name) ; jj=jj+1;
    end
end


choice = questdlg('Do you want to add zeros to time labeling (recomended)?','Hello User','Yes','No','Yes');
switch choice
    case 'Yes'
        add_zeros_to_filename(pathname,filename_str)
        
        
        dir_filename=dir(str);
        jj=0;
        for ii=1:size(dir_filename,1)
            if    isempty(findstr(dir_filename(ii).name,'tif'))~=1
                jj=jj+1 ;
            end
        end
        filename_str=cell(jj,1);
        jj=1;
        for ii=1:size(dir_filename,1)
            if    isempty(findstr(dir_filename(ii).name,'tif'))~=1
                filename_str(jj)=cellstr(dir_filename(ii).name) ; jj=jj+1;
            end
        end
end 

[pathname,filename]=create_new_experiment_function(handles,pathname,filename_str);
% --------------------------------------------------- 
