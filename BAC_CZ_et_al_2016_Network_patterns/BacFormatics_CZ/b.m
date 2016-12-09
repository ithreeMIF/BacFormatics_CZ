function varargout = b(varargin)
% B MATLAB code for b.fig
%      B, by itself, creates a new B or raises the existing
%      singleton*.
%
%      H = B returns the handle to a new B or the handle to
%      the existing singleton*.
%
%      B('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in B.M with the given input arguments.
%
%      B('Property','Value',...) creates a new B or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before b_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to b_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help b

% Last Modified by GUIDE v2.5 27-Jan-2016 11:45:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @b_OpeningFcn, ...
    'gui_OutputFcn',  @b_OutputFcn, ...
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


% --- Executes just before b is made visible.
function b_OpeningFcn(hObject, eventdata, handles, varargin)
Adding_path
Img=imread('UTS_emblem.png');
axes(handles.UTS_emblem);
imshow(Img)

Img=imread('BacFormatics_emblem.png');
axes(handles.BacFormatics_emblem);
imshow(Img)
handles.output = hObject;
set(handles.pathname,'string',cd)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes b wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = b_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Open_Experiment.
function Open_Experiment_Callback(hObject, eventdata, handles)
BAC_NAME=get(handles.figure1,'Name');
Current_Exp= BAC_NAME(findstr(BAC_NAME,'>')+1:end);
Current_Exp=regexprep(Current_Exp, 'BacFormatics_EXP_New.dat','') ;

[filename, pathname, filterindex] = uigetfile({  '*.dat','dat-files (*.dat)';}, 'Please load experiment',Current_Exp);
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end





set(handles.pathname,'string',pathname)
set(handles.filename,'string',filename)



set(handles.edit_axes1,'string','ready','ForegroundColor','w')

set(handles.Load_tif_select_by_folder,'BackGroundColor',[0.8 0.8 0.8])
set(handles.r5,'ForeGroundColor','k')
set(handles.r6,'ForeGroundColor','k')
set(handles.r4,'ForeGroundColor','k')

set(hObject,'BackGroundColor','g')
set(handles.r1,'ForeGroundColor','g')
set(handles.r2,'ForeGroundColor','g')
set(handles.r3,'ForeGroundColor','g')
set(handles.r4,'ForeGroundColor','g')




% ------------------
function Load_tif_select_by_folder_Callback(hObject, eventdata, handles)
[pathname,filename]=Load_tif_select_by_folder_function(handles) ;
set(handles.pathname,'string',pathname)
set(handles.filename,'string',filename)
set(handles.edit_axes1,'string','ready','ForegroundColor','w')



set(handles.Open_Experiment,'BackGroundColor',[0.8 0.8 0.8])
set(handles.r1,'ForeGroundColor','k')
set(handles.r2,'ForeGroundColor','k')
set(handles.r3,'ForeGroundColor','k')
set(handles.r4,'ForeGroundColor','k')



set(hObject,'BackGroundColor','g')
set(handles.r5,'ForeGroundColor','g')
set(handles.r6,'ForeGroundColor','g')
set(handles.r4,'ForeGroundColor','g')




% --- Executes on button press in Run_default_algorithm.
function Run_default_algorithm_Callback(hObject, eventdata, handles)
set(handles.edit_axes1,'string','busy','ForegroundColor','r')



pathname=get(handles.pathname,'string');
filename=get(handles.filename,'string');
full_filename=char(strcat(pathname,filename)); 
importdata_file=importdata(full_filename)  ;
 
 


Load_File_Edit_char1=char(strcat(cd,'\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast_explosive\BacFormatics_SEG_explosive_step1_borders_enhancement_ch00_to_ch00.dat'));
try
    importdata(Load_File_Edit_char1)
catch
    str=char(strcat('Could not find the segmentation file-',Load_File_Edit_char1));
    msgbox(str)
    return
end


Load_File_Edit_char2=char(strcat(cd,'\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast_explosive\BacFormatics_SEG_explosive_step2_local_maxima_ch00_to_ch01_to_ch01.dat')); 
try
    importdata(Load_File_Edit_char2)
catch
    str=char(strcat('Could not find the segmentation file-',Load_File_Edit_char2));
    msgbox(str)
    return
end


Load_File_Edit_char3=char(strcat(cd,'\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast_explosive\BacFormatics_SEG_explosive_step3_ACM_and_spliting_ch00_to_ch03.dat')); 
try
    importdata(Load_File_Edit_char3)
catch
    str=char(strcat('Could not find the segmentation file-',Load_File_Edit_char3));
    msgbox(str)
    return
end

 
Load_File_Edit_char4=char(strcat(cd,'\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast_explosive\BacFormatics_SEG_explosive_step4_find_rods_ch03_to_ch00.dat')); 
try
    importdata(Load_File_Edit_char4)
catch
    str=char(strcat('Could not find the segmentation file-',Load_File_Edit_char4));
    msgbox(str)
    return
end

Load_File_Edit_char5=char(strcat(cd,'\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast_explosive\BacFormatics_SEG_explosive_step5_find_round_cells_ch03_to_ch02.dat')); 
try
    importdata(Load_File_Edit_char5)
catch
    str=char(strcat('Could not find the segmentation file-',Load_File_Edit_char5));
    msgbox(str)
    return
end



experiment_H  =waitbar(0.3,'Processing experiments. please wait....');
Position=get(experiment_H,'Position');
Position(2)=Position(2)+100;
set(experiment_H,'Position',Position)



BAC_Segmentation_Module(importdata_file,full_filename,  [1 1 1],Load_File_Edit_char1,1) ;
waitbar(0.7)

BAC_Segmentation_Module(importdata_file,full_filename,  [1 2 2],Load_File_Edit_char2,1) ;
waitbar(0.7)

BAC_Segmentation_Module(importdata_file,full_filename,  [1 1 4],Load_File_Edit_char3,1) ;
waitbar(0.7)

BAC_Segmentation_Module(importdata_file,full_filename,  [1 1 1],Load_File_Edit_char4,1) ;
waitbar(0.7)


BAC_Segmentation_Module(importdata_file,full_filename,  [1 1 3],Load_File_Edit_char5,1) ;
waitbar(0.7)


%  close(BAC_Segmentation_Module)
close(experiment_H)
set(handles.edit_axes1,'string','ready','ForegroundColor','w')
set(hObject,'BackGroundColor','g')
set(handles.r7,'ForeGroundColor','g')

% --- Executes on button press in call_segmentation_module1.
function call_segmentation_module1_Callback(hObject, eventdata, handles)
% hObject    handle to call_segmentation_module1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('instructions')

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)


