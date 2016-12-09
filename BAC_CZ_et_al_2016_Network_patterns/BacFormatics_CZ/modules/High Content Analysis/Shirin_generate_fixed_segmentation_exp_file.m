clear all

 
new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');
if isequal(new_dir,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
pathname=strcat(new_dir,'\');

data_file=importdata(char(strcat(pathname,'BacFormatics_EXP_template.dat')))


  str=char(strcat(pathname,'\resegment\*.png'));
   dir_filename=dir(str)  ;




for ii=1:size(dir_filename,1) 
        str= dir_filename(ii).name  ;
           ind1=  findstr(str,'--') ;
           
           filename_str=str(ind1+2:end-19);
           pathname_str=str(1:ind1);
           
            if  pathname_str(end)=='-'
                pathname_str(end)=[];
            end
             if  pathname_str(end)~='\'
                pathname_str(end+1)='\';
             end
             
             
           pathname_str2=regexprep( pathname_str ,'_','\');
           pathname_str3=regexprep( pathname_str2,'-',' ');
     
           
           full_filename=char(strcat(pathname,pathname_str3,filename_str));
           
%            full_pathname=char(strcat(pathname,pathname_str3));
%            full_pathname_Segmented=char(strcat(pathname,pathname_str3,'\ch00_Segmented'));
           data_file(1).cdata(ii)=cellstr(full_filename);
           
%            data_file(2).cdata{ii,1}=cellstr(full_pathname);
%            data_file(2).cdata{ii,3}=cellstr(full_pathname_Segmented);
end


 
handles.data_file(10).cdata='BacFormatics_EXP_resegment.dat';  
save('BacFormatics_EXP_resegment.dat' ,  'data_file')
pause(1)
msgbox('Experiment file was saved. Press OK to continue','Saved')


