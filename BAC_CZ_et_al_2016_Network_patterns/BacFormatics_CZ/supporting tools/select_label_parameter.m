%% ________________BacFormatics Code starts here:________________  
function varargout = select_label_parameter(varargin)                  
% SELECT_LABEL_PARAMETER M-file for select_label_parameter.fig                  
%      SELECT_LABEL_PARAMETER, by itself, creates a new SELECT_LABEL_PARAMETER or raises the existing                  
%      singleton*.                  
%                  
%      H = SELECT_LABEL_PARAMETER returns the handle to a new SELECT_LABEL_PARAMETER or the handle to                  
%      the existing singleton*.                  
%                  
%      SELECT_LABEL_PARAMETER('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in SELECT_LABEL_PARAMETER.M with the given input arguments.                  
%                  
%      SELECT_LABEL_PARAMETER('Property','Value',...) creates a new SELECT_LABEL_PARAMETER or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before select_label_parameter_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to select_label_parameter_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help select_label_parameter                  
% Last Modified by GUIDE v2.5 03-Mar-2016 12:37:54
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @select_label_parameter_OpeningFcn, ...                  
'gui_OutputFcn',  @select_label_parameter_OutputFcn, ...                  
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
% --- Executes just before select_label_parameter is made visible.                  
function select_label_parameter_OpeningFcn(hObject, eventdata, handles, varargin)     
 

start_frame=varargin{1};
end_frame=varargin{2}  

 
set(handles.start_frame,'string',num2str(start_frame))
set(handles.end_frame,'string',num2str(end_frame))





clear new_str
new_str{1}='Centroid';
new_str{2}='BoundingBox';
new_str{3}='Area';
new_str{4}='Orientation';
new_str{5}='Eccentricity';
new_str{6}='Perimeter';
new_str{7}='MajorAxislength';
new_str{8}='MinorAxislength';
new_str{9}='Polar_Points';
new_str{10}='Circularity'; 
set(handles.listbox1,'string',new_str)
  
%   new_str=cellstr( new_str);
 
uiwait                 
% --- Outputs from this function are retur    
function varargout = select_label_parameter_OutputFcn(hObject, eventdata, handles)                   
  try   
       global new_str
       global start_frame
       global end_frame
       
 
       
varargout{1}=char(new_str);   
varargout{2}=char( start_frame);   
varargout{3}=char(end_frame);   

 
guidata(hObject, handles);                  
close                  
clc                  
end                
 
              
% --- Executes on selection change in popupmenu1.                  
function popupmenu1_Callback(hObject, eventdata, handles)                   
function popupmenu1_CreateFcn(hObject, eventdata, handles)                  
% --- Executes on button press in pushbutton1.                  
function pushbutton1_Callback(hObject, eventdata, handles)

global start_frame
global end_frame

start_frame=get(handles.start_frame,'string');
end_frame=get(handles.end_frame,'string');


global new_str
str=get(handles.listbox1,'String');

 


new_str= char(strcat('''',char(str(1)),'''',',')) 
for ii=2:size(str,1)                  
 temp_str= char(strcat('''',char(str(ii)),'''',','))     
new_str=strcat(new_str, temp_str)                
end
new_str(end)=[];
new_str=char(new_str);
uiresume   
% --- Executes on selection change in listbox1.                  
function listbox1_Callback(hObject, eventdata, handles)                  
% hObject    handle to listbox1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from listbox1                  
% --- Executes during object creation, after setting all properties.                  
function listbox1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to listbox1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on button press in pushbutton5.                  
function pushbutton5_Callback(hObject, eventdata, handles)                  
n=get(handles.listbox1,'Value') ;                  
listbox=get(handles.listbox1,'string')  ;                   
% if  n==1                    
% msgbox('BoundingBox must be labeled!')                  
% return                  
% end                  
if (n==1 &&  size(listbox,1)>1)                  
for ii=1:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                   
end                  
filename=new_listbox(1);                  
filename= strcat(pathname,filename);                  
filename=char(filename);                   
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
filename=new_listbox(n);                   
filename=char(filename);                   
set(handles.listbox1,'string',new_listbox);                   
return                  
end                  
if (n==size(listbox,1) && n>1)                  
for  ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                    
end                  
set(handles.listbox1,'Value',n-1);                  
set(handles.listbox1,'string',new_listbox);                  
return                  
end                  


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

listbox2_str=get(handles.listbox2,'string');
listbox2_val=get(handles.listbox2,'value');
str=listbox2_str(listbox2_val);

 

listbox1_str=get(handles.listbox1,'string');
 
if isempty(listbox1_str)==1
    listbox1_str(1)=str;
else
    listbox1_str(end+1)=str;
end
    
   if strcmp(str,'Circularity') 
listbox1_str(end+1)={'Perimeter'};
listbox1_str(end+1)={'Area'};
end
   if strcmp(str,'Polar_Points') 
listbox1_str(end+1)={'MajorAxisLength'};
listbox1_str(end+1)={'MinorAxisLength'};
listbox1_str(end+1)={'Orientation'};
   end
   
      if strcmp(str,'Detect_spots') | strcmp(str,'Polar_near_spots')  | strcmp(str,'Polar_spots_angle')    
listbox1_str(end+1)={'MajorAxisLength'};
listbox1_str(end+1)={'MinorAxisLength'};
listbox1_str(end+1)={'Orientation'};
listbox1_str(end+1)={'Polar_Points'};   
listbox1_str(end+1)={'Detect_spots'};
listbox1_str(end+1)={'Polar_near_spots'};
listbox1_str(end+1)={'Polar_spots_angle'};
      end
   
  
   
   
listbox1_str=unique(listbox1_str);
   set(handles.listbox1,'string',listbox1_str);
   set(handles.listbox1,'max',size(listbox1_str,1));


function start_frame_Callback(hObject, eventdata, handles)

 




function start_frame_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function end_frame_Callback(hObject, eventdata, handles)


function end_frame_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
