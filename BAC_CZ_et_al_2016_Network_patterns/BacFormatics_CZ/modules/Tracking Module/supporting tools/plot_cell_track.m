%% ________________BacFormatics Code starts here:________________  
function varargout = plot_cell_track(varargin)                  
% PLOT_CELL_TRACK MATLAB code for plot_cell_track.fig                  
%      PLOT_CELL_TRACK, by itself, creates a new PLOT_CELL_TRACK or raises the existing                  
%      singleton*.                  
%                  
%      H = PLOT_CELL_TRACK returns the handle to a new PLOT_CELL_TRACK or the handle to                  
%      the existing singleton*.                  
%                  
%      PLOT_CELL_TRACK('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in PLOT_CELL_TRACK.M with the given input arguments.                  
%                  
%      PLOT_CELL_TRACK('Property','Value',...) creates a new PLOT_CELL_TRACK or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before plot_cell_track_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to plot_cell_track_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help plot_cell_track                  
% Last Modified by GUIDE v2.5 29-Jan-2016 13:32:31
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @plot_cell_track_OpeningFcn, ...                  
'gui_OutputFcn',  @plot_cell_track_OutputFcn, ...                  
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
% --- Executes just before plot_cell_track is made visible.                  
function plot_cell_track_OpeningFcn(hObject, eventdata, handles, varargin)     
    
    
    


 if nargin>3
 
   
 
 Montage=varargin{2};
 max_x=0;                    
max_y=0;                    
for ii=1:size(Montage,2)                    
if max_x<size(Montage(ii).cdata,1)                    
max_x=size(Montage(ii).cdata,1);                    
end                    
if max_y<size(Montage(ii).cdata,2)                    
max_y=size(Montage(ii).cdata,2);                    
end                    
end                    
           
D=zeros(max_x,max_y,1,ii);                    
for ii=1:size(Montage,2)                    
D(end-size(Montage(ii).cdata,1)+1:end, end-size(Montage(ii).cdata,2)+1:end,1,ii)=Montage(ii).cdata(:,:) ;                    
end  


handles.D=D;
guidata(hObject, handles);

D(:,:,1)=-D(:,:,1);

 axes(handles.axes2)
     cla                   
montage(D, 'DisplayRange', []);                   
           
          
     Sum_vec=varargin{1};
     axes(handles.axes1)
     cla
     plot(Sum_vec,'Marker','square','Hittest','Off');
     
     handles.Sum_vec=Sum_vec;  handles.stop_point=1;
     
     
     hold on
     
     
     plot( handles.stop_point,handles.Sum_vec(handles.stop_point),'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'Marker','square','Hittest','Off');
    
  
n=varargin{3};
 Forward=varargin{4};
 
 
 if Forward==1
     set(handles.text2,'string','Frame (Forward)') 
       Ind=n:1:n+length(Sum_vec)-1;
       set(gca,'XTickLabel',{ Ind},'XTick',1:length(Sum_vec)); 
 else
     set(handles.text2,'string','Frame (Rewind)') 
       Ind=n:-1:n-length(Sum_vec)+1; 
     set(gca,'XTickLabel',{ Ind},'XTick',1:length(Sum_vec)); 
 end
 
 set(handles.edit8,'string',{1:length(Sum_vec)},'max',length(Sum_vec),'min',1,'value',1)
 
 end
 
 
     handles.output = hObject;  
     guidata(hObject, handles); 
     
     
 
 


 

% handles.output = hObject;       %???remove            
                 
% UIWAIT makes plot_cell_track wait for user response (see UIRESUME)                  
% uiwait(handles.figure1);                  
% --- Outputs from this function are returned to the command line.                  
function varargout = plot_cell_track_OutputFcn(hObject, eventdata, handles)                  
% varargout  cell array for returning output args (see VARARGOUT);                  
% hObject    handle to figure                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Get default command line output from handles structure                  
  
 varargout{1} = handles.output;    

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
  
  
    
 function pushbutton1_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop_point
stop_point=[];
close(plot_cell_track)
 
 
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
close(plot_cell_track)


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
 
global stop_point
% sel_typ = get(gcbf,'SelectionType')        ;         
% point1 = round(get(hObject,'CurrentPoint'))  
%  stop_point=point1(1)
 stop_point=get(handles.edit8,'value'); 
D=handles.D;

D(:,:,stop_point)=-D(:,:,stop_point);
axes(handles.axes2)
     cla 
     
montage(D, 'DisplayRange', []);  





    
     axes(handles.axes1)
     cla
     plot(handles.Sum_vec,'Marker','square','Hittest','Off');
      
     guidata(hObject, handles); 
     
     
     
     
     
     Sum_vec=handles.Sum_vec;
     
     
     
     hold on 
     plot(stop_point, Sum_vec(stop_point),'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'Marker','square','Hittest','Off');
     





% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
 


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit8.
function edit8_ButtonDownFcn(hObject, eventdata, handles)
global stop_point
% sel_typ = get(gcbf,'SelectionType')        ;         
% point1 = round(get(hObject,'CurrentPoint'))  
%  stop_point=point1(1)
 stop_point=get(handles.edit8,'value'); 
D=handles.D;

D(:,:,stop_point)=-D(:,:,stop_point);
axes(handles.axes2)
     cla 
     
montage(D, 'DisplayRange', []);  





    
     axes(handles.axes1)
     cla
     plot(handles.Sum_vec,'Marker','square','Hittest','Off');
      
     guidata(hObject, handles); 
     
     
     
     
     
     Sum_vec=handles.Sum_vec;
     
     
     
     hold on 
     plot(stop_point, Sum_vec(stop_point),'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'Marker','square','Hittest','Off');
     
