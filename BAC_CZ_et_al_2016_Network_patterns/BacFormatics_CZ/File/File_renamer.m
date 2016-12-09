%% ________________BacFormatics Code starts here:________________  
function varargout = File_renamer(varargin)                  
% File_renamer M-file for File_renamer.fig                  
%      File_renamer, by itself, creates a new File_renamer or raises the existing                  
%      singleton*.                  
%                  
%      H = File_renamer returns the handle to a new File_renamer or the handle to                  
%      the existing singleton*.                  
%                  
%      File_renamer('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in File_renamer.M with the given input arguments.                  
%                  
%      File_renamer('Property','Value',...) creates a new File_renamer or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before File_renamer_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to File_renamer_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help File_renamer                  
% Last Modified by GUIDE v2.5 02-Apr-2015 16:49:14
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @File_renamer_OpeningFcn, ...                  
'gui_OutputFcn',  @File_renamer_OutputFcn, ...                  
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
% --- Executes just before File_renamer is made visible.                  
function File_renamer_OpeningFcn(hObject, eventdata, handles, varargin)                  
% This function has no output args, see OutputFcn.                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% varargin   command line arguments to File_renamer (see VARARGIN)                  
% Choose default command line output for File_renamer                  
handles.output = hObject;                  
% Update handles structure                  
guidata(hObject, handles);                  
% UIWAIT makes File_renamer wait for user response (see UIRESUME)                  
% uiwait(handles.figure1);                  
% --- Outputs from this function are returned to the command line.                  
function varargout = File_renamer_OutputFcn(hObject, eventdata, handles)                  
% varargout  cell array for returning output args (see VARARGOUT);                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Get default command line output from handles structure                  
varargout{1} = handles.output;                  
% --- Executes on selection change in listbox1.                  
function listbox1_Callback(hObject, eventdata, handles)                  
Raw_listbox=get(handles.listbox1,'String')                  
if iscell(Raw_listbox)==0                  
Raw_listbox=cellstr(Raw_listbox);                  
1                  
end                  
if isempty(Raw_listbox)==1                  
2                  
return                  
end                  
n=get(handles.listbox1,'value')                  
pathname= char(Raw_listbox(n));                  
set(handles.pathname2,'string',pathname)                  
str=strcat(pathname,'\*.tif') ;                  
dir_filename=dir(str)  ;                  
filename_str=cell(size(dir_filename));                  
for ii=1:size(dir_filename,1)                  
filename_str(ii)=cellstr(dir_filename(ii).name) ;                  
end                  
set(handles.listbox2,'String',filename_str);                  
set(handles.listbox2,'Max',size(dir_filename,1)) ;                  
set(handles.listbox2,'Value',1) ;                  
set(handles.listbox2,'Min',0);                  
listbox2_Callback(hObject, eventdata, handles)                  
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
%                  
function pushbutton2_Callback(hObject, eventdata, handles)                  
n=get(handles.listbox1,'Value') ;                  
box= cellstr(get(handles.listbox1,'string')) ;box2=box;                  
Data=get(handles.uitable1,'Data');                  
Data(n,:)=[];                  
filename_str=get(handles.uitable1,'RowName');                  
box2(n)=[];                  
set(handles.uitable1,'RowName',box2 ,'Data',Data);                  
if (n==1 && n==size(box,1))                  
new_box=[];                  
set(handles.listbox1,'string',new_box);                  
return                  
end                  
if (n==1 &&  size(box,1)>1)                  
for ii=1:(size(box,1)-1)                  
new_box(ii)=box(ii+1);                  
end                  
new_box=char(new_box);                  
set(handles.listbox1,'string',new_box);                  
return                  
end                  
if (n>1 &&  size(box,1)>1 && size(box,1)>n)                  
for ii=1:(n-1)                  
new_box(ii)=box(ii);                  
end                  
for ii=n:(size(box,1)-1)                  
new_box(ii)=box(ii+1);                  
end                  
new_box=char(new_box);                  
set(handles.listbox1,'string',new_box);                  
return                  
end                  
if (n==size(box,1) && n>1)                  
for  ii=1:(n-1)                  
new_box(ii)=box(ii);                  
end                  
set(handles.listbox1,'Value',n-1);                  
new_box=char(new_box);                  
set(handles.listbox1,'string',new_box);                  
return                  
end                  
% --- Executes on selection change in popupmenu1.                  
function popupmenu1_Callback(hObject, eventdata, handles)                  
% hObject    handle to popupmenu1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
val=get(hObject,'value');                  
if val==1                  
set(handles.popupmenu2, 'Visible','off')                  
elseif   val==2                  
set(handles.popupmenu2, 'Visible','on')                  
end                  
% --- Executes during object creation, after setting all properties.                  
function popupmenu1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to popupmenu1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on selection change in popupmenu2.                  
function popupmenu2_Callback(hObject, eventdata, handles)                  
% hObject    handle to popupmenu2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from popupmenu2                  
% --- Executes during object creation, after setting all properties.                  
function popupmenu2_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to popupmenu2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% -----------------------------------------------------------------------                  
% --- Executes on button press in temp_path.                  
function temp_path_Callback(hObject, eventdata, handles)                  
current_dir=get(hObject,'String') ;                  
new_dir=uigetdir(current_dir,'Current Directory');                  
if isequal(new_dir,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
new_dir= strcat(new_dir,'\') ;                  
new_dir=char(new_dir)                  
set(hObject,'String',new_dir) ;                  
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
function edit_CH00_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit_CH00 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit_CH00 as text                  
%        str2double(get(hObject,'String')) returns contents of edit_CH00 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit_CH00_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit_CH00 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function edit_CH01_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit_CH01 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit_CH01 as text                  
%        str2double(get(hObject,'String')) returns contents of edit_CH01 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit_CH01_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit_CH01 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function edit_CH02_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit_CH02 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit_CH02 as text                  
%        str2double(get(hObject,'String')) returns contents of edit_CH02 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit_CH02_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit_CH02 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function edit_CH03_Callback(hObject, eventdata, handles)                  
% hObject    handle to edit_CH03 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of edit_CH03 as text                  
%        str2double(get(hObject,'String')) returns contents of edit_CH03 as a double                  
% --- Executes during object creation, after setting all properties.                  
function edit_CH03_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to edit_CH03 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on selection change in popupmenu3.                  
function popupmenu3_Callback(hObject, eventdata, handles)                  
if get(handles.popupmenu3,'value')==1                  
set(handles.edit_CH01,'visible','off')                  
set(handles.edit_CH02,'visible','off')                  
set(handles.edit_CH03,'visible','off')                  
end                  
if get(handles.popupmenu3,'value')==2                  
set(handles.edit_CH01,'visible','on')                  
set(handles.edit_CH02,'visible','off')                  
set(handles.edit_CH03,'visible','off')                  
end                  
if get(handles.popupmenu3,'value')==3                  
set(handles.edit_CH01,'visible','on')                  
set(handles.edit_CH02,'visible','on')                  
set(handles.edit_CH03,'visible','off')                  
end                  
if get(handles.popupmenu3,'value')==4                  
set(handles.edit_CH01,'visible','on')                  
set(handles.edit_CH02,'visible','on')                  
set(handles.edit_CH03,'visible','on')                  
end                  
% --- Executes during object creation, after setting all properties.                  
function popupmenu3_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to popupmenu3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on button press in save_as_8_bit.                  
function save_as_8_bit_Callback(hObject, eventdata, handles)                  
% hObject    handle to save_as_8_bit (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of save_as_8_bit                  
% --- Executes on selection change in listbox2.                  
% --- Executes during object creation, after setting all properties.                  
function listbox2_CreateFcn(hObject, eventdata, handles)                  
function listbox2_Callback(hObject, eventdata, handles)                  
% hObject    handle to listbox2 (see GCBO)                  
pathname2=get(handles.pathname2,'string')                  
n2=round(get(handles.listbox2,'Value'));                  
box_Raw2=get(handles.listbox2,'string');                  
n1 =round(get(handles.listbox1,'Value'));                  
full_filename = char(strcat( pathname2,'/',box_Raw2(n2)))                  
if ~isempty(dir(full_filename))                  
temp=imread(full_filename,'tif',1);                  
end                  
axes(handles.axes1);                  
cla(handles.axes1);                  
imagesc(temp, 'Hittest','Off'); axis tight                  
% set(h_axes1_imagesc, 'Hittest','Off');                  
%set(gcf,'colormap',handles.c);                  
% % xy_border=handles.data_file(6).cdata;                  
Data   = get(handles.uitable1,'Data') ;                  
try                  
for ii=1:size(handles.sectionXY(n1).cdata,2)                  
sectionXY=handles.sectionXY(n1).cdata(ii).cdata;                  
plot(sectionXY(:,1),sectionXY(:,2),'Color','m','LineWidth',9,'Hittest','Off');                  
plot([sectionXY(1,1) sectionXY(end,1) ],[ sectionXY(1,2) sectionXY(end,2)],'Color','m','LineWidth',9,'Hittest','Off');                  
text(sectionXY(1,1),sectionXY(1,2) ,char(strcat('Pos',char(Data(n1,ii)))),'FontSize',22)                  
end                  
end                  
%rectangle('Position', xy_border,'LineWidth',5,'LineStyle','--','EdgeColor','m');                  
%axis tight; axis manual;                  
hold on                  
axis tight                  
axis manual                  
% --- Executes on button press in pathname2.                  
function pathname2_Callback(hObject, eventdata, handles)                  
% hObject    handle to pathname2 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
function Position_Callback(hObject, eventdata, handles)                  
% hObject    handle to Position (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of Position as text                  
%        str2double(get(hObject,'String')) returns contents of Position as a double                  
% --- Executes during object creation, after setting all properties.                  
function Position_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to Position (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on button press in pushbutton10.                  
function pushbutton10_Callback(hObject, eventdata, handles)                  
n1=round(get(handles.listbox1,'Value'));                  
handles.sectionXY(n1).cdata =[];                  
handles.Pos(n1).cdata=cell(1,1);                  
Data=get(handles.uitable1,'Data');                  
Data(n1,:)=[];                  
set(handles.uitable1, 'Data',Data);                  
guidata(hObject, handles);                  
listbox2_Callback(hObject, eventdata, handles)                  
% --- Executes on button press in pushbutton9.                  
function pushbutton9_Callback(hObject, eventdata, handles)                  
% hObject    handle to pushbutton9 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
point1 =get(handles.axes1,'Position');                  
point1=point1./2;                  
axes(handles.axes1);                  
h_rectangle = impoly(gca);                  
setColor(h_rectangle,[0 0.2 0.2]);                  
n1=round(get(handles.listbox1,'Value'));                  
sectionXY = wait(h_rectangle) ;                  
if isempty(handles.sectionXY(n1).cdata)==1                  
handles.sectionXY(n1).cdata(1).cdata= sectionXY;                  
handles.Pos(n1).cdata(1)= {get(handles.Position,'string')} ;                  
else                  
sizey=size(handles.sectionXY(n1).cdata,2);                  
handles.sectionXY(n1).cdata(sizey+1).cdata=sectionXY;                  
handles.Pos(n1).cdata(sizey+1)={ get(handles.Position,'string')} ;                  
end                  
guidata(hObject, handles);                  
str=get(handles.Position,'string');                  
Data=get(handles.uitable1,'Data')                  
jj=1;                  
for ii=1:size(Data,2)                  
a=Data(n1,ii);                  
try                  
char(a);                  
catch                  
break                  
end                  
jj=jj+1;                  
end                  
Data(n1,jj)  ={ get(handles.Position,'string')}                  
set(handles.uitable1,'Data',Data   )                  
listbox2_Callback(hObject, eventdata, handles)                  
% --- Executes when selected cell(s) is changed in uitable1.                  
function uitable1_CellSelectionCallback(hObject, eventdata, handles)                  
n1=eventdata.Indices(1);                  
ii=eventdata.Indices(2);                  
set(handles.listbox1,'value',n1)                  
Data   = get(handles.uitable1,'Data') ;                  
listbox1_Callback(hObject, eventdata, handles)                  
try                  
sectionXY=handles.sectionXY(n1).cdata(ii).cdata;                  
plot(sectionXY(:,1),sectionXY(:,2),'Color','c','LineWidth',9,'Hittest','Off');                  
plot([sectionXY(1,1) sectionXY(end,1) ],[ sectionXY(1,2) sectionXY(end,2)],'Color','c','LineWidth',9,'Hittest','Off');                  
text(sectionXY(1,1),sectionXY(1,2) ,char(strcat('Pos',char(Data(n1,ii)))),'FontSize',22)                  
end                  
% --- Executes when entered data in editable cell(s) in uitable1.                  
function uitable1_CellEditCallback(hObject, eventdata, handles)                  
n1=eventdata.Indices(1);                  
ii=eventdata.Indices(2);                  
set(handles.listbox1,'value',n1)                  
Data   = get(handles.uitable1,'Data') ;                  
listbox1_Callback(hObject, eventdata, handles)                  
try                  
sectionXY=handles.sectionXY(n1).cdata(ii).cdata;                  
plot(sectionXY(:,1),sectionXY(:,2),'Color','c','LineWidth',9,'Hittest','Off');                  
plot([sectionXY(1,1) sectionXY(end,1) ],[ sectionXY(1,2) sectionXY(end,2)],'Color','c','LineWidth',9,'Hittest','Off');                  
text(sectionXY(1,1),sectionXY(1,2) ,char(strcat('Pos',char(Data(n1,ii)))),'FontSize',22)                  
end                  
% --------------------------------------------------------------------                  
function Load_Callback(hObject, eventdata, handles)                  
pathname = uigetdir(get(handles.temp_path,'String'),'Important- subfolders names should be atleast 3 letters!');                  
if isequal(pathname,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
pathname =strcat(pathname,'\');                  
set(handles.temp_path,'String',pathname);                  
handles.select='folder';                  
dir_filename=dir(pathname);                  
%  filename=  dir_filename.name                  
jj=1;                  
for ii=1:size(dir_filename,1)                  
if  length(dir_filename(ii).name)>2                  
temp=cellstr(dir_filename(ii).name)   ;                  
%               if  strfind(char(temp),'pos')~=1                  
temp=char(strcat(pathname,temp)) ;                  
if isdir(temp)==1                  
filename_str(jj)= {(temp)};    jj=jj+1;                  
end                  
%               end                  
end                  
end                  
try                  
filename_str=char(filename_str);                  
set(handles.listbox1,'String',filename_str);                  
set(handles.listbox1,'Max',size(dir_filename,1)) ;                  
set(handles.listbox1,'Value',1) ;                  
set(handles.listbox1,'Min',0);                  
catch                  
msgbox('Please select "position" folders that contain the .tif')                  
end                  
set(handles.uitable1,'RowName',filename_str);                  
set(handles.uitable1,'Data',cell(size(dir_filename,1),1));                  
for ii=1:size(dir_filename,1)                  
handles.sectionXY(ii).cdata=[];                  
handles.Pos(ii).cdata=cell(1,1);                  
end                  
handles.pathname=pathname;                  
guidata(hObject,handles);                  
listbox1_Callback(hObject, eventdata, handles)                  
% ----------                  
% --------------------------------------------------------------------                  
function Untitled_1_Callback(hObject, eventdata, handles)                  
Raw_listbox=get(handles.listbox1,'String')                  
Add_to_Back=get(handles.edit1,'string')                  
if get(handles.save_as_8_bit,'value')==1                  
Rbits=1; % reduce bits to 9                  
else                  
Rbits=0;                  
end                  
if iscell(Raw_listbox)==0                  
Raw_listbox=cellstr(Raw_listbox);                  
1                  
end                  
if isempty(Raw_listbox)==1                  
2                  
return                  
end                  
edit_CH00=get(handles.edit_CH00,'string');                  
edit_CH01=get(handles.edit_CH01,'string');                  
edit_CH02=get(handles.edit_CH02,'string');                  
edit_CH03=get(handles.edit_CH03,'string');                  
edit_CH00= regexprep(edit_CH00,' ', '');edit_CH01 =regexprep(edit_CH01,' ', '');                  
edit_CH02= regexprep(edit_CH02,' ', '');edit_CH03 =regexprep(edit_CH03,' ', '');                  
n=length(Raw_listbox);                  
h=timebar_BACWrapper('Please wait....');                  
set(h,'color','w');                  
for   ii=1:n                  
timebar_BACWrapper(h,ii/(n))                  
pathname= char(Raw_listbox(ii));                  
new_pathname= strcat(pathname,'\r');                  
mkdir(new_pathname)                  
str=strcat(pathname,'\*.tif') ;                  
dir_filename=dir(str) ;                  
% to find the number of zeros to add to time points:                  
time_point=[]                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name));                  
t=findstr(file_name,'_T');                  
if isempty(t)==1                  
t=findstr(file_name,'_t');                  
end                  
t=t(end);                  
Tif=findstr(file_name,'.TIF');                  
if isempty(Tif)==1                  
Tif=findstr(file_name,'.Tif');                  
end                  
Tif=Tif(end) ;                  
time_point(jj)= str2num(file_name(t+2:Tif-1));                  
end                  
time_point=max( time_point)                  
if  time_point<10                  
Mdigits=1;                  
end                  
if  time_point>9 && time_point<100                  
Mdigits=2;                  
end                  
if  time_point>99 && time_point<1000                  
Mdigits=3;                  
end                  
if  time_point>999 && time_point<10000                  
Mdigits=4;                  
end                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name));                  
full_filename= char(strcat(pathname,'\',  file_name )  ) ;                  
tempstr_filename=regexprep(file_name,' ', '');                  
if isempty(findstr( tempstr_filename,edit_CH00))~=1                  
Channel='0' ;                  
else                  
if isempty(findstr( tempstr_filename,edit_CH01))~=1                  
Channel='1'  ;                  
else                  
if isempty(findstr( tempstr_filename,edit_CH02))~=1                  
Channel='2' ;                  
else                  
if isempty(findstr( tempstr_filename,edit_CH03))~=1                  
Channel='3'  ;                  
end                  
end                  
end                  
end                  
%              -------------------------------------------                  
t=findstr(file_name,'_T');                  
if isempty(t)==1                  
t=findstr(file_name,'_t');                  
end                  
t=t(end)                  
Tif=findstr(file_name,'.TIF');                  
if isempty(Tif)==1                  
Tif=findstr(file_name,'.Tif');                  
end                  
Tif=Tif(end)                  
pos=findstr(file_name,'_s');                  
if isempty(pos)==1                  
pos=findstr(file_name,'_S');                  
end                  
pos=pos(end)                  
w=findstr(file_name,'_w');                  
position = file_name(pos+2:t-1);                  
time_point= file_name(t+2:Tif-1) ;                  
if Mdigits-length(num2str(time_point))==1                  
time_point=strcat('0',time_point);                  
end                  
if Mdigits-length(num2str(time_point))==2                  
time_point=strcat('00',time_point);                  
end                  
if Mdigits-length(num2str(time_point))==3                  
time_point=strcat('000',time_point);                  
end                  
Backbone=file_name(1:w-1);                  
%if backbone start with nuber add index before it                  
if isempty(str2num(Backbone(1)))~=1                  
new_name=char(strcat(new_pathname,'\',Add_to_Back,Backbone,'_Pos',position ,'_t',  time_point,  '_ch0', Channel,'.tif')) ;                  
else                  
new_name=char(strcat(new_pathname,'\',Backbone,'_Pos', position ,'_t',  time_point,  '_ch0', Channel,'.tif')) ;                  
end                  
if Rbits                  
try                  
temp=double(imread( full_filename));                  
temp=uint8(255*(temp./max(max(temp))));                  
imwrite(temp,new_name)                  
catch                  
save ll                  
end                  
else                  
movefile(full_filename,new_name)                  
end                  
end                  
pause(2)                  
end                  
close(h)                  
% --------------------------------------------------------------------                  
function Untitled_2_Callback(hObject, eventdata, handles)                  
[filename, pathname, filterindex] = uiputfile({  '*.dat','Dat-files (*.dat)';}, 'save  session to a data file' );                  
if isequal(filename,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
filename=regexprep(filename, 'BacFormatics_Sec_','');                  
full_filename= strcat(pathname,'BacFormatics_Sec_',filename) ;                  
full_filename=char(full_filename);                  
temp(1).cdata=get(handles.uitable1,'RowName');                  
temp(2).cdata=get(handles.uitable1,'Data');                  
temp(3).cdata=handles.sectionXY;                  
save(full_filename ,  'temp')                  
Raw_listbox=get(handles.listbox1,'String')                  
Add_to_Back=get(handles.edit1,'string')                  
if get(handles.save_as_8_bit,'value')==1                  
Rbits=1; % reduce bits to 9                  
else                  
Rbits=0;                  
end                  
if iscell(Raw_listbox)==0                  
Raw_listbox=cellstr(Raw_listbox);                  
1                  
end                  
if isempty(Raw_listbox)==1                  
2                  
return                  
end                  
edit_CH00=get(handles.edit_CH00,'string');                  
edit_CH01=get(handles.edit_CH01,'string');                  
edit_CH02=get(handles.edit_CH02,'string');                  
edit_CH03=get(handles.edit_CH03,'string');                  
edit_CH00= regexprep(edit_CH00,' ', '');edit_CH01 =regexprep(edit_CH01,' ', '');                  
edit_CH02= regexprep(edit_CH02,' ', '');edit_CH03 =regexprep(edit_CH03,' ', '');                  
n=length(Raw_listbox);                  
temp_path=get(handles.temp_path,'String');                  
for   ii=1:n                  
for iii=1:size(handles.Pos(ii).cdata,2)                  
position= char(handles.Pos(ii).cdata(iii));                  
pathname= char(Raw_listbox(ii));                  
new_pathname= strcat(temp_path,'\Pos',position)                  
mkdir(new_pathname)                  
end                  
end                  
h=timebar_BACWrapper('Please wait....');                  
set(h,'color','w');                  
for   ii=1:n                  
timebar_BACWrapper(h,ii/(n))                  
pathname= char(Raw_listbox(ii));                  
str=strcat(pathname,'\*.tif') ;                  
dir_filename=dir(str) ;                  
% to find the number of zeros to add to time points:                  
time_point=[]                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name));                  
t=findstr(file_name,'_T');                  
if isempty(t)==1                  
t=findstr(file_name,'_t');                  
end                  
t=t(end);                  
Tif=findstr(file_name,'.TIF');                  
if isempty(Tif)==1                  
Tif=findstr(file_name,'.Tif');                  
end                  
Tif=Tif(end) ;                  
time_point(jj)= str2num(file_name(t+2:Tif-1));                  
end                  
time_point=max( time_point)                  
if  time_point<10                  
Mdigits=1;                  
end                  
if  time_point>9 && time_point<100                  
Mdigits=2;                  
end                  
if  time_point>99 && time_point<1000                  
Mdigits=3;                  
end                  
if  time_point>999 && time_point<10000                  
Mdigits=4;                  
end                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name));                  
full_filename= char(strcat(pathname,'\',  file_name )  ) ;                  
tempstr_filename=regexprep(file_name,' ', '');                  
if isempty(findstr( tempstr_filename,edit_CH00))~=1                  
Channel='0' ;                  
else                  
if isempty(findstr( tempstr_filename,edit_CH01))~=1                  
Channel='1'  ;                  
else                  
if isempty(findstr( tempstr_filename,edit_CH02))~=1                  
Channel='2' ;                  
else                  
if isempty(findstr( tempstr_filename,edit_CH03))~=1                  
Channel='3'  ;                  
end                  
end                  
end                  
end                  
%              -------------------------------------------                  
t=findstr(file_name,'_T');                  
if isempty(t)==1                  
t=findstr(file_name,'_t');                  
end                  
t=t(end);                  
Tif=findstr(file_name,'.TIF');                  
if isempty(Tif)==1                  
Tif=findstr(file_name,'.Tif');                  
end                  
Tif=Tif(end)    ;                  
w=findstr(file_name,'_w');                  
time_point= file_name(t+2:Tif-1) ;                  
if Mdigits-length(num2str(time_point))==1                  
time_point=strcat('0',time_point);                  
end                  
if Mdigits-length(num2str(time_point))==2                  
time_point=strcat('00',time_point);                  
end                  
if Mdigits-length(num2str(time_point))==3                  
time_point=strcat('000',time_point);                  
end                  
Backbone=file_name(1:w-1);                  
%if backbone start with nuber add index before it                  
for iii=1:size(handles.Pos(ii).cdata,2)                  
position= char(handles.Pos(ii).cdata(iii));                  
new_pathname= strcat(temp_path,'\Pos',position)  ;                  
if isempty(str2num(Backbone(1)))~=1                  
new_name=char(strcat(new_pathname,'\',Add_to_Back,Backbone,'_Pos',position ,'_t',  time_point,  '_ch0', Channel,'.tif')) ;                  
else                  
new_name=char(strcat(new_pathname,'\',Backbone,'_Pos', position ,'_t',  time_point,  '_ch0', Channel,'.tif')) ;                  
end                  
if Rbits                  
try                  
temp=double(imread( full_filename));                  
temp=uint8(255*(temp./max(max(temp))));                  
imwrite(temp,new_name)                  
catch                  
save ll                  
end                  
else                  
movefile(full_filename,new_name)                  
end                  
end                  
end                  
pause(3)                  
end                  
close(h)                  
% --------------------------------------------------------------------                  
function Untitled_3_Callback(hObject, eventdata, handles)                  
close                  
h=BacFormatics;                  
drawnow;                  
j = get(h,'javaframe');                  
jfig = j.fFigureClient.getWindow; %undocumented                  
jfig.setAlwaysOnTop(0);%places window on top, 0 to disable                  
jfig.setMaximized(1); %maximizes the window, 0 to minimize                  
% --- Executes on button press in pushbutton12.                  
function pushbutton12_Callback(hObject, eventdata, handles)                  
%                  
% save handles handles                  
% return                  
pathname2=get(handles.pathname2,'string')                  
n2=round(get(handles.listbox2,'Value'));                  
box_Raw2=get(handles.listbox2,'string');                  
n1 =round(get(handles.listbox1,'Value'));                  
full_filename = char(strcat( pathname2,'/',box_Raw2(n2)))                  
if ~isempty(dir(full_filename))                  
temp=imread(full_filename,'tif',1);                  
end                  
temp= uint8(255*(temp ./(max(max(temp ))))) ;    %norm matrix                  
level = graythresh(temp);      temp=im2bw(temp,level);                  
temp=~temp;                  
temp=imfill(temp,'holes'); temp=bwareaopen(temp,5000,4);                  
stats=regionprops(temp,'BoundingBox')                  
%                  
%  save stats stats                  
n1=round(get(handles.listbox1,'Value'));                  
str=get(handles.Position,'string');                  
handles.sectionXY(n1).cdata =[];                  
handles.Pos(n1).cdata=cell(1,1);                  
Data=get(handles.uitable1,'Data');                  
try                  
Data(n1,:)=[];                  
end                  
for jj=1:length(stats)                  
XY=stats(jj).BoundingBox ;                  
XY(3)=XY(1)+XY(3); XY(4)=XY(2)+XY(4) ;                  
XY =[XY(1) XY(2); XY(1) XY(4)  ;   XY(3) XY(4);  XY(3) XY(2)];                  
%                  
handles.sectionXY(n1).cdata(jj).cdata= XY;                  
handles.Pos(n1).cdata(jj)= {str} ;                  
Data(n1,jj)  ={ num2str(jj)} ;                  
end                  
guidata(hObject, handles);                  
set(handles.uitable1,'Data',Data   )                  
listbox2_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function Untitled_4_Callback(hObject, eventdata, handles)                  
Add_to_Back=get(handles.edit1,'string')                  
if get(handles.save_as_8_bit,'value')==1                  
Rbits=1; % reduce bits to 9                  
else                  
Rbits=0;                  
end                  
edit_CH00=get(handles.edit_CH00,'string');                  
edit_CH01=get(handles.edit_CH01,'string');                  
edit_CH02=get(handles.edit_CH02,'string');                  
edit_CH03=get(handles.edit_CH03,'string');                  
edit_CH00= regexprep(edit_CH00,' ', '');edit_CH01 =regexprep(edit_CH01,' ', '');                  
edit_CH02= regexprep(edit_CH02,' ', '');edit_CH03 =regexprep(edit_CH03,' ', '');                  
% pathname = uigetdir(get(handles.temp_path,'String'),'Important- subfolders names should be atleast 3 letters!');                  
% if isequal(pathname,0)  %$#1                  
%     h = msgbox('User selected Cancel','Aborted');                  
%     return;                  
% end                  
% pathname =strcat(pathname,'\');                  
pathname ='F:\my_data\D'                  
% n=inputdlg('Enter the number of positions','1')                  
% n=str2num(char(n));                  
n=5                  
h=timebar_BACWrapper('Please wait....');                  
set(h,'color','w')                   
for   ii=1:20                  
timebar_BACWrapper(h,ii/(n))                  
new_pathname= char(strcat(pathname,'\pos',num2str(ii)));                  
mkdir(new_pathname)                   
str=char(strcat(pathname,'\*_s',num2str(ii),'_*')) ;                  
dir_filename=dir(str) ;                  
% to find the number of zeros to add to time points:                  
time_point=[]                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name));                  
t=findstr(file_name,'_T');                  
if isempty(t)==1                  
t=findstr(file_name,'_t');                  
end                  
t=t(end);                  
Tif=findstr(file_name,'.TIF');                  
if isempty(Tif)==1                  
Tif=findstr(file_name,'.Tif');                  
end                  
Tif=Tif(end) ;                  
time_point(jj)= str2num(file_name(t+2:Tif-1));                  
end                  
time_point=max( time_point)                  
if  time_point<10                  
Mdigits=1;                  
end                  
if  time_point>9 && time_point<100                  
Mdigits=2;                  
end                  
if  time_point>99 && time_point<1000                  
Mdigits=3;                  
end                  
if  time_point>999 && time_point<10000                  
Mdigits=4;                  
end                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name));                  
full_filename= char(strcat(pathname,'\',  file_name )  ) ;                  
tempstr_filename=regexprep(file_name,' ', '')                   
edit_CH00                  
if isempty(findstr( tempstr_filename,edit_CH00))~=1                  
Channel='0'                    
else                  
if isempty(findstr( tempstr_filename,edit_CH01))~=1                  
Channel='1'                    
else                  
if isempty(findstr( tempstr_filename,edit_CH02))~=1                  
Channel='2' ;                   
else                  
if isempty(findstr( tempstr_filename,edit_CH03))~=1                  
Channel='3'  ;                  
end                  
end                  
end                  
end                  
%              -------------------------------------------                  
t=findstr(file_name,'_T');                  
if isempty(t)==1                  
t=findstr(file_name,'_t');                  
end                  
t=t(end)                  
Tif=findstr(file_name,'.TIF');                  
if isempty(Tif)==1                  
Tif=findstr(file_name,'.Tif');                  
end                  
Tif=Tif(end)                  
pos=findstr(file_name,'_s');                  
if isempty(pos)==1                  
pos=findstr(file_name,'_S');                  
end                  
pos=pos(end)                  
w=findstr(file_name,'_w');                  
position = file_name(pos+2:t-1);                  
time_point= file_name(t+2:Tif-1) ;                  
if Mdigits-length(num2str(time_point))==1                  
time_point=strcat('0',time_point);                  
end                  
if Mdigits-length(num2str(time_point))==2                  
time_point=strcat('00',time_point);                  
end                  
if Mdigits-length(num2str(time_point))==3                  
time_point=strcat('000',time_point);                  
end                  
Backbone=file_name(1:w-1);                  
position=num2str(ii);                  
%if backbone start with nuber add index before it                  
if isempty(str2num(Backbone(1)))~=1                  
new_name=char(strcat(new_pathname,'\',Add_to_Back,Backbone,'_Pos',position ,'_t',  time_point,  '_ch0', Channel,'.tif')) ;                  
else                  
new_name=char(strcat(new_pathname,'\',Backbone,'_Pos', position ,'_t',  time_point,  '_ch0', Channel,'.tif')) ;                  
end                  
if Rbits                  
try                  
new_name= regexprep(new_name,' ', '');                  
%                 full_filename                  
new_name                  
temp=double(imread( full_filename)) ;                  
%                 figure(1)                  
%                 imagesc(temp)                  
temp=uint8(255*(temp./max(max(temp))));                  
imwrite(temp,new_name)                  
catch                  
save ll                  
end                  
else                  
%             movefile(full_filename,new_name)                  
end                  
end                  
pause(2)                  
end                  
close(h)                  


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
  
  %use this function if index is wrong, i.e.:

% exp_1
% exp_2
% exp...
% exp 11
% exp 12
% 
% and need to convert to:
% 
% exp_t001_ch00
% exp_t002_ch00
  
Raw_listbox=get(handles.listbox1,'String')                  
Add_to_Back=get(handles.edit1,'string')                  
if get(handles.save_as_8_bit,'value')==1                  
Rbits=1; % reduce bits to 9                  
else                  
Rbits=0;                  
end                  
if iscell(Raw_listbox)==0                  
Raw_listbox=cellstr(Raw_listbox);                  
1                  
end                  
if isempty(Raw_listbox)==1                  
2                  
return                  
end                  
% edit_CH00=get(handles.edit_CH00,'string');                  
% edit_CH01=get(handles.edit_CH01,'string');                  
% edit_CH02=get(handles.edit_CH02,'string');                  
% edit_CH03=get(handles.edit_CH03,'string');                  
% edit_CH00= regexprep(edit_CH00,' ', '');edit_CH01 =regexprep(edit_CH01,' ', '');                  
% edit_CH02= regexprep(edit_CH02,' ', '');edit_CH03 =regexprep(edit_CH03,' ', '');                  
                
h=timebar_BACWrapper('Please wait....');                  
set(h,'color','w');                  
for   ii=1:size(Raw_listbox,1)                  
timebar_BACWrapper(h,ii/(size(Raw_listbox,1)))                  
pathname= char(Raw_listbox(ii));                  
new_pathname= strcat(pathname,'_exp');                  
mkdir(new_pathname)                  
str=strcat(pathname,'\*.tif') ;                  
dir_filename=dir(str) ;                  
% to find the number of zeros to add to time points:                  
time_point=[]   
Fnumber=size(dir_filename,1) ;
for jj=1:Fnumber                 
file_name=char(cellstr(dir_filename(jj).name)) ;
 
                             
str= char(strcat(pathname,'\',  file_name )  )     ;               
  
 
 
 temp=double(imread( str));                  
 temp=uint16( 65535*(temp./max(max(temp))));                  
   
str=file_name;

 
loc_sign=findstr(str,'_');  ind_loc_sign1=  loc_sign(1);  ind_loc_sign2=  loc_sign(end); 
n=str( ind_loc_sign2+1:end-4)  ;
Name_Str=str(ind_loc_sign1+1:ind_loc_sign2-1);


N=str2num(n);

 
if  N<10   
%     if Fnumber>
time_point=strcat('0000',n); 
%     end
end                  
if  N>9 && N<100                  
time_point=strcat('000',n);                   
end                  
if  N>99 && N<1000                  
time_point=strcat('00',n);                 
end  
if  N>999 && N<10000                  
time_point=strcat('0',n);                 
end  
 
new_name=char(strcat(new_pathname,'\',Name_Str ,'_t',  time_point,  '_ch00.tif'))     
% figure(1)
% imagesc(temp)
 imwrite(temp,new_name)  
 
end
end


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Raw_listbox=get(handles.listbox1,'String')                  
Add_to_Back=get(handles.edit1,'string')                  
if get(handles.save_as_8_bit,'value')==1                  
Rbits=1; % reduce bits to 9                  
else                  
Rbits=0;                  
end                  
if iscell(Raw_listbox)==0                  
Raw_listbox=cellstr(Raw_listbox);                  
1                  
end                  
if isempty(Raw_listbox)==1                  
2                  
return                  
end                  
% edit_CH00=get(handles.edit_CH00,'string');                  
% edit_CH01=get(handles.edit_CH01,'string');                  
% edit_CH02=get(handles.edit_CH02,'string');                  
% edit_CH03=get(handles.edit_CH03,'string');                  
% edit_CH00= regexprep(edit_CH00,' ', '');edit_CH01 =regexprep(edit_CH01,' ', '');                  
% edit_CH02= regexprep(edit_CH02,' ', '');edit_CH03 =regexprep(edit_CH03,' ', '');                  
                
h=timebar_BACWrapper('Please wait....');                  
set(h,'color','w');                  
for   ii=1:size(Raw_listbox,1)                  
timebar_BACWrapper(h,ii/(size(Raw_listbox,1)))                  
pathname= char(Raw_listbox(ii))
pathname2=char(strcat(pathname,'/tif files'))               
new_pathname= strcat(pathname,'_exp');                  
mkdir(new_pathname)                  
str=strcat(pathname,'\*.tif') ; 
str2=strcat(pathname2,'\*.tif') ;

dir_filename=dir(str2) ;                  
% to find the number of zeros to add to time points:                  
time_point=[]                  
for jj=1:size(dir_filename,1)                  
file_name=char(cellstr(dir_filename(jj).name)) ;
 
                             
str= char(strcat(pathname2,'\',  file_name )  )     ;               
  
 
 
 temp=double(imread( str));                  
 temp=uint16( 65535*(temp./max(max(temp))));                  
   
str=file_name;

 
loc_sign=findstr(str,'_');  ind_loc_sign1=  loc_sign(1);  ind_loc_sign2=  loc_sign(end); 
n=str( ind_loc_sign2+1:end-4)  ;
Name_Str=str(ind_loc_sign1+1:ind_loc_sign2-1);


N=str2num(n);


if  N<10                  
time_point=strcat('000',n);                   
end                  
if  N>9 && N<100                  
time_point=strcat('00',n);                   
end                  
if  N>99 && N<1000                  
time_point=strcat('0',n);                 
end  
time_point
new_name=char(strcat(new_pathname,'\',Name_Str ,'_t',  time_point,  '_ch00.tif'))     
 imwrite(temp,new_name)  
 
end
end


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
