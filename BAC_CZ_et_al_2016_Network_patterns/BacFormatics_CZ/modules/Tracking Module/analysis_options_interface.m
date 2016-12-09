function varargout = analysis_options_interface(varargin)
% ANALYSIS_OPTIONS_INTERFACE MATLAB code for analysis_options_interface.fig
%      ANALYSIS_OPTIONS_INTERFACE, by itself, creates a new ANALYSIS_OPTIONS_INTERFACE or raises the existing
%      singleton*.
%
%      H = ANALYSIS_OPTIONS_INTERFACE returns the handle to a new ANALYSIS_OPTIONS_INTERFACE or the handle to
%      the existing singleton*.
%
%      ANALYSIS_OPTIONS_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSIS_OPTIONS_INTERFACE.M with the given input arguments.
%
%      ANALYSIS_OPTIONS_INTERFACE('Property','Value',...) creates a new ANALYSIS_OPTIONS_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analysis_options_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analysis_options_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analysis_options_interface

% Last Modified by GUIDE v2.5 16-Jul-2015 15:24:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analysis_options_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @analysis_options_interface_OutputFcn, ...
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


% --- Executes just before analysis_options_interface is made visible.
function analysis_options_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analysis_options_interface (see VARARGIN)
tic
% Choose default command line output for analysis_options_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analysis_options_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);

 try
global data_file  
if isempty(data_file )~=1
        set(handles.data_file_checkbox,'value',1)
end
 end 
try
global MATRIX_data_velocity  
if isempty(MATRIX_data_velocity)~=1
        set(handles.velocity_matrix_checkbox,'value',1)
end
end 
% ___
try
global MATRIX_data_displacement  
if isempty(MATRIX_data_displacement)~=1
    set(handles.displacement_matrix_checkbox,'value',1)
end
end
% ___
try
global MATRIX
if isempty(MATRIX)~=1
    set(handles.trajectories_matrix_checkbox,'value',1)
end
end
% ___
try
global MATRIX_data_direction  
if isempty(MATRIX_data_direction)~=1
    set(handles.direction_matrix_checkbox,'value',1)
end
end
 % ___
try
global MATRIX_data_orientation 
if isempty(MATRIX_data_orientation)~=1
    set(handles.orientation_matrix_checkbox,'value',1)
end
end
 % ___
try
global MATRIX_data_MajorAxisLength 
if isempty(MATRIX_data_MajorAxisLength)~=1
    set(handles.MajorAxisLength_matrix_checkbox,'value',1)
end
end




 
for ii=1:6
       eval(char(strcat('global  togglebutton_value_',num2str(ii)))) 
        eval(char(strcat('togglebutton_value=togglebutton_value_',num2str(ii))));
       eval(char(strcat('set(handles.togglebutton',num2str(ii),',''value'',togglebutton_value)')));
       
       eval(char(strcat('global  togglebutton_ForegroundColor_',num2str(ii)))) 
        eval(char(strcat('togglebutton_ForegroundColor=togglebutton_ForegroundColor_',num2str(ii))));
       eval(char(strcat('set(handles.togglebutton',num2str(ii),',''ForegroundColor'',togglebutton_ForegroundColor)')));
       
       
       eval(char(strcat('global  togglebutton_userdata_',num2str(ii)))) 
        eval(char(strcat('togglebutton_userdata=togglebutton_userdata_',num2str(ii))));
       eval(char(strcat('set(handles.togglebutton',num2str(ii),',''userdata'',togglebutton_userdata)')));
       
       
       eval(char(strcat('global  togglebutton_BackgroundColor_',num2str(ii)))) 
        eval(char(strcat('togglebutton_BackgroundColor=togglebutton_BackgroundColor_',num2str(ii))));
       eval(char(strcat('set(handles.togglebutton',num2str(ii),',''BackgroundColor'',togglebutton_BackgroundColor)')));
       
       eval(char(strcat('global  togglebutton_String_',num2str(ii)))) 
        eval(char(strcat('togglebutton_String=togglebutton_String_',num2str(ii))));
       eval(char(strcat('set(handles.togglebutton',num2str(ii),',''String'',togglebutton_String)')));
