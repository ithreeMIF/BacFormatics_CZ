clear all
new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');
if isequal(new_dir,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
pathname=strcat(new_dir,'\');
% set(handles.pathname,'string',pathname);
% guidata(hObject,handles);
jj=1;
[list_of_folders]=read_list_of_folders(pathname) %maybe 1, maybe more
if isempty(list_of_folders)==1
    return
end
h =waitbar(0.5,'Please wait....');
set(h ,'color','w');
while size(list_of_folders,2)>0
    'loop 1'
    [temp_list_of_folders]=read_list_of_folders(char(list_of_folders(1)));
    % if      isempty(strfind(char(list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(list_of_folders(1)),'Pos'))~=1 )
    filename_str(jj)= list_of_folders(1) ; jj=jj+1;
    % end
    list_of_folders(1)=[]
    while size(temp_list_of_folders,2)>0
        'loop 2'
        [temp2_list_of_folders]=read_list_of_folders(char(temp_list_of_folders(1)));
        % if  isempty(strfind(char(temp_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp_list_of_folders(1)),'Pos'))~=1 )
        filename_str(jj)= temp_list_of_folders(1) ; jj=jj+1;
        % end
        temp_list_of_folders(1)=[] ;
        while size(temp2_list_of_folders,2)>0
            'loop 3'
            [temp3_list_of_folders]=read_list_of_folders(char(temp2_list_of_folders(1)));
            % if  isempty(strfind(char(temp2_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp2_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp2_list_of_folders(1)),'Pos'))~=1 )
            filename_str(jj)= temp2_list_of_folders(1) ; jj=jj+1;
            % end
            temp2_list_of_folders(1)=[] ;
            while size(temp3_list_of_folders,2)>0
                'loop 4'
                [temp4_list_of_folders]=read_list_of_folders(char(temp3_list_of_folders(1)));
                % if  isempty(strfind(char(temp3_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp3_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp3_list_of_folders(1)),'Pos'))~=1 )
                filename_str(jj)= temp3_list_of_folders(1) ; jj=jj+1;
                % end
                temp3_list_of_folders(1)=[]
                while size(temp4_list_of_folders,2)>0
                    'loop 5'
                    [temp5_list_of_folders]=read_list_of_folders(char(temp4_list_of_folders(1)));
                    % if  isempty(strfind(char(temp4_list_of_folders(1)),'Projection'))==1    &&   ( isempty(strfind(char(temp4_list_of_folders(1)),'pos'))~=1 ||  isempty(strfind(char(temp4_list_of_folders(1)),'Pos'))~=1 )
                    filename_str(jj)= temp4_list_of_folders(1) ; jj=jj+1;
                    % end
                    temp4_list_of_folders(1)=[]  ;
                end
            end
        end
    end
end




for nn=1:size(filename_str,2)
    try
        %     data_file=[];
        %     data_file=DATA;
        
        
        pathname =char(strcat(filename_str(nn),'\'));
        str=char(strcat(pathname,'*.tif'));
        dir_filename=dir(str)  ;
        if size(dir_filename,1)>0
            
            
            
            jj=0;
            for ii=1:size(dir_filename,1)
                if    isempty(findstr(dir_filename(ii).name,'tif'))~=1
                    jj=jj+1 ;
                end
            end
            Raw_listbox =cell(jj,1);
            jj=1;
            for ii=1:size(dir_filename,1)
                if    isempty(findstr(dir_filename(ii).name,'tif'))~=1
                    Raw_listbox(jj)=cellstr(dir_filename(ii).name) ; jj=jj+1;
                end
            end
            
            
            
            n=length(Raw_listbox);   iii=1;
            for   ii=1:n
              try
                    file_name= char(Raw_listbox(ii));
                    
                 full_file_name= char(strcat(pathname , file_name)); 
                    raw_matrix=uint8(imread(full_file_name)); 
                    
                    file_name=regexprep(file_name,'ch00.tif','ch00_Segmented.tif'); 
                    full_file_name= char(strcat(pathname,'ch00_Segmented\', file_name));%ch00_Segmented
                    segmented_matrix=uint8(imread(full_file_name)); 
                    
                    raw_matrix1=raw_matrix;        raw_matrix2=raw_matrix;        raw_matrix3=raw_matrix;
%                    raw_matrix(segmented_matrix==1)=180;
                  raw_matrix3(segmented_matrix==1)=255;
                  
               temp_matrix=cat(3,raw_matrix1,raw_matrix2, raw_matrix3);
               
                figure(1)
                imagesc( temp_matrix)
               pathname2=pathname;
                pathname2(1:length(new_dir)+1)=[];
                str=regexprep(pathname2,'\','_'); str=regexprep(str,' ','-');
                
                
                if strcmp(str(end),'\')
                    str(end)=[];
                end
                if strcmp(str(end),'_')
                    str(end)=[];
                end
                
                 
                str2=char(strcat(new_dir,'\',str,'--',file_name))
                   str2=regexprep(str2,'tif','png');
                imwrite(temp_matrix,str2)
%                 
%                 pause
  end
        end
    end
    end
end


 