set(handles.edit_axes1,'string','busy','ForegroundColor','r')
pathname=get(handles.pathname,'string');
filename=get(handles.filename,'string');
full_filename=char(strcat(pathname,filename));
importdata_file=importdata(full_filename)  ;
splitting_bacteria_cells_function(importdata_file)

set(hObject,'BackGroundColor','g')
set(handles.r17,'ForeGroundColor','g')
 set(handles.r18,'ForeGroundColor','g')
set(handles.edit_axes1,'string','Ready','ForegroundColor','w')

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDAT--------
% -----------------


% --- Executes on button press in text19.
function text19_Callback(hObject, eventdata, handles)


set(handles.text18,'BackGroundColor',[0.8 0.8 0.8]) 
set(handles.r14,'ForeGroundColor','k') 
set(handles.r15,'ForeGroundColor','k') 
set(handles.r16,'ForeGroundColor','k') 


set(hObject,'BackGroundColor','g')
set(handles.r8,'ForeGroundColor','g') 
set(handles.r9,'ForeGroundColor','g') 
set(handles.r10,'ForeGroundColor','g') 
set(handles.r11,'ForeGroundColor','g') 
set(handles.r12,'ForeGroundColor','g') 
set(handles.r13,'ForeGroundColor','g') 
set(handles.text69,'Visible','on') 

% --- Executes on button press in text18.
function text18_Callback(hObject, eventdata, handles)
set(handles.text19,'BackGroundColor',[0.8 0.8 0.8])
set(handles.r8,'ForeGroundColor','k') 
set(handles.r9,'ForeGroundColor','k') 
set(handles.r10,'ForeGroundColor','k') 
set(handles.r11,'ForeGroundColor','k') 
set(handles.r12,'ForeGroundColor','k') 
set(handles.r13,'ForeGroundColor','k') 

 
set(hObject,'BackGroundColor','g')
set(handles.r14,'ForeGroundColor','g') 
set(handles.r15,'ForeGroundColor','g') 
set(handles.r16,'ForeGroundColor','g') 
 


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

set(handles.edit_axes1,'string','busy','ForegroundColor','r')
pathname=get(handles.pathname,'string');
filename=get(handles.filename,'string');
full_filename=char(strcat(pathname,filename));
importdata_file=importdata(full_filename)  ;
merging_bacteria_cells_function(importdata_file)

set(hObject,'BackGroundColor','g')
set(handles.r19,'ForeGroundColor','g')
set(handles.edit_axes1,'string','Ready','ForegroundColor','w')


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)

    



pathname=get(handles.pathname,'string');
filename=get(handles.filename,'string'); 
BacFormatics(filename,pathname)
 


% --- Executes during object creation, after setting all properties.
function pushbutton11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Run_Analysis_Module.
function Run_Analysis_Module_Callback(hObject, eventdata, handles)
choice = questdlg('Do you want to run the analysis module?','Hello User','Yes','No','Yes');
switch choice
    case 'No'
        return
end
analysis_options_interface


% --- Executes on button press in text63.
msgbox('instructions')


% --- Executes on button press in UTS_emblem.
function UTS_Callback(hObject, eventdata, handles)
% hObject    handle to UTS_emblem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function UTS_emblem_CreateFcn(hObject, eventdata, handles)
 


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