end

 


% --- Outputs from this function are returned to the command line.
function varargout = analysis_options_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles) 
 
if  toc<0.05
    return
end
tic
  
 
    
    point_figure  = get(gcf,'CurrentPoint')  ;
    %
    x = point_figure(1)  ;
    y = point_figure(2)  ;
    
    
    xy1 =get(handles.checkbox_1, 'Position')   ;
    xy2 =get(handles.checkbox_2, 'Position') ;
    xy3 =get(handles.checkbox_3, 'Position') ;
    xy4 =get(handles.checkbox_4, 'Position') ;
    xy5=get(handles.checkbox_5, 'Position') ;
    xy6=get(handles.checkbox_6, 'Position') ;
    xy7=get(handles.checkbox_7, 'Position') ;
%     xy8=get(handles.checkbox_8, 'Position')  ;
    
 
    
    
    if xy1(1)<x && xy1(2)<y && x<(xy1(1)+xy1(3)) && y<(xy1(2)+xy1(4))
        set(handles.mode_text,'string','tendency of cells in question (in the indicated region) to be aligned (orientated) with its nearhest  neighbor cells','Visible','on')
     elseif xy2(1)<x && xy2(2)<y && x<(xy2(1)+xy2(3)) && y<(xy2(2)+xy2(4))
 set(handles.mode_text,'string','tendency of cells in question (in the indicated region) to move in the same direction with its nearhest neighbor cells','Visible','on')
     elseif xy3(1)<x && xy3(2)<y && x<(xy3(1)+xy3(3)) && y<(xy3(2)+xy3(4))
set(handles.mode_text,'string','The total distance migrated by any single cell was calculated as the sum of each distance traversed between each interval','Visible','on')  
      elseif xy4(1)<x && xy4(2)<y && x<(xy4(1)+xy4(3)) && y<(xy4(2)+xy4(4))
set(handles.mode_text,'string','The net displacement between the location of the cell in the first frame and frame n. Distances are binned and increments and plotted as proportion of the total population of cells','Visible','on')  
   elseif xy5(1)<x && xy5(2)<y && x<(xy5(1)+xy5(3)) && y<(xy5(2)+xy5(4))
set(handles.mode_text,'string','the total distance traveled by separating the cells into several even populations according to the total distance. These populations can have %overlap to create a smoother transition between consecutive sets','Visible','on')  
   elseif xy6(1)<x && xy6(2)<y && x<(xy6(1)+xy6(3)) && y<(xy6(2)+xy6(4))
    set(handles.mode_text,'string','the distribution of all of the angular displacements f?(??,?) from initial orientation of each particle that is visible for a duration of ??','Visible','on')  
 elseif xy7(1)<x && xy7(2)<y && x<(xy7(1)+xy7(3)) && y<(xy7(2)+xy7(4))
         set(handles.mode_text,'string','is the distribution of angular changes in velocity direction from initial velocity direction of each particle','Visible','on')  
 
%     elseif xy8(1)<x && xy8(2)<y && x<(xy8(1)+xy8(3)) && y<(xy8(2)+xy8(4))
%         set(handles.mode_text,'string','paint tool','Visible','on')
%    f
 

    else
       set(handles.mode_text,'string','run tracking','Visible','off')
    end
  
 
% --- Executes on button press in checkbox_1.
function checkbox_1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_1


% --- Executes on button press in checkbox_2.
function checkbox_2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_2


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
  iImage = imread(['example_1.png']);  
    figure 
    imagesc( iImage )
  iImage = imread(['example_1_b.png']);  
    figure 
    imagesc( iImage )
  iImage = imread(['example_1_c.png']);  
    figure 
    imagesc( iImage )


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  iImage = imread(['example_2.png']);  
    figure 
    imagesc( iImage )
  iImage = imread(['example_2_b.png']);  
    figure 
    imagesc( iImage )


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  iImage = imread(['example_3.png']);  
    figure 
    imagesc( iImage )
  iImage = imread(['example_3_b.png']);  
    figure 
    imagesc( iImage )

