function varargout = HCA_module(varargin)
% HCA_MODULE MATLAB code for HCA_module.fig
%      HCA_MODULE, by itself, creates a new HCA_MODULE or raises the existing
%      singleton*.
%
%      H = HCA_MODULE returns the handle to a new HCA_MODULE or the handle to
%      the existing singleton*.
%
%      HCA_MODULE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HCA_MODULE.M with the given input arguments.
%
%      HCA_MODULE('Property','Value',...) creates a new HCA_MODULE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HCA_module_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HCA_module_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HCA_module

% Last Modified by GUIDE v2.5 28-Jul-2015 10:45:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HCA_module_OpeningFcn, ...
                   'gui_OutputFcn',  @HCA_module_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before HCA_module is made visible.
function HCA_module_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HCA_module (see VARARGIN)

% Choose default command line output for HCA_module
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HCA_module wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HCA_module_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
msgbox('USE TIF not tif, otherwise change defualt')
 
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









DATA=[];
% ch_0=get(handles.ch_00,'Value')-1;
% ch_1=get(handles.ch_01,'Value')-1 ;
% ch_2=get(handles.ch_02,'Value')-1;
% ch_3=get(handles.ch_03,'Value')-1;

ch_0= 1
ch_1=0
ch_2=0
ch_3=0

if ch_0==0
    Y=wavread('Error');
    h = errordlg('Chanel 0 must be defined!','Error');
    sound(Y,22000);
    return
end
active=4;
if ch_0==0
    Y=wavread('Error');
    h = errordlg('Chanel 0 must be defined!','Error');
    sound(Y,22000);
    return
end
if ch_1==0
    active=active-1 ;
end
if ch_2==0
    active=active-1;
end
if ch_3==0
    active=active-1 ;
