%% ________________BacFormatics Code starts here:________________  
function varargout = change_LUT2(varargin)                  
% CHANGE_LUT2 M-file for change_LUT2.fig                  
%      CHANGE_LUT2, by itself, creates a new CHANGE_LUT2 or raises the existing                  
%      singleton*.                  
%                  
%      H = CHANGE_LUT2 returns the handle to a new CHANGE_LUT2 or the handle to                  
%      the existing singleton*.                  
%                  
%      CHANGE_LUT2('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in CHANGE_LUT2.M with the given input arguments.                  
%                  
%      CHANGE_LUT2('Property','Value',...) creates a new CHANGE_LUT2 or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before change_LUT2_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to change_LUT2_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help change_LUT2                  
% Last Modified by GUIDE v2.5 31-Mar-2016 13:26:33
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @change_LUT2_OpeningFcn, ...                  
'gui_OutputFcn',  @change_LUT2_OutputFcn, ...                  
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
% --- Executes just before change_LUT2 is made visible.                  
function change_LUT2_OpeningFcn(hObject, eventdata, handles, varargin)                  
                  
handles.output = hObject;   
handles.c =varargin{1};  
guidata(hObject, handles);    
drawnow
uiwait                  
% --- Outputs from this function are returned to the command line.                  
function varargout = change_LUT2_OutputFcn(hObject, eventdata, handles)                  
varargout{1}=    get(gcf,'colormap');                  
guidata(hObject, handles);                  
close                  
% --- Executes on selection change in popupmenu1.                  
function popupmenu1_Callback(hObject, eventdata, handles)                  
  

global MATRIX_data_labeled 
 MATRIX_data_labeled2= MATRIX_data_labeled;
 MATRIX_data_labeled2=MATRIX_data_labeled2(:);MATRIX_data_labeled2(isnan(MATRIX_data_labeled2))=[]; z=hist(MATRIX_data_labeled2,100);
 
for ii=1:100  
   y1=1;
  y2 =z(ii)/sum(z);y2=round(y2*100) ; 
  if y2~=0
      MATRIX_data_labeled3(y1:y2,ii)=ii;
  end 
end



MATRIX_data_labeled3(1,100)=0;MATRIX_data_labeled3(100,100)=100; 
imagesc(MATRIX_data_labeled3) 
colormap(handles.c)
colorbar                
colormapeditor    
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
% --- Executes on button press in pushbutton1.                  
function pushbutton1_Callback(hObject, eventdata, handles)  
global CC
save CC CC
uiresume                  
% --- Executes on mouse press over axes background.                  
function axes1_ButtonDownFcn(hObject, eventdata, handles)                  
%                  


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load CC
colormap(CC) 
guidata(hObject, handles);    


% --- Executes on button press in pushbutton5.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
