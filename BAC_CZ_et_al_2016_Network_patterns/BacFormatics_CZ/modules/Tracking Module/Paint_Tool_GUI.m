%% ________________BacFormatics Code starts here:________________
function varargout = Paint_Tool_GUI(varargin)
%      Paint_Tool_GUI, by itself, creates a new Paint_Tool_GUI or raises the existing
%      singleton*.
%
%      H = Paint_Tool_GUI returns the handle to a new Paint_Tool_GUI or the handle to
%      the existing singleton*.
%
%      Paint_Tool_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Paint_Tool_GUI.M with the given input arguments.
%
%      Paint_Tool_GUI('Property','Value',...) creates a new Paint_Tool_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs
%      are
%      applied to the GUI before Paint_Tool_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to Paint_Tool_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help Paint_Tool_GUI
% Last Modified by GUIDE v2.5 02-May-2015 06:00:53
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Paint_Tool_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Paint_Tool_GUI_OutputFcn, ...
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
function Paint_Tool_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
 
%  set(handles.sliderframes , 'Enable','on', 'SliderStep',[1, 0.1]);  % Matlab scrollbar
    

 


global spot_size
spot_size=2;

set(handles.figure1,'Name','Paint_Tool_GUI');



handles.output = hObject;    
guidata(hObject, handles);    



% --------------------------
function varargout = Paint_Tool_GUI_OutputFcn(hObject, ~, handles)
%  setWindowState(hObject,'maximize','icon.gif');  % Undocumented feature!

varargout{1} = handles.output;     


pause(0.05); drawnow;
varargout{1} = handles.output;
  replaceSlider(hObject,handles);
 varargout{1}=  handles.output;
   
function replaceSlider(hFig,handles)
sliderPos = getpixelposition(handles.sliderframes) ;
 



delete(handles.sliderframes);
handles.sliderframes = javacomponent('javax.swing.JSlider',sliderPos,hFig);



handles.sliderframes.setEnabled(false);
set(handles.sliderframes,'StateChangedCallback',{@sliderframes_Callback,handles});
guidata(hFig, handles);  % update handles struct
 
   
    set(handles.sliderframes, 'Value',1, 'Maximum',10, 'Minimum',1);
    try
        handles.sliderframes.setEnabled(true);  % Java JSlider
    catch
        set(handles.sliderframes, 'Enable','on', 'SliderStep',[1/numFiles, 0.1]);  % Matlab scrollbar
    end
 
 


% --- Executes on slider movement.
function sliderframes_Callback(hObject, eventdata, handles)
% hObject    handle to sliderframes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global spot_size
spot_size=round(get(handles.sliderframes,'value') ) 
spot_size_str=char(['Drawing spot size: ' num2str(spot_size)]);
set(handles.spot_size,'string',spot_size_str)


if spot_size<=1
    spot_size=0;
end
if spot_size>1 & spot_size<=2
    spot_size=1 ;
end
if spot_size>2 & spot_size<=3
    spot_size=2 ;
end
if spot_size>3 & spot_size<=4
    spot_size=3 ;
end
if spot_size>4 & spot_size<=5
    spot_size=4 ;
end
if spot_size>5 
spot_size=round(spot_size/4);
end

% --- Executes during object creation, after setting all properties.
function sliderframes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderframes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

 
 


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
