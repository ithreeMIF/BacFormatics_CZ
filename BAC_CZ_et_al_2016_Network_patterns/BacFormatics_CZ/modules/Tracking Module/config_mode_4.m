%% ________________BacFormatics Code starts here:________________  
function varargout = config_mode_4(varargin)                  
% CONFIG_MODE_4 M-file for config_mode_4.fig                  
%      CONFIG_MODE_4, by itself, creates a new CONFIG_MODE_4 or raises the existing                  
%      singleton*.                  
%                  
%      H = CONFIG_MODE_4 returns the handle to a new CONFIG_MODE_4 or the handle to                  
%      the existing singleton*.                  
%                  
%      CONFIG_MODE_4('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in CONFIG_MODE_4.M with the given input arguments.                  
%                  
%      CONFIG_MODE_4('Property','Value',...) creates a new CONFIG_MODE_4 or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before config_mode_4_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to config_mode_4_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help config_mode_4                  
% Last Modified by GUIDE v2.5 28-Jan-2016 00:34:41
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @config_mode_4_OpeningFcn, ...                  
'gui_OutputFcn',  @config_mode_4_OutputFcn, ...                  
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
% --- Executes just before config_mode_4 is made visible.                  
function config_mode_4_OpeningFcn(hObject, eventdata, handles, varargin)                  
if nargin <4                  
handles.output = hObject;                  
guidata(hObject, handles);                  
end                  
varargout{1}=    get(handles.popupmenu1,'value'); 
varargout{2}=    get(handles.edit1,'string');    
guidata(hObject, handles);                 
uiwait                  
% --- Outputs from this function are returned to the command line.                  
function varargout = config_mode_4_OutputFcn(hObject, eventdata, handles)                  
varargout{1}=    get(handles.popupmenu1,'value'); 
varargout{2}=    get(handles.edit1,'string');    
guidata(hObject, handles);                  
close                  
                
function pushbutton1_Callback(hObject, eventdata, handles)                  
uiresume                  
function edit1_CreateFcn(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
function edit1_Callback(hObject, eventdata, handles)
function popupmenu1_Callback(hObject, eventdata, handles)
