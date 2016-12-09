function [pathname,filename]=create_new_experiment_function(handles,pathname,Raw_listbox)
 
ch_0=1;
ch_1=0;
ch_2=0;
ch_3=0;

DATA=[];
DATA(3).cdata=cell(4,2) ;
DATA(3).cdata(1,1)=cellstr(num2str(ch_0));
DATA(3).cdata(2,1)=cellstr(num2str(ch_1));
DATA(3).cdata(3,1)=cellstr(num2str(ch_2));
DATA(3).cdata(4,1)=cellstr(num2str(ch_3));


DATA(3).cdata(1,2)=cellstr('dic');
DATA(3).cdata(2,2)=cellstr('_');
DATA(3).cdata(3,2)=cellstr('_');
DATA(3).cdata(4,2)=cellstr('_');

active=4;

DATA(2).cdata=cell(9,3) ; %
for ii=1:active
    DATA(4).cdata.Centroids(ii).cdata=[];
end
for ii=1:active
    DATA(4).cdata.L(ii).cdata=[];
end
for ii=1:active
    DATA(5).cdata.Tracks(ii).cdata=[];
end
DATA(7).cdata=cell(6,2) ; %flags for tracking and labeling status (with label is easy only has to use isempty(centy1) command
DATA(7).cdata(1,1)=cellstr('N');
DATA(7).cdata(2,1)=cellstr('N');
DATA(7).cdata(3,1)=cellstr('N');
DATA(7).cdata(4,1)=cellstr('N');
DATA(7).cdata(5,1)=cellstr('N');
DATA(7).cdata(6,1)=cellstr('N');
DATA(7).cdata(1,2)=cellstr('N');
DATA(7).cdata(2,2)=cellstr('N');
DATA(7).cdata(3,2)=cellstr('N');
DATA(7).cdata(4,2)=cellstr('N');
DATA(7).cdata(5,2)=cellstr('N');
DATA(7).cdata(6,2)=cellstr('N');
DATA(7).cdata(1,3)=cellstr('N');
DATA(7).cdata(2,3)=cellstr('N');
DATA(7).cdata(3,3)=cellstr('N');
DATA(7).cdata(4,3)=cellstr('N');
DATA(7).cdata(5,3)=cellstr('N');
DATA(7).cdata(6,3)=cellstr('N');
try
    Data= handles.temp2(2).cdata;
end

data_file=[];
data_file=DATA;

pathname_temp= char(strcat(pathname)) ;    mkdir(pathname_temp) ;    data_file(2).cdata(1,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(2,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(3,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(4,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch00_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(1,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch01_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(2,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch02_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(3,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch03_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(4,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch00_Segmented',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(1,3)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch01_Segmented',filesep));    mkdir(pathname_temp) ;    data_file(2).cdata(2,3)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch02_Segmented',filesep));    mkdir(pathname_temp) ;    data_file(2).cdata(3,3)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch03_Segmented',filesep));   mkdir(pathname_temp) ;    data_file(2).cdata(4,3)=cellstr(char(pathname_temp));

n=length(Raw_listbox);
iiii=1;
zz=cell(1,1); zz(1)=cellstr('empty');

choice = questdlg('Do you want to normalize image intensity and save as 8-bit?','Hello User','Yes','No','Yes');
switch choice
    case 'Yes'
        inputval = inputdlg('Please input new mean intensity (max 255)','Input',1,{'120'});
        inputval=str2num(char(inputval));
        
        h=waitbar(0,'please wait...');
        for   ii=1:n
              waitbar(ii/n )
            file_name= char(Raw_listbox(ii));
            file_name= char(regexprep(file_name, '_ch00', ''));
            file_name= char(regexprep(file_name, '_ch01', ''));
            file_name= char(regexprep(file_name, '_ch02', ''));
            file_name= char(regexprep(file_name, '_ch03', ''));
            file_name= char(regexprep(file_name, '_ch04', ''));
            file_name= char(regexprep(file_name, '_ch05', ''));
            file_name= char(regexprep(file_name, '.tif', ''));
            
            full_file_name= char(strcat(pathname,file_name,'.tif'));
            try
                temp_martix=double(imread_cross(full_file_name));
                temp_martix= temp_martix./mean(mean(temp_martix));
                temp_martix= uint8(inputval*temp_martix);
                if ii==1
                    info=imfinfo(full_file_name);
                    data_file(6).cdata= [1 1  info.Width  info. Height];
                    data_file(9).cdata=8;
                end
                delete( full_file_name)
                new_full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
                imwrite(temp_martix, new_full_file_name)
                
            catch
                full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
                temp_martix=double(imread_cross(full_file_name));
                temp_martix= temp_martix./mean(mean(temp_martix));
                temp_martix= uint8(inputval*temp_martix);
                if ii==1
                    info=imfinfo(full_file_name);
                    data_file(6).cdata= [1 1  info.Width  info. Height];
                    data_file(9).cdata=8;
                end
                delete( full_file_name)
                imwrite(temp_martix,  full_file_name)
            end
            
            
            
            stat=0;
            for iii=1:length(zz)
                if isempty(strfind(file_name,char(zz(iii))))==0
                    stat=1; break
                end
            end
            if stat==0
                zz(iiii)=  cellstr(file_name);iiii=iiii+1;
            end
        end
        close(h)
        
    case 'No'
        h=waitbar(0,'please wait...');
        for   ii=1:n
              waitbar(ii/n )
            
            file_name= char(Raw_listbox(ii));
            file_name= char(regexprep(file_name, '_ch00', ''));
            file_name= char(regexprep(file_name, '_ch01', ''));
            file_name= char(regexprep(file_name, '_ch02', ''));
            file_name= char(regexprep(file_name, '_ch03', ''));
            file_name= char(regexprep(file_name, '_ch04', ''));
            file_name= char(regexprep(file_name, '_ch05', ''));
            file_name= char(regexprep(file_name, '.tif', ''));
            
            full_file_name= char(strcat(pathname,file_name,'.tif'));
            try
                temp_martix=imread_cross(full_file_name);
                if ii==1
                    info=imfinfo(full_file_name);
                    data_file(6).cdata= [1 1  info.Width  info. Height];
                    data_file(9).cdata=info.BitDepth;
                end
                delete( full_file_name)
                new_full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
                imwrite(temp_martix, new_full_file_name)
                
            catch
                full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
                temp_martix=imread_cross(full_file_name);
                if ii==1
                    info=imfinfo(full_file_name);
                    data_file(6).cdata= [1 1  info.Width  info. Height];
                    data_file(9).cdata=info.BitDepth;
                end
                delete( full_file_name)
                imwrite(temp_martix,  full_file_name)
            end
            
            
            
            stat=0;
            for iii=1:length(zz)
                if isempty(strfind(file_name,char(zz(iii))))==0
                    stat=1; break
                end
            end
            if stat==0
                zz(iiii)=  cellstr(file_name);iiii=iiii+1;
            end
        end
           close(h)
end

 
           
data_file(1).cdata(:,1)=zz;
 
 
%           ------------
if iscell(Raw_listbox)==0
    return
end
%      -----------------
inputval = inputdlg('Please input name for experimental file','Input',1,{'New'});
filename=char(strcat('BacFormatics_EXP_',inputval,'.dat'))
full_filename=char(strcat(pathname,filename));
data_file(10).cdata=full_filename;
save (full_filename,'data_file');
pause(0.3)
 
% 