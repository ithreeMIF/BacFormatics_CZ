%% ________________BacFormatics Code starts here:________________  
function varargout = select_mode5_options(varargin)                  
% SELECT_MODE5_OPTIONS M-file for select_mode5_options.fig                  
%      SELECT_MODE5_OPTIONS, by itself, creates a new SELECT_MODE5_OPTIONS or raises the existing                  
%      singleton*.                  
%                  
%      H = SELECT_MODE5_OPTIONS returns the handle to a new SELECT_MODE5_OPTIONS or the handle to                  
%      the existing singleton*.                  
%                  
%      SELECT_MODE5_OPTIONS('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in SELECT_MODE5_OPTIONS.M with the given input arguments.                  
%                  
%      SELECT_MODE5_OPTIONS('Property','Value',...) creates a new SELECT_MODE5_OPTIONS or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before select_mode5_options_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to select_mode5_options_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help select_mode5_options                  
% Last Modified by GUIDE v2.5 30-Jan-2016 01:40:32
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @select_mode5_options_OpeningFcn, ...                  
'gui_OutputFcn',  @select_mode5_options_OutputFcn, ...                  
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
% --- Executes just before select_mode5_options is made visible.                  
function select_mode5_options_OpeningFcn(hObject, eventdata, handles, varargin)                  
if nargin <4                  
handles.output = hObject;                  
guidata(hObject, handles);                  
end                  
                 
handles.o =1;
guidata(hObject, handles);                  
uiwait                  
% --- Outputs from this function are returned to the command line.                  
function varargout = select_mode5_options_OutputFcn(hObject, eventdata, handles)                  
varargout{1}=  handles.o ;                  
guidata(hObject, handles);                  
close                  
% --- Executes on selection change in popupmenu1.                  
function popupmenu1_Callback(hObject, eventdata, handles)                  
handles.o=get(hObject, 'Value');                  
guidata(hObject, handles);                  


% --- Executes during object creation, after setting all properties.                  
function popupmenu1_CreateFcn(hObject, eventdata, handles)                  
 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
uiresume  