% --- Executes on button press in checkbox_4.
function checkbox_4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_4


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  iImage = imread(['example_4.png']);  
    figure 
    imagesc( iImage )


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox_5.
function checkbox_5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_5


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox_6.
function checkbox_6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_6


% --- Executes on button press in checkbox_7.
function checkbox_7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_7



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


% --- Executes on button press in checkbox_3.
function checkbox_3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_3


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
     set(hObject,'BackgroundColor','k')
end

% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
     set(hObject,'BackgroundColor','k')
end

% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
     set(hObject,'BackgroundColor','k')
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
     set(hObject,'BackgroundColor','k')
end
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over togglebutton1.
function togglebutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Togglebutton(hObject, eventdata, handles,1)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over togglebutton2.
function togglebutton2_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,2)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over togglebutton3.
function togglebutton3_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,3)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over togglebutton4.
function togglebutton4_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,4)



function Togglebutton(hObject, eventdata, handles,Togglebutton_ind)

 

temp_centy  =handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata;




in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2));
temp_centy=temp_centy(find(in),1:2);


Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

 
  
 v=MATRIX(n,:); v(v==0)=[];v2=[];
 v2(:,1)=v(1:2:length(v)); v2(:,2)=v(2:2:length(v)); 
 
 Counter=1;cell_list=[];
 for ii=1:size(temp_centy,1)
x= temp_centy(ii,1);
y=temp_centy(ii,2);

v3=v2;
v3(:,1)=v3(:,1)-x;
v3(:,2)=v3(:,2)-y;
v3=mean(abs(v3),2);
Ind=find(v3==0);

if isempty(Ind)~=1
   cell_list(Counter)= Ind;   
    Counter=Counter+1;
 end
 end
 
  
  
    

% ----------------------------------------------------------


data.color        =     uisetcolor;


data.cell_list    =    cell_list

gate_name_str = inputdlg('Please give the gate a name');

