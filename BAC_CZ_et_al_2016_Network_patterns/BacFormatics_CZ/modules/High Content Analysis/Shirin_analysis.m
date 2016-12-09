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

 
   clear Cell_Length_stack 
    clear  listbox 
Counter=1;
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
                    file_name=regexprep(file_name,'ch00.tif','ch00_Segmented.tif');
                     
                        full_file_name= char(strcat(pathname,'ch00_Segmented\', file_name));%ch00_Segmented
                        temp_matrix=double(imread(full_file_name)); 
                        
                        
                        
                        
                        L=bwlabel(temp_matrix,4);
                        
                        
                        if max(L(:))>0
                        s=regionprops(L,'Perimeter', 'MinorAxisLength');
                        
                        MinorAxisLength=cat(1,s.MinorAxisLength);
                        Perimeter=cat(1,s.Perimeter);
                         
                        if iii==1
                            Cell_Length=Perimeter/2-pi*MinorAxisLength/2;
                            iii=iii+1;
                        else
                               Cell_Length2=Perimeter/2-pi*MinorAxisLength/2;
                                 Cell_Length(end+1:end+length(Cell_Length2))=  Cell_Length2;
                                    iii=iii+1;
                               
                        end
                        end
                    end
%                    Length=
%                  matrix= temp_martix; 
%                  matrix2=bwmorph(matrix,'thin',inf); 
%                         
%                         
%                   figure(1)
%                   imagesc( matrix2+matrix)
%                   pause
                end
                 Cell_Length_stack(Counter).cdata=Cell_Length;
     listbox{Counter}=pathname;
     Counter=Counter+1;
    end 
end
end
  



maxi=0;
for ii=1:size(Cell_Length_stack,2)
    if maxi<length(Cell_Length_stack(ii).cdata)
        maxi=length(Cell_Length_stack(ii).cdata);
    end
end
Data_Cell_Length=nan( maxi,ii);
for ii=1:size(Cell_Length_stack,2)
Data_Cell_Length( 1:length(Cell_Length_stack(ii).cdata),ii )=Cell_Length_stack(ii).cdata;
figure(1)
imagesc(Data_Cell_Length)
 
end

try
    a=1:4:64
    Data_Cell_Length2=Data_Cell_Length(:,a) 
end
xlswrite('Data_Cell_Length1.xlsx',Data_Cell_Length2)




