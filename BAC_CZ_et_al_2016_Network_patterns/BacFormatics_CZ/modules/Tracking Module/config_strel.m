%% ________________BacFormatics Code starts here:________________  
function varargout = config_strel(varargin)                  
% CONFIG_STREL M-file for config_strel.fig                  
%      CONFIG_STREL, by itself, creates a new CONFIG_STREL or raises the existing                  
%      singleton*.                  
%                  
%      H = CONFIG_STREL returns the handle to a new CONFIG_STREL or the handle to                  
%      the existing singleton*.                  
%                  
%      CONFIG_STREL('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in CONFIG_STREL.M with the given input arguments.                  
%                  
%      CONFIG_STREL('Property','Value',...) creates a new CONFIG_STREL or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before config_strel_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to config_strel_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help config_strel                  
% Last Modified by GUIDE v2.5 28-Jan-2016 09:09:28
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @config_strel_OpeningFcn, ...                  
'gui_OutputFcn',  @config_strel_OutputFcn, ...                  
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
% --- Executes just before config_strel is made visible.                  
function config_strel_OpeningFcn(hObject, eventdata, handles, varargin)                  
if nargin <4                  
handles.output = hObject;                  
guidata(hObject, handles);                  
end                  
varargout{1}=    get(handles.popupmenu1,'value'); 
varargout{2}=    get(handles.edit1,'string');    
guidata(hObject, handles);                 
uiwait                  
% --- Outputs from this function are returned to the command line.                  
function varargout = config_strel_OutputFcn(hObject, eventdata, handles)                  
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


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
msgbox([...
    'A strel object represents a 2-D (also called a flat) morphological structuring element, which is an essential part of morphologica ' ...
'dilation and erosion operations. A structuring element is a matrix consisting of only 0s and 1s that can have any arbitrary shape and ' ...
    'size. The pixels with values of 1 define the neighborhood. Two-dimensional, or flat, structuring elements are typically much smaller '...
    'than the image being processed. The center pixel of the structuring element, called the origin, identifies the pixel of interest—the ' ...
    'pixel being processed. Three-dimensional, or nonflat, structuring elements use 0s and 1s to define the extent of the structuring element ' ...
    'in the x- and y-planes and add height values to define the third dimension. To create a 3-D (also called a nonflat) structuring element ' ...
    ',use offsetstre'],'Help')