end
DATA=[];
DATA(3).cdata=cell(4,2) ;
DATA(3).cdata(1,1)=cellstr(num2str(ch_0));
DATA(3).cdata(2,1)=cellstr(num2str(ch_1));
DATA(3).cdata(3,1)=cellstr(num2str(ch_2));
DATA(3).cdata(4,1)=cellstr(num2str(ch_3));
% DATA(3).cdata(1,2)=cellstr(get(handles.edit_ch00,'string'));
% DATA(3).cdata(2,2)=cellstr(get(handles.edit_ch01,'string'));
% DATA(3).cdata(3,2)=cellstr(get(handles.edit_ch02,'string'));
% DATA(3).cdata(4,2)=cellstr(get(handles.edit_ch03,'string'));

 DATA(3).cdata(1,2)=cellstr('dic');
 DATA(3).cdata(2,2)=cellstr('_');
  DATA(3).cdata(3,2)=cellstr('_');
   DATA(3).cdata(4,2)=cellstr('_');


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





 
for nn=1:size(filename_str,2)  
 try
    data_file=[];
    data_file=DATA;
 
    
    pathname =char(strcat(filename_str(nn),'\'));
    str=char(strcat(pathname,'*.tif'));
    dir_filename=dir(str)  ;
    if size(dir_filename,1)>0 
    
    pathname_temp= char(strcat(pathname)) ;    mkdir(pathname_temp) ;    data_file(2).cdata(1,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(2,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(3,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(4,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch00_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(1,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch01_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(2,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch02_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(3,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch03_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(4,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch00_Segmented\'));     mkdir(pathname_temp) ;    data_file(2).cdata(1,3)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch01_Segmented\'));    mkdir(pathname_temp) ;    data_file(2).cdata(2,3)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch02_Segmented\'));    mkdir(pathname_temp) ;    data_file(2).cdata(3,3)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch03_Segmented\'));   mkdir(pathname_temp) ;    data_file(2).cdata(4,3)=cellstr(char(pathname_temp));
 
    


                jj=0;
                for ii=1:size(dir_filename,1)
                    if    isempty(findstr(dir_filename(ii).name,'TIF'))~=1
                        jj=jj+1 ;
                    end
                end
                Raw_listbox =cell(jj,1);
                jj=1;
                for ii=1:size(dir_filename,1)
                    if    isempty(findstr(dir_filename(ii).name,'TIF'))~=1
                        Raw_listbox(jj)=cellstr(dir_filename(ii).name) ; jj=jj+1;
                    end
                end
                
               
                
                n=length(Raw_listbox);
                iiii=1;
                zz=cell(1,1); zz(1)=cellstr('empty');
                for   ii=1:n
                    file_name= char(Raw_listbox(ii));
                    file_name= char(regexprep(file_name, '_ch00', ''));
                    file_name= char(regexprep(file_name, '_ch01', ''));
                    file_name= char(regexprep(file_name, '_ch02', ''));
                    file_name= char(regexprep(file_name, '_ch03', ''));
                    file_name= char(regexprep(file_name, '_ch04', ''));
                    file_name= char(regexprep(file_name, '_ch05', ''));
                    file_name= char(regexprep(file_name, '.TIF', ''));
                    
                    
                    
                        full_file_name= char(strcat(pathname,file_name,'.TIF'));
                        temp_martix=double(imread(full_file_name));
                        
                         
  
 temp_martix= temp_martix./mean(mean(temp_martix));
 temp_martix= uint8(120*temp_martix);

 
 figure(1)
 imagesc( temp_martix)
 
 
 if ii==1
                
                info=imfinfo(full_file_name);
                data_file(6).cdata= [1 1  info.Width  info. Height];
                data_file(9).cdata=info.BitDepth; 
     
     
 end
                      
                        
                         
                        
                        delete( full_file_name)
                        
                       new_full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
                   imwrite(temp_martix, new_full_file_name)
                    
                    
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
                
                
                
                
                
                % data_file(1).cdata=cell(length(filename_str),1) ;
                data_file(1).cdata(:,1)=zz;%Raw_listbox;
                %           ------------
                if iscell(Raw_listbox)==0
                    return
                end
                %      -----------------
                n=size(Raw_listbox,1); %ch 0
                jj=1;
                index_Raw_listbox_ch_0=[]
                for ii=1:n
                    file_name= char(Raw_listbox(ii));
                    if isempty(findstr(file_name,'ch00.tif'))~=0
                        index_Raw_listbox_ch_0(jj)=ii;
                        jj=jj+1;
                    end
                end
                clc
            
               
             
%                 pathname=filename_str(nn)
                % str= pathname( strfind(char(pathname),'\pos'):end);
                % str_index=find(ismember(str,'\')) ;
                % str(str_index)=[]  ;
%                 a=char(pathname);
% % %                 try
% % %                     str=a(findstr(a,'\Pos')+4:end)
% % %                     %   for ii=1:size(Data,2)
% % %                     %       for jj=1:size(Data,1)
% % %                     for ii=1:size(Data,1)
% % %                         for jj=1:size(Data,2)
% % %                             try
% % %                                 if strcmp(char(Data(ii,jj)),str)
% % %                                     iijj=[ii jj];
% % %                                 end
% % %                             end
% % %                         end
% % %                     end
% % %                     data_file(11).cdata=handles.temp2(3).cdata(iijj(1)).cdata(iijj(2)).cdata;
% % %                 end
%                 str=a(findstr(a,'\Pos')+1:end);
%                 more_str=get(handles.define_section_name,'String');
%                 if isempty(str)~=1
%                     filename=char(strcat(pathname,'/BacFormatics_EXP_New_',more_str,'_',str,'.dat'))
%                 else
                    filename=char(strcat(pathname,'BacFormatics_EXP_New.dat'))
%                 end
                %This it the principle: the temp experiment should not be overwriiten
                %completed experiments file by mistake.
                data_file(10).cdata=filename;
                save ( filename  ,  'data_file');
                pause(0.3)
                
                
    end             
                
 end            
end
msgbox('Experiment files were created. Press OK to continue','Saved')





set(handles.pushbutton1,'BackGroundColor','g')








return

% new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');
% if isequal(new_dir,0)  %$#1
% h = msgbox('User selected Cancel','Aborted');
% return;
% end
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









DATA=[];
% ch_0=get(handles.ch_00,'Value')-1;
% ch_1=get(handles.ch_01,'Value')-1 ;
% ch_2=get(handles.ch_02,'Value')-1;
% ch_3=get(handles.ch_03,'Value')-1;

ch_0= 1
ch_1=0
ch_2=0
ch_3=0

if ch_0==0
    Y=wavread('Error');
    h = errordlg('Chanel 0 must be defined!','Error');
    sound(Y,22000);
    return
end
active=4;
if ch_0==0
    Y=wavread('Error');
    h = errordlg('Chanel 0 must be defined!','Error');
    sound(Y,22000);
    return
end
if ch_1==0
    active=active-1 ;
end
if ch_2==0
    active=active-1;
end
if ch_3==0
    active=active-1 ;
end
DATA=[];
DATA(3).cdata=cell(4,2) ;
DATA(3).cdata(1,1)=cellstr(num2str(ch_0));
DATA(3).cdata(2,1)=cellstr(num2str(ch_1));
DATA(3).cdata(3,1)=cellstr(num2str(ch_2));
DATA(3).cdata(4,1)=cellstr(num2str(ch_3));
% DATA(3).cdata(1,2)=cellstr(get(handles.edit_ch00,'string'));
% DATA(3).cdata(2,2)=cellstr(get(handles.edit_ch01,'string'));
% DATA(3).cdata(3,2)=cellstr(get(handles.edit_ch02,'string'));
% DATA(3).cdata(4,2)=cellstr(get(handles.edit_ch03,'string'));

 DATA(3).cdata(1,2)=cellstr('dic');
 DATA(3).cdata(2,2)=cellstr('_');
  DATA(3).cdata(3,2)=cellstr('_');
   DATA(3).cdata(4,2)=cellstr('_');


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



for nn=1:size(filename_str,2)  
 try
    data_file=[];
    data_file=DATA;
 
    
    pathname =char(strcat(filename_str(nn),'\'));
    str=char(strcat(pathname,'*.tif'));
    dir_filename=dir(str)  ;
    if size(dir_filename,1)>0 
    
    pathname_temp= char(strcat(pathname)) ;    mkdir(pathname_temp) ;    data_file(2).cdata(1,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(2,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(3,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(4,1)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch00_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(1,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch01_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(2,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch02_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(3,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch03_Filtered\'));     mkdir(pathname_temp) ;    data_file(2).cdata(4,2)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch00_Segmented\'));     mkdir(pathname_temp) ;    data_file(2).cdata(1,3)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch01_Segmented\'));    mkdir(pathname_temp) ;    data_file(2).cdata(2,3)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch02_Segmented\'));    mkdir(pathname_temp) ;    data_file(2).cdata(3,3)=cellstr(char(pathname_temp));
    pathname_temp= char(strcat(pathname,'ch03_Segmented\'));   mkdir(pathname_temp) ;    data_file(2).cdata(4,3)=cellstr(char(pathname_temp));
 
    


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
                
                
%                 Raw_listbox
%                 pause
                
                
                n=length(Raw_listbox);
                iiii=1;
                zz=cell(1,1); zz(1)=cellstr('empty');
                for   ii=1:n
                    file_name= char(Raw_listbox(ii));
                    file_name= char(regexprep(file_name, '_ch00', ''));
                    file_name= char(regexprep(file_name, '_ch01', ''));
                    file_name= char(regexprep(file_name, '_ch02', ''));
                    file_name= char(regexprep(file_name, '_ch03', ''));
                    file_name= char(regexprep(file_name, '_ch04', ''));
                    file_name= char(regexprep(file_name, '_ch05', ''));
                    file_name= char(regexprep(file_name, '.tif', ''));
                    
                    
                    
                        full_file_name= char(strcat(pathname,file_name,'.tif'));
                        temp_martix=double(imread(full_file_name));
                        
                         
  
 temp_martix= temp_martix./mean(mean(temp_martix));
 temp_martix= uint8(120*temp_martix);
 mean(mean(temp_martix))
   
 
 
 
 if ii==1
                
                info=imfinfo(full_file_name);
                data_file(6).cdata= [1 1  info.Width  info. Height];
                data_file(9).cdata=info.BitDepth; 
     
     
 end
                      
                        
                         
                        
                        delete( full_file_name)
                        
                       new_full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
                   imwrite(temp_martix, new_full_file_name)
                    
                    
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
                
                
                
                
                
                % data_file(1).cdata=cell(length(filename_str),1) ;
                data_file(1).cdata(:,1)=zz;%Raw_listbox;
                %           ------------
                if iscell(Raw_listbox)==0
                    return
                end
                %      -----------------
                n=size(Raw_listbox,1); %ch 0
                jj=1;
                index_Raw_listbox_ch_0=[]
                for ii=1:n
                    file_name= char(Raw_listbox(ii));
                    if isempty(findstr(file_name,'ch00.tif'))~=0
                        index_Raw_listbox_ch_0(jj)=ii;
                        jj=jj+1;
                    end
                end
                clc
            
               
             
%                 pathname=filename_str(nn)
                % str= pathname( strfind(char(pathname),'\pos'):end);
                % str_index=find(ismember(str,'\')) ;
                % str(str_index)=[]  ;
%                 a=char(pathname);
% % %                 try
% % %                     str=a(findstr(a,'\Pos')+4:end)
% % %                     %   for ii=1:size(Data,2)
% % %                     %       for jj=1:size(Data,1)
% % %                     for ii=1:size(Data,1)
% % %                         for jj=1:size(Data,2)
% % %                             try
% % %                                 if strcmp(char(Data(ii,jj)),str)
% % %                                     iijj=[ii jj];
% % %                                 end
% % %                             end
% % %                         end
% % %                     end
% % %                     data_file(11).cdata=handles.temp2(3).cdata(iijj(1)).cdata(iijj(2)).cdata;
% % %                 end
%                 str=a(findstr(a,'\Pos')+1:end);
%                 more_str=get(handles.define_section_name,'String');
%                 if isempty(str)~=1
%                     filename=char(strcat(pathname,'/BacFormatics_EXP_New_',more_str,'_',str,'.dat'))
%                 else
                    filename=char(strcat(pathname,'BacFormatics_EXP_New.dat'))
%                 end
                %This it the principle: the temp experiment should not be overwriiten
                %completed experiments file by mistake.
                data_file(10).cdata=filename;
                save ( filename  ,  'data_file');
                pause(0.3)
                
                
    end             
                
 end            
end
msgbox('Experiment files were created. Press OK to continue','Saved')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles   clear all
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
 
set(handles.pushbutton3,'BackGroundColor','g')


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all

 
new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');
if isequal(new_dir,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
pathname=strcat(new_dir,'\');
try
data_file=importdata(char(strcat(pathname,'BacFormatics_EXP_template.dat')))
catch
    msgbox('template experimental file is missing')
end

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
set(handles.pushbutton5,'BackGroundColor','g')
