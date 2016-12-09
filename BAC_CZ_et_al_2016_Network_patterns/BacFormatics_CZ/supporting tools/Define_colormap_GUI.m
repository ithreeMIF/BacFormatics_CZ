%% ________________BacFormatics Code starts here:________________  
function varargout = Define_colormap_GUI(varargin)                  
% DEFINE_COLORMAP_GUI MATLAB code for Define_colormap_GUI.fig                  
%      DEFINE_COLORMAP_GUI, by itself, creates a new DEFINE_COLORMAP_GUI or raises the existing                  
%      singleton*.                  
%                  
%      H = DEFINE_COLORMAP_GUI returns the handle to a new DEFINE_COLORMAP_GUI or the handle to                  
%      the existing singleton*.                  
%                  
%      DEFINE_COLORMAP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in DEFINE_COLORMAP_GUI.M with the given input arguments.                  
%                  
%      DEFINE_COLORMAP_GUI('Property','Value',...) creates a new DEFINE_COLORMAP_GUI or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before Define_colormap_GUI_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to Define_colormap_GUI_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help Define_colormap_GUI                  
% Last Modified by GUIDE v2.5 01-Feb-2016 18:03:40
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @Define_colormap_GUI_OpeningFcn, ...                  
'gui_OutputFcn',  @Define_colormap_GUI_OutputFcn, ...                  
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
% --- Executes just before Define_colormap_GUI is made visible.                  
function Define_colormap_GUI_OpeningFcn(hObject, eventdata, handles, varargin)                  
% This function has no output args, see OutputFcn.                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% varargin   command line arguments to Define_colormap_GUI (see VARARGIN)                  
               
% Choose default command line output for Define_colormap_GUI                  
handles.output = hObject;     
% set(handles.figure1,'userdata','new_cells_list_window')

 
 
 

% Update handles structure                  
guidata(hObject, handles);                  
% UIWAIT makes Define_colormap_GUI wait for user response (see UIRESUME)                  
% uiwait(handles.figure1);                  
% --- Outputs from this function are returned to the command line.                  
function varargout = Define_colormap_GUI_OutputFcn(hObject, eventdata, handles)                  
% varargout  cell array for returning output args (see VARARGOUT);                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Get default command line output from handles structure                  
varargout{1} = [];                  
function Y_lim_end1_Callback(hObject, eventdata, handles)                  
% hObject    handle to Y_lim_end1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of Y_lim_end1 as text                  
%        str2double(get(hObject,'String')) returns contents of Y_lim_end1 as a double                  
% --- Executes during object creation, after setting all properties.                  
function Y_lim_end1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to Y_lim_end1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function Y_lim_start1_Callback(hObject, eventdata, handles)                  
% hObject    handle to Y_lim_start1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of Y_lim_start1 as text                  
%        str2double(get(hObject,'String')) returns contents of Y_lim_start1 as a double                  
% --- Executes during object creation, after setting all properties.                  
function Y_lim_start1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to Y_lim_start1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on button press in pushbutton2.                  
function pushbutton2_Callback(hObject, eventdata, handles)                  
index=1                  
eval( strcat('Ylim(1)=str2num(get(handles.Y_lim_start1,','''string''))'))                  
eval( strcat('Ylim(2)=str2num(get(handles.Y_lim_end1,','''string''))'))                  
eval(strcat('axes(handles.axes',num2str(index),')'));                  
eval(strcat('set(handles.axes',num2str(index),',','[','''','y','''',',','''','lim','''','],Ylim);'))                  
% --- Executes on mouse press over axes background.                  
function axes1_ButtonDownFcn(hObject, eventdata, handles)                  
sel_typ = get(gcbf,'SelectionType')                  
point1 = get(hObject,'CurrentPoint')                  
%  frame=round(point1(1))                  
%  if strcmp(sel_typ,'normal')==1                  
%       'free option'                  
%  end                  
%                  
%   if strcmp(sel_typ,'alt')==1                  
%             'free option'                  
%   end                  
%   if strcmp(sel_typ,'extend')==1                  
%      'extend'                  
% end                  
%                  
% global h_centy_window                  
% global h_TAC_Cell_Tracking_Module                  
% set(h_TAC_Cell_Tracking_Module.Raw_listbox,'value',round(point1(1)))                  
% %    h_TAC_Cell_Tracking_Module = guidata(TAC_Cell_Tracking_Module)                  
% %     set(h_TAC_Cell_Tracking_Module.Raw_listbox,'value',round(point1(1)))                  
% TAC_Cell_Tracking_Module('Raw_listbox_Callback', h_TAC_Cell_Tracking_Module.Raw_listbox,[],h_TAC_Cell_Tracking_Module)                  
% %     important: gui1.m and gui1.fig must be in the path to be called                  
% 
% 
% global h_centy_window                  
% global h_TAC_Cell_Tracking_Module                  
% set(h_TAC_Cell_Tracking_Module.Raw_listbox,'value',round(point1(1)))                  
% %    h_TAC_Cell_Tracking_Module = guidata(TAC_Cell_Tracking_Module)                  
% %     set(h_TAC_Cell_Tracking_Module.Raw_listbox,'value',round(point1(1)))                  
% TAC_Cell_Tracking_Module('Raw_listbox_Callback', h_TAC_Cell_Tracking_Module.Raw_listbox,[],h_TAC_Cell_Tracking_Module)                  
% %     important: gui1.m and gui1.fig must be in the path to be called                  



  h_Raw_listbox = findobj('tag','Raw_listbox')             
  set( h_Raw_listbox,'value',round(point1(1)))       

