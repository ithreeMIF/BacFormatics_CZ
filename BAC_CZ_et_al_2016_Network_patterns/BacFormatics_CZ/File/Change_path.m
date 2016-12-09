%% ________________BacFormatics Code starts here:________________  
function varargout = Change_path(varargin)                  
% CHANGE_PATH M-file for Change_path.fig                  
%      CHANGE_PATH, by itself, creates a new CHANGE_PATH or raises the existing                  
%      singleton*.                  
%                  
%      H = CHANGE_PATH returns the handle to a new CHANGE_PATH or the handle to                  
%      the existing singleton*.                  
%                  
%      CHANGE_PATH('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in CHANGE_PATH.M with the given input arguments.                  
%                  
%      CHANGE_PATH('Property','Value',...) creates a new CHANGE_PATH or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before Change_path_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to Change_path_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help Change_path                  
% Last Modified by GUIDE v2.5 18-Jul-2013 14:30:42                  
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @Change_path_OpeningFcn, ...                  
'gui_OutputFcn',  @Change_path_OutputFcn, ...                  
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
% --- Executes just before Change_path is made visible.                  
function Change_path_OpeningFcn(hObject, eventdata, handles, varargin)                  
% This function has no output args, see OutputFcn.                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% varargin   command line arguments to Change_path (see VARARGIN)                  
% Choose default command line output for Change_path                  
handles.output = hObject;                  
% Update handles structure                  
guidata(hObject, handles);                  
% UIWAIT makes Change_path wait for user response (see UIRESUME)                  
% uiwait(handles.figure1);                  
% --- Outputs from this function are returned to the command line.                  
function varargout = Change_path_OutputFcn(hObject, eventdata, handles)                  
% varargout  cell array for returning output args (see VARARGOUT);                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Get default command line output from handles structure                  
varargout{1} = handles.output;                  
function edit1_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit1 as text                  
%        str2double(get(hObject,'String')) returns contents of edit1 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function edit2_Callback(hObject, eventdata, handles)                  
% hObject    handle to Current_Dir3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of Current_Dir3 as text                  
%        str2double(get(hObject,'String')) returns contents of Current_Dir3 as a double                  
% --- Executes during object creation, after setting all properties.                  
function Current_Dir3_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to Current_Dir3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% ------------------------------------------                  
% --- Executes on selection change in listbox1.                  
function listbox1_Callback(hObject, eventdata, handles)                  
if  toc<2                  
h=waitbar(0.2,'please wait..');                  
pause(1)                  
close(h)                  
end                  
%this trick should prevent the program to crash when user trying to read large file too fast,                  
%instead it will open many messeges that will close itself after 2 seconds (assuming that 2 seconds is enough)                  
tic                  
h=waitbar(0.2,'Read experiment file..');                  
set(h ,'color','w');                  
n=get(handles.listbox1,'Value');                  
filename_str2=get(handles.listbox1,'String');                  
%                  
%  filename_str2 =cellstr(filename_str2);                  
full_filename=    filename_str2(n) ;                  
full_filename=char(full_filename) ;                  
try                   
data =importdata(full_filename);                  
waitbar(0.8);                  
handles.data_file=data;                    
str= data(1).cdata   ;                  
set(handles.listbox2,'Value',1)                  
set(handles.listbox2,'String', str(:,1))                   
guidata(hObject, handles);                  
listbox2_Callback(hObject, eventdata, handles)                  
%%                  
catch                  
close(h)                  
msgbox('error!')                  
return                  
end                  
try                  
str=char(data(2).cdata(1,1));                  
set(handles.edit2, 'String' ,str)                  
Find_slesh=findstr(str,'\') ;                  
new_Find_slesh=ones(1,size(Find_slesh,2)+1)                  
new_Find_slesh(2:end)= Find_slesh;                  
Find_slesh= new_Find_slesh;                  
handles.Find_slesh=Find_slesh;                  
guidata(hObject, handles);                  
for ii=1:size(Find_slesh,2)-1                  
new_str=str(Find_slesh(ii):Find_slesh(ii+1))                  
new_str=regexprep(new_str, '\','')                  
%%%                  
eval(strcat(  'set(handles.Current_Dir',num2str(ii),',''String'',new_str);') );                  
str_1= strcat('if  get(handles.radiobutton',num2str(ii),',''Value'')~=get(handles.radiobutton',num2str(ii),',''Max'');');                  
str_2=strcat(str_1, 'set(handles.Rename_Dir',num2str(ii),',''String'',new_str);') ;                  
str_3=strcat(str_2,'set(handles.Rename_Dir',num2str(ii),',''visible'',''on'');') ;                  
str_4=strcat(str_3,'end')                  
eval(str_4)                  
%%%                  
%%%                  
%           str_1= strcat('if  get(handles.radiobutton',num2str(ii),',''Value'')==get(handles.radiobutton',num2str(ii),',''Max'');');                  
%           str_2= strcat(str_1, 'set(handles.Current_Dir',num2str(ii),',''String'',new_str);') ;                  
%           str_2= strcat(str_1, 'set(handles.Current_Dir',num2str(ii),',''String'',new_str);') ;                  
%           str_3=strcat(str_2, 'set(handles.Rename_Dir',num2str(ii),',''String'',new_str);') ;                  
%           str_4=strcat(str_3,'set(handles.Rename_Dir',num2str(ii),',''visible'',''on'');') ;                  
%           str_5=strcat(str_4,'end')                  
%            eval(str_5)                  
%%%%                  
end                  
for ii=size(Find_slesh,2):10                  
eval(strcat('set(handles.Current_Dir',num2str(ii),',''String'',[])'));                  
eval(strcat('set(handles.Rename_Dir',num2str(ii),',''String'',[])'));                  
eval(strcat('set(handles.Rename_Dir',num2str(ii),',''visible'',''off'')'));                  
end                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
close(h)                  
catch                  
close(h)                  
end                  
% --- Executes during object creation, after setting all properties.                  
function listbox1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to listbox1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: listbox controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --------------------------------------------------------------------                  
function Untitled_1_Callback(hObject, eventdata, handles)                  
close(Change_path)                  
% -------------------------------------------------------------------------                  
function Rename_Dir1_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir2_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir3_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir4_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir5_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir6_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir7_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir8_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir9_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
function Rename_Dir10_Callback(hObject, eventdata, handles)                  
Find_slesh=handles.Find_slesh;                  
Rename_Dir='';                  
for ii=1:size(Find_slesh,2)-1                  
eval(strcat('temp_Rename_Dir=get(handles.Rename_Dir',num2str(ii),',''String'')'));                  
Rename_Dir=strcat(Rename_Dir,temp_Rename_Dir,'\');                  
end                  
while isempty( strfind(Rename_Dir ,'\\'))~=1                  
Rename_Dir( strfind(Rename_Dir ,'\\'))=[];                  
end                  
if get(handles.new_path_as_location,'value')==1                  
v=findstr(full_filename,'\');                  
v=v(end);                  
exp_location= full_filename(1:v);                  
set(handles.edit3, 'String' ,exp_location);                  
else                  
set(handles.edit3, 'String' ,Rename_Dir);                  
end                  
% -------------------------------------------------------------------------                  
% --- Executes on button press in pushbutton3.                  
function pushbutton3_Callback(hObject, eventdata, handles)                  
if  toc<2                  
h=waitbar(0.2,'please wait..');                  
pause(1)                  
close(h)                  
end                  
%this trick should prevent the program to crash when user trying to read large file too fast,                  
%instead it will open many messeges that will close itself after 2 seconds (assuming that 2 seconds is enough)                  
tic                  
h=waitbar(0.2,'Save new path for specific file data..');                  
set(h ,'color','w');                  
n=get(handles.listbox1,'Value');                  
filename_str2=get(handles.listbox1,'String');                  
full_filename=    filename_str2(n) ;                  
full_filename=char(full_filename);                  
data =importdata(full_filename);                  
old_path=get(handles.edit2, 'String')                  
new_path=get(handles.edit3, 'String')                  
Length_pathname=size(old_path,2)                  
full_filename=    filename_str2(n) ;                  
full_filename=char(full_filename);                  
data =importdata(full_filename);                  
for ii=1:3                  
for jj=1:3                  
str=char(data(2).cdata(ii,jj))                  
str(1:Length_pathname)=[];                  
new_str=strcat(new_path,str)                  
new_str=   regexprep(new_str ,'Threshold', 'Segmented') ;                  
data(2).cdata(ii,jj)=cellstr(new_str)                  
end                  
end                  
for ii=4:20                  
data(2).cdata(ii,1)=data(2).cdata(1,1);                  
if ii<10                  
newstr=char(strcat('ch0',num2str(ii))) ;                  
else                  
newstr=char(strcat('ch',num2str(ii)))  ;                  
end                  
stremp2=regexprep(data(2).cdata(1,2) ,'ch00', newstr) ;                  
data(2).cdata(ii,2)= stremp2;                  
stremp3=regexprep(data(2).cdata(1,3) ,'ch00', newstr) ;                  
data(2).cdata(ii,3)= stremp3;                  
end                  
save (full_filename ,  'data')                  
close(h)                  
% --- Executes on button press in radiobutton10.                  
function radiobutton10_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton10 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton10                  
% --- Executes on button press in radiobutton9.                  
function radiobutton9_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton9 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton9                  
% --- Executes on button press in radiobutton8.                  
function radiobutton8_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton8 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton8                  
% --- Executes on button press in radiobutton7.                  
function radiobutton7_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton7 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton7                  
% --- Executes on button press in radiobutton6.                  
function radiobutton6_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton6 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton6                  
% --- Executes on button press in radiobutton5.                  
function radiobutton5_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton5 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton5                  
% --- Executes on button press in radiobutton4.                  
function radiobutton4_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton4 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton4                  
% --- Executes on button press in radiobutton3.                  
function radiobutton3_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton3                  
% --- Executes on button press in radiobutton2.                  
function radiobutton2_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton2                  
% --- Executes on button press in radiobutton1.                  
function radiobutton1_Callback(hObject, eventdata, handles)                  
% hObject    handle to radiobutton1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of radiobutton1                  
function edit13_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit13 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit13 as text                  
%        str2double(get(hObject,'String')) returns contents of edit13 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit13_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit13 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED1_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED1 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED1 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED2_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED2 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED2 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED2_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED3_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED3 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED3 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED3_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED4_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED4 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED4 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED4 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED4_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED4 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED5_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED5 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED5 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED5 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED5_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED5 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED6_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED6 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED6 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED6 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED6_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED6 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED7_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED7 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED7 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED7 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED7_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED7 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function LOCKED8_Callback(hObject, eventdata, handles)                  
% hObject    handle to LOCKED8 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of LOCKED8 as text                  
%        str2double(get(hObject,'String')) returns contents of LOCKED8 as a double                  
% --- Executes during object creation, after setting all properties.                  
function LOCKED8_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to LOCKED8 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function edit23_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit23 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit23 as text                  
%        str2double(get(hObject,'String')) returns contents of edit23 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit23_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit23 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function edit24_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit24 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit24 as text                  
%        str2double(get(hObject,'String')) returns contents of edit24 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit24_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit24 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on button press in pushbutton6.                  
function pushbutton6_Callback(hObject, eventdata, handles)                  
filename_str2=get(handles.listbox1,'String');                  
n=size(filename_str2,1);                  
h1=timebar_BACWrapper('Save new path for all batch ....');                  
set(h1,'color','w');                  
for ii=1:n                  
timebar_BACWrapper(h1,ii/n)                  
set(handles.listbox1,'value',ii)                  
listbox1_Callback(hObject, eventdata, handles)                  
pushbutton3_Callback(hObject, eventdata, handles)                  
end                  
close(h1)                  
% --------------------------------------------------------------------                  
function Untitled_2_Callback(hObject, eventdata, handles)                  
% hObject    handle to Untitled_2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --------------------------------------------------------------------                  
function Untitled_3_Callback(hObject, eventdata, handles)                  
new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');                  
if isequal(new_dir,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
set(handles.edit1,'string',new_dir)                  
pathname=strcat(new_dir,'\');                  
h =timebar_BACWrapper('loading ....');                  
set(h ,'color','w');                  
dir_filename=dir(new_dir);                  
jjj=1                  
list_of_exp=cellstr({});                  
n= size(dir_filename,1);                  
% ###1                  
for ii=1:n %loop 1                  
timebar_BACWrapper(h,ii/n)                  
temp=cellstr(dir_filename(ii).name)  ;                  
temp=(strcat(pathname,temp)) ;                  
if  isdir(char(temp))==1 && length(dir_filename(ii).name)>2                  
dir_dat_name=dir(char(strcat(temp  ,'\*.dat')))                  
for jj=1:size(dir_dat_name,1)                  
filename_str(jjj)=cellstr(strcat(temp ,'\',dir_dat_name(jj).name))                  
jjj=jjj+1                  
end                  
end                  
end                  
close(h)                  
cur_dat_name=dir(char(strcat(new_dir  ,'\*.dat')))                  
for jj=1:size(cur_dat_name,1)                  
filename_str(jjj)=cellstr(strcat(new_dir ,'\',  cur_dat_name(jj).name))                  
jjj=jjj+1                  
end                  
filename_str=cellstr(filename_str);                  
set(handles.listbox1,'string',filename_str);                  
set(handles.listbox1,'Max',size(filename_str,1)) ;                  
set(handles.listbox1,'Value',1) ;                  
set(handles.listbox1,'Min',0);                  
set(handles.listbox1,'value',1)                  
listbox1_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function Untitled_4_Callback(hObject, eventdata, handles)                  
new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');                  
if isequal(new_dir,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
set(handles.edit1,'string',new_dir)                  
pathname=strcat(new_dir,'\');                  
dir_filename=dir(new_dir);                  
jj=1;                  
clear filename_str                  
% ###1                  
n=size(dir_filename,1) %loop 1                  
h =timebar_BACWrapper('loading ....');                  
set(h ,'color','w');                  
for ii=1:size(dir_filename,1) %loop 1                  
timebar_BACWrapper(h ,ii/n)                  
temp=cellstr(dir_filename(ii).name)  ;                  
temp=(strcat(pathname,temp))  ;                  
if  isdir(char(temp))==1 && length(dir_filename(ii).name)>2                  
dir_filename2=dir(char(temp));                  
for iii=1:size(dir_filename2,1)  %loop 2                  
temp2=cellstr(dir_filename2(iii).name);                  
temp2=(strcat(temp,'\',temp2))  ;                  
if  isdir(char(temp2))==1 && length(dir_filename2(iii).name)>2                  
dir_filename3=dir(char(temp2));                  
for iiii=1:size(dir_filename3,1)  %loop 3                  
temp3=cellstr(dir_filename3(iiii).name);                  
temp3=(strcat(temp2,'\',temp3))  ;                  
if  isdir(char(temp3))==1 && length(dir_filename3(iiii).name)>2                  
% search in more subdirectories                  
else                  
if  strfind(char(dir_filename3(iiii).name),'BacFormatics_EXP')==1                  
filename_str(jj)= (temp3);    jj=jj+1;                  
end                  
end                  
end                  
else                  
if  strfind(char(dir_filename2(iii).name),'BacFormatics_EXP')==1                  
filename_str(jj)= (temp2);    jj=jj+1;                  
end                  
end                  
end                  
else                  
if  strfind(char(dir_filename(ii).name),'BacFormatics_EXP')==1                  
filename_str(jj)= (temp);    jj=jj+1;                  
end                  
end                  
end                  
set(handles.listbox1,'string',filename_str);                  
set(handles.listbox1,'Max',size(filename_str,1)) ;                  
set(handles.listbox1,'Value',1) ;                  
set(handles.listbox1,'Min',0);                  
set(handles.listbox1,'value',1)                  
listbox1_Callback(hObject, eventdata, handles)                  
close(h)                  
% --- Executes during object creation, after setting all properties.                  
function pushbutton1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to pushbutton1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% --- Executes on button press in pushbutton7.                  
function pushbutton7_Callback(hObject, eventdata, handles)                  
% hObject    handle to pushbutton7 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
n=get(handles.listbox1,'Value') ;                  
listbox=get(handles.listbox1,'string')  ;                  
if (n==1 && n==size(listbox,1))                  
new_listbox=[];                  
set(handles.listbox1,'string',new_listbox);                  
return                  
end                  
if (n==1 &&  size(listbox,1)>1)                  
for ii=1:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
set(handles.listbox1,'string',new_listbox);                  
return                  
end                  
if (n>1 &&  size(listbox,1)>1 && size(listbox,1)>n)                  
for ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
for ii=n:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
set(handles.listbox1,'string',new_listbox);                  
return                  
end                  
if   (n==size(listbox,1) && n>1)                  
for  ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
set(handles.listbox1,'Value',n-1);                  
set(handles.listbox1,'string',new_listbox);                  
return                  
end                  
% --------------------------------------------------------------------                  
function Untitled_5_Callback(hObject, eventdata, handles)                  
% hObject    handle to Untitled_5 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
new_dir=uigetdir('Current Directory','Please select folder containing the subfolders of the positions');                  
if isequal(new_dir,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
set(handles.edit1,'string',new_dir)                  
pathname=strcat(new_dir,'\');                  
h =timebar_BACWrapper('loading ....');                  
set(h ,'color','w');                  
dir_filename=dir(new_dir);                  
jjj=1                  
list_of_exp=cellstr({});                  
n= size(dir_filename,1);                  
% ###1                  
for ii=1:n %loop 1                  
timebar_BACWrapper(h,ii/n)                  
temp=cellstr(dir_filename(ii).name)  ;                  
temp=(strcat(pathname,temp)) ;                  
if  isdir(char(temp))==1 && length(dir_filename(ii).name)>2                  
dir_dat_name=dir(char(strcat(temp  ,'\*a.dat')))                  
for jj=1:size(dir_dat_name,1)                  
filename_str(jjj)=cellstr(strcat(temp ,'\',dir_dat_name(jj).name))                  
jjj=jjj+1                  
end                  
end                  
end                  
close(h)                  
cur_dat_name=dir(char(strcat(new_dir  ,'\*.dat')))                  
for jj=1:size(cur_dat_name,1)                  
filename_str(jjj)=cellstr(strcat(new_dir ,'\',  cur_dat_name(jj).name))                  
jjj=jjj+1                  
end                  
filename_str=cellstr(filename_str);                  
set(handles.listbox1,'string',filename_str);                  
set(handles.listbox1,'Max',size(filename_str,1)) ;                  
set(handles.listbox1,'Value',1) ;                  
set(handles.listbox1,'Min',0);                  
set(handles.listbox1,'value',1)                  
listbox1_Callback(hObject, eventdata, handles)                  
% --- If Enable == 'on', executes on mouse press in 5 pixel border.                  
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.                  
function edit1_ButtonDownFcn(hObject, eventdata, handles)                  
% hObject    handle to edit1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --- Executes on button press in new_path_as_location.                  
function new_path_as_location_Callback(hObject, eventdata, handles)                  
% hObject    handle to new_path_as_location (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of new_path_as_location                  
% --- Executes on selection change in listbox2.                  
function listbox2_Callback(hObject, eventdata, handles)                  
% hObject    handle to listbox2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
n=round(get(handles.listbox2,'Value'));                  
Raw_listbox= get(handles.listbox2,'string');                  
track_what1=get(handles.track_what1,'Value') ;                   
segmentation_type1=get(handles.segmentation_type1,'Value');                    
try                  
temp= read_image(handles,n,segmentation_type1,track_what1,  Raw_listbox )  ;%segmentation_type=Raw (1)                  
axes(handles.axes1);cla                  
imagesc(temp);  axis   tight                  
try                  
sectionXY= handles.data_file(11).cdata;                  
if isempty(sectionXY)~=1                  
plot(sectionXY(:,1),sectionXY(:,2),'Color','m','LineWidth',9,'Hittest','Off');                  
plot([sectionXY(1,1) sectionXY(end,1) ],[ sectionXY(1,2) sectionXY(end,2)],'Color','m','LineWidth',9,'Hittest','Off');                  
end                  
%rectangle('Position', xy_border,'LineWidth',5,'LineStyle','--','EdgeColor','m');                  
%axis tight; axis manual;                  
hold on                  
axis tight                  
axis manual                  
end                  
end                  
% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from listbox2                  
% --- Executes during object creation, after setting all properties.                  
function listbox2_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to listbox2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: listbox controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on selection change in track_what1.                  
function track_what1_Callback(hObject, eventdata, handles)                  
% hObject    handle to track_what1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: contents = cellstr(get(hObject,'String')) returns track_what1 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from track_what1                  
listbox2_Callback(hObject, eventdata, handles)                  
% --- Executes during object creation, after setting all properties.                  
function track_what1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to track_what1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on selection change in segmentation_type1.                  
function segmentation_type1_Callback(hObject, eventdata, handles)                  
% hObject    handle to segmentation_type1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
listbox2_Callback(hObject, eventdata, handles)                  
% --- Executes during object creation, after setting all properties.                  
function segmentation_type1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to segmentation_type1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function [matrix_out]= read_image(handles,n,segmentation_type,track_what,box_list)                  
Projected_by_Value=get(handles.Projected_by,'Value')  ;                  
Projected_by_Str=get(handles.Projected_by,'String') ;                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
Projected_by=regexprep(Projected_by, 'z', '') ;                  
Projected_by=str2double(Projected_by) ;                  
matrix_out=[];                  
if iscell(box_list)                  
filename=char(box_list(n));                  
end                  
%    if   findstr(char(handles.data_file(7).cdata(track_what,2)),'Y')==1                  
%          centy1 = handles.data_file(4).cdata.Centroids(track_what).cdata(n).cdata;                  
%    end                  
try                  
if isempty(strfind(filename,'.tif'))~=1                  
filename=filename(1:max(strfind(filename, '_ch')-1));                  
end                  
end                  
try                  
if isempty(strfind(filename,'_z'))~=1                  
filename=filename(1:max(strfind(filename, '_z')-1));                  
end                  
end                  
filename=regexprep(char(filename),'.TIF','')                  
if isempty(Projected_by)~=1&& isnan(Projected_by)~=1                  
switch segmentation_type                  
case 1                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'.tif')) ;                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread(full_filename ,1) ;                  
end                  
case 2                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Filtered.tif'))                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread(full_filename ,1);                  
end                  
case 3                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Segmented.tif'))                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread(full_filename ,1);                  
end                  
case 4                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Filtered.tif')) ;                  
a=dir(full_filename_Filtered);                  
if size(a,1)~=0                  
temp_Filtered=imread(full_filename ,1);                  
temp_Filtered=double(temp_Filtered);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
b=dir(full_filename_Segmented);                  
if size(a,1)~=0 && size(b,1)~=0                  
temp_Segmented=imread(full_filename ,1);                  
temp_Segmented=flipdim(temp_Segmented,1);                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Filtered.* temp_Segmented;                  
end                  
case 5                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'.tif')) ;                  
a=dir(full_filename_Raw);                  
if size(a,1)~=0                  
temp_Raw=imread(full_filename ,1);                  
temp_Raw=double(temp_Raw);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
b=dir(full_filename );                  
if size(a,1)~=0 && size(b,1)~=0                  
temp_Segmented=imread(full_filename ,1);                  
temp_Segmented=flipdim(temp_Segmented,1);                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Raw.* temp_Segmented;                  
end                  
end                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value))  ;                  
if findstr('By mean',Projected_by)                  
switch segmentation_type                  
case 1                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),filename,'_ch0',num2str(track_what-1),'.tif')) ;                  
a=dir(full_filename);                  
if size(a,1)~=0                  
matrix_out=imread(full_filename ,1);                  
end                  
case 2                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),filename,'_ch0',num2str(track_what-1),'_Filtered.tif'))                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread(full_filename ,1);                  
end                  
case 3                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread(full_filename ,1);                  
end                  
case 4                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),filename,'_ch0',num2str(track_what-1),'_Filtered.tif')) ;                  
a=dir(full_filename );                  
if size(a,1)~=0                  
temp_Filtered=imread(full_filename ,1);                  
temp_Filtered=double(temp_Filtered);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
b=dir(full_filename );                  
if size(a,1)~=0 && size(b,1)~=0                  
temp_Segmented=imread(full_filename ,1);                  
temp_Segmented=flipdim(temp_Segmented,1);                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Filtered.* temp_Segmented;                  
end                  
case 5                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),filename,'_ch0',num2str(track_what-1),'.tif')) ;                  
a=dir(full_filename );                  
if size(a,1)~=0                  
temp_Raw=imread(full_filename ,1);                  
temp_Raw=double(temp_Raw);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
b=dir(full_filename );                  
if size(a,1)~=0 && size(b,1)~=0                  
temp_Segmented=imread(full_filename ,1);                  
temp_Segmented=flipdim(temp_Segmented,1);                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Raw.* temp_Segmented;                  
end                  
end                  
end                  
% --- Executes on selection change in Projected_by.                  
function Projected_by_Callback(hObject, eventdata, handles)                  
% hObject    handle to Projected_by (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
listbox2_Callback(hObject, eventdata, handles)                  
% --- Executes during object creation, after setting all properties.                  
function Projected_by_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to Projected_by (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
