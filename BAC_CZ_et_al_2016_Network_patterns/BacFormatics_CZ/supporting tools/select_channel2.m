%% ________________BacFormatics Code starts here:________________  
function varargout = select_channel2(varargin)                  
% SELECT_CHANNEL2 M-file for select_channel2.fig                  
%      SELECT_CHANNEL2, by itself, creates a new SELECT_CHANNEL2 or raises the existing                  
%      singleton*.                  
%                  
%      H = SELECT_CHANNEL2 returns the handle to a new SELECT_CHANNEL2 or the handle to                  
%      the existing singleton*.                  
%                  
%      SELECT_CHANNEL2('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in SELECT_CHANNEL2.M with the given input arguments.                  
%                  
%      SELECT_CHANNEL2('Property','Value',...) creates a new SELECT_CHANNEL2 or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before select_channel2_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to select_channel2_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help select_channel2                  
% Last Modified by GUIDE v2.5 11-Jul-2016 22:27:20
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @select_channel2_OpeningFcn, ...                  
'gui_OutputFcn',  @select_channel2_OutputFcn, ...                  
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
% --- Executes just before select_channel2 is made visible.                  
function select_channel2_OpeningFcn(hObject, eventdata, handles, varargin)     
 try
    global select_channel_set_name
    set(handles.text2,'string',select_channel_set_name)
 end

 
 

        
  
 


handles.output = hObject;                  
guidata(hObject, handles);                  
uiwait                  
% --- Outputs from this function are returned to the command line.                  
function varargout = select_channel2_OutputFcn(hObject, eventdata, handles)                  
varargout{1}= get(handles.popupmenu1,'value');                  
Projected_by_Value=get(handles.Projected_by,'Value');                  
Projected_by_Str=get(handles.Projected_by,'String');                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
varargout{2}= Projected_by;                  
guidata(hObject, handles);                  
close                  
% --- Executes on selection change in popupmenu1.                  
function popupmenu1_Callback(hObject, eventdata, handles)                  
function popupmenu1_CreateFcn(hObject, eventdata, handles)                  
% --- Executes on button press in pushbutton1.                  
function pushbutton1_Callback(hObject, eventdata, handles)                  
uiresume                  
% --- Executes on selection change in Projected_by.                  
function Projected_by_Callback(hObject, eventdata, handles)                  
% hObject    handle to Projected_by (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: contents = get(hObject,'String') returns Projected_by contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from Projected_by                  
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