h_Bac = findobj('userdata','BacFormatics'); h_BacFormatics  =         guidata(  h_Bac)
BacFormatics('Raw_listbox_Callback', h_BacFormatics.Raw_listbox,[], h_BacFormatics)



% 
% 
%  h_Raw_listbox = findobj('tag','Raw_listbox')             
% % set( h_Raw_listbox,'value',round(point1(1)))       
%  
%   h_Bac = findobj('userdata','BacFormatics')
%   h_Bac=guidata(  h_Bac)
% %   h_Bac('Raw_listbox_Callback',  h_Bac.Raw_listbox,[], h_Bac) 
% % 
% % 
% % %  h_Bac('Raw_listbox_Callback',  h_Bac.Raw_listbox,[], h_Bac) 
% % %  
% %  
%   h_Raw_listbox([], [],   h_Bac)
  
  
  
  
  
  
  
  
  
  
  
  
  
function X_lim_start1_Callback(hObject, eventdata, handles)                  
% hObject    handle to X_lim_start1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of X_lim_start1 as text                  
%        str2double(get(hObject,'String')) returns contents of X_lim_start1 as a double                  
% --- Executes during object creation, after setting all properties.                  
function X_lim_start1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to X_lim_start1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
function X_lim_end1_Callback(hObject, eventdata, handles)                  
% hObject    handle to X_lim_end1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: get(hObject,'String') returns contents of X_lim_end1 as text                  
%        str2double(get(hObject,'String')) returns contents of X_lim_end1 as a double                  
% --- Executes during object creation, after setting all properties.                  
function X_lim_end1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to X_lim_end1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: edit controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
% --- Executes on button press in pushbutton3.                  
function pushbutton3_Callback(hObject, eventdata, handles)                  
% hObject    handle to pushbutton3 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --- Executes on button press in pushbutton4.                  
function pushbutton4_Callback(hObject, eventdata, handles)                  
index=1                  
eval( strcat('Xlim(1)=str2num(get(handles.X_lim_start1,','''string''))'))                  
eval( strcat('Xlim(2)=str2num(get(handles.X_lim_end1,','''string''))'))                  
eval(strcat('axes(handles.axes',num2str(index),')'));                  
eval(strcat('set(handles.axes',num2str(index),',','[','''','X','''',',','''','lim','''','],Xlim);'))                  
 
 
  

 
% --- Executes during object creation, after setting all properties.                  
function axes1_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to axes1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: place code in OpeningFcn to populate axes1                  
% --- Executes on selection change in selective_operator.                  
function selective_operator_Callback(hObject, eventdata, handles)                  
% hObject    handle to selective_operator (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: contents = cellstr(get(hObject,'String')) returns selective_operator contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from selective_operator                  
Untitled_1_Callback(hObject, eventdata, handles)                  
% --- Executes during object creation, after setting all properties.                  
function selective_operator_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to selective_operator (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  


 

 
% --- Executes on button press in step3.
function step3_Callback(hObject, eventdata, handles)
% hObject    handle to step3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CC
CC=  get(gcf,'colormap');
 
% --- Executes on button press in step1.
function step1_Callback(hObject, eventdata, handles)
% hObject    handle to step1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MATRIX_data CC
 MATRIX_data2= MATRIX_data;
 MATRIX_data2=MATRIX_data2(:);MATRIX_data2(isnan(MATRIX_data2))=[]; z=hist(MATRIX_data2,100);
Close
for ii=1:100
    
    
   y1=1;
  y2 =z(ii)/sum(z);y2=round(y2*100) ;
  
  if y2~=0
      MATRIX_data3(y1:y2,ii)=ii;
  end
  
    
   
end



MATRIX_data3(1,100)=0;MATRIX_data3(100,100)=100;
 
 imagesc(MATRIX_data3)
handles.MATRIX_data3=MATRIX_data3;
guidata(hObject, handles); 
% --- Executes on button press in step2.
function step2_Callback(hObject, eventdata, handles)
% hObject    handle to step2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
imagesc(handles.MATRIX_data3)
colorbar
 
   set(handles.axes1, 'ylim',[0 100])
      set(handles.axes1, 'xlim',[1 100])
  try
       colormap(CC)
       
  catch
      
      try
      load CC
      colormap(CC)
      catch
      
      colormap(jet(100))
      end
  end
    
% set(get(h_fig,'Children'),'ydir','normal')

  
C=colormapeditor