eval(char(strcat('set(handles.togglebutton',num2str(Togglebutton_ind),',''userdata','''',' , data)')))
eval(char(strcat('set(handles.togglebutton',num2str(Togglebutton_ind),',''string','''',' , gate_name_str)')))
eval(char(strcat('set(handles.togglebutton',num2str(Togglebutton_ind),',''ForegroundColor','''',' , data.color)')))


show_frame( handles,n)  ;
 


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if get(handles.checkbox_1,'value')==1
    global MATRIX_data_orientation
    figure
    title('Orientation AutoCorrelation')
    if get(handles.togglebutton1,'value')==0 & get(handles.togglebutton2,'value')==0 & get(handles.togglebutton3,'value')==0  ...
            &  get(handles.togglebutton4,'value')==0 & get(handles.togglebutton5,'value')==0 & get(handles.togglebutton6,'value')==0
        %not gating: all data
        orient_autocorr_BACWrapper(MATRIX_data_orientation ,[0 0 1] ,0)
        return
    end
    hold on
    for kk=1:6
        eval(char(strcat('togglebutton_value= get(handles.togglebutton',num2str(kk),',''value'')')));
        if  togglebutton_value==1
            eval(char(strcat('Data= get(handles.togglebutton',num2str(kk),',''userdata'')')));
            if isempty(Data)~=1
                cell_list=Data.cell_list;
                
                if isempty(cell_list)~=1
                    
                    counter=1;new_cell_list=[]
                    for ii=1:size(Data.cell_list,2)
                        new_cell_list(counter)=2*Data.cell_list(ii)-1     ;counter=counter+1;
                        new_cell_list(counter)=2*Data.cell_list(ii)     ;counter=counter+1;
                    end
                    MATRIX_data_orientation_gated =MATRIX_data_orientation(:,new_cell_list);
                    eval(char(strcat('C= get(handles.togglebutton',num2str(kk),',''ForegroundColor'')')));
                    orient_autocorr_BACWrapper(MATRIX_data_orientation_gated,C ,0)
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if get(handles.checkbox_2,'value')==1
    global MATRIX_data_velocity
    figure
    title('velocity AutoCorrelation')
    if get(handles.togglebutton1,'value')==0 & get(handles.togglebutton2,'value')==0 & get(handles.togglebutton3,'value')==0  ...
            &  get(handles.togglebutton4,'value')==0 & get(handles.togglebutton5,'value')==0 & get(handles.togglebutton6,'value')==0
        %not gating: all data
        orient_autocorr_BACWrapper(MATRIX_data_velocity ,[0 0 1] ,0)
        return
    end
    hold on
    for kk=1:6
        eval(char(strcat('togglebutton_value= get(handles.togglebutton',num2str(kk),',''value'')')));
        if  togglebutton_value==1
            eval(char(strcat('Data= get(handles.togglebutton',num2str(kk),',''userdata'')')));
            if isempty(Data)~=1
                cell_list=Data.cell_list;
                
                if isempty(cell_list)~=1
                    
                    counter=1;new_cell_list=[]
                    for ii=1:size(Data.cell_list,2)
                        new_cell_list(counter)=2*Data.cell_list(ii)-1     ;counter=counter+1;
                        new_cell_list(counter)=2*Data.cell_list(ii)     ;counter=counter+1;
                    end
                    MATRIX_data_velocity_gated =MATRIX_data_velocity(:,new_cell_list);
                    eval(char(strcat('C= get(handles.togglebutton',num2str(kk),',''ForegroundColor'')')));
                    orient_autocorr_BACWrapper(MATRIX_data_velocity_gated,C ,0)
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if get(handles.checkbox_10,'value')==1
    global MATRIX_data_direction
    figure
    title('direction AutoCorrelation')
    if get(handles.togglebutton1,'value')==0 & get(handles.togglebutton2,'value')==0 & get(handles.togglebutton3,'value')==0  ...
            &  get(handles.togglebutton4,'value')==0 & get(handles.togglebutton5,'value')==0 & get(handles.togglebutton6,'value')==0
        %not gating: all data
        orient_autocorr_BACWrapper(MATRIX_data_direction ,[0 0 1] ,0)
        return
    end
    hold on
    for kk=1:6
        eval(char(strcat('togglebutton_value= get(handles.togglebutton',num2str(kk),',''value'')')));
        if  togglebutton_value==1
            eval(char(strcat('Data= get(handles.togglebutton',num2str(kk),',''userdata'')')));
            if isempty(Data)~=1
                cell_list=Data.cell_list;
                
                if isempty(cell_list)~=1
                    
                    counter=1;new_cell_list=[]
                    for ii=1:size(Data.cell_list,2)
                        new_cell_list(counter)=2*Data.cell_list(ii)-1     ;counter=counter+1;
                        new_cell_list(counter)=2*Data.cell_list(ii)     ;counter=counter+1;
                    end
                    MATRIX_data_direction_gated =MATRIX_data_direction(:,new_cell_list);
                    eval(char(strcat('C= get(handles.togglebutton',num2str(kk),',''ForegroundColor'')')));
                    orient_autocorr_BACWrapper(MATRIX_data_direction_gated,C ,0)
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% --- Executes on button press in trajectories_matrix_checkbox.
function trajectories_matrix_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to trajectories_matrix_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of trajectories_matrix_checkbox


% --- Executes on button press in orientation_matrix_checkbox.
function orientation_matrix_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to orientation_matrix_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of orientation_matrix_checkbox


% --- Executes on button press in velocity_matrix_checkbox.
function velocity_matrix_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to velocity_matrix_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of velocity_matrix_checkbox


% --- Executes on button press in data_file_checkbox.
function data_file_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to data_file_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of data_file_checkbox


% --- Executes on button press in displacement_matrix_checkbox.
function displacement_matrix_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to displacement_matrix_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of displacement_matrix_checkbox


% --- Executes on button press in MajorAxisLength_matrix_checkbox.
function MajorAxisLength_matrix_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to MajorAxisLength_matrix_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MajorAxisLength_matrix_checkbox


% --- Executes on button press in togglebutton5.
function togglebutton5_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton5


% --- Executes on button press in togglebutton6.
function togglebutton6_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton6


% --- Executes on button press in direction_matrix_checkbox.
function direction_matrix_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to direction_matrix_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of direction_matrix_checkbox


% --- Executes on button press in checkbox_10.
function checkbox_10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_10


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
