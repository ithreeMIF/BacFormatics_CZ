%good% ________________BacFormatics Code starts here:________________
function varargout = BacFormatics(varargin)
%      BacFormatics, by itself, creates a new BacFormatics or raises the existing
%      singleton*.
%
%      H = BacFormatics returns the handle to a new BacFormatics or the handle to
%      the existing singleton*.
%
%      BacFormatics('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BacFormatics.M with the given input arguments.
%
%      BacFormatics('Property','Value',...) creates a new BacFormatics or raises the
%      existing singleton*.  Starting from the left, property value pairs
%      are
%      applied to the GUI before BacFormatics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to BacFormatics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% main_edit the above text to modify the response to help BacFormatics
% Last Modified by GUIDE v2.5 30-Jun-2016 11:21:52
% Begin initialization code - DO NOT MAIN_EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @BacFormatics_OpeningFcn, ...
    'gui_OutputFcn',  @BacFormatics_OutputFcn, ...
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
% End initialization code - DO NOT MAIN_EDIT
%% ---------------------------------------------------
% <<<<PART A OF BACFORMATICS PROGRAM:>>>>>
% Loading and displaying BacFormatics Screen and icons.  Settings default
% parameters.  Explanations and comments below
%  ---------------------------------------------------
function BacFormatics_OpeningFcn(hObject, eventdata, handles, varargin)
tic
 set(gcf,'Position',    [ 0.2042    0.7844    0.5000    0.0011])
 global track_what Projected_by imread_mode
 imread_mode=1;
track_what=1;
Projected_by='Imean' 
global mode_1 mode_2 mode_3 mode_4 mode_5 mode_6  mode_7 mode_8  Axis   box_Raw   data_file_2 spot_size spot_type SE_paint CD h_BacFormatics  
jFrame=get(handle(handles.figure1), 'javaframe');
jicon=javax.swing.ImageIcon('icon.gif');
jFrame.setFigureIcon(jicon);
set(handles.figure1,'userdata','BacFormatics')
axes(handles.axes1) 

Img=imread('bacformatics2.png');
axes(handles.BacFormatics_emblem);
imshow(Img)

handles.data_file(12).cdata.axis1=-1;
handles.data_file(12).cdata.axis2=-1;
handles.data_file(12).cdata.draw=0;
handles.data_file(12).cdata.split_tracks=0;
handles.flags.Xdata_global=0;
handles.edit_relabel_range= 0;
handles.max_distance=30;
handles.mode7_vec=[];
handles.mode5_vec=[];
handles.mode4_vec=[];
spot_size=1;
spot_type='square';
SE_paint=1;
global Axes
Axes=1
handles.flags.autosearch=0; 
 
 handles.flags.Contour=-1;
  handles.flags.Segment=-1;
    handles.flags.Box=-1;
      handles.flags.Events=-1;
          handles.flags.Arrows=-1;
          
  handles.flags.Polar_Points=-1;
   handles.flags.Centerline=-1;
    handles.flags.Mesh=-1;
  handles.flags.Center=-1;
   handles.flags.Intersection=-1;
    handles.flags.Spots=-1;
    
handles.flags.Manubar=1;
handles.flags.Toolbar=0;
handles.flags.Colorbar=0;
 
handles.flags.Color_Balance=0;
handles.track_every=1;
handles.new_cells_data_lim=70; 
 handles.flags.show_left_panel=0;
handles.flags.AR_lock=1
handles.Colors_Line1=[0 0 1] ;
handles.Width_Line1=1;
handles.Scale_Line1=20;
handles.Size_Mark1=15;
handles.Colors_Mark1=[1 0 0];
handles.Type_Mark1='.';
handles.Colors_Line2=[1 1 0];
handles.Width_Line2=6;
Axis=1;

mode_1=0;mode_2=0;mode_3=0;mode_4=0;mode_5=0;mode_6=0;mode_7=0;mode_8=0;


for ii=1:8
    
    
    
    
    switch ii
        case 1
            iImage = imread('1.png'); % icon file name (.png) has to be equal to icon name
        case 2
            iImage = imread('2.png'); % icon file name (.png) has to be equal to icon name
        case 3
            iImage = imread('3.png'); % icon file name (.png) has to be equal to icon name
        case 4
            iImage = imread('4.png'); % icon file name (.png) has to be equal to icon name
        case 5
            iImage = imread('5.png'); % icon file name (.png) has to be equal to icon name
        case 6
            iImage = imread('6.png'); % icon file name (.png) has to be equal to icon name
        case 7
            iImage = imread('7.png'); % icon file name (.png) has to be equal to icon name
        case 8
            iImage = imread('8.png'); % icon file name (.png) has to be equal to icon name
    end 
    dImage1 = Img_convert(iImage); 
    eval(strcat('set(handles.mode_',num2str(ii),' ,''cdata''',', dImage1)') ) 
end


for ii=1:10 
    switch ii
        case 1
            iImage = imread('Folder_1.png'); % icon file name (.png) has to be equal to icon name
        case 2
            iImage = imread('Save_2.png'); % icon file name (.png) has to be equal to icon name
        case 3
            iImage = imread('Label_8.png'); % icon file name (.png) has to be equal to icon name
            
        case 5
            iImage = imread('Link_9.png'); % icon file name (.png) has to be equal to icon name
        case 7
            iImage = imread('Track_10.png'); % icon file name (.png) has to be equal to icon name
        case 9
            iImage = imread('Camera_3.png'); % icon file name (.png) has to be equal to icon name
        case 10
            iImage = imread('Roi_5.png'); % icon file name (.png) has to be equal to icon name 
        case 4 
            iImage = imread('Roi_5.png'); % icon file name (.png) has to be equal to icon name
        case 6
            iImage = imread('Roi_5.png'); % icon file name (.png) has to be equal to icon name
        case 8 
            iImage = imread('Fix_7.png'); % icon file name (.png) has to be equal to icon name 
    end 
     dImage1 = Img_convert(iImage,1); 
    eval(strcat('set(handles.icon_',num2str(ii),' ,''cdata''',', dImage1)') ) 
end




%
%
%
vec=  0:0.06:0.06*8;
vec=vec+0.276 ;

set(handles.mode_8,  'Position'  , [0 vec(1)          0.031    0.062]);
set(handles.mode_7,  'Position'  , [0 vec(2)         0.031     0.062]);
set(handles.mode_6,  'Position'  , [0 vec(3)         0.031     0.062]);
set(handles.mode_5,  'Position'  , [0 vec(4)         0.031     0.062]);
set(handles.mode_4,  'Position'  , [0 vec(5)         0.031     0.062]);
set(handles.mode_3,  'Position'  , [0 vec(6)         0.031     0.062]);
set(handles.mode_2,  'Position'  , [0 vec(7)        0.031     0.062]);
set(handles.mode_1,  'Position'  , [0 vec(8)         0.031     0.062]); 
vec=  0:0.032:0.032*5;
vec=vec+0.785  ;

set(handles.icon_9,  'Position'  , [0 vec(1)        0.016   0.032]);
set(handles.icon_7,  'Position'  , [0 vec(2)        0.016    0.032]);
set(handles.icon_5,  'Position'  , [0 vec(3)        0.016   0.032]);
set(handles.icon_3,  'Position'  , [0 vec(4)        0.016   0.032]);
set(handles.icon_1,  'Position'  , [0 vec(5)       0.016    0.032]);



set(handles.icon_10,  'Position'  , [0.016 vec(1)        0.016   0.032]);
set(handles.icon_8,  'Position'  , [0.016  vec(2)        0.016    0.032]);
set(handles.icon_6,  'Position'  , [0.016  vec(3)        0.016   0.032]);
set(handles.icon_4,  'Position'  , [0.016  vec(4)        0.016   0.032]);
set(handles.icon_2,  'Position'  , [0.016  vec(5)       0.016    0.032]);



vec=  0:0.032:0.064*6;
vec=0.965-vec ;

set(handles.Show_Arrows,  'Position'  , [ vec(1)  0.27      0.032   0.064]);
set(handles.Show_Events,  'Position'  , [ vec(2)     0.27   0.032    0.064]);
set(handles.Show_Box,  'Position'  , [ vec(3)     0.27   0.032   0.064]);
set(handles.Show_Segment,  'Position'  , [ vec(4) 0.27       0.032   0.064]);
set(handles.Show_Contour,  'Position'  , [ vec(5)   0.27    0.032    0.064]);
set(handles.underdevelopment1,  'Position'  , [ vec(6)   0.27    0.032    0.064]);


set(handles.Show_Intersection,  'Position'  , [ vec(1)  0.27+0.064      0.032   0.064]);
set(handles.Show_Center,  'Position'  , [ vec(2)       0.27+0.064   0.032   0.064]);
set(handles.Show_Mesh,  'Position'  , [ vec(3)           0.27+0.064  0.032  0.064]);
set(handles.Show_Centerline,  'Position'  , [ vec(4)     0.27+0.064   0.032   0.064]);
set(handles.Show_Polar_Points,  'Position'  , [ vec(5)   0.27+0.064     0.032    0.064]);
set(handles.Show_Spots,  'Position'  , [ vec(6)   0.27+0.064     0.032    0.064]);    


global icons_positions
icons_positions=icons_positions_function(handles);



load animatorIcons.mat
 
dImage1=Img_convert(pauseCData,1) ;
set(handles.stop_button,'cdata',   dImage1) 
dImage1=Img_convert(rewindCData,1) ;
set(handles.backward_button,'cdata',   dImage1) 
dImage1=Img_convert(fastforwardCData,1) ;
set(handles.forward_button,'cdata',   dImage1)



Img = Img_imread('With_contour_dots.png');  
set(handles.Show_Contour,'cdata',Img) 
Img = Img_imread('Segment.png');  
set(handles.Show_Segment,'cdata',Img) 
Img = Img_imread('Box1.png');  
set(handles.Show_Box,'cdata',Img) 
Img = Img_imread('Events.png');  
set(handles.Show_Events,'cdata',Img) 
Img = Img_imread('Arrows1.png');  
set(handles.Show_Arrows,'cdata',Img) 

Img = Img_imread('Polar_Points.png'); 
set(handles.Show_Polar_Points,'cdata',Img)
Img = Img_imread('Centerline.png'); 
set(handles.Show_Centerline,'cdata',Img)
Img = Img_imread('Mesh_ribons_and_dots.png'); 
set(handles.Show_Mesh,'cdata',Img)
Img = Img_imread('Center1.png');  
set(handles.Show_Center,'cdata',Img)
Img = Img_imread('Intersection.png'); 
set(handles.Show_Intersection,'cdata',Img)

Img = Img_imread('Spots.png'); 
set(handles.Show_Spots,'cdata',Img)
 


handles.Y1=1;
handles.X1 =1;
handles.Y =512;%default set by R.S
handles.X=512; %default set by R.S
c=zeros(64,3);
dic=c;
dic(:,1)=0:0.0158:1;
dic(:,2)=0:0.0158:1;
dic(:,3)=0:0.0158:1;
rfp=c;
rfp(:,1)=0:0.0158:1;
gfp=c;
gfp(:,2)=0:0.0158:1;
cfp=c;
cfp(:,3)=0:0.0158:1;
yfp=c;
yfp(:,1)=0:0.0158:1;
yfp(:,2)=0:0.0158:1;
Cherry=c;
Cherry(:,1)=0:0.0158:1;
Cherry(:,2)= linspace(0,0.2,64)';
handles.c1=dic;
handles.c2=cfp;
handles.c3=gfp;
handles.c4=yfp;
handles.c5=Cherry;
handles.c6=rfp;

 
   
    
    handles.output = hObject;
    handles.data_file=[];
    guidata(hObject, handles);
    
   
 
 
 
%%%%%
 
 
tic   
 % create the listener for the slider
 handles.sliderListener = addlistener(handles.slider1,'ContinuousValueChange',@(hFigure,eventdata) slider1ContValCallback(hObject,eventdata));
 handles.sliderListener = addlistener(handles.slider2,'ContinuousValueChange',@(hFigure,eventdata) slider2ContValCallback(hObject,eventdata));
 

guidata(hObject, handles);
% h_BacFormatics=handles;
axes(handles.axes1)
axis normal
 


global posmatrix Axes_in
posmatrix=[];  Axes_in=1;
  
 
Axes=1
 Pos=[0.075   0.105   0.9-0.03   0.89  ]
 
 posmatrix(Axes,1:4)= Pos 
 posmatrix(Axes,5)=0
 
%    eval(strcat('set(handles.axes',num2str(Axes),',','''','FontSize','''',',[',num2str(10),'])'))
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Position','''',',[',num2str(Pos),'])'))
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Box','''',',','''','on','''',')'))
 eval(strcat('h_title=get(handles.axes',num2str(Axes),',','''','ylabel','''',')'))
 
%  
%  eval(strcat('h_title=get(handles.axes',num2str(Axes),',','''','title','''',')'))
 set(h_title,'string','Node 1:source' ) 
 str(1)={'Node-1'}
set(handles.nodes_list,'string',str)

   
 











if nargin==3
 handles.nargin_num=3;
 guidata(hObject, handles);
   
end
if nargin==5
     filename=varargin{1};
     pathname=varargin{2}  ;
    full_filename=char(strcat(pathname,filename)) ;
    Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname)
    % important: don`t put guidata(hObject, handles); after the Open_Experiment_function
    set(handles.edit_axes1,'string','ready','ForegroundColor','w')
end
% ---------------------------------------------------
function varargout = BacFormatics_OutputFcn(hObject, ~, handles)
%  setWindowState(hObject,'maximize','icon.gif');  % Undocumented feature!
pause(0.05); drawnow;
varargout{1} = handles.output; 
 
function setWindowState(h,state,iconFilename)
if ~usejava('jvm'),  return;  end
drawnow; %need to make sure that the figures have been rendered or Java error can occur
%get the javaframes and desired operations
% is h all figure handles
if ~all(ishandle(h)) || ~isequal(length(h),length(findobj(h,'flat','Type','figure')))
    return;
end %if
%check that the states are all valid
if ~ismember(state,{'maximize','minimize','restore'}),  return;  end
% Get the figure's java frame
warning off MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame
jf = get(h,'javaframe');
%get version so we know which method to call
v = ver('matlab');
switch v.Release
    case {'(R14SP2)','(R14SP3)'}
        awtinvoke(jf,state);
    otherwise
        fp = jf.fFigureClient.getFrameProxy;
        switch state
            case 'maximize'
                awtinvoke(fp,'setMaximized(Z)',true)
            case 'minimize'
                awtinvoke(fp,'setMinimized(Z)',true)
            case 'restore'
                awtinvoke(fp,'setMaximized(Z)',false)
        end %switch
end %switch
% Set the java frame's icon
try
    newIcon = javax.swing.ImageIcon(iconFilename);
    jf.setFigureIcon(newIcon);
catch
    % never mind - filename is probably missing or invalid icon file
end
drawnow;
%end %setWindowState
function figResizeFcn(hFig,varargin)
handles = guidata(hFig);
%% ---------------------------------------------------
% <<<<PART B OF BACFORMATICS PROGRAM:>>>>>
%Manu Editor options. Not many explanations and comments as  most functions
%are short and self-evident for most MATLAB progremers
% ---------------------------------------------------
function File_Callback(~, ~, ~)
function Experiment_Callback(hObject, eventdata, handles)
function New_Experiment_Callback(~, ~, ~)
Experiment_Generator ;
% ---------------------------------------------------
function Open_Experiment_Callback(hObject, eventdata, handles)
BAC_NAME=get(handles.figure1,'Name');
Current_Exp= BAC_NAME(findstr(BAC_NAME,'>')+1:end);
Current_Exp=regexprep(Current_Exp, 'BacFormatics_EXP_New.dat','') ;

[filename, pathname, filterindex] = uigetfile({  '*.dat','dat-files (*.dat)';}, 'Please load experiment',Current_Exp);
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
full_filename = char(strcat(pathname,filename));

choice = questdlg(['Do you want to associate the experiment to: ' pathname '?'],'Hello User','Yes','No','Yes');
set(handles.edit_axes1,'string','Open_Experiment. Please wait...','ForegroundColor','r') 
switch choice
    case 'Yes' 
Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname)
  case 'No'
  Open_Experiment_function(hObject, eventdata, handles,full_filename)
end
 set(handles.edit_axes1,'string','ready','ForegroundColor','w')
% ---------------------------------------------------
 function Save_Experiment_Callback(hObject, eventdata, handles)
 Save_Experiment_function(hObject, eventdata, handles)
function Change_path_Callback(hObject, eventdata, handles)
Change_path




function Open_Callback(hObject, eventdata, handles) 
function Load_tif_select_by_folder_Callback(hObject, eventdata, handles)
set(handles.edit_axes1,'string','please wait...','ForegroundColor','r');   set(gcf,'Pointer','watch');   
[pathname,filename]=Load_tif_select_by_folder_function(handles) 
full_filename= char(strcat(pathname,filename)); 
Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname)
set(handles.edit_axes1,'string','ready. Experiment file was created','ForegroundColor','w'); set(gcf,'Pointer','arrow');


function Untitled_288_Callback(hObject, eventdata, handles)
    msgbox('under construction') 
% --------------------------------------------------- 
function Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname)

h=waitbar(0,'Loading experiment file, please wait');  
 
BAC_NAME=get(handles.figure1,'Name');
NAME= BAC_NAME(1:findstr(BAC_NAME,'>')) ;
full_filename=regexprep(full_filename, '\', filesep) ;
full_filename=regexprep(full_filename, '/', filesep) ;
handles.data_file=importdata(full_filename);

guidata(hObject,handles)
pause(2)
 if nargin>4
     handles.data_file(2).cdata{1,1}= [pathname];
     handles.data_file(2).cdata{1,2}= [pathname  'ch00_Filtered' filesep];
     handles.data_file(2).cdata{1,3}= [pathname  'ch00_Segmented' filesep]  ;
     
     handles.data_file(2).cdata{2,1}= [pathname];
     handles.data_file(2).cdata{2,2}= [pathname   'ch01_Filtered' filesep];
     handles.data_file(2).cdata{2,3}= [pathname   'ch01_Segmented' filesep]  ;
     
     
     handles.data_file(2).cdata{3,1}= [pathname];
     handles.data_file(2).cdata{3,2}= [pathname   'ch02_Filtered' filesep];
     handles.data_file(2).cdata{3,3}= [pathname   'ch02_Segmented' filesep]  ;
     
 end  






waitbar(0.4)  
set(handles.figure1,'Name',char(strcat(NAME, '>' ,full_filename)));
global box_Raw N_frames data_file_2
box_Raw= handles.data_file(1).cdata(:,1) ;
N_frames=size(box_Raw,1);
handles.Ignore_ROI(N_frames).cdata=[];
data_file_2=handles.data_file(2).cdata;
track_what=1; %defualt channel

set(handles.Raw_listbox,'Value',1);
set(handles.show_tracks,'Value',5);



set(handles.Raw_listbox,'String', handles.data_file(1).cdata(:,1));set(handles.Raw_listbox,'Max',size(handles.data_file(1).cdata(:,1),1))
set(handles.track_what1,'Value',1);      set(handles.Color_parameters,'Value',1);
str=[];
str=handles.data_file(3).cdata(track_what,1);
if str2double(str)<1
    set(handles.track_what1,'Value',1);   set(handles.Color_parameters,'Value',1);
    return
end
waitbar(0.5) 
handles.Y1=1;
handles.X1=1;
handles.Y=handles.data_file(6).cdata(3);
handles.X=handles.data_file(6).cdata(4);

if str2double(str)<1
    set(handles.track_what1,'Value',1);
    msgbox('this channel is not existing. Verify that chanel exist or disable the restriction manualy to continue')
    return
end
 

try
    if handles.data_file(14).cdata.flags.Generate_Centerline==1;
        set(handles.Generate_Centerline,'Enable','on')
    else
        set(handles.Generate_Centerline,'Enable','off')
    end
catch
    handles.data_file(14).cdata.flags.Generate_Centerline=0;
    set(handles.Generate_Centerline,'Enable','off')
end
try
    if handles.data_file(14).cdata.flags.Generate_Mesh==1;
        set(handles.Generate_Mesh,'Enable','on')
    else
        set(handles.Generate_Mesh,'Enable','off')
    end
catch
    handles.data_file(14).cdata.flags.Generate_Mesh=0;
    set(handles.Generate_Mesh,'Enable','off')
end

try
    if handles.data_file(14).cdata.flags.detect_z_ring_and_centerline_junction==1;
        set(handles.detect_z_ring_and_centerline_junction,'Enable','on')
    else
        set(handles.detect_z_ring_and_centerline_junction,'Enable','off')
    end
catch
    handles.data_file(14).cdata.flags.detect_z_ring_and_centerline_junction=0;
    set(handles.detect_z_ring_and_centerline_junction,'Enable','off')
end

if char(str)=='1'
    handles.c=handles.c1;
elseif char(str)=='2'
    handles.c=handles.c2;
elseif char(str)=='3'
    handles.c=handles.c3;
elseif char(str)=='4'
    handles.c=handles.c4;
elseif char(str)=='5'
    handles.c=handles.c5;
elseif char(str)=='6'
    handles.c=handles.c6;
end
set(handles.figure1,'colormap',handles.c);

handles.mode5_vec= [];
waitbar(0.55) 
for ii=1:2000
    try
        eval(['global h_imline_mode5_' num2str(ii)])
        eval( ['delete(h_imline_mode5_' num2str(ii) ')'])
    end
end
waitbar(0.65) 
handles.mode7_vec= [];
for ii=1:2000
    try
        eval(['global h_imline_mode7_' num2str(ii)])
        eval( ['delete(h_imline_mode7_' num2str(ii) ')'])
    end
end
waitbar(0.75) 
handles.mode4_vec= [];

try
    global h_imline_mode4 %#ok<*TLEV>
    delete(h_imline_mode4)
end

guidata(hObject,handles)
update_icons(handles)
waitbar(0.95) 
%numFiles = size(get(handles.Raw_listbox,'string'),1);
numFiles = size(handles.data_file(1).cdata(:,1),1) ;
% set(handles.end_export,'string',num2str(numFiles));
 

    set(handles.slider1, 'Value',1, 'Max',numFiles, 'Min',1); 
    set(handles.slider1, 'Enable','on', 'SliderStep',[1/numFiles, 0.1]);  % Matlab scrollbar
  
    
      
     
    
    set(handles.mode_text,'string','1')

axes(handles.axes1)
cla

 Untitled_141_Callback(hObject, eventdata, handles) 
% max_x=handles.data_file(6).cdata(3);
% max_y=handles.data_file(6).cdata(4);
% 
% imagesc(zeros(max_y,max_x));
% pos=get(handles.axes1,'position');
% axes_ratio=pos(4)/pos(3);
% if    max_y<max_x
%     pixel_ratio=max_x/max_y;
%     ylim([1 max_y])
%     xlim([1   max_y*axes_ratio*pixel_ratio])
% end
Raw_listbox_Callback([], eventdata, handles)
 Untitled_141_Callback(hObject, eventdata, handles)
  
set(handles.Raw_listbox,  'value',1 );
if findstr(char(handles.data_file(7).cdata(track_what,3)),'Y')==1
    
    try
        MATRIX = handles.data_file(5).cdata.Tracks(track_what).cdata   ;
        Data.vec_temp1=MATRIX(:);
        Data.vec_temp2=find(Data.vec_temp1~=0);
        Data.vec_temp1(Data.vec_temp1==0)=[];
        Data.N=size(MATRIX,1);
        Data.M=size(MATRIX,2);
        set(handles.show_tracks,'userdata',Data)
        
        if isempty(MATRIX)~=1
            handles.C=distinguishable_colors_BACWrapper(64,'k');  set(handles.Color_parameters,'userdata',handles.C)
        end
        
        
    end
    guidata(hObject,handles)
    
end
 axis tight
update_labelmatrix(handles)

global Ch00_stack_Segmented
Ch00_stack_Segmented=[];

global Ch00_stack_Raw
Ch00_stack_Raw=[];

read_global_stack([1 0 1])
 
close(h)

% jFrame=get(handle(handles.figure1), 'javaframe') 
%  jFrame.setMaximized(true);   % to maximize the figure
 
 Pos=get(gcf,'Position')
 if  Pos(3)<0.51 & Pos(4)<0.01 
     set(gcf,'Position',[0.1 0.07 0.8 0.9])
 end
 
% ----------
function Open_Samples_Callback(hObject, eventdata, handles)
function Sample_1_Callback(hObject, eventdata, handles)
  
global CD
CD
if isempty(CD)
    CD=cd;
end
full_filename=char([CD '\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast\BacFormatics_EXP_Pseudomonas_aeruginosa_phase_contrast.dat'])
full_filename=regexprep(full_filename, '\', filesep) ;
ind=findstr(full_filename,filesep);ind=ind(end);
pathname=full_filename(1:ind);
Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname) 
function Sample_2_Callback(hObject, eventdata, handles)
global CD 
if isempty(CD)
    CD=cd;
end
full_filename=char([CD '\File\Open Samples\E_Coli_phase_contrast\BacFormatics_EXP_E_Coli_phase_contrast.dat'])
full_filename=regexprep(full_filename, '\', filesep) ;
ind=findstr(full_filename,filesep);ind=ind(end);
pathname=full_filename(1:ind);
Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname)  
function Sample_3_Callback(hObject, eventdata, handles)
global CD   
if isempty(CD)
    CD=cd;
end
full_filename=char([CD '\File\Open Samples\z_ring_intersection\BacFormatics_EXP_z_ring_intersection.dat'])
full_filename=regexprep(full_filename, '\', filesep) ;
ind=findstr(full_filename,filesep);ind=ind(end);
pathname=full_filename(1:ind);
Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname) 

function Sample_4_Callback(hObject, eventdata, handles)

function Import_Callback(~, ~, ~) %#ok<*DEFNU>
% ---------------------------------------------------
function Untitled_16_Callback(~, ~, handles)
track_what=get(handles.track_what1,'Value');
n_Raw=get(handles.Raw_listbox,'Value');
DATA=handles.data_file(8).cdata(track_what).Frame(n_Raw).DATA  ;
if  DATA(1).vector(11)~=0
    set(handles.T_popup_2,'Value',DATA(1).vector(11));   end
if  DATA(1).vector(12)~=0
    set(handles.T_popup_3,'Value',DATA(1).vector(12));  end
if  DATA(1).vector(13)~=0
    set(handles.T_popup_4,'Value',DATA(1).vector(13));  end
if  DATA(1).vector(14)~=0
    set(handles.T_popup_5,'Value',DATA(1).vector(14));  end
if  DATA(1).vector(15)~=0
    set(handles.T_popup_6,'Value',DATA(1).vector(15));  end
for ii=2:5
    T_popup_function(ii,handles);
end
set(handles.thresh_level,'Value',DATA(1).vector(16));
set(handles.T_Slider_2,'Value',DATA(1).vector(17));
set(handles.T_Slider_3,'Value',DATA(1).vector(18));
set(handles.T_Slider_4,'Value',DATA(1).vector(19));
set(handles.T_Slider_5,'Value',DATA(1).vector(20));
set(handles.T_Slider_6,'Value',DATA(1).vector(21));
if DATA(1).vector(22)==0
    DATA(1).vector(22)= 1;
end
%   if DATA(1).vector(23)==0
%      DATA(1).vector(23)= 1;
%   end
if DATA(1).vector(24)==0
    DATA(1).vector(24)= 1;
end
set(handles.strel_type,'Value',DATA(1).vector(22));
%  set(handles.fspecial_type,'Value',DATA(1).vector(23));
set(handles.bwmorph_type,'Value',DATA(1).vector(24));
%  if isnan(DATA(2).vector(1))~=1
%      set(handles.F_edit_1,'String',DATA(2).vector(1)); end
%   if isnan(DATA(2).vector(2))~=1
%       set(handles.F_edit_2,'String',DATA(2).vector(2)); end
%    if isnan(DATA(2).vector(3))~=1
%        set(handles.F_edit_3,'String',DATA(2).vector(3)); end
%     if isnan(DATA(2).vector(4))~=1
%         set(handles.F_edit_4,'String',DATA(2).vector(4)); end
%      if isnan(DATA(2).vector(5))~=1
%          set(handles.F_edit_5,'String',DATA(2).vector(5)); end
%
try
    if isnan(DATA(2).vector(6))~=1
        set(handles.T_edit_1,'String',DATA(2).vector(6)); end
    if isnan(DATA(2).vector(7))~=1
        set(handles.T_edit_2,'String',DATA(2).vector(7)); end
    if isnan(DATA(2).vector(8))~=1
        set(handles.T_edit_3,'String',DATA(2).vector(8)); end
    if isnan(DATA(2).vector(9))~=1
        set(handles.T_edit_4,'String',DATA(2).vector(9)); end
    if isnan(DATA(2).vector(10))~=1
        set(handles.T_edit_5,'String',DATA(2).vector(10)); end
    if isnan(DATA(2).vector(11))~=1
        set(handles.T_edit_6,'String',DATA(2).vector(11)); end
end
% ---------------------------------------------------
function Untitled_15_Callback(~, ~, handles)
% hObject    handle to Load_optimal_settings (see GCBO)
[filename, pathname, filterindex] = uigetfile({  '*.dat','DAT-files (*.dat)';}, 'Please Choose optimal setting file');
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
full_filename= char(strcat(pathname,filename)); 
DATA=importdata(full_filename)  ;
set_DATA(handles,DATA);
% ---------------------------------------------------
function Untitled_87_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp= handles.data_file(8).cdata  ;
handles.data_file(8).cdata=[]  ;
guidata(hObject,handles)
%   Current_Exp=get(handles.Current_Exp,'String');
[filename, pathname, filterindex] = uiputfile({  '*.dat','Dat-files (*.dat)';}, 'save image processing settings before deleting from experiment file' );
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
full_filename= strcat(pathname  ,filename) ;
full_filename=char(full_filename);
save(full_filename ,  'temp')
pause(1)
msgbox('Settings were saved. Press OK to continue','Saved')
% ---------------------------------------------------
 
function load_zvi_Callback(hObject, eventdata, handles) 
% ---------------------------------------------------
function Untitled_294_Callback(hObject, eventdata, handles)
 [filename, pathname, filterindex] = uigetfile({  '*.zvi','Zvi-files (*.zvi)';}, 'Please Choose raw zvi files','MultiSelect', 'on'  ); %pick files to combine
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
if  iscell(filename)==0  %Only one image was selected
    filename_for_listbox=cellstr(filename);
    filename_for_listbox=cell(filename_for_listbox);
    box_Raw=filename_for_listbox;
else  %Multiple images were selected
    box_Raw=filename ;
end
full_filename=create_new_experiment_function_zvi(hObject, eventdata, handles,pathname,box_Raw);
Open_Experiment_function(hObject, eventdata, handles,full_filename) 
% ---------------------------------------------------
function Untitled_295_Callback(hObject, eventdata, handles)
 pathname = uigetdir;
if isequal(pathname,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
pathname =strcat(pathname,filesep);
str=strcat(pathname,'*.zvi');
dir_filename=dir(str);
jj=0;
for ii=1:size(dir_filename,1)
    if    isempty(findstr(dir_filename(ii).name,'zvi'))~=1
        jj=jj+1 ;
    end
end
filename_str=cell(jj,1);
jj=1;
for ii=1:size(dir_filename,1)
    if    isempty(findstr(dir_filename(ii).name,'zvi'))~=1
        filename_str(jj)=cellstr(dir_filename(ii).name) ; jj=jj+1;
    end
end


full_filename=create_new_experiment_function_zvi(hObject, eventdata, handles,pathname,filename_str);
Open_Experiment_function(hObject, eventdata, handles,full_filename)
% ---------------------------------------------------
function full_filename=create_new_experiment_function_zvi(hObject, eventdata, handles,pathname,box_Raw)
set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch'); 
ch_0=1;
ch_1=3;
ch_2=6;
ch_3=0;
%  dic; cfp; gfp; yfp; Cherry; rfp;
DATA=[];
DATA(3).cdata=cell(4,2) ;
DATA(3).cdata(1,1)=cellstr(num2str(ch_0));
DATA(3).cdata(2,1)=cellstr(num2str(ch_1));
DATA(3).cdata(3,1)=cellstr(num2str(ch_2));
DATA(3).cdata(4,1)=cellstr(num2str(ch_3));


DATA(3).cdata(1,2)=cellstr('dic');
DATA(3).cdata(2,2)=cellstr('gfp');
DATA(3).cdata(3,2)=cellstr('rfp');
DATA(3).cdata(4,2)=cellstr('_');

active=4;

DATA(2).cdata=cell(9,3) ; %
for ii=1:active
    DATA(4).cdata.Centroids(ii).cdata=[];
end
for ii=1:active
    DATA(4).cdata.L(ii).cdata=[];
end
for ii=1:active
    DATA(5).cdata.Tracks(ii).cdata=[];
end
DATA(7).cdata=cell(6,2) ; %flags for tracking and labeling status (with label is easy only has to use isempty(centy1) command
DATA(7).cdata(1,1)=cellstr('N');
DATA(7).cdata(2,1)=cellstr('N');
DATA(7).cdata(3,1)=cellstr('N');
DATA(7).cdata(4,1)=cellstr('N');
DATA(7).cdata(5,1)=cellstr('N');
DATA(7).cdata(6,1)=cellstr('N');
DATA(7).cdata(1,2)=cellstr('N');
DATA(7).cdata(2,2)=cellstr('N');
DATA(7).cdata(3,2)=cellstr('N');
DATA(7).cdata(4,2)=cellstr('N');
DATA(7).cdata(5,2)=cellstr('N');
DATA(7).cdata(6,2)=cellstr('N');
DATA(7).cdata(1,3)=cellstr('N');
DATA(7).cdata(2,3)=cellstr('N');
DATA(7).cdata(3,3)=cellstr('N');
DATA(7).cdata(4,3)=cellstr('N');
DATA(7).cdata(5,3)=cellstr('N');
DATA(7).cdata(6,3)=cellstr('N');
try
    Data= handles.temp2(2).cdata;
end

data_file=[];
data_file=DATA;

pathname_temp= char(strcat(pathname)) ;    mkdir(pathname_temp) ;    data_file(2).cdata(1,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(2,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(3,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname));     mkdir(pathname_temp) ;    data_file(2).cdata(4,1)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch00_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(1,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch01_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(2,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch02_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(3,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch03_Filtered',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(4,2)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch00_Segmented',filesep));     mkdir(pathname_temp) ;    data_file(2).cdata(1,3)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch01_Segmented',filesep));    mkdir(pathname_temp) ;    data_file(2).cdata(2,3)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch02_Segmented',filesep));    mkdir(pathname_temp) ;    data_file(2).cdata(3,3)=cellstr(char(pathname_temp));
pathname_temp= char(strcat(pathname,'ch03_Segmented',filesep));   mkdir(pathname_temp) ;    data_file(2).cdata(4,3)=cellstr(char(pathname_temp));

n=length(box_Raw);
iiii=1;
zz=cell(1,1); zz(1)=cellstr('empty');

choice = questdlg('Do you want to normalize image intensity and save as 8-bit?','Hello User','Yes','No','Yes');
switch choice
    case 'Yes'
        inputval = inputdlg('Please input new mean intensity (max 255)','Input',1,{'120'});
        inputval=str2num(char(inputval));
        
        for   ii=1:n
            file_name= char(box_Raw(ii));
            file_name= char(regexprep(file_name, '_ch00', ''));
            file_name= char(regexprep(file_name, '_ch01', ''));
            file_name= char(regexprep(file_name, '_ch02', ''));
            file_name= char(regexprep(file_name, '_ch03', ''));
            file_name= char(regexprep(file_name, '_ch04', ''));
            file_name= char(regexprep(file_name, '_ch05', ''));
                file_name(end-3:end)=[]  ; 
            full_file_name= char(strcat(pathname,file_name,'.zvi')) ; 
            ZVI=bfopen(full_file_name); 
             ZVI2=ZVI{1};ch00=ZVI2{1,1};ch01=ZVI2{2,1};ch02=ZVI2{3,1};
            
            
            temp_martix=double(ch00); temp_martix= temp_martix./mean(mean(temp_martix));  ch00= uint8(inputval*temp_martix);
            temp_martix=double(ch01); temp_martix= temp_martix./mean(mean(temp_martix));  ch01= uint8(inputval*temp_martix);
            temp_martix=double(ch02); temp_martix= temp_martix./mean(mean(temp_martix));  ch02= uint8(inputval*temp_martix);
            
            
            
            
            if ii==1
                data_file(6).cdata= [1 1  size(ch00,2)  size(ch00,1)];
                matrix(1)=65535;
                if max(matrix(:))==255
                    data_file(9).cdata=8;
                elseif max(matrix(:))==65535
                    data_file(9).cdata=16;
                end
            end
            new_full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
            imwrite(ch00, new_full_file_name)
            new_full_file_name= char(strcat(pathname,file_name,'_ch01.tif'));
            imwrite(ch01, new_full_file_name)
            new_full_file_name= char(strcat(pathname,file_name,'_ch02.tif'));
            imwrite(ch02, new_full_file_name)
            %%%%
            
            
     
        
        
        
        
        
        
        stat=0;
        for iii=1:length(zz)
            if isempty(strfind(file_name,char(zz(iii))))==0
                stat=1; break
            end
        end
        if stat==0
            zz(iiii)=  cellstr(file_name);iiii=iiii+1;
        end
        end
        
        
    case 'No'
        
        for   ii=1:n
            file_name= char(box_Raw(ii));
            file_name= char(regexprep(file_name, '_ch00', ''));
            file_name= char(regexprep(file_name, '_ch01', ''));
            file_name= char(regexprep(file_name, '_ch02', ''));
            file_name= char(regexprep(file_name, '_ch03', ''));
            file_name= char(regexprep(file_name, '_ch04', ''));
            file_name= char(regexprep(file_name, '_ch05', ''));
            file_name(end-3:end)=[]  ; 
            full_file_name= char(strcat(pathname,file_name,'.zvi')) 
            ZVI=bfopen(full_file_name) 
            
            
            ZVI2=ZVI{1};ch00=ZVI2{1,1};ch01=ZVI2{2,1};ch02=ZVI2{3,1};
            if ii==1
                data_file(6).cdata= [1 1  size(ch00,2)  size(ch00,1)];
                matrix(1)=65535;
                if max(matrix(:))==255
                    data_file(9).cdata=8;
                elseif max(matrix(:))==65535
                    data_file(9).cdata=16;
                end
            end
            new_full_file_name= char(strcat(pathname,file_name,'_ch00.tif'));
            imwrite(ch00, new_full_file_name)
            new_full_file_name= char(strcat(pathname,file_name,'_ch01.tif'));
            imwrite(ch01, new_full_file_name)
            new_full_file_name= char(strcat(pathname,file_name,'_ch02.tif'));
            imwrite(ch02, new_full_file_name)
            %%%%
            
      
        
        
        
        stat=0;
        for iii=1:length(zz)
            if isempty(strfind(file_name,char(zz(iii))))==0
                stat=1; break
            end
        end
        if stat==0
            zz(iiii)=  cellstr(file_name);iiii=iiii+1;
        end
        end 
        end




data_file(1).cdata(:,1)=zz;
%           ------------
if iscell(box_Raw)==0
    return
end
%      -----------------
full_filename=char(strcat(pathname,'BacFormatics_EXP_New.dat'));
data_file(10).cdata=full_filename;
save (full_filename,'data_file');
pause(0.3)
set(handles.edit_axes1,'string','ready. Experiment file was created','ForegroundColor','w')
set(gcf,'Pointer','arrow');
% ---------------------------------------------------
% ---------------------------------------------------



function Untitled_210_Callback(hObject, eventdata, handles)
function Close_Callback(hObject, eventdata, handles)
Close
function Untitled_212_Callback(hObject, eventdata, handles)
function Record_movie_Callback(hObject, eventdata, handles)
% hObject    handle to Record_movie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1) 
[filename2put, pathname2put, filterindex]=uiputfile('*.tif','name of multistack file');
prompt = {'Enter first frame:','Enter last frame:'};
dlg_title = 'Input frames number';
num_lines = 1;
def = {'',''};
answer = inputdlg(prompt,dlg_title,num_lines,def);
start_export= str2num(char(answer(1))); %#ok<ST2NM>
end_export=str2num(char(answer(2))); %#ok<ST2NM>
% colorbar('location','north')
% create movie:

% load verX1
% load  verX2 
% load  verY1
% load verY2   
     
 
%         set(handles.track_what1,'value',3)
%         track_what1_Callback(hObject, [], handles)
        
        
%     temp=getframe ;  title(num2str(n))
%     pause(0.2);
%     imwrite( temp(1).cdata ,[pathname2put filename2put],'WriteMode','append');
%     
    
%     mov(Counter)=temp;
    
    hold on
 
 Counter=1  
for n= start_export:end_export 
%     cla
    show_frame( handles,n,'axes') ;
%    xlim([verX1(n) verX2(n)])
%     ylim([verY1(n) verY2(n)])
%  
     
    
      temp=getframe ;  
    title(num2str(n))
    pause(0.2);
      imwrite( temp(1).cdata ,[pathname2put filename2put],'WriteMode','append');
    
    
      mov(Counter)=temp;
    Counter=Counter+1;
    pause(0.5);
end




% ---------------------------------------------------
function Houdini_Callback(hObject, eventdata, handles)
function Untitled_155_Callback(hObject, eventdata, handles)



track_what=1;
global box_Raw
XY_data= handles.data_file(4).cdata.L(track_what).cdata;

pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper('Re-label cells before exporting to Houdini. Please wait....');
set(h,'color','w');
global N_frames
start_track=1;
end_track=N_frames;
for ii=start_track:end_track %2 Procced only if the complimantory Segmented file was found
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
    set(handles.mode_text,'String',[num2str(ii) filesep num2str(end_track-start_track+1)],'Visible','on')
    
    
    
    filename_Segmentation=box_Raw(ii) ;
    full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;
    full_filename_Segmentation=char(full_filename_Segmentation) ;
    temp_Segmentation=imread_cross( full_filename_Segmentation,1);
    
    
    
    
    
    
    L=bwlabel(temp_Segmentation ,4);
    Border_matrix=[]; border_index_vector=[];
    for iii=1:max(L(:))
        temp_bw=L==iii;
        
        temp_Border=bwperim(temp_bw);
        
        
        if iii==1
            Border_matrix=temp_Border;
            border_index_vector=ones(size( temp_Border,1),1);
        else%
            Border_matrix(end+1:end+size(temp_Border,1),:)=temp_Border;
            border_index_vector(end+1:end+size(temp_Border,1),:)=iii;
        end
    end
    
    XY_data.Border(ii).cdata=Border_matrix;
    XY_data.border_index_vector(ii).cdata=border_index_vector;
    
    
end

handles.data_file(4).cdata.L(track_what).cdata=XY_data;
guidata(hObject, handles);
close(h)
return



track_what=1
global box_Raw
XY_data= handles.data_file(4).cdata.L(track_what).cdata;

pathname_Segmentation=handles.data_file(2).cdata(track_what,3)
h=timebar_BACWrapper('Re-label cells before exporting to Houdini. Please wait....');
set(h,'color','w');
global N_frames
start_track=1
end_track=N_frames
for ii=start_track:end_track %2 Procced only if the complimantory Segmented file was found
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
    set(handles.mode_text,'String',[num2str(ii) filesep num2str(end_track-start_track+1)],'Visible','on')
    
    
    
    filename_Segmentation=box_Raw(ii) ;
    full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;
    full_filename_Segmentation=char(full_filename_Segmentation) ;
    temp_Segmentation=imread_cross( full_filename_Segmentation,1);
    
    
    
    
    
    
    L=bwlabel(temp_Segmentation ,4);
    
    
    
    
    
    XYdata=regionprops(L,'Centroid','BoundingBox','MajorAxisLength','MinorAxisLength','Orientation','ConvexHull');
    
    % temp_Centroid= cat(1,XYdata.Centroid);
    %  temp_Centroid=  round(temp_Centroid*100)/100;
    %  temp_Centroid(:,3)=ii;
    %   XY_data.Centroid(ii).cdata = temp_Centroid;
    %
    
    XY_data.BoundingBox(ii).cdata= cat(1,XYdata.BoundingBox);
    
    
    
    XY_data.MajorAxisLength(ii).cdata= cat(1,XYdata.MajorAxisLength);
    
    
    XY_data.MinorAxisLength(ii).cdata= cat(1,XYdata.MinorAxisLength);
    
    XY_data.Orientation(ii).cdata= cat(1,XYdata.Orientation)+90;
    
    %
    % if  isempty(findstr(char(str_parameter),'PixelList'))==0
    % %  XY_data.PixelList(ii).cdata= cat(1,XYdata.PixelList);
    %    XY_data.PixelList(ii).cdata=  XYdata.PixelList ;
    % end
    
    % if  isempty(findstr(char(str_parameter),'Eccentricity'))==0
    %  XY_data.Eccentricity(ii).cdata= cat(1,XYdata.Eccentricity);
    % end
    % if  isempty(findstr(char(str_parameter),'Perimeter'))==0
    %  XY_data.Perimeter(ii).cdata= cat(1,XYdata.Perimeter);
    % end
    % if  isempty(findstr(char(str_parameter),'Extent'))==0
    %  XY_data.Extent(ii).cdata= cat(1,XYdata.Extent);
    % end
    %
    % if  isempty(findstr(char(str_parameter),'Solidity'))==0
    %  XY_data.Solidity(ii).cdata= cat(1,XYdata.Solidity);
    % % end
    % if  isempty(findstr(char(str_parameter),'EquivDiameter'))==0
    %  XY_data.EquivDiameter(ii).cdata= cat(1,XYdata.EquivDiameter);
    % end
    
    
    
    %  XY_data.ConvexHull(ii).cdata=  XYdata.ConvexHull ;
    %
    %
    %
    %   PixelList=data_file(4).cdata.L(track_what).cdata.PixelList(ii);
    
    ConvexHull_matrix=[]; border_index_vector=[];
    for iii=1:size(XYdata,1)
        temp_ConvexHull= XYdata(iii).ConvexHull;
        if iii==1
            ConvexHull_matrix=temp_ConvexHull;
            border_index_vector=ones(size( temp_ConvexHull,1),1);
        else%ext=nd
            ConvexHull_matrix(end+1:end+size(temp_ConvexHull,1),:)=temp_ConvexHull;
            border_index_vector(end+1:end+size(temp_ConvexHull,1),:)=iii;
        end
        %        figure(1)
        %        imagesc(border_index_vector)
        
    end
    
    XY_data.ConvexHull(ii).cdata=ConvexHull_matrix;
    XY_data.border_index_vector(ii).cdata=border_index_vector;
    
    
    
    %
    %  XY_data.Circularity(ii).cdata=4*pi*XY_data.Area(ii).cdata./(XY_data.Perimeter(ii).cdata.^2);
    
    try
        r=0.4*XY_data.MajorAxisLength(ii).cdata ;
        %              r= 0.35*XY_data.MajorAxisLength(ii).cdata ;
        rr=0.5*XY_data.MinorAxisLength(ii).cdata ;
        %             r=r-2*rr
        %             pause
        
        
        
        theta=XY_data.Orientation(ii).cdata;
        
        theta=theta-90;
        Ind1=find(theta>=0 &  theta<=90);
        
        theta(Ind1)=     -  theta(Ind1)   +180;
        
        Ind2=find(theta<0 &  theta>=-90);
        theta(Ind2)=     -  theta(Ind2)   +180;
        
        
        
        
        
        
        
        
        x=XY_data.Centroid(ii).cdata(:,1);     y=XY_data.Centroid(ii).cdata(:,2);
        
        
        xx1 =  x  + r .* cosd( theta)    ;
        yy1 = y  + r .* sind( theta)   ;
        
        xx2 =  x  + r .* cosd( theta+180)  ;
        yy2 =  y  + r .* sind( theta+180)   ;
        
        
        
        xxx1 =  x  + rr .* cosd( theta+90)    ;
        yyy1 = y  + rr .* sind( theta+90)   ;
        
        xxx2 =  x  + rr .* cosd( theta+270)  ;
        yyy2 =  y  + rr .* sind( theta+270)   ;
        
        minor_axis_p1=[];minor_axis_p2=[];major_axis_p1=[];major_axis_p2=[];
        
        minor_axis_p1(:,1)=xx1;   minor_axis_p1(:,2)=yy1; %%%%%%%%%%%%%%
        minor_axis_p2(:,1)=xx2;   minor_axis_p2(:,2)=yy2; %%%%%%%%%%%%%%
        
        major_axis_p1(:,1)=xxx1;   major_axis_p1(:,2)=yyy1; %%%%%%%%%%%%%%
        major_axis_p2(:,1)=xxx2;   major_axis_p2(:,2)=yyy2; %%%%%%%%%%%%%%
        
        
        
        XY_data.minor_axis_p1(ii).cdata= minor_axis_p1;
        XY_data.minor_axis_p2(ii).cdata= minor_axis_p2;
        XY_data.major_axis_p1(ii).cdata= major_axis_p1;
        XY_data.major_axis_p2(ii).cdata= major_axis_p2;
    end
end

handles.data_file(4).cdata.L(track_what).cdata=XY_data;
guidata(hObject, handles);
close(h)


iImage = imread('Link_9.png'); % icon file name (.png) has to be equal to icon name
dImage = double(iImage(:,:,1));
dImage = dImage./max(dImage(:)); dImage=dImage ;
dImage  = repmat(dImage, [1 1 3]);
set(handles.icon_5, 'cdata',  dImage  )

iImage = imread('Track_10.png'); % icon file name (.png) has to be equal to icon name
dImage = double(iImage(:,:,1));
dImage = dImage./max(dImage(:)); dImage=dImage ;
dImage  = repmat(dImage, [1 1 3]);
set(handles.icon_7, 'cdata',  dImage  )


msgbox('please apply tracking linker again')
% ---------------------------------------------------


% ---------------------------------------------------
function Untitled_153_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_153 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N_frames CD

N_frames;


for n=1:N_frames
    eval(char(['global  matrixColormap_' num2str(n) ' matrixX_' num2str(n) ' matrixY_' num2str(n) ' vecN_' num2str(n) ' vecX_' num2str(n) ' vecY_',num2str(n)]))
    %            matrixColormap_',num2str(n),')']))
    %             eval(char(['line(matrixX_' num2str(n) ',matrixY_' num2str(n) ',''Hittest'',''Off'',''Marker'',''.'',''MarkerSize'',6)']))
    %              try
    
    %              end
    
    
    
    
    vecX=eval(char(['vecX_' num2str(n)]));
    
    vecY=eval(char(['vecY_' num2str(n)]));
    
    vecN=eval(char(['vecN_' num2str(n)]));
    
    
    vecN= vecN';
    
    
    str=[CD 'File\Houdini\vecN_' num2str(n) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'vecN', '-ASCII')
    vecXY=[];
    vecXY(:,1)=vecX;   vecXY(:,2)=vecY;
    
    Nan_ind= isnan(vecXY);     vecXY(Nan_ind)=0;
    
    
    
    str=[CD 'File\Houdini\vecXY_data_' num2str(n) '.chan'] ;
     str=regexprep(str, '\', filesep) ;
    save(str, 'vecXY', '-ASCII')
    
    
end
% ---------------------------------------------------
function Untitled_111_Callback(hObject, eventdata, handles)
global CD
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc


data_file=handles.data_file;
track_what=1;
% MATRIX =  data_file(5).cdata.Tracks(track_what).cdata;
MATRIX_data_velocity=nan(size(MATRIX,1) ,size(MATRIX,2)/2 );
MATRIX_data_direction=MATRIX_data_velocity;


MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating direction and velocity data....');
max_velocity =5;

for ii=1:size(MATRIX,2)/2 %for each cell
    timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
    temp_vec_X=MATRIX(:,2*ii-1); Vx= nandiff(temp_vec_X'); %or try without ' (only temp_vec)
    temp_vec_Y=MATRIX(:,2*ii); Vy= nandiff(temp_vec_Y'); %or try without ' (only temp_vec)'
    MATRIX_data_velocity(:, ii)= sqrt(Vx.^2+Vy.^2);
    MATRIX_data_Vx(:, ii)= Vx;
    MATRIX_data_Vy(:, ii)= Vy;
    
    for jj=1:length(Vx)
        MATRIX_data_direction(jj, ii)=VxVy2angle(Vx(jj),Vy(jj));
    end
    
    
end


% for ii=1:size(MATRIX,2)/2 %for each cell
%     timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
%     MATRIX_data_velocity(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_velocity(:, ii),10);
%     MATRIX_data_direction(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_direction(:, ii),10);
%     MATRIX_data_Vx(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_Vx(:, ii),10);
%     MATRIX_data_Vy(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_Vy(:, ii),10);
% end




% llll
max_Vx=max_velocity;
max_Vy=max_velocity;
MATRIX_data_Vx=abs(MATRIX_data_Vx);
MATRIX_data_Vy=abs(MATRIX_data_Vy);




MATRIX_data_velocity(MATRIX_data_velocity>max_velocity)=max_velocity;
% MATRIX_data_velocity=round(100*MATRIX_data_velocity/max_velocity);
% MATRIX_data_velocity(MATRIX_data_velocity==0)=1;

MATRIX_data_Vx(MATRIX_data_Vx>max_Vx)=max_Vx;
% MATRIX_data_Vx=round(100*MATRIX_data_Vx/max_Vx);
% MATRIX_data_Vx(MATRIX_data_Vx==0)=1;

MATRIX_data_Vy(MATRIX_data_Vy>max_Vy)=max_Vy;
% MATRIX_data_Vy=round(100*MATRIX_data_Vy/max_Vy);
% MATRIX_data_Vy(MATRIX_data_Vy==0)=1;





h=timebar_BACWrapper('creating orientation data....');
for ii=2:size(MATRIX,1)  %on the base of frame
    
    
    %     timebar_BACWrapper(h,ii/size(MATRIX,1))
    Ind= data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Velocity_vec=MATRIX_data_velocity(ii,Ind);Velocity_vec=Velocity_vec';
    Nan_ind= isnan(Velocity_vec);     Velocity_vec(Nan_ind)=nanmean(Velocity_vec);
    
    
    
    str=[CD '\File\Houdini\velocity_vec_' num2str(ii) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'Velocity_vec', '-ASCII')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    direction_vec=MATRIX_data_direction(ii,Ind);direction_vec=direction_vec';
    
    
    
    nan_def=nanmean(Velocity_vec);
    Velocity_vec(isnan(Velocity_vec))=nan_def;
    Velocity_vec=Velocity_vec./max(max(Velocity_vec));
    
    matrixColormap = phasecolor_BACWrapper(direction_vec , Velocity_vec/1.02 )  ;
    direction_matrix=round(matrixColormap*10)/10;
    
    Nan_ind= isnan(direction_vec);    direction_vec(Nan_ind)=nanmean(direction_vec);
    
    Nan_ind= isnan(direction_matrix);    direction_matrix(Nan_ind)=0;
    
    
    
    
    
    str=[CD '\File\Houdini\direction_vec_' num2str(ii) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'direction_vec', '-ASCII')
    
    
    str=[CD '\File\Houdini\direction_matrix_' num2str(ii) '.chan'] ;
     str=regexprep(str, '\', filesep) ;
    save(str, 'direction_matrix', '-ASCII')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    Vx_vec=MATRIX_data_Vx(ii,Ind); Vx_vec= Vx_vec';
    Vy_vec=MATRIX_data_Vy(ii,Ind); Vy_vec= Vy_vec';
    
    Vxy=[];
    Vxy(:,1)=Vx_vec; Vxy(:,2)=Vy_vec;
    
    
    str=[CD '\File\Houdini\Vxy_' num2str(ii) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'Vxy', '-ASCII')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    str=['[CD '\File\Houdini\cell_id_' num2str(ii) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'Ind', '-ASCII')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy= data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,1:2);
    str=[CD '\File\Houdini\Cxy_data_' num2str(ii) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'Cxy', '-ASCII')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     PixelList=data_file(4).cdata.L(track_what).cdata.PixelList(ii);
    %
    %     PixelList_matrix=[]; border_index_vector=[];
    %     for iii=1: size(PixelList,2)
    %         temp_PixelList=PixelList(iii).cdata;
    %        if iii==1
    %            PixelList_matrix=temp_PixelList;
    %            border_index_vector=ones(size( temp_PixelList,1),1);
    %        else%ext=nd
    %            PixelList_matrix(end+1:end+size(temp_PixelList,1),:)=temp_PixelList;
    %            border_index_vector(end+1:end+size(temp_PixelList,1),:)=iii;
    %        end
    %        figure(1)
    %        imagesc(border_index_vector)
    %        pause
    %     end
    %
    %     border_index_vector=data_file(4).cdata.L(track_what).cdata.border_index_vector(ii).cdata ;
    %     str=['c:\3_7\border_index_vector_' num2str(ii) '.chan'] ;
    %     save(str, 'border_index_vector', '-ASCII')
    %
    %
    %      ConvexHull_matrix=data_file(4).cdata.L(track_what).cdata.ConvexHull(ii).cdata;
    %     str=['c:\3_7\ConvexHull_matrix_' num2str(ii) '.chan'] ;
    %     save(str, 'ConvexHull_matrix', '-ASCII')
    %
    
end
close(h)







% ---------------------------------------------------
function Untitled_160_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_160 (see GCBO)


track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc

Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid;

h=timebar_BACWrapper('create orientation matrix data....');

for ii=1:N  %on the base of frame
    timebar_BACWrapper(h,ii/M)
    Orientation=handles.data_file(4).cdata.L(track_what).cdata.Orientation(ii).cdata;
    Ind= Centy(ii).cdata(:,6)  ;
    temp_vec= find(MATRIX(ii,:)>0); temp_vec(1:2:length( temp_vec))=[];temp_vec=temp_vec/2;
    
    Orientation_MATRIX=[];
    
    
    for jj=1:length(temp_vec)
        JJ=temp_vec(jj);
        Ind2= ismember(Ind,JJ);
        Orientation_MATRIX(:,JJ)=Orientation(Ind2);
    end
    
    
    
    
    
    
    
end
close(h)


% ---------------------------------------------------
function Untitled_165_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_165 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N_frames
for n=1:N_frames
    eval(char(['global  matrixColormap_' num2str(n)]))
    matrixColormap=eval(char(['matrixColormap_' num2str(n)])) ;
    matrixColormap=round(matrixColormap*10)/10;
    Nan_ind= isnan(matrixColormap);    matrixColormap(Nan_ind)=0;
    str=['c:\matrixColormap\matrixColormap_' num2str(n) '.chan'] ;
    str=regexprep(str, '\', filesep) ;
    save(str, 'matrixColormap', '-ASCII')
end
% ---------------------------------------------------
% ---------------------------------------------------
function File_Renamer_Callback(hObject, eventdata, handles)
File_Renamer
% ---------------------------------------------------


function Export_Callback(hObject, eventdata, handles)
clc
Close


track_what=1
for n=1:1000
     vecL=[];
    
      L1 = handles
      L2 = handles.data_file(4)
      L3 = L2.cdata.L(track_what)
      L3.cdata
     
%     L4 = L3.cdata.X1(n)
%     L5 = L4.cdata
     
      X1 =  handles.data_file(4).cdata.L(track_what).cdata.X1(n).cdata ;
      Y1 =  handles.data_file(4).cdata.L(track_what).cdata.Y1(n).cdata ;
      
      
      
      eval(char(strcat('global  Orientation_matrixColormap_',num2str(n))))
      eval(char(strcat('Orientation_matrixColormap=Orientation_matrixColormap_',num2str(n),';')));

 
     for kk = 1:length(X1) 
         
         Vercat_cell_mesh = handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;
         
         z = vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)], [Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) ; 
         
         p1 = [Vercat_cell_mesh(:,1) + X1(kk) - 1 Vercat_cell_mesh(:,2) + Y1(kk) - 1];
         
         p2 = [Vercat_cell_mesh(:,3) + X1(kk) - 1 Vercat_cell_mesh(:,4) + Y1(kk) - 1];
         
         R = sqrt((Vercat_cell_mesh(:,3) - Vercat_cell_mesh(:,1)).^2 + (Vercat_cell_mesh(:,4) - Vercat_cell_mesh(:,2)).^2); 
         
         [xx,yy,zz] = evolve_cell_segments(p1,p2,R) ;
         
         CC = Orientation_matrixColormap(kk,:);
         
         if kk==1
             
             ptCloud = [xx(:) yy(:) zz(:) + 4];
             
              C = repmat(CC,length(xx(:)), 1);
              
              vecL = ones(length(xx(:)), 1);
              
         else
             ptCloud2 = [xx(:) yy(:) zz(:) + 4];
             
             ptCloud = vertcat(ptCloud,ptCloud2);
             
             C2 = repmat(CC,length(xx(:)),1);
             
             C = vertcat(C,C2);
             
             vecL2 = ones(length(xx(:)), 1);
             
             vecL = vertcat(vecL,n*vecL2);
         end 
     end
    
      
   C=uint8(255*C);   
   ptCloud  =  pointCloud(ptCloud,'Color',C); 
 
%       figure(1)
%      pcshow(ptCloud )
% pause

 
if n<10
  str=char(strcat('Cells_000',num2str(n),'.ply'))
  str2=char(strcat('Cell_Label_000',num2str(n),'.chan'))
  
elseif n>9 && n<100
     
      str=char(strcat('Cells_00',num2str(n),'.ply'))
      str2=char(strcat('Cell_Label_00',num2str(n),'.chan'))
elseif  n>99 && n<1000
      str=char(strcat('Cells_0',num2str(n),'.ply'))
      str2=char(strcat('Cell_Label_0',num2str(n),'.chan'))
else
      str=char(strcat('Cells_',num2str(n),'.ply'))
      str2=char(strcat('Cell_Label_',num2str(n),'.chan'))
end
     
 
    pcwrite(ptCloud,str,'PLYFormat','binary'); 
    save(str2, 'vecL', '-ASCII')
end



 
clc
Close


track_what=1
for n=1:1000

    
%      X1=  handles.data_file(4).cdata.L(track_what).cdata.X1(n).cdata ;
%      Y1=  handles.data_file(4).cdata.L(track_what).cdata.Y1(n).cdata ;
%      
%     global  Orientation_matrixColormap_1
%      for kk=1:length(X1) 
%          Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;
%          z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) ; 
%          p1=[Vercat_cell_mesh(:,1)+X1(kk)-1 Vercat_cell_mesh(:,2)+Y1(kk)-1];
%          p2=[Vercat_cell_mesh(:,3)+X1(kk)-1 Vercat_cell_mesh(:,4)+Y1(kk)-1]; 
%          R=sqrt((Vercat_cell_mesh(:,3)-Vercat_cell_mesh(:,1)).^2+(Vercat_cell_mesh(:,4)-Vercat_cell_mesh(:,2)).^2); 
%          [xx,yy,zz] = evolve_cell_segments(p1,p2,R) ;
%          CC=Orientation_matrixColormap_1(kk,:);
%          
%          if kk==1
%              ptCloud=[xx(:) yy(:) zz(:)+4];
%               C=repmat(CC,length(xx(:)),1);
%          else
%              ptCloud2=[xx(:) yy(:) zz(:)+4];
%              ptCloud=   vertcat(ptCloud,ptCloud2);
%              C2=repmat(CC,length(xx(:)),1);
%              C=vertcat(C,C2);
%          end 
%      end
%     
%      
%      
%      
%      
%      
% %      
%   C=uint8(255*C);   
%  ptCloud  =  pointCloud(ptCloud,'Color',C); 
%      figure(1)
%      pcshow(ptCloud )
%            
% % % % % % % % % % 

    
    
    eval(char(strcat('global  matrixX_',num2str(n))))
    eval(char(strcat('matrixX=matrixX_',num2str(n),';')));
    
    eval(char(strcat('global  matrixY_',num2str(n))))
      eval(char(strcat('matrixY=matrixY_',num2str(n),';')));
    
%     eval(char(strcat('global  matrixColormap_',num2str(n))))
%     eval(char(strcat(' matrixColormap_',num2str(n),'=matrixColormap;')));
%     
 
CCC=jet(size(matrixX,1))
for  jj=1:size(matrixX,1)  
      CC=CCC(jj,:);
         
    
    
    
    
  if jj==1
             
ptCloud3=[matrixY(jj,:)' matrixX(jj,:)' jj*ones(size(matrixX,2),1)+4];
              C3=repmat(CC,size(matrixX,2),1);
         else
           
ptCloud4=[matrixY(jj,:)' matrixX(jj,:)' jj*ones(size(matrixX,2),1)+4];
             ptCloud3=   vertcat(ptCloud3,ptCloud4);
             C4=repmat(CC, size(matrixX,2),1);
             C3=vertcat(C3,C4);
         end 
end
 
C3=uint8(255*C3);  
ptCloud3  =  pointCloud(ptCloud3,'Color',C3);  
 
if n<10
  str=char(strcat('Trajectories_000',num2str(n),'.ply'))
elseif n>9 && n<100
     
      str=char(strcat('Trajectories_00',num2str(n),'.ply'))
elseif  n>99 && n<1000
      str=char(strcat('Trajectories_0',num2str(n),'.ply'))
else
      str=char(strcat('Trajectories_',num2str(n),'.ply'))
end
     
 
    pcwrite(ptCloud3,str,'PLYFormat','binary');
 
    
end
    
    
function Export_cropped_cells_Callback(~, ~, handles)
% ---------------------------------------------------
function Export_classifier_Callback(hObject, eventdata, handles)

track_what=get(handles.track_what1,'value');
% h=timebar_BACWrapper('Processing second segmentation. Please wait....');set(h,'color','w');
box_Raw=get(handles.Raw_listbox,'string') ;
n=  get(handles.Raw_listbox,'value') ;
filename=box_Raw(n) ;
Projected_by=get(handles.Projected_by,'String');
full_filename = char(strcat(handles.data_file(2).cdata{track_what,1},filename,'_ch0',num2str(track_what-1),'.tif')) ;
temp=imread_cross(full_filename);

%   full_filename = char(strcat(handles.data_file(2).cdata{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'));
%   temp_Segmentation = flipdim(imread(full_filename,'tif',1),1);


centy2 = handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata;   % . Find the mark in centroids


for jj=1: size(handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata,1)
    XY=   handles.data_file(4).cdata.L(track_what).cdata(n).cdata(jj).Centroid;
    clear dvec
    dvec(:,1)=  centy2(:,1)-  XY(1);
    dvec(:,2)=  centy2(:,2)-  XY(2);
    Ind= find(ismember(sum(abs(dvec),2),0)) ;
    Minorss1=str2num(num2str(centy2(Ind,3)- n))==0.1; %#ok<*ST2NM>
    Minorss2=str2num(num2str(centy2(Ind,3)- n))==0.2;
    
    if Minorss1==1
        species{jj}='double';
    elseif Minorss2==1
        species{jj}='single';
    else
        species{jj}='bulb' ;
    end
    
    temp_Segmentation=zeros(size(temp));
    PixelList=  double(handles.data_file(4).cdata.L(track_what).cdata(n).cdata(jj).PixelList);
    Ind=sub2ind(size(temp), PixelList(:,2), PixelList(:,1));
    temp_Segmentation(Ind)=1;
    XY=  double(handles.data_file(4).cdata.L(track_what).cdata(n).cdata(jj).BoundingBox);
    STAT=0;
    
    if (XY(1) + XY(3)) > handles.X
        XY(1) = floor(XY(1));
    end
    
    if (XY(2)+XY(4))>handles.Y
        XY(2)=floor(XY(2));
    end
    
    X1 = round(XY(2));
    
    Y1 = round(XY(1));
    
    X2 = round(XY(2)+XY(4));
    
    Y2 = round(XY(1)+XY(3));
    
    matrix_intensity=double(temp(X1:X2,Y1:Y2));
    matrix_bw=double(temp_Segmentation(X1:X2,Y1:Y2));
    matrix_bw2=matrix_bw;
    matrix_bw2(  matrix_bw2==0)=nan;
    matrix_intensity=matrix_intensity.*matrix_bw2;
    [B,L]=bwboundaries(matrix_bw,'noholes');
    stats=regionprops(L,'Eccentricity', 'EquivDiameter','MajorAxisLength','MinorAxisLength','Area','Orientation');
    boundary = B{1};
    % compute a simple estimate of the object's perimeter
    delta_sq = diff(boundary).^2;
    obj_area=stats(1).Area;
    obj_perimeter = sum(sqrt(sum(delta_sq,2)));
    obj_circularity=4*pi*obj_area/obj_perimeter^2;
    M(jj,1)= stats(1).Eccentricity;
    M(jj,2)=stats(1).EquivDiameter;
    M(jj,3)=stats(1).MajorAxisLength;
    M(jj,4)= stats(1).MinorAxisLength;
    M(jj,5)= stats(1).MinorAxisLength/stats(1).MajorAxisLength;
    M(jj,6)= stats(1).Area;
    
    if   stats(1).Orientation<0
        stats(1).Orientation=stats(1).Orientation+180  ;
    end
    
    matrix_bw2= imrotate( matrix_bw,-stats(1).Orientation)  ;
    peak_1=sum(matrix_bw2);   peak_2=sum(matrix_bw'); %#ok<*UDIM>
    
    
    peak_1=  smooth(peak_1,20)     ;
    peak_2=  smooth(peak_2,20)     ;
    
    peak_1(isnan( peak_1))=0;   peak_2(isnan( peak_2))=0;
    
    IND1=findpeaks_BACWrapper(peak_1) ;    npeaks_1 =peak_1(IND1) ;
    IND2=findpeaks_BACWrapper(peak_2) ;    npeaks_2 =peak_2(IND2) ;
    IND11=findpeaks_BACWrapper(-peak_1) ;    npeaks_11 =max(peak_1(IND11)) ;
    IND22=findpeaks_BACWrapper(-peak_2) ;    npeaks_22 =max(peak_2(IND22));
    z1=abs((npeaks_11-mean(npeaks_1))./(npeaks_11+mean(npeaks_1))) ;
    z2=abs((npeaks_22-mean(npeaks_2))./(npeaks_22+mean(npeaks_2))) ;
    
    M(jj,7)=length(npeaks_1) ;
    M(jj,8)=length(npeaks_2) ;
    M(jj,9)=z1;
    M(jj,10)=z2;
    
    matrix_intensity2=     imrotate( matrix_intensity,-stats(1).Orientation) ;
    peak_1=nansum(matrix_intensity2);
    
    
    peak_1=  smooth(peak_1,10)     ;
    
    peak_1(isnan( peak_1))=0;
    IND1=findpeaks_BACWrapper(peak_1) ;    npeaks_1 =peak_1(IND1) ;
    IND11=findpeaks_BACWrapper(-peak_1) ;    npeaks_11 =max(peak_1(IND11)) ;
    z1=abs((npeaks_11-mean(npeaks_1))./(npeaks_11+mean(npeaks_1))) ;
    M(jj,11)=length(npeaks_1) ;
    M(jj,12)=z1;
end

save M M
save species species
% ---------------------------------------------------
function Spreadsheet_of_trajectories_Callback(hObject, eventdata, handles)

track_what=get(handles.track_what2,'Value')  ;
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
save MATRIX MATRIX
if isempty(MATRIX)==1
    h = errordlg('You have to track the cell first!!','Error');
    sound(Y,22000);
    return
end
ABC=['A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z'];
if size(MATRIX,2)>26
    lastcell=strcat(ABC(floor(size(MATRIX,2)/26)),ABC(round(26*(size(MATRIX,2)/26-floor(size(MATRIX,2)/26)))));
else
    lastcell= ABC(size(MATRIX,2)) ;
end
lastcell=strcat(lastcell,num2str(size(MATRIX,1)))  ;
Excel = actxserver('Excel.Application');
set(Excel, 'Visible', 1);
Workbooks = Excel.Workbooks;
Workbook = invoke(Workbooks, 'Add');
Activesheet = Excel.Activesheet;
ActivesheetRange = get(Activesheet,'Range','A1',lastcell);
set(ActivesheetRange, 'Value',MATRIX);
ActivesheetRange.Font.Bold = 'True';
ActivesheetRange.Font.Size = 10;
ActivesheetRange.ColumnWidth = 11;
ActivesheetRange.Borders.LineStyle = 1;
ActivesheetRange.Borders.Weight = 2;
% ---------------------------------------------------
function Export_data_matrix_Callback(hObject, eventdata, handles)
% This function takes the matrix of trajectories and for each frame it takes the label data (which is input by the user as string, i.e. Area, Perimeter, etc)
% it takes the index of each labeled cells, which is column 6 in Centy, and then it search for each tracked cell its coresponding labeled parameter,
% thus it returns a parametric matrix (for the labled cells) that is coresponding to the matrix of trajectories
% Finally, it create  new matrix that is a global and therefore the user
% can use or save it from the command window
%The function was validated by R.S. 9.10.15

% CZ - it does not work for data containing two or more elements (ie: X, Y
% coords of centroids or extremities, I will modify to fix that and also
% export a tab delimited text file automatically instead of requiring use of
% the command line (29 07 16)
param_str = inputdlg('Please imput parameter to be exported');

param_str = char(param_str);

DATA_MATRIX=[];

track_what = get(handles.track_what2,'Value') ;

Data = get(handles.show_tracks,'userdata' );

vec_temp2 = Data.vec_temp2;% a list of indices

vec_temp1 = Data.vec_temp1;% a column vector with the follwing form: 
% [x1t1,x1t2,x1t3...x1tN, y1t1...y1tN, x2t1...x2tN, y2t1...y2tN]

N = Data.N  ; % the number of frames

M = Data.M ; % the total number of tracked cells

vec_temp3(vec_temp2) = vec_temp1;

vec_temp3(end + 1 :  M*N) = 0;

MATRIX = reshape(vec_temp3', N, M);% a matrix with the following structure:
% [x1t1, y1t1 ..., xMt1, yMt1
%  x1t2, y1t2 ..., xMt2, yMt2
%  .
%  .
%  .
%  x1tN, y1tN ..., xMtN, yMtN]

Centy = handles.data_file(4).cdata.L(track_what).cdata.Centroid;
% the centroid field for each frame contains cell ID linker data 
% in columns 3 - 6 in the follwing form: 
% [current frame, index_in_previous_frame, previous_frame, index_in_current_frame]

h = timebar_BACWrapper(['create ' param_str ' matrix data....']);


root = handles.data_file(2).cdata(1,1);

root = [root{1}, param_str];
if ~isdir(root)
    mkdir(root)
end


if ( strcmp(param_str, 'Centroid') || strcmp(param_str, 'minor_axis_p1') || ...
        strcmp(param_str, 'minor_axis_p1') || strcmp(param_str, 'minor_axis_p2') || ...
        strcmp(param_str, 'major_axis_p1') || strcmp(param_str, 'major_axis_p2') )
    
    i_params = 2;
    
    params = {'X', 'Y'};
    


    else if ( strcmp(param_str, 'BoundingBox') )
    
    i_params = 4;
    
    params = {'upper_left_X', 'upper_left_Y', 'width_X', 'width_Y'};

        else
            
        i_params = 1;
        
        params = {param_str};
        
        end

end
    

for p = 1:i_params
    
filename = [root '/' params{p} '.txt'];

DATA_MATRIX = nan(size(MATRIX,1), size(MATRIX,2)/2);

    for ii = 1:N  %on the base of frame

        timebar_BACWrapper(h,ii/M)

        eval(['DATA_VEC=handles.data_file(4).cdata.L(' num2str(track_what) ').cdata.'  param_str '(' num2str(ii) ').cdata;'])

        Ind = Centy(ii).cdata(:,6)  ;

        temp_vec = find(MATRIX(ii,:) > 0); temp_vec(1:2:length( temp_vec))=[];temp_vec=temp_vec/2;

        for jj = 1:length(temp_vec)

            JJ = temp_vec(jj);

            Ind2 = find(ismember(Ind,JJ));

            DATA_MATRIX(ii,JJ) = DATA_VEC(Ind2, p);
        end
    end



    dlmwrite(filename, DATA_MATRIX')
    
end
param_list_filename = [root '/parameter_list_key.txt'];

fileID = fopen(param_list_filename, 'w');
    for p = 1:i_params
        fprintf(fileID, '%s \t', params{p});
    end
fclose(fileID);

close(h)

eval(['global ' param_str '_MATRIX;']);

eval([param_str '_MATRIX=DATA_MATRIX;']);

% ---------------------------------------------------
function MAIN_EDIT_Callback(hObject, eventdata, handles)
function Edit_Callback(hObject, eventdata, handles)
global h_Tracking_settings_GUI
try
    handles.edit_relabel_range=str2num(char(get(h_Tracking_settings_GUI.edit_relabel_range,'string') )   );
    handles.max_distance=str2num(char(get(h_Tracking_settings_GUI.max_distance,'string') )  );
    handles.track_every=str2num(char(get(h_Tracking_settings_GUI.track_every,'string') )  );
    
    guidata(hObject,handles);
    close(Tracking_settings_GUI)
    %global h_BacFormatics
    %h_BacFormatics=handles;
catch
    hh=Tracking_settings_GUI;
    drawnow
    jframe = getjframe_BACWrapper(hh) ;
    on_top=get(handles.on_top,'value');set(jframe,'AlwaysOnTop',on_top)
end
% ---------------------------------------------------
function Untitled_215_Callback(hObject, eventdata, handles)
function Untitled_216_Callback(hObject, eventdata, handles)
function Untitled_217_Callback(hObject, eventdata, handles)
function Untitled_218_Callback(hObject, eventdata, handles)
function Untitled_219_Callback(hObject, eventdata, handles)
function Fill_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
if islogical(matrix)
    matrix =imfill(matrix,'holes');
else
    msgbox('image has to be binary')
end
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')

function Invert_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
matrix2=matrix;matrix2(1)=65535;
if max(matrix2(:))==1
    matrix = ~matrix;
elseif max(matrix2(:))==255
    matrix=double(matrix) ;
    matrix=255*( matrix./(max(max( matrix))));
    matrix=uint8( matrix);
    matrix=255- matrix;
elseif max(matrix2(:))==65535
    matrix=double(matrix) ;
    matrix=65535*( matrix./(max(max( matrix))));
    matrix=uint16( matrix);
    matrix=65535- matrix;
end
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Selection_Callback(hObject, eventdata, handles)
function Contrast_Callback(hObject, eventdata, handles)
axes(handles.axes1)
imtool(gca)
function measure_tool_Callback(hObject, eventdata, handles)
axes(handles.axes1)
% start_row = 1478;
% end_row = 2246;
% answer = inputdlg('Please input pixel size (in um)');
% answer=str2num(char(answer))
% um_per_pixel = answer;
% rows = [start_row um_per_pixel end_row];
% start_col = 349;
% end_col = 1117;
% cols = [start_col um_per_pixel end_col];

Xlim=get(handles.axes1,'xlim');
Ylim=get(handles.axes1,'ylim');

distx=(Xlim(2)-Xlim(1))/10;
disty=(Ylim(2)-Ylim(1))/10;
meanx=mean(Xlim);
meany=mean(Ylim);

hline = imdistline(gca,[meanx meanx+distx],[meany  meany+disty]);
api = iptgetapi(hline);
api.setLabelTextFormatter('%02.0f pixels');
api = iptgetapi(hline);
wait(hline)  ;
api.delete()

function impixelregion_tool_Callback(hObject, eventdata, handles)
axes(handles.axes1)
impixelregion(gca)
% ---------------------------------------------------
function Untitled_226_Callback(hObject, eventdata, handles)
function Untitled_227_Callback(hObject, eventdata, handles)

function Options_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
function Colorebar_Callback(hObject, eventdata, handles)
if    handles.flags.Colorbar==0
    handles.flags.Colorbar=1;
    axes(handles.axes1)
    colorbar
else
    handles.flags.Colorbar=0;
    axes(handles.axes1)
    colorbar('off')
end
guidata(hObject, handles);

% ---------------------------------------------------
function Toolbar_Callback(hObject, eventdata, handles)

if   handles.flags.Toolbar==0
    handles.flags.Toolbar=1;
    set(handles.figure1,'Toolbar','figure' )
else
    handles.flags.Toolbar=0;
    set(handles.figure1,'Toolbar','none')
end
guidata(hObject, handles);
function Untitled_228_Callback(hObject, eventdata, handles)
function Untitled_229_Callback(hObject, eventdata, handles)
function Untitled_230_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
function Image_Callback(hObject, eventdata, handles)
function Type_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
matrix2=matrix;matrix2(1)=65535;
if max(matrix2(:))==1
    msgbox('Binary image')
elseif max(matrix2(:))==255
    msgbox('8-bit image')
elseif max(matrix2(:))==65535
    msgbox('16-bit image')
end
function Imgae_Adjust_Callback(hObject, eventdata, handles)
function Imcontrast_Callback(hObject, eventdata, handles)
axes(handles.axes1)
imcontrast(gca)
function Color_Balance_Callback(hObject, eventdata, handles)
if handles.flags.Color_Balance==0
    set(handles.rgb_panel,'Visible','on');
    handles.flags.Color_Balance=1;
else
    set(handles.Filtered_panel,'Visible','on');
    handles.flags.rgb_panel=0;
end
guidata(hObject, handles);
function Threshold_Callback(hObject, eventdata, handles)
function Auto_Threshold_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
level =  matrix(I);
matrix= im2bw(matrix,level);
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
function Untitled_233_Callback(hObject, eventdata, handles)
function Infotool_Callback(hObject, eventdata, handles)
imageinfo

function Coloreditor_Callback(hObject, eventdata, handles)
colormapeditor
handles.c=  get(gcf,'colormap');
guidata(hObject,handles)
function Crop_Callback(hObject, eventdata, handles)
 n=get(handles.Raw_listbox,'value')   ;
show_frame(handles,n,'figure')
 global h_figure val 
 set(get(get(h_figure,'Children'),'title'),'String','Select ROI with the mouse, control the box size with arrows-','Color','blue','fontsize',13 ,'fontname' ,'it ' ) ;
 
 
%  set(gcf,'Color','w');   
% set(gcf,'Toolbar','none'); 
 
 
 
%   val=[handles.data_file(6).cdata(3)/size(temp,2) handles.data_file(6).cdata(4)/size(temp,1)];
 
val=[1 1];
magnify_BACWrapper(figure(h_figure),'m');
h=figure(gcf); 
uiwait(h);  
function Duplicate_Callback(hObject, eventdata, handles)
icon_9_Callback(hObject, eventdata, handles)
function Rename_Callback(hObject, eventdata, handles)
function Scale_Callback(hObject, eventdata, handles)
function Transform_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
 
 
matrix2=matrix;matrix2(1)=65535;
if max(matrix2(:))~=1
    msgbox('Image is not a Binary') 
    return
end
matrix=bwdist(matrix) ;
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')


function Zoom_Callback(hObject, eventdata, handles)
set(handles.slide_zoom_option,'value',1) 
 set(handles.slide_zoom_option,'string','zoom')
    set(handles.slide_zoom_option,'ForeGroundColor',[1 1 0])
function Overlay_Callback(hObject, eventdata, handles)
function run_Change_LUT_Callback(hObject, eventdata, handles)
handles.c=change_LUT ;
guidata(hObject,handles);
set(gcf,'colormap',handles.c);
function Anotate_Callback(hObject, eventdata, handles)
 
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  
 bw=read_image2(n,3,track_what); 
bw2=imfill(bw,'holes');
bw2(bw==1)=0;
if ~sum(bw2(:))
     msgbox('There are no holes')
    return
end 
 
 


prompt = {'Enter minimum hole area :','Enter maximum hole area:' };
dlg_title = 'Input';
num_lines = 1;
def = {num2str(0),num2str(20) };
answer = inputdlg(prompt,dlg_title,num_lines,def);  
 
min_hole_area =str2num(char(answer(1)));
max_hole_area  =str2num(char(answer(2))); 

L=bwlabel(bw2); 
stats = regionprops(L,'Area');                  
idx = find([stats.Area] > min_hole_area  &  [stats.Area] < max_hole_area  );                  
matrix = ismember(L,idx); 
 
if max(matrix(:))==0
    msbox('There are holes within the selected area range')
else
[Y,X]=find(matrix ==1);
line( X,Y ,'LineStyle','none','Marker','*'  ,'Color',handles.Colors_Line1, 'MarkerSize',6)%Hitt  ;
end   
      
      
function Draw2_Callback(hObject, eventdata, handles)
mode_8_Callback(hObject, eventdata, handles)
function Untitled_250_Callback(hObject, eventdata, handles)
function Untitled_141_Callback(hObject, eventdata, handles)
 global Axes
  AR=[1 1 1]
         eval(strcat('set(handles.axes', num2str(Axes),',','''','DataAspectRatio','''',',','[',num2str(AR),'])')) ;
      
axes(handles.axes1) 
zoom off 
cla
max_x=handles.data_file(6).cdata(3)  
max_y=handles.data_file(6).cdata(4)  
imagesc(zeros(max_y,max_x))
pos=get(handles.axes1,'position' ) 
axes_ratio=pos(4)/pos(3);
if    max_y<max_x
    pixel_ratio=max_x/max_y;
    ylim([1 max_y])
    xlim([1   max_y*axes_ratio*pixel_ratio])
end

n=round(get(handles.Raw_listbox,'Value')) ; 
 
show_frame(handles,n,'axes' )
 

function Untitled_251_Callback(hObject, eventdata, handles)
function Untitled_252_Callback(hObject, eventdata, handles)
function Untitled_253_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
function Process_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
function Smooth_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
matrix=medfilt2(matrix) ;
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Sharpen_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
matrix=imsharpen(matrix) ;
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Find_edges_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
matrix=edge(matrix,'log' );
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Find_Maxima_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
matrix=imregionalmax(matrix);
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Denoise_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
inputval = inputdlg('Please input denoising coefficient','Input',1,{'83'});
inputval=str2num(char(inputval));
a=floor(inputval/10);
b=round(5*(inputval/10-floor(inputval/10)));
matrix =  noisecomp_BACWrapper(matrix ,a,b);
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Binary_Callback(hObject, eventdata, handles)
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1
    matrix = read_image2( n,segmentation_type);
end
inputval = inputdlg('Please input threshold cut-off','Input',1,{'0.5'});
inputval=str2num(char(inputval));
matrix =  im2bw(matrix ,inputval);
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')
% ---------------------------------------------------
function Untitled_281_Callback(hObject, eventdata, handles)
function Untitled_283_Callback(hObject, eventdata, handles)
function Untitled_282_Callback(hObject, eventdata, handles)
function Untitled_138_Callback(hObject, eventdata, handles)

% ---------------------------------------------------
function Segmentation_module_Callback(~, ~, handles)
n=get(handles.Raw_listbox,'Value') ;
switch get(handles.imread_mode,'value')
    case 1 
        if isempty(handles.data_file)~=1
            run_BAC('BAC_Segmentation_Module',handles.data_file ,n) ;
        else
            run_BAC('BAC_Segmentation_Module') ;
        end 
    case 2  
        str=char(handles.data_file(1).cdata(n)); 
        ind1=findstr(str,filesep);
        ind1=ind1(end);
        pathname_raw=str(1:ind1); Filename =str(ind1+1:end); 
        full_filename=char(strcat(pathname_raw,'BacFormatics_EXP_New.dat')); 
        data_file=importdata(full_filename);
        str2=  data_file(1).cdata ;
        n=find(strcmp(str2,Filename));
        
        %         filename_raw=char(strcat(Filename ,'_ch00.tif'));
        %         pathname_Segmented=char(strcat(pathname_raw,'ch00_Segmented\'));
        %         filename_Segmented=char(strcat(Filename ,'_ch00_Segmented.tif'));
        %         full_filename_Segmentation=char(strcat(pathname_Segmented,filename_Segmented)); 
        run_BAC('BAC_Segmentation_Module', data_file ,n) ;
end

function Untitled_140_Callback(hObject, eventdata, handles)
BAC_Robust_Module
function Untitled_143_Callback(hObject, eventdata, handles)

% ---------------------------------------------------
function Untitled_146_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
box_Raw=handles.data_file(1).cdata;
track_what=1;
N=size(box_Raw,1);
Area_vec=zeros(1,N);counts_vec=zeros(1,N);
global Ch00_stack_Segmented


h=waitbar(0,'searching out-of-focus images...');

for n=1:N
    waitbar(n/N )
    try
        eval(strcat('matrix= Ch00_stack_Segmented(',num2str(n),').cdata;'))
    catch
        full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
        matrix =  imread_cross(full_filename)   ;
    end
    Area_vec(n)=sum(matrix(:));
    
    
    %             figure(1)
    %             imagesc(matrix)
    
end




Area_vec2=nanmoving_average_BACWrapper(Area_vec  ,2);
Area_vec2=abs(Area_vec-Area_vec2);
[~,out_of_focus_vec]=findpeaks_BACWrapper(Area_vec2,'Npeaks',15);
% there are intensity flactuations and out of the focus. Because we usually new_image over-sampling, the coverage coefficient determinate the percentage of best frames to use.


box_Raw(out_of_focus_vec)=[];


handles.data_file(1).cdata=box_Raw;
guidata(hObject,handles);

set(handles.Raw_listbox,'Value',1);

set(handles.Raw_listbox,'String', handles.data_file(1).cdata(:,1));set(handles.Raw_listbox,'Max',size(handles.data_file(1).cdata(:,1),1))

track_what=get(handles.track_what2,'Value') ;

handles.data_file(4).cdata.L(track_what).cdata=[];



handles.data_file(5).cdata.Tracks(track_what ).cdata =[];
handles.data_file(7).cdata(track_what,1) =cellstr('N'); %Now flag for track is No
handles.data_file(7).cdata(track_what,2) =cellstr('N'); %Now flag for track is No
handles.data_file(7).cdata(track_what,3) =cellstr('N'); %Now flag for track is No

update_icons(handles)






guidata(hObject,handles); update_labelmatrix(handles)

close(h)
Save_Experiment_Callback(hObject, eventdata, handles)
Open_Experiment_Callback(hObject, eventdata, handles)

% ---------------------------------------------------
function Untitled_147_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_147 (see GCBO)
box_Raw=handles.data_file(1).cdata;
track_what=1;
N=size(box_Raw,1);
Area_vec=zeros(1,N);counts_vec=zeros(1,N);
global Ch00_stack_Segmented


h=waitbar(0,'searching out-of-focus images...');

for n=1:N
    waitbar(n/N )
    try
        eval(strcat('matrix= Ch00_stack_Segmented(',num2str(n),').cdata;'))
    catch
        full_filename = [handles.data_file(2).cdata{track_what,3},handles.data_file(1).cdata{n},'_ch0',num2str(track_what-1),'_Segmented.tif'];
        matrix =  imread_cross(full_filename)   ;
    end
    
    L=bwlabel(matrix,4);
    counts_vec(n)=max(L(:));
    
    %             figure(1)
    %             imagesc(matrix)
    
end




counts_vec2=nanmoving_average_BACWrapper(counts_vec  ,2);
counts_vec2=abs(counts_vec-counts_vec2);
[~,out_of_focus_vec]=findpeaks_BACWrapper(counts_vec2,'Npeaks',15);
% there are intensity flactuations and out of the focus. Because we usually new_image over-sampling, the coverage coefficient determinate the percentage of best frames to use.


box_Raw(out_of_focus_vec)=[];


handles.data_file(1).cdata=box_Raw;
guidata(hObject,handles);

set(handles.Raw_listbox,'Value',1);

set(handles.Raw_listbox,'String', handles.data_file(1).cdata(:,1));set(handles.Raw_listbox,'Max',size(handles.data_file(1).cdata(:,1),1))

track_what=get(handles.track_what2,'Value') ;

handles.data_file(4).cdata.L(track_what).cdata=[];



handles.data_file(5).cdata.Tracks(track_what ).cdata =[];
handles.data_file(7).cdata(track_what,1) =cellstr('N'); %Now flag for track is No
handles.data_file(7).cdata(track_what,2) =cellstr('N'); %Now flag for track is No
handles.data_file(7).cdata(track_what,3) =cellstr('N'); %Now flag for track is No

update_icons(handles)






guidata(hObject,handles); update_labelmatrix(handles)

close(h)
Save_Experiment_Callback(hObject, eventdata, handles)
Open_Experiment_Callback(hObject, eventdata, handles)

% ---------------------------------------------------
function Untitled_152_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_152 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
box_Raw=handles.data_file(1).cdata;
n=get(handles.Raw_listbox,'Value') ;
box_Raw(n)=[];
handles.data_file(1).cdata=box_Raw;
guidata(hObject,handles);

set(handles.Raw_listbox,'Value',1);

set(handles.Raw_listbox,'String', handles.data_file(1).cdata(:,1));set(handles.Raw_listbox,'Max',size(handles.data_file(1).cdata(:,1),1))

track_what=get(handles.track_what2,'Value') ;

handles.data_file(4).cdata.L(track_what).cdata=[];



handles.data_file(5).cdata.Tracks(track_what ).cdata =[];
handles.data_file(7).cdata(track_what,1) =cellstr('N'); %Now flag for track is No
handles.data_file(7).cdata(track_what,2) =cellstr('N'); %Now flag for track is No
handles.data_file(7).cdata(track_what,3) =cellstr('N'); %Now flag for track is No

update_icons(handles)






guidata(hObject,handles); update_labelmatrix(handles)

msgbox('please label, associate, and track again')
%  Save_Experiment_Callback(hObject, eventdata, handles)
%  Open_Experiment_Callback(hObject, eventdata, handles)
function Label_Callback(~, ~, ~)

function Raw_listbox_CreateFcn(~, ~, ~)
 
function showcurrentframe_Callback(hObject, eventdata, handles)
n=get( hObject,'string');
n=round(str2double(n));
set( handles.Raw_listbox,'value',n)
box_Raw=get( handles.Raw_listbox,'string');
if n>0
    if n<size(box_Raw,1)
        Raw_listbox_Callback([], [], handles)
    end
end
function showcurrentframe_CreateFcn(~, ~, ~)

function Projected_by_CreateFcn(~, ~, ~)
function segmentation_type1_CreateFcn(~, ~, ~)
function track_what1_CreateFcn(~, ~, ~)
function Div_Cells_CreateFcn(~, ~, ~)
function Div_frame_index_CreateFcn(~, ~, ~)

function start_export_Callback(~, ~, ~)
function start_export_CreateFcn(~, ~, ~)
function end_export_Callback(~, ~, ~)
function end_export_CreateFcn(~, ~, ~)
function Daughter1_edit_Callback(~, ~, ~)
function Daughter2_edit_Callback(~, ~, ~)
function Daughter2_edit_CreateFcn(~, ~, ~)
function parental_num_CreateFcn(~, ~, ~)
function Daughter1_edit_CreateFcn(~, ~, ~)
function Current_Exp_CreateFcn(~, ~, ~)


function MODE_CreateFcn(~, ~, ~)

% ---------------------------------------------------
function Raw_listbox_Callback(~, eventdata, handles)
axes(handles.axes1)
set(handles.axes1,'userdata',[])
global paint_matrix

n=round(get(handles.Raw_listbox,'Value'));


Projected_by =get(handles.Projected_by,'String') ;

box_Raw=get(handles.Raw_listbox,'string') ;
track_what2=get(handles.track_what2,'Value') ;
shift_frame=str2num(get(handles.shift_frame,'string'));
if n==1
    shift_frame=0;
end
paint_matrix= read_image2(n-shift_frame ,3,Projected_by, char(box_Raw(n-shift_frame)),track_what2,track_what2);



try
      show_frame( handles,n,'axes')
end
set(handles.showcurrentframe,'String',num2str(n ));
set(handles.slider1,'value',n);
global N_frames
str=char([num2str(n) filesep num2str(N_frames)])
set(handles.mode_text,'Visible','on')
set(handles.mode_text,'String',str);
% ----------------------------------------------------------
function track_what1_Callback(hObject, ~, handles)
global track_what 
track_what =get(handles.track_what1,'Value');
str=handles.data_file(3).cdata(track_what,1);
% if str2double(str)<1
%     msgbox('verify that chanel exist or disable manually');
%     set(handles.track_what1,'Value',1);
%     return
% end
str
if char(str)=='1'
    handles.c=handles.c1 ;
elseif char(str)=='2'
    handles.c=handles.c2;
elseif char(str)=='3'
    
    handles.c=handles.c3;
elseif char(str)=='4'
    
    handles.c=handles.c4;
elseif char(str)=='5'
    
    handles.c=handles.c5;
elseif char(str)=='6'
    
    handles.c=handles.c6;
end
set(gcf,'colormap',handles.c);
guidata(hObject,handles)


Raw_listbox_Callback([], [], handles)


% ------------------------------------------------------
function Div_frame_index_Callback(hObject, eventdata, handles)
trackdivstr= get(handles.Div_frame_index,'String');
trackdivstr=cellstr(  trackdivstr);
trackdivval= get(handles.Div_frame_index,'Value' );
frame_index=  str2num(char(trackdivstr(trackdivval))); %#ok<ST2NM>
set(handles.Raw_listbox,'Value',frame_index)
Raw_listbox_Callback([], [], handles)
%   ---------------------------------------------------
function Div_Cells_Callback(hObject, eventdata, handles)
cell_index= get(hObject,'Value');
track_what=get(handles.track_what2,'Value');
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
V=MATRIX(:,cell_index*2-1)./MATRIX(:,cell_index*2-1);

get(handles.Cells_list_option,'value') ;
[~,index]=nanmin(V);
if get(handles.Cells_list_option,'value') == 2
    index=index+nansum(V)-1;
end
set(handles.Raw_listbox,'Value',index)
Raw_listbox_Callback([], [], handles)
%  ------------------------------------------------------
function virtual_mode_Callback(~, ~, ~) 

function move_poles_ButtonDown(src,evnt)
global this_patch    patch_clicked

 sel_typ = get(gcbf,'SelectionType');
   switch sel_typ 
      case 'normal'
          
         this_patch = src ;
        
        patch_clicked = ~patch_clicked ;
  
%           
   end
 
 
 
 


 
%-------------------------------------------------------------------------
function [last_cell]=get_last_cell_index(MATRIX)
for  last_cell=2:2: size(MATRIX,2)
    X=MATRIX(:,last_cell);
    X(X==0)=[];
    if isempty(X)==1
        break
    end
end
% ----------------------------
function [vector, jj]=create_vector(MATRIX,handles,start_frame)
%  [vector  jj]
% vector is the trajectories of cell number start_frame in the
% MATRIX (the table). jj is the first frame that this cell appears.
%takes the matrix from table and the first frame where the cell appears as an inputs
if start_frame>size(MATRIX,2)
    h = errordlg('Input has to be smaller than the number of cells tracked.','Error');
    return
end
vector=MATRIX(:,start_frame);
for ii=1:length(vector);
    if  vector(ii)>0
        break
    end
end
jj=ii;
n=length(vector);
index_zeros=find(ismember(vector,0));
vector=MATRIX(jj:jj+n-length(index_zeros)-1,start_frame:start_frame+1);
n=size(vector,1);
vector(:,end+1)=nan(n,1);
%now vectors is a matrix where width is = x , y , the L number is
%regionprops:
track_what=get(handles.track_what2,'Value');
% the   location is from the coresponding Centroids data
for ii=1:n
    centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii+jj-1).cdata;
    Centroids_frame=zeros(size(handles. data_file(4).cdata.L(track_what).cdata(ii+jj-1).cdata,1),2);
    sizeC=size(handles. data_file(4).cdata.L(track_what).cdata(ii+jj-1).cdata,1);
    for kk=1:sizeC
        Centroid_frame(kk,:)= handles. data_file(4).cdata.L(track_what).cdata(ii+jj-1).cdata(kk).Centroid;
    end
    for kk=1:sizeC
        if vector(ii,1:2)==Centroid_frame(kk,:)
            vector(ii,3)=kk;
            break
        end
    end
end






function Relabel_the_cells_Callback(hObject, eventdata, handles,full_filename)

box_Raw=get(handles.Raw_listbox,'string');
end_frame=size(box_Raw,1);
start_frame=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;


 
if nargin==3
  [str_parameter,start_frame,end_frame]=select_label_parameter(start_frame,end_frame);
  start_frame=str2num(start_frame);  end_frame=str2num(end_frame);
  
  
 handles.data_file(4).cdata.L(track_what).cdata = Find_L(handles,track_what,box_Raw,start_frame,end_frame,str_parameter ) ;
    
    handles.data_file(7).cdata(track_what,1) ={'Y'};
    handles.data_file(7).cdata(track_what,2) ={'N'};
    handles.data_file(7).cdata(track_what,3) ={'N'};
    update_icons(handles)
    
    guidata(hObject,handles);
    
    update_labelmatrix(handles)
   
    show_frame( handles, n, 'axes');
  
else
    start_frame=1; 
        str_parameter= strcat('''BoundingBox'',''Area'',''Centroid'',''Orientation'',''Eccentricity'',''Circularity'',''Perimeter'',''Majoraxislength'',''Minoraxislength''');
   data_file=handles.data_file;
    data_file(4).cdata.L(track_what).cdata= Find_L(handles,track_what,box_Raw,start_frame,end_frame,str_parameter ) ;
    data_file(7).cdata(track_what,1) ={'Y'};
    save (full_filename ,  'data_file')
 
end




function Untitled_20_Callback(hObject, ~, handles)
% %global h_BacFormatics;
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
if  isempty(MATRIX)==1
    return
end
n=get(handles.Raw_listbox,'Value') ;
prompt = {'Please input cell to be eliminated:'};
dlg_title = 'Delete Cell';
num_lines = 1;
def = {' ' };
answer = inputdlg(prompt,dlg_title,num_lines,def);
answer=str2double(answer);
MATRIX(:, answer*2-1:answer*2)=[];

Data.vec_temp1=MATRIX(:);Data.vec_temp2=  find(Data.vec_temp1~=0) ; Data.vec_temp1(Data.vec_temp1==0)=[];Data.N=size(MATRIX,1);Data.M=size(MATRIX,2); set(handles.show_tracks,'userdata',Data)
guidata(hObject,handles) ;
% %h_BacFormatics=handles;
%
show_frame( handles,n,'axes')  ;
% ---------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% %global h_BacFormatics;
n=get(handles.Raw_listbox,'Value') ;
prompt = {'Please input the SHORTER track to be cuttoff:'};
dlg_title = 'Delete';
num_lines = 1;
def = {' ' };
answer = inputdlg(prompt,dlg_title,num_lines,def) ;
min_track_length=str2double(answer);
track_what=get(handles.track_what2,'Value');
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);

Counter=0; list_of_delete=[];
for ii=1:size(MATRIX,2)
    X=MATRIX(:, ii);
    X=X(X~=0);
    track_length=length(X);
    if  track_length<min_track_length
        Counter=Counter+1;
        list_of_delete(Counter)=ii;
    end
end
try
    
    MATRIX(:,list_of_delete)=[];
    M=MATRIX./MATRIX;[a,start_XY]=nanmin(M);Index= isnan(a); MATRIX(:,Index)=[];
    Data.vec_temp1=MATRIX(:);
    Data.vec_temp2=  find(Data.vec_temp1~=0) ;
    Data.vec_temp1(Data.vec_temp1==0)=[];
    Data.N=size(MATRIX,1);
    Data.M=size(MATRIX,2);
    set(handles.show_tracks,'userdata',Data );
end

edit_labeling(hObject, eventdata, handles)
show_frame( handles,n,'axes')  ;



function edit_labeling(hObject, eventdata, handles)

choice = questdlg('Do you want to relabel index (:,6) according to edited tracks?', ...
    'Hello User', ...
    'Yes','No','No');
% Handle response
switch choice
    case 'Yes'
        track_what=get(handles.track_what2,'Value') ;
        Data=get(handles.show_tracks,'userdata' );
        
        
        
        vec_temp2=Data.vec_temp2 ;
        vec_temp1=Data.vec_temp1;
        N=Data.N  ;
        M=Data.M ;
        vec_temp3(vec_temp2)=vec_temp1;
        vec_temp3 (end+1:  M*N)=0;
        MATRIX = reshape(vec_temp3',N,M);
        
        
        centy  =handles.data_file(4).cdata.L(track_what).cdata.Centroid   ; 
       
        
        h=waitbar(0,'reconstructing label index (:,6) according to edited tracks ....');
        set(h,'color','w');
        for n=1:size(centy,2)
            waitbar(n/size(MATRIX,1))
            
            v=MATRIX(n,:);
            v(v==0)=nan;
            v2=[];
            v2(:,1)=v(1:2:length(v));
            v2(:,2)=v(2:2:length(v));
             temp_centy=centy(n).cdata;
             
             
             ind_vec=nan(size(temp_centy,1),1);
              for jj=1:size(temp_centy,1) 
                 
                v3=v2(:,1)==temp_centy(jj,1) &  v2(:,2)==temp_centy(jj,2);
                
                
                
                temp_ind=find(v3);
                
                if ~isempty(temp_ind)
                ind_vec(jj)=temp_ind;
                end
                
                  
              end
              
               
              temp_centy(:,6)=ind_vec;
              centy(n).cdata=temp_centy;
        end
        
          handles.data_file(4).cdata.L(track_what).cdata.Centroid=  centy;    
            
               
                 
        
        
        guidata(hObject,handles)
        close(h)
end
%h_BacFormatics=handles;
%
% ---------------------------------------------------
function Untitled_22_Callback(hObject, ~, handles)
% %global h_BacFormatics;
track_what=get(handles.track_what2,'Value');
n=get(handles.Raw_listbox,'Value') ;
prompt = {'Please input the LONGER track to be cuttoff:'};
dlg_title = 'Delete';
num_lines = 1;
def = {' ' };
answer = inputdlg(prompt,dlg_title,num_lines,def) ;
max_track_length=str2double(answer);
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1; vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
for ii=1:size(MATRIX,2)
    X=MATRIX(:, ii);
    X=X(X~=0);
    track_length=length(X);
    if  track_length>max_track_length
        list_of_delete(ii)=ii;
    end
end
list_of_delete=list_of_delete(list_of_delete~=0);
MATRIX(:,list_of_delete)=[];


Data.vec_temp1=MATRIX(:);Data.vec_temp2=  find(Data.vec_temp1~=0) ; Data.vec_temp1(Data.vec_temp1==0)=[];Data.N=size(MATRIX,1);Data.M=size(MATRIX,2); set(handles.show_tracks,'userdata',Data)
guidata(hObject,handles)
show_frame( handles,n,'axes')  ;
%h_BacFormatics=handles;
%
% ---------------------------------------------------
function Untitled_23_Callback(hObject, ~, handles)
%global h_BacFormatics;
track_what=get(handles.track_what2,'Value') ;
n=get(handles.Raw_listbox,'Value') ;
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1; vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
if  isempty(MATRIX)==1
    return
end
prompt = {'Please input first cell-track:','Please input second cell-track:'};
dlg_title = 'Merging..';
num_lines = 1;
def = {'',''};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
answer=str2double(answer);
answer_1    = answer(1);
answer_2    = answer(2);
MATRIX(:, answer_1*2-1:answer_1*2)=MATRIX(:, answer_1*2-1:answer_1*2)+MATRIX(:, answer_2*2-1:answer_2*2) ;
MATRIX(:, answer_2*2-1:answer_2*2)=[];

Data.vec_temp1=MATRIX(:);Data.vec_temp2=  find(Data.vec_temp1~=0) ; Data.vec_temp1(Data.vec_temp1==0)=[];Data.N=size(MATRIX,1);Data.M=size(MATRIX,2); set(handles.show_tracks,'userdata',Data)
guidata(hObject,handles)
show_frame( handles,n,'axes')  ;
%h_BacFormatics=handles;
%

% ---------------------------------------------------
function Untitled_8_Callback(hObject, ~, handles)
Current_Exp=get(handles.Current_Exp,'String');
[filename, pathname, filterindex] = uiputfile({  '*.dat','Dat-files (*.dat)';}, 'save  session to a data file',Current_Exp);
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
filename=regexprep(filename, 'BacFormatics_EXP_','');
full_filename= strcat(pathname,'BacFormatics_EXP_',filename) ;
full_filename=char(full_filename);
box_Raw=get(handles.Raw_listbox,'String');
if iscell(box_Raw)~=0
    handles.data_file(1).cdata=cell(length(box_Raw),1) ;
    handles.data_file(1).cdata(:,1)=box_Raw;
end
handles.data_file(10).cdata=full_filename;
guidata(hObject, handles);
temp=handles.data_file;
save(full_filename ,  'temp')
%   -------------------------------------------------------------
function popupmenu7_Callback(hObject, ~, handles)
popup_apply_filters=get(hObject,'Value') ;
switch popup_apply_filters
    case 1
        str=handles.data_file(1).cdata(2,3);
    case 2
        str=handles.data_file(1).cdata(3,3);
    case 3
        str=handles.data_file(1).cdata(4,3);
    case 4
        str=handles.data_file(1).cdata(5,3);
end
if char(str)=='1'
    handles.c=handles.c1;
elseif char(str)=='2'
    handles.c=handles.c2;
elseif char(str)=='3'
    handles.c=handles.c3;
elseif char(str)=='4'
    handles.c=handles.c4;
end
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
% --------------------------------------------------------
function pushbutton10_Callback(~, ~, ~)
uiwait
% ---------------------------------------------------
function segmentation_type1_Callback(hObject, ~, handles)
n=get(handles.Raw_listbox,'value')   ;
Raw_listbox_Callback([], [], handles)


function [STAT]= autothreshold_critiria(matrix_bw,ROI)
bwareaopen_value=80;
%Critiria: 0. minimum size of segment larger than critical area 1. must
%be only one segment. 2. Circularity higher than 0.45
%3. Less than 0.4 percatet of border line is filled. 4. new threshold is at least 0.6 percent from the original matrix_bw!
STAT=0;
if mean(mean(matrix_bw))>50 && size(matrix_bw,1)*size(matrix_bw,2)>100
    L=bwlabel(ROI) ;
    if max(max(L))==1
        stats=regionprops(L,'Perimeter','Area');
        circularity=4*pi*stats.Area/(stats.Perimeter^2);
        if circularity>0.5
            if mean(ROI(:,1))<0.4 || mean(ROI(:,end))<0.4 || mean(ROI(:,1))<0.4 || mean(ROI(:,end))<0.4
                a=sum(sum(matrix_bw)); b=sum(sum(ROI));
                if a/b>0.62
                    STAT=1;
                end
            end
        end
    end
end
%  ----------
% --------------------------------------------------------------
function [STAT]= autothreshold_critiria2(matrix_bw,ROI) %for 2 cells
bwareaopen_value=80;
%Critiria: 0. minimum size of segment larger than critical area 1. must
%be only one segment. 2. Circularity higher than 0.45
%3. Less than 0.4 percatet of border line is filled. 4. new threshold is at least 0.6 percent from the original matrix_bw!
STAT=0;
if mean(mean(matrix_bw))>50 && size(matrix_bw,1)*size(matrix_bw,2)>100
    L=bwlabel(ROI) ;
    if max(max(L))==1
        stats=regionprops(L,'Perimeter','Area');
        circularity=4*pi*stats.Area/(stats.Perimeter^2);
        if circularity>0.45
            if mean(ROI(:,1))<0.4 || mean(ROI(:,end))<0.4 || mean(ROI(:,1))<0.4 || mean(ROI(:,end))<0.4
                %                              a=sum(sum(ROI)); b=sum(sum(ROI));v
                %                               if b/a>0.6
                STAT=1;
                %                               end
            end
        end
    end
end
%  ----------
% ---------------------------------------------------
function Optima_settings_Callback(~, ~, ~)
% hObject    handle to Optima_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------
function Load_optimal_settings_Callback(~, ~, handles)
% hObject    handle to Load_optimal_settings (see GCBO)
[filename, pathname, filterindex] = uigetfile({  '*.dat','DAT-files (*.dat)';}, 'Please Choose optimal setting file');
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
full_filename= char(strcat(pathname,filename)); 
DATA=importdata(full_filename)  ;
set_DATA(handles,DATA);
% ---------------------------------------------------
function Setting_for_selected_frame_Callback(~, ~, handles)
track_what=get(handles.track_what1,'Value');
n_Raw=get(handles.Raw_listbox,'Value');
DATA=handles.data_file(8).cdata(track_what).Frame(n_Raw).DATA  ;
%  if  DATA(1).vector(1)~=0
%      set(handles.F_popup_1,'Value',DATA(1).vector(1)); end
%  if  DATA(1).vector(2)~=0
%      set(handles.F_popup_2,'Value',DATA(1).vector(2)); end
%  if  DATA(1).vector(3)~=0
%      set(handles.F_popup_3,'Value',DATA(1).vector(3)); end
%  if  DATA(1).vector(4)~=0
%      set(handles.F_popup_4,'Value',DATA(1).vector(4)); end
%  if  DATA(1).vector(5)~=0
%      set(handles.F_popup_5,'Value',DATA(1).vector(5)); end
% for ii=1:5
% F_popup_function(ii,handles);
% end
%
% set(handles.F_Slider_1,'Value',DATA(1).vector(6));
% set(handles.F_Slider_2,'Value',DATA(1).vector(7));
% set(handles.F_Slider_3,'Value',DATA(1).vector(8));
% set(handles.F_Slider_4,'Value',DATA(1).vector(9));
% set(handles.F_Slider_5,'Value',DATA(1).vector(10));
%
if  DATA(1).vector(11)~=0
    set(handles.T_popup_2,'Value',DATA(1).vector(11));   end
if  DATA(1).vector(12)~=0
    set(handles.T_popup_3,'Value',DATA(1).vector(12));  end
if  DATA(1).vector(13)~=0
    set(handles.T_popup_4,'Value',DATA(1).vector(13));  end
if  DATA(1).vector(14)~=0
    set(handles.T_popup_5,'Value',DATA(1).vector(14));  end
if  DATA(1).vector(15)~=0
    set(handles.T_popup_6,'Value',DATA(1).vector(15));  end
for ii=2:5
    T_popup_function(ii,handles);
end
set(handles.thresh_level,'Value',DATA(1).vector(16));
set(handles.T_Slider_2,'Value',DATA(1).vector(17));
set(handles.T_Slider_3,'Value',DATA(1).vector(18));
set(handles.T_Slider_4,'Value',DATA(1).vector(19));
set(handles.T_Slider_5,'Value',DATA(1).vector(20));
set(handles.T_Slider_6,'Value',DATA(1).vector(21));
if DATA(1).vector(22)==0
    DATA(1).vector(22)= 1;
end
%   if DATA(1).vector(23)==0
%      DATA(1).vector(23)= 1;
%   end
if DATA(1).vector(24)==0
    DATA(1).vector(24)= 1;
end
set(handles.strel_type,'Value',DATA(1).vector(22));
%  set(handles.fspecial_type,'Value',DATA(1).vector(23));
set(handles.bwmorph_type,'Value',DATA(1).vector(24));
%  if isnan(DATA(2).vector(1))~=1
%      set(handles.F_edit_1,'String',DATA(2).vector(1)); end
%   if isnan(DATA(2).vector(2))~=1
%       set(handles.F_edit_2,'String',DATA(2).vector(2)); end
%    if isnan(DATA(2).vector(3))~=1
%        set(handles.F_edit_3,'String',DATA(2).vector(3)); end
%     if isnan(DATA(2).vector(4))~=1
%         set(handles.F_edit_4,'String',DATA(2).vector(4)); end
%      if isnan(DATA(2).vector(5))~=1
%          set(handles.F_edit_5,'String',DATA(2).vector(5)); end
%
if isnan(DATA(2).vector(6))~=1
    set(handles.T_edit_1,'String',DATA(2).vector(6)); end
if isnan(DATA(2).vector(7))~=1
    set(handles.T_edit_2,'String',DATA(2).vector(7)); end
if isnan(DATA(2).vector(8))~=1
    set(handles.T_edit_3,'String',DATA(2).vector(8)); end
if isnan(DATA(2).vector(9))~=1
    set(handles.T_edit_4,'String',DATA(2).vector(9)); end
if isnan(DATA(2).vector(10))~=1
    set(handles.T_edit_5,'String',DATA(2).vector(10)); end
if isnan(DATA(2).vector(11))~=1
    set(handles.T_edit_6,'String',DATA(2).vector(11)); end
%  ---------------------
function set_DATA(handles,DATA)
% if DATA(1).vector(1)~=0
%     set(handles.F_popup_1,'Value',DATA(1).vector(1)) ;   end
% if DATA(1).vector(2)~=0
%     set(handles.F_popup_2,'Value',DATA(1).vector(2));    end
% if DATA(1).vector(3)~=0
%     set(handles.F_popup_3,'Value',DATA(1).vector(3));    end
% if DATA(1).vector(4)~=0
%     set(handles.F_popup_4,'Value',DATA(1).vector(4));    end
% if DATA(1).vector(5)~=0
%     set(handles.F_popup_5,'Value',DATA(1).vector(5));    end
% for ii=1:5
% F_popup_function(ii,handles);
% end
% set(handles.F_Slider_1,'Value',DATA(1).vector(6));
% set(handles.F_Slider_2,'Value',DATA(1).vector(7));
% set(handles.F_Slider_3,'Value',DATA(1).vector(8));
% set(handles.F_Slider_4,'Value',DATA(1).vector(9));
% set(handles.F_Slider_5,'Value',DATA(1).vector(10));
%
if DATA(1).vector(11)~=0
    set(handles.T_popup_2,'Value',DATA(1).vector(11));  end
if DATA(1).vector(12)~=0
    set(handles.T_popup_3,'Value',DATA(1).vector(12));  end
if DATA(1).vector(13)~=0
    set(handles.T_popup_4,'Value',DATA(1).vector(13));  end
if DATA(1).vector(14)~=0
    set(handles.T_popup_5,'Value',DATA(1).vector(14));  end
if DATA(1).vector(15)~=0
    set(handles.T_popup_6,'Value',DATA(1).vector(15));  end
for ii=2:5
    T_popup_function(ii,handles);
end
set(handles.thresh_level,'Value',DATA(1).vector(16));
set(handles.T_Slider_2,'Value',DATA(1).vector(17));
set(handles.T_Slider_3,'Value',DATA(1).vector(18));
set(handles.T_Slider_4,'Value',DATA(1).vector(19));
set(handles.T_Slider_5,'Value',DATA(1).vector(20));
set(handles.T_Slider_6,'Value',DATA(1).vector(21));
set(handles.strel_type,'Value',DATA(1).vector(22));
% set(handles.fspecial_type,'Value',DATA(1).vector(23));
set(handles.bwmorph_type,'Value',DATA(1).vector(24));
% set(handles.F_edit_1,'String',DATA(2).vector(1));
% set(handles.F_edit_2,'String',DATA(2).vector(2));
% set(handles.F_edit_3,'String',DATA(2).vector(3));
% set(handles.F_edit_4,'String',DATA(2).vector(4));
% set(handles.F_edit_5,'String',DATA(2).vector(5));
set(handles.T_edit_1,'String',DATA(2).vector(6));
set(handles.T_edit_2,'String',DATA(2).vector(7));
set(handles.T_edit_3,'String',DATA(2).vector(8));
set(handles.T_edit_4,'String',DATA(2).vector(9));
set(handles.T_edit_5,'String',DATA(2).vector(10));
set(handles.T_edit_6,'String',DATA(2).vector(11));
% set(handles.Filtered_panel,'Visible','on');
% set(handles.Threshold_panel,'Visible','on');
% -----------------------------------------------------------------------------------------------
function [output]= Cell_data_function(vector,handles,~,str,~)
track_what=get(handles.track_what1,'Value')  ;
output=[];
for ii=1:size(vector,1)
    if isnan(vector(ii,3))~=1
        full_command=strcat('handles. data_file(4).cdata.L(',num2str(track_what) ,').cdata(ii+jj-1).cdata(vector(ii,3)).',str) ;
        output(ii,:)= eval(full_command) ;
    end
end
%      kk=1;
%               for ii=1:size(vector,1)
%                           if isnan(vector(ii,3))~=1
%                               full_command=strcat('handles. data_file(4).cdata.L(',num2str(track_what1) ,').cdata(ii+jj-1).cdata(vector(ii,3)).',str);
%                               output(kk,:)= eval(full_command) ; kk=kk+1;
%                           end
%               end
%  ------------------------------------------
function show_tracks_Callback(hObject, eventdata, handles)
if get(handles.show_tracks,'value')==1
    set(handles.togglebutton1,'Visible','on')
    set(handles.togglebutton2,'Visible','on')
    set(handles.togglebutton3,'Visible','on')
    set(handles.togglebutton4,'Visible','on')
    set(handles.togglebutton5,'Visible','on')
    set(handles.togglebutton6,'Visible','on')
else
    set(handles.togglebutton1,'Visible','off')
    set(handles.togglebutton2,'Visible','off')
    set(handles.togglebutton3,'Visible','off')
    set(handles.togglebutton4,'Visible','off')
    set(handles.togglebutton5,'Visible','off')
    set(handles.togglebutton6,'Visible','off')
end

Raw_listbox_Callback([], [], handles)


% -----------------------------------------
% ---------------------------------------------------
function Untitled_36_Callback(~, ~, ~)
% hObject    handle to Untitled_36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------
function Untitled_35_Callback(hObject, ~, handles)
h=timebar_BACWrapper('Processing second segmentation. Please  wait....');set(h,'color','w');
track_what=get(handles.track_what1,'value');
[Channel,Projected_by]=select_channel;
fff=1; z=1;
box_Raw=get(handles.Raw_listbox,'string') ;
n=  get(handles.Raw_listbox,'value') ;
Y=handles.data_file(6).cdata(3);
X=handles.data_file(6).cdata(4);
temp_matrix=zeros(X,Y);
for ii=1:size(box_Raw,1)
    timebar_BACWrapper(h,ii/size(box_Raw,1))
    filename=char(box_Raw(ii)) ;
    [matrix2, full_filename_Segmentation]= read_image2(ii,3,Projected_by, filename,Channel)   ;
    [temp ,full_filename_Raw]= read_image2(ii,3,'Imean', filename , track_what)   ;
    % % % % % % %         for kk=1:5 %if useing 5 sections
    % % % % % % %           Z=char(strcat('z',num2str(kk)));
    % % % % % % %           [temp_Raw(:,:,kk),centy1,full_filename]= read_image2(ii,1,Z, filename, handles.data_file)   ;
    % % % % % % %         end
    for jj=1:size(handles.data_file(4).cdata.L(track_what).cdata(ii).cdata,1)
        if  isempty(handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata)~=1
            XY=  double(handles.data_file(4).cdata.L(track_what).cdata(ii).cdata(jj).BoundingBox);
            STAT=0;
            if (XY(1)+XY(3))>X
                XY(1)=floor(XY(1));
            end
            if (XY(2)+XY(4))>Y
                XY(2)=floor(XY(2));
            end
            X1=round(XY(2))  ;
            Y1=round(XY(1))  ;
            X2=round(XY(2)+XY(4)) ;
            Y2=round(XY(1)+XY(3)) ;
            matrix1= temp_matrix;
            matrix1(X1:X2,Y1:Y2)=temp(X1:X2,Y1:Y2)./(max(max(temp(X1:X2,Y1:Y2))));
            matrix2=  matrix2./max(max(matrix2));
            intersec=double(matrix1).*double(matrix2);
            if         max(max(matrix2))==0%'no object in the  second channel'
                V=0;
                eval(strcat('handles.data_file(4).cdata.L(',num2str(track_what),').cdata(',num2str(ii),').cdata(',num2str(jj),').Proximity_Ch_',num2str(Channel-1),'=V ;'))
            else
                if max(max(intersec))>0 %   'cell-object contact'
                    V=1;
                    eval(strcat('handles.data_file(4).cdata.L(',num2str(track_what),').cdata(',num2str(ii),').cdata(',num2str(jj),').Proximity_Ch_',num2str(Channel-1),'=V ;'))
                else
                    %                       pause
                    matrix11=bwdist(matrix1,'euclidean');
                    matrix22=  bwdist(matrix2,'euclidean');
                    matrix111= double(matrix1).*double(matrix22);  matrix111(~ matrix111)=nan;
                    matrix222= double(matrix11).*double(matrix2);matrix222(~ matrix222)=nan;
                    v1=find(ismember(matrix111,min(min(matrix111))))  ;
                    v2=find(ismember(matrix222,min(min(matrix222))))  ;
                    v1=v1(1); v2=v2(1);% if more than one pixel is selected as the closest point. better model is required!
                    [V(1),V(2)]=ind2sub(size(matrix111),v1);  [V(3),V(4)]=ind2sub(size(matrix111),v2);
                    eval(strcat('handles.data_file(4).cdata.L(',num2str(track_what),').cdata(',num2str(ii),').cdata(',num2str(jj),').Proximity_Ch_',num2str(Channel-1),'=V ;'))
                end
            end
            clear V
        end
    end
end
guidata(hObject,handles);
close(h)

function min_var_for_consideration_CreateFcn(~, ~, ~)

% ---------------------------------------------------
function Untitled_34_Callback(hObject, ~, handles)
% hObject    handle to Untitled_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=timebar_BACWrapper('Label brightest pixel. Please  wait....');set(h,'color','w');
track_what=get(handles.track_what1,'value');
[Channel,Projected_by]=select_channel;
box_Raw=get(handles.Raw_listbox,'string') ;
n=  get(handles.Raw_listbox,'value') ;
handles.Y=handles.data_file(6).cdata(3);
handles.X=handles.data_file(6).cdata(4);
temp_matrix=zeros(X,Y);
for ii=1:size(box_Raw,1)
    timebar_BACWrapper(h,ii/size(box_Raw,1))
    filename=char(box_Raw(ii)) ;
    [temp_Segmentation ,full_filename_Segmentation]= read_image2(ii,3,'Imean', filename, track_what)   ;
    [temp, full_filename_Raw]= read_image2(ii,1,Projected_by, filename,Channel)   ;
    % % % % % % %         for kk=1:5 %if useing 5 sections
    % % % % % % %           Z=char(strcat('z',num2str(kk)));
    % % % % % % %           [temp_Raw(:,:,kk),centy1,full_filename]= read_image2(ii,1,Z, filename, handles.data_file)   ;
    % % % % % % %         end
    for jj=1:size(handles.data_file(4).cdata.L(track_what).cdata(ii).cdata,1)
        if  isempty(handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata)~=1
            XY=  double(handles.data_file(4).cdata.L(track_what).cdata(ii).cdata(jj).BoundingBox);
            STAT=0;
            if (XY(1)+XY(3))>X
                XY(1)=floor(XY(1));
            end
            if (XY(2)+XY(4))>Y
                XY(2)=floor(XY(2));
            end
            X1=round(XY(2))  ;
            Y1=round(XY(1))  ;
            X2=round(XY(2)+XY(4)) ;
            Y2=round(XY(1)+XY(3)) ;
            matrix= temp_matrix;
            matrix(X1:X2,Y1:Y2)=temp_Segmentation(X1:X2,Y1:Y2);
            matrix=smoothn_BACWrapper(double(matrix).*double(temp),3);
            [~, x]=find(ismember(matrix,max(max(matrix)))) ;
            eval(strcat('handles.data_file(4).cdata.L(',num2str(track_what),').cdata(',num2str(ii),').cdata(',num2str(jj),').BrightestP_Ch_',num2str(Channel),'=[x y] ;'))
        end
    end
end
guidata(hObject,handles);
close(h)
% --- Executes on selection change in vector1.
function vector1_Callback(~, ~, ~)
% hObject    handle to vector1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns vector1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from vector1
% --- Executes during object creation, after setting all properties.
function vector1_CreateFcn(hObject, ~, ~) 
 
function Show_events_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], [], handles)


if get(hObject,'value')
    set(hObject,'ForegroundColor','y')
else
    set(hObject,'ForegroundColor','w')
end

function Show_proximity_vector_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], [], handles)
% --- Executes on button press in stack_RAM.
function stack_RAM_Callback(hObject, ~, handles)



% propertyeditor('off')
track_what=get(handles.track_what1,'value');
set(hObject,'Value',0)
h=waitbar(0,'reading stack file to memory ....');
%     speaker_BACWrapper('reading stack file to memory ....');
set(h,'color','w');
segmentation_type=get(handles.segmentation_type1,'Value')  ;
start_export=str2double(get(handles.start_export,'string'));
end_export=str2double(get(handles.end_export,'string'));
n=end_export-start_export;
box_Raw=get(handles.Raw_listbox,'string');


switch segmentation_type
    
    case 1
        eval(strcat('global Ch0',num2str(track_what-1),'_stack_Raw'))
        for ii=1:size(box_Raw,1)
            waitbar(ii/size(box_Raw,1))
            if (ii>start_export-1) && (ii-1<end_export)
                temp = read_image2(ii,segmentation_type);
                eval(strcat('Ch0',num2str(track_what-1),'_stack_Raw(',num2str(ii),').cdata=uint8(255*(double(temp)./max(max(double(temp)))));'))
                pause(0.05)
            else
                eval(strcat('Ch0',num2str(track_what-1),'_stack_Raw(',num2str(ii),').cdata=[];'))
            end
        end
        
    case 2
        
        eval(strcat('global Ch0',num2str(track_what-1),'_stack_Filtered'))
        for ii=1:size(box_Raw,1)
            waitbar(ii/size(box_Raw,1))
            if (ii>start_export-1) && (ii-1<end_export)
                temp = read_image2(ii,segmentation_type);
                eval(strcat('Ch0',num2str(track_what-1),'_stack_Filtered(',num2str(ii),').cdata=uint8(255*(double(temp)./max(max(double(temp)))));'))
                pause(0.05)
            else
                eval(strcat('Ch0',num2str(track_what-1),'_stack_Filtered(',num2str(ii),').cdata=[];'))
            end
        end
    case 3
        eval(strcat('global Ch0',num2str(track_what-1),'_stack_Segmented'))
        for ii=1:size(box_Raw,1)
            waitbar(ii/size(box_Raw,1))
            if (ii>start_export-1) && (ii-1<end_export)
                temp = read_image2(ii,segmentation_type);
                eval(strcat('Ch0',num2str(track_what-1),'_stack_Segmented(',num2str(ii),').cdata=uint8(255*(double(temp)./max(max(double(temp)))));'))
                pause(0.05)
            else
                eval(strcat('Ch0',num2str(track_what-1),'_stack_Segmented(',num2str(ii),').cdata=[];'))
            end
        end
end


guidata(hObject, handles);
close(h)

function uipushtool1_ClickedCallback(hObject, eventdata, handles)
Open_Experiment_Callback(hObject, eventdata, handles)

function uipushtool3_ClickedCallback(~, ~, ~)
disp('under development')
% ---------------------------------------------------

% ---------------------------------------------------

% ---------------------------------------------------
function uipushtool5_ClickedCallback(hObject, eventdata, handles)
Label_the_cells_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
% ---------------------------------------------------
function uipushtool6_ClickedCallback(~, ~, ~)
% hObject    handle to uipushtool6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------
% ---------------------------------------------------
function Untitled_26_Callback(hObject, ~, handles)
uiwait(msg_box_1)
h = imrect;
position = wait(h);
handles.data_file(6).cdata=  [ceil(position(1)) ceil(position(2)) round(position(3))  round(position(4))]  ;
guidata(hObject,handles);
n=get(handles.Raw_listbox,'Value') ;
box_Raw=get(handles.Raw_listbox,'string') ;
filename=char(box_Raw(n)) ;
show_frame( handles,n,'axes');
% ---------------------------------------------------


function axes1_DeleteFcn(~, ~, ~)
%     handles.mode4_vec= [];
%     guidata(hObject,handles)
%      global h_imline_mode4
%      try
%       delete(h_imline_mode4)
%      end
%  mode5_vec=handles.mode5_vec;
%     handles.mode5_vec= [];
%     guidata(hObject,handles)
%
%
%     if isempty(mode5_vec)~=1
%         for ii=1:length(mode5_vec)
%             Val=mode5_vec(ii);
%              try
%             eval(['global h_imline_mode5_' num2str(Val)])
%             eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
%             end
%         end
%     end


function mode_1_Callback(hObject, eventdata, handles)
    
    
 
    
set(handles.shift_frame,'string','0')

mode5_vec=handles.mode5_vec;
handles.mode5_vec= [];
guidata(hObject,handles)


if isempty(mode5_vec)~=1
    for ii=1:length(mode5_vec)
        Val=mode5_vec(ii);
        try
            eval(['global h_imline_mode5_' num2str(Val)])
            eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
        end
    end
end

global mode_1
if mode_1~=1
    maxes_mode(handles,hObject, eventdata,1)
else
    maxes_mode(handles,hObject, eventdata,0)
end
function mode_2_Callback(hObject, eventdata, handles)
global mode_2
if mode_2~=1
    maxes_mode(handles,hObject, eventdata,2)
else
    maxes_mode(handles,hObject, eventdata,0)
end
function mode_3_Callback(hObject, eventdata, handles)
global mode_3
if mode_3~=1
    maxes_mode(handles,hObject, eventdata,3)
else
    maxes_mode(handles,hObject, eventdata,0)
end
function mode_4_Callback(hObject, eventdata, handles)


set(handles.shift_frame,'string','0')


mode5_vec=handles.mode5_vec;
handles.mode5_vec= [];
guidata(hObject,handles)


if isempty(mode5_vec)~=1
    for ii=1:length(mode5_vec)
        try
            Val=mode5_vec(ii);
            try
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
            end
        end
    end
end


global mode_4
if mode_4~=1
    maxes_mode(handles,hObject, eventdata, 4)
else
    maxes_mode(handles,hObject, eventdata, 0)
end
function mode_5_Callback(hObject, eventdata, handles)
    
 
handles.flags.Box=2;
Img = imread('Box2.png'); % icon file name
set(handles.Show_Box,'cdata',Img)

   
    
    
    
    
    
set(handles.shift_frame,'string','0')
handles.mode4_vec= [];
guidata(hObject,handles)
global h_imline_mode4
try
    delete(h_imline_mode4)
end
mode5_vec=handles.mode5_vec;
handles.mode5_vec= [];
guidata(hObject,handles)


if isempty(mode5_vec)~=1
    for ii=1:length(mode5_vec)
        Val=mode5_vec(ii);
        try
            eval(['global h_imline_mode5_' num2str(Val)])
            eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
        end
    end
end

global mode_5
if mode_5~=1
    maxes_mode(handles,hObject, eventdata,5)
else
    maxes_mode(handles,hObject, eventdata,0)
end
function mode_6_Callback(hObject, eventdata, handles)
set(handles.shift_frame,'string','0')


handles.mode4_vec= [];
guidata(hObject,handles)
global h_imline_mode4
try
    delete(h_imline_mode4)
end
mode5_vec=handles.mode5_vec;
handles.mode5_vec= [];
guidata(hObject,handles)


if isempty(mode5_vec)~=1
    for ii=1:length(mode5_vec)
        Val=mode5_vec(ii);
        try
            eval(['global h_imline_mode5_' num2str(Val)])
            eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
        end
    end
end

global mode_6
if mode_6~=1
    maxes_mode(handles,hObject, eventdata,6)
else
    maxes_mode(handles,hObject, eventdata,0)
end



function mode_7_Callback(hObject, eventdata, handles)





handles.mode4_vec= [];
guidata(hObject,handles)
global h_imline_mode4
try
    delete(h_imline_mode4)
end
mode5_vec=handles.mode5_vec;
handles.mode5_vec= [];
guidata(hObject,handles)


if isempty(mode5_vec)~=1
    for ii=1:length(mode5_vec)
        Val=mode5_vec(ii);
        try
            eval(['global h_imline_mode5_' num2str(Val)])
            eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
        end
    end
end



mode7_vec=handles.mode7_vec;
handles.mode7_vec= [];
guidata(hObject,handles)
if isempty(mode7_vec)~=1
    for ii=1:length(mode7_vec)
        Val=mode7_vec(ii);
        try
            eval(['global h_imline_mode7_' num2str(Val)])
            eval( ['delete(h_imline_mode7_' num2str(Val) ')'])
        end
    end
end

% try


global mode_7
if mode_7~=1  

maxes_mode(handles,hObject, eventdata, 7)
Raw_listbox_Callback([], eventdata, handles)
n=get(handles.Raw_listbox,'value')   ;
track_what=get(handles.track_what2,'Value') ;
centy1_m =handles.data_file(4).cdata.L(track_what).cdata.Centroid(n-1).cdata;
centy1_n =handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata;

Xlim=get(handles.axes1,'xlim');
Ylim=get(handles.axes1,'ylim');

axes(handles.axes1);
Counter=1;
for ii=1:size(centy1_n,1) 
    
    eval(['global h_imline_mode7_' num2str(ii)])
    %    cell1=find(ismember(XY,(min(XY)))) ;
    %     XY= (( centy1_n(:,1)-cell2(1)).^2+ (centy1_n(:,2)-cell2(2)).^2).^2     ;
    %    cell2=find(ismember(XY,(min(XY)))) ;
    %
    %    temp_val=centy1_n(cell1,4);
    %    centy1_n(cell1,4)= centy1_n(cell2,4) ;
    %    centy1_n(cell2,4)= temp_val
    %
    index=centy1_n(ii,4) ;
    if index==-1
        vec=[  centy1_n(ii,1)   centy1_n(ii,2)     centy1_n(ii,1)   centy1_n(ii,2) ];
        %            save vec vec
        %         save xlim xlim
        %         save ylim ylim
        if (((vec(1)>Xlim(1) & vec(1)<Xlim(2)) & (vec(3)>Xlim(1) & vec(3)<Xlim(2))) & ((vec(2)>Ylim(1) & vec(2)<Ylim(2)) & (vec(4)>Ylim(1) & vec(4)<Ylim(2)))) %#ok<*AND2>
            
            eval( ['h_imline_mode7_' num2str(ii) '=imline(gca,[' num2str(vec(1)) ' ' num2str(vec(2)) ' ;' num2str(vec(3)) ' ' num2str(vec(4)) ']);']     )
            eval( ['setColor(h_imline_mode7_' num2str(ii)   ',[1 0 1])'])
            eval( ['Line_Children=get(h_imline_mode7_' num2str(ii) ','  '''Children'')'])
            eval(['set(Line_Children(1),''LineWidth''' ',0.2,'  '''Color'',''m'',''Marker'',''*'')' ])
            eval(['set(Line_Children(2),''LineWidth''' ',5,'  '''Color'',''b'',''Marker'',''o'')' ])
            eval(['set(Line_Children(3),''LineWidth''' ',3,'  '''Color'',''m''' ')'])
            mode7_vec(Counter)=ii; Counter=Counter+1;
        end
    else
        
        vec=[  centy1_n(ii,1)   centy1_n(ii,2)  centy1_m(index,1)   centy1_m(index,2) ];
        %         xlim
        %         ylim
        %
        %         save vec vec
        %         save xlim xlim
        %         save ylim ylim
        %
        
        if (((vec(1)>Xlim(1) & vec(1)<Xlim(2)) & (vec(3)>Xlim(1) & vec(3)<Xlim(2))) & ((vec(2)>Ylim(1) & vec(2)<Ylim(2)) & (vec(4)>Ylim(1) & vec(4)<Ylim(2))))
            
            %  ['h_imline_mode7_' num2str(ii) '=imline(gca,[' num2str(vec(1)) ' ' num2str(vec(2)) '],[' num2str(vec(3)) ' ' num2str(vec(4)) '])']
            eval( ['h_imline_mode7_' num2str(ii) '=imline(gca,[' num2str(vec(1)) ' ' num2str(vec(2)) ' ;' num2str(vec(3)) ' ' num2str(vec(4)) ']);']     )
            eval( ['setColor(h_imline_mode7_' num2str(ii)   ',[1 0 1])'])
            eval( ['Line_Children=get(h_imline_mode7_' num2str(ii) ','  '''Children'');'])
            eval(['set(Line_Children(1),''LineWidth''' ',0.2,'  '''Color'',''m'',''Marker'',''*'')' ])
            eval(['set(Line_Children(2),''LineWidth''' ',7,'  '''Color'',''r'',''Marker'',''o'')' ])
            eval(['set(Line_Children(3),''LineWidth''' ',3,'  '''Color'',''m''' ')'])
            text(vec(1), vec(2),num2str(ii),'fontsize',handles.Size_Mark1*0.5 ,'VerticalAlignment','top','color',handles.Colors_Line2)
            mode7_vec(Counter)=ii; Counter=Counter+1;
        end
        
    end
end 



handles.mode7_vec= mode7_vec;
guidata(hObject,handles) 
else 
 maxes_mode(handles,hObject, eventdata ,0)  
 
 Show_Segment_Callback(hObject, eventdata, handles)
end
 



% end
function mode_8_Callback(hObject, eventdata, handles)
set(handles.shift_frame,'string','0')
handles.mode4_vec= [];
guidata(hObject,handles)
global h_imline_mode4
try
    delete(h_imline_mode4)
end
mode5_vec=handles.mode5_vec;
handles.mode5_vec= [];
guidata(hObject,handles)


if isempty(mode5_vec)~=1
    for ii=1:length(mode5_vec)
        Val=mode5_vec(ii);
        eval(['global h_imline_mode5_' num2str(Val)])
        eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
    end
end


global mode_8 
if mode_8~=1  
set(handles.Show_Segment,'value',1)
maxes_mode(handles,hObject, eventdata,8) 
else 
 maxes_mode(handles,hObject, eventdata,0)  
end
Show_Segment_Callback(hObject, eventdata, handles)






function maxes_mode(handles,hObject, eventdata,n)


global mode_1 mode_2 mode_3 mode_4 mode_5 mode_6  mode_7 mode_8 %#ok<*NUSED>

%
% axis manual;
for ii=1:8
    
    
    
    
    
    
    if ii==n
        
        
        
        eval(strcat('mode_',num2str(ii),'=1'))
        
        
        
        switch ii
            case 1
                iImage = imread('1_w.png'); % icon file name (.png) has to be equal to icon name
            case 2
                iImage = imread('2_w.png'); % icon file name (.png) has to be equal to icon name
            case 3
                iImage = imread('3_w.png'); % icon file name (.png) has to be equal to icon name
            case 4
                iImage = imread('4_w.png'); % icon file name (.png) has to be equal to icon name
            case 5
                iImage = imread('5_w.png'); % icon file name (.png) has to be equal to icon name
            case 6
                iImage = imread('6_w.png'); % icon file name (.png) has to be equal to icon name
            case 7
                iImage = imread('7_w.png'); % icon file name (.png) has to be equal to icon name
            case 8
                iImage = imread('8_w.png'); % icon file name (.png) has to be equal to icon name
        end
        dImage = double(iImage(:,:,1));
        dImage = dImage./max(dImage(:));
        dImage1 = repmat(dImage, [1 1 3]);
        
        eval(strcat('set(handles.mode_',num2str(ii),' ,''cdata''',', dImage1)') )
        
    else
        eval(strcat('mode_',num2str(ii),'=0'))
        
        switch ii
            case 1
                iImage = imread('1.png'); % icon file name (.png) has to be equal to icon name
            case 2
                iImage = imread('2.png'); % icon file name (.png) has to be equal to icon name
            case 3
                iImage = imread('3.png'); % icon file name (.png) has to be equal to icon name
            case 4
                iImage = imread('4.png'); % icon file name (.png) has to be equal to icon name
            case 5
                iImage = imread('5.png'); % icon file name (.png) has to be equal to icon name
            case 6
                iImage = imread('6.png'); % icon file name (.png) has to be equal to icon name
            case 7
                iImage = imread('7.png'); % icon file name (.png) has to be equal to icon name
            case 8
                iImage = imread('8.png'); % icon file name (.png) has to be equal to icon name
        end
        dImage = double(iImage(:,:,1));
        dImage = dImage./max(dImage(:)); dImage=dImage./2;
        dImage1 = repmat(dImage, [1 1 3]);
        eval(strcat('set(handles.mode_',num2str(ii),' ,''cdata''',', dImage1)') )
        
        
        
    end
end

if n==7
    str= inputdlg('Please input shift-frame value to aid for manual correction','Input',1,{'1'});
    set(handles.shift_frame,'string',char(str))
else
    set(handles.shift_frame,'string','0')
end


 switch n
     case {0,3,4,5,6}
         set(handles.Panel_Selection,'value',1)
         Panel_Selection_Callback(hObject, eventdata, handles) 
      case {1,2,7}
        set(handles.Panel_Selection,'value',4)
         Panel_Selection_Callback(hObject, eventdata, handles)  
     case 8
          set(handles.Panel_Selection,'value',3)
         Panel_Selection_Callback(hObject, eventdata, handles)  
  end






function track_what2_Callback(hObject, ~, handles)
Raw_listbox_Callback([], [], handles)

 
function Color_parameters_CreateFcn(~, ~, ~)

function axes1_CreateFcn(~, ~, ~)

 
 
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
 

% ---------------------------------------------------
function Untitled_44_Callback(hObject, ~, handles)
%global h_BacFormatics;
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid ;
if   findstr(char(handles.data_file(7).cdata(track_what,2)),'N')==1     %Must be labeled before running the tracking algorithm
    h = msgbox('Please allocate the Centroids and label the cells before running tracking algorithm.','Aborted');
    return
end
str=eval(strcat('handles.data_file(3).cdata(',num2str(track_what),',1)'));
str=str2double(str);
if str==0
    return
end
jj=0;
for ii=1:size(centy1,2)
    jj=jj+size(centy1(ii).cdata,1);
end
maxi=jj*2;
MATRIX2=zeros(size(centy1,2) ,maxi);
jjj=1;
for ii=1:size(centy1,2)
    for jj=1:size(centy1(ii).cdata,1)
        MATRIX2(ii,jjj:jjj+1)  =centy1(ii).cdata(jj,1:2) ;
        jjj=jjj+2;
    end
end
MATRIX=      MATRIX2 ;
Data.vec_temp1=MATRIX(:);Data.vec_temp2=  find(Data.vec_temp1~=0) ; Data.vec_temp1(Data.vec_temp1==0)=[];Data.N=size(MATRIX,1);Data.M=size(MATRIX,2); set(handles.show_tracks,'userdata',Data)
handles.data_file(7).cdata(track_what,1) =cellstr('Y'); %Now flag for track is Yes
guidata(hObject,handles);
%  track_what2_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], [], handles)
%h_BacFormatics=handles;
%
try
    global h_cell_tracks_window
    cell_tracks_window('Untitled_1_Callback', h_cell_tracks_window.Untitled_1,[],h_cell_tracks_window)
end
% ---------------------------------------------------
 %
function Untitled_45_Callback(hObject, ~, handles)


N=size(handles.data_file(1).cdata,1);

n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;

centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid ;

max_distance=handles.max_distance;


if   findstr(char(handles.data_file(7).cdata(track_what,1)),'N')==1     %Must be labeled before running the tracking algorithm
    h = msgbox('Please allocate the Centroids and label the cells before running assoication algorithm.','Aborted');
    return
end
% str=eval(strcat('handles.data_file(3).cdata(',num2str(track_what),',1)'));
% str=str2double(str);
% if str==0
%     return
% end





prompt = {'max_distance (pixels/frame): ','Enter frame to start :','Enter frame to end:' };
dlg_title = 'Input';
num_lines = 1;
def = {num2str(max_distance),num2str(n),num2str(N ) };
answer = inputdlg(prompt,dlg_title,num_lines,def);









max_distance=str2double(char(answer(1)));
start_track =str2num(char(answer(2)));
end_track =str2num(char(answer(3))) ;
if end_track> size(centy1,2)
    end_track= size(centy1,2);
end
if start_track< 1
    start_track= 1;
end




data_file=handles.data_file;


%     calculate number of steps in the loop:


data_file(4).cdata.L(track_what).cdata.Centroid(start_track).cdata(:,4)=-1;
data_file(4).cdata.L(track_what).cdata.Centroid(start_track).cdata(:,5)=start_track-1  ;
eval(strcat('global Ch0',num2str(track_what-1),'_stack_Segmented'))

vec = start_track:end_track; %vec is the timeseries index

h=timebar_BACWrapper('Processing association. Please wait....');set(h,'color','w');

  centy1 = data_file(4).cdata.L(track_what).cdata.Centroid; 


%%%%%%%%%%%%%%%%%%%%%

if get(handles.imread_mode,'value')==1
    
    full_filename = [ data_file(2).cdata{track_what,3}, data_file(1).cdata{vec(1)},'_ch0',num2str(track_what-1),'_Segmented.tif'];
    matrix1 =  imread_cross(full_filename)   ;
    
    
    
    
    for ii = 1:length(vec) - 1 %iterate through frames
        
        timebar_BACWrapper(h,ii/length(vec))
        
        n0 = vec(ii); % t
        n1 = vec(ii + 1);% t + 1
        
        
        if  isempty(centy1(n0).cdata) ~= 1 &&  isempty(centy1(n1).cdata) ~= 1
            
            
            matrix0 = matrix1;
            
            
            full_filename = [ data_file(2).cdata{track_what,3},...
                data_file(1).cdata{n1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
            matrix1 =  imread_cross(full_filename)   ;
            
            
 data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=...
     hungarianlinker_TACWrapper(centy1(n1).cdata(:,1:2),centy1(n0).cdata(:,1:2),max_distance);
            
            
%             data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=fast_ass( matrix0,matrix1,max_distance);
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
            
        end
        if  isempty(centy1(n0).cdata)==1 &&  isempty(centy1(n1).cdata)~=1
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=-1;
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%



if get(handles.imread_mode,'value')==2
    for ii=1:length(vec)-1
        timebar_BACWrapper(h,ii/length(vec))
        
        n0=vec(ii); %5 6 7 8 9
        n1=vec(ii+1);% 6 7 8 9 10
        
        
        if  isempty(centy1(n0).cdata)~=1 &&  isempty(centy1(n1).cdata)~=1
            try
                
                eval(strcat('matrix0= Ch00_stack_Segmented(',num2str(n0),').cdata;'))
                eval(strcat('matrix1= Ch00_stack_Segmented(',num2str(n1),').cdata;'))
                
            catch
                
                
                full_filename = [ data_file(2).cdata{track_what,3}, data_file(1).cdata{n0},'_ch0',num2str(track_what-1),'_Segmented.tif'];
                matrix0 =  imread_cross(full_filename)   ;
                
                
                full_filename = [ data_file(2).cdata{track_what,3}, data_file(1).cdata{n1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
                matrix1 =  imread_cross(full_filename)   ;
            end
            
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=fast_ass( matrix0,matrix1,max_distance);
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
            
        end
        if  isempty(centy1(n0).cdata)==1 &&  isempty(centy1(n1).cdata)~=1
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=-1;
            data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
            
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%







handles.data_file=data_file;
handles.data_file(7).cdata(track_what,2) ={'Y'};
handles.data_file(7).cdata(track_what,3) ={'N'};
guidata(hObject,handles)
close(h)
update_labelmatrix(handles)



update_icons(handles)


% ---------------------------------------------------
function Untitled_46_Callback(hObject, eventdata, handles)

%global h_BacFormatics;
handles.data_file(12).cdata.split_tracks=1;
guidata(hObject,handles);



track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1; vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
nn=1;div_cells=[];
last_cell =get_last_cell_index(MATRIX);
h=waitbar(0,'splitting tracks in progress');
for iiii=1:size(handles.data_file(4).cdata.L(track_what).cdata.Centroid,2)
    if isempty(handles.data_file(4).cdata.L(track_what).cdata.Centroid(iiii).cdata)~=1
        waitbar(iiii/size(handles.data_file(4).cdata.L(track_what).cdata.Centroid,2))
        centy2 = handles.data_file(4).cdata.L(track_what).cdata.Centroid(iiii).cdata;
        for jj=1:size(centy2,1)  % .
            if str2num(num2str(centy2(jj,3)- iiii))==0.1
                clear dvec
                cell_index=2:2:(last_cell-2) ;
                dvec(:,1)= MATRIX(iiii,cell_index-1)-centy2(jj,1)  ;
                dvec(:,2)=  MATRIX(iiii,cell_index)-centy2(jj,2) ;
                cell_index= find(ismember(sum(abs(dvec),2),0)) ;
                
                try
                    MATRIX=break_track(MATRIX,iiii,2*cell_index) ;last_cell =get_last_cell_index(MATRIX);
                catch
                    cell_index;
                    msgbox(['One frame before and after division have to be associated. Linking operation terminated unexpectedly due to unresolve cell: ' num2str(cell_index)])
                    return
                end
                nn=nn+1;
            end
        end
    end
end
close(h)
M=MATRIX./MATRIX;[a,start_XY]=nanmin(M);Index= isnan(a); MATRIX(:,Index)=[];
Data.vec_temp1=MATRIX(:);
Data.vec_temp2=  find(Data.vec_temp1~=0) ;
Data.vec_temp1(Data.vec_temp1==0)=[];
Data.N=size(MATRIX,1);
Data.M=size(MATRIX,2);
set(handles.show_tracks,'userdata',Data)
% M=MATRIX./MATRIX;[a,start_XY]=nanmin(M);Index= isnan(a); MATRIX(:,Index)=[];
track_what2_Callback(hObject, eventdata, handles)
%h_BacFormatics=handles;
try
    global h_cell_tracks_window
    cell_tracks_window('Untitled_1_Callback', h_cell_tracks_window.Untitled_1,[],h_cell_tracks_window)
end
track_what2_Callback(hObject,eventdata, handles)
function m_edit_CreateFcn(~, ~, ~)
% ---------------------------------------------------
function Untitled_47_Callback(hObject, ~, handles)
point1 =get(handles.axes1,'Position');
point1=point1./2;
axes(handles.axes1);
h_rectangle = impoly(gca);
setColor(h_rectangle,[0 0.2 0.2]);
ROI= wait(h_rectangle) ;
prompt = {'Please input frame to start:','Please input frame to end:'};
dlg_title = 'Merging..';
num_lines = 1;
def = {'',''};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
answer=str2double(answer);
m    = answer(1);
n    = answer(2);
h=timebar_BACWrapper('Remove centroids. Please wait....');
set(h,'color','w');
track_what=get(handles.track_what2,'Value');
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid;
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    timebar_BACWrapper(h,ii/n)
    try
        temp_centy=centy1(ii).cdata;
        in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2));
        centy1(ii).cdata= temp_centy(ismember(in,0),:);
    end
end
handles.data_file(4).cdata.L(track_what).cdata.Centroid=  centy1 ;
guidata(hObject,handles);
%global h_BacFormatics
% h_BacFormatics=handles;
close(h)
% ---------------------------------------------------
function Untitled_48_Callback(hObject, ~, handles)
point1 =get(handles.axes1,'Position');
point1=point1./2;
axes(handles.axes1);
h_rectangle = impoly(gca);
%  setColor(h_rectangle,[0 0.2 0.2]);
ROI= wait(h_rectangle) ;
prompt = {'Please input frame to start:','Please input frame to end:'};
dlg_title = 'Merging..';
num_lines = 1;
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid ;
centy2 = handles.data_file(4).cdata.L(track_what).cdata ;
def = {num2str(n),num2str(size(centy1,2) )};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
answer=str2double(answer);
m    = answer(1);
n    = answer(2);
h=timebar_BACWrapper('Remove objects outside region. Please wait....');
set(h,'color','w');
track_what=get(handles.track_what2,'Value');
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    try
        temp_centy=centy1(ii).cdata;
        in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2));
        centy1(ii).cdata= temp_centy(ismember(in,1),:);
    end
end
handles.data_file(4).cdata.L(track_what).cdata.Centroid=  centy1 ;
clc
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    timebar_BACWrapper(h,ii/n)
    kk=1;   clear centy3 % imprtant: centry3=[] is not good here!
    for jj=1:size(centy2(ii).cdata,1);
        temp_centy= centy2(ii).cdata(jj).Centroid  ;
        in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2))  ;
        if in==1
            centy3(kk) =centy2(ii).cdata(jj)  ;  kk=kk+1;
        end
    end
    try
        centy2(ii).cdata=centy3';
    catch
        centy2(ii).cdata=[];
    end
end
close(h)
handles.data_file(4).cdata.L(track_what).cdata=  centy2  ;
guidata(hObject,handles);
%global h_BacFormatics
% h_BacFormatics=handles;
% ---------------------------------------------------
function accept_label_changes_Callback(hObject, ~, handles)
h=waitbar(0,'PLEASE WAIT ....');
max_distance=handles.max_distance;


try
    
    centy1=[];
    axes2=get(handles.axes2,'userdata');
    matrix=axes2(1).cdata ;  temp=axes2(2).cdata  ;
    box_Raw=get(handles.Raw_listbox,'string') ;
    if iscell(box_Raw)==0
        h = errordlg('No files in Raw Frame listbox','Error');
        return
    end
    n=get(handles.Raw_listbox,'value');
    
    
    
    
    filename=char(box_Raw(n))  ;
    track_what=get(handles.track_what2,'Value') ;
    pathname_Segmentation=handles.data_file(2).cdata(track_what,3) ;
    full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    full_filename_Segmentation=char(full_filename_Segmentation );
    temp_Segmentation=imread_cross(full_filename_Segmentation);
    temp_Segmentation( handles.X1:handles.X1+handles.X-1,handles.Y1:handles.Y1+handles.Y-1  )=  matrix   ;
    imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive
    L=bwlabel(temp_Segmentation,4);
    stats=regionprops(L,'Centroid') ;
    for jj=1:length(stats)
        temp_centy=[stats(jj).Centroid n] ;
        temp_centy=  (round(temp_centy.*100))./100;
        centy1(jj,:)=  temp_centy;
    end
    handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata=centy1   ;
    temp_Segmentation2=zeros(size(temp_Segmentation));
    position= handles.data_file(6).cdata ;
    temp_Segmentation2(position(2):(position(2)+position(4)-1),position(1):(position(1)+position(3)-1))  =  temp_Segmentation(position(2):(position(2)+position(4)-1),position(1):(position(1)+position(3)-1));
    L=bwlabel(temp_Segmentation2,4);
    handles.data_file(4).cdata.L(track_what).cdata(n).cdata= regionprops(L,'Area','BoundingBox','Centroid','PixelList','Orientation','Eccentricity','Perimeter','Extent','Solidity','Majoraxislength','Minoraxislength','EquivDiameter');
    for iii=1: size(handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata,1)
        handles.data_file(4).cdata.L(track_what).cdata(n).cdata(iii).Centroid= round( handles.data_file(4).cdata.L(track_what).cdata(n).cdata(iii).Centroid*100)/100 ;
    end
    guidata(hObject,handles);
    
    
    
end
vector_associated=get(handles.axess3,'userdata') ;
n=get(handles.Raw_listbox,'value')   ;
track_what=get(handles.track_what2,'Value') ;
centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid;
edit_relabel_range=handles.edit_relabel_range;
max_distance=handles.max_distance;
selective_operator=  get(handles.selective_operator,'Value');
centy1= reassociation( vector_associated,centy1,track_what,edit_relabel_range,selective_operator, max_distance,n,  handles.track_every ) ;
handles.data_file(4).cdata.L(track_what).cdata.Centroid= centy1;
guidata(hObject,handles);



%global h_BacFormatics
% h_BacFormatics=handles;
update_labelmatrix(handles)
close(h)
show_frame( handles,n,'axes');

% ---------------------------------------------------
function Untitled_50_Callback(hObject, eventdata, handles)
choice = questdlg('Are you sure you want to erase existing labeling?', ...
    'Hello User', ...
    'Yes','No','No');
% Handle response
switch choice
    case 'Yes' 
    track_what=get(handles.track_what2,'Value') ;
    str=eval(strcat('handles.data_file(3).cdata(',num2str(track_what),',1)'));
    str=str2double(str);
    if str==0
        return
    end 
    
    handles.data_file(4).cdata.L(track_what).cdata=[];
    handles.data_file(7).cdata(track_what,1) =cellstr('N'); %Now flag for track is No
    handles.data_file(7).cdata(track_what,2) =cellstr('N'); %Now flag for track is No
    handles.data_file(7).cdata(track_what,3) =cellstr('N'); %Now flag for track is No
    update_icons(handles)
    
    guidata(hObject,handles);
    
    update_labelmatrix(handles) 
Untitled_51_Callback(hObject, eventdata, handles)
end
% ---------------------------------------------------
function Untitled_51_Callback(hObject, eventdata, handles)
choice = questdlg('Are you sure you want to erase existing trajectories MATRIX?', ...
    'Hello User', ...
    'Yes','No','No');
% Handle response
switch choice
    case 'Yes'
        answer = 0;
    case 'No'
        answer = 1;
end
if answer
    return
end

h=timebar_BACWrapper('Format trajectories matrix. Please wait....');
box_Raw=get(handles.Raw_listbox,'string');
track_what=get(handles.track_what2,'Value') ;
handles.data_file(5).cdata.Tracks(track_what ).cdata =[];
set(handles.show_tracks,'userdata' ,[])
handles.data_file(7).cdata(track_what,3) =cellstr('N'); %Now flag for track is No
guidata(hObject,handles);
update_icons(handles)

%global h_BacFormatics
% h_BacFormatics=handles;
close(h)
try
    track_what2_Callback(hObject, eventdata, handles)
end

update_labelmatrix(handles)

function uipushtool55_ClickedCallback(~, ~, ~)
% ---------------------------------------------------

% ---------------------------------------------------
function Untitled_52_Callback(~, ~, handles)
z=get(handles.axess3,'userdata');
 




n=get(handles.Raw_listbox,'value')   ;
track_what=get(handles.track_what2,'Value') ;
centy1 =handles.data_file(4).cdata.L(track_what).cdata.Centroid   ;

 
try
    n_m1=centy1(n-1).cdata; disp(n_m1)
end
n_0=centy1(n).cdata; disp(n_0)
try
    n_p1=centy1(n+1).cdata; disp(n_p1)
end

save centy1 centy1
% ---------------------------------------------------
function Untitled_53_Callback(~, ~, ~)
% ---------------------------------------------------
function Untitled_55_Callback(~, ~, handles)
track_what=get(handles.track_what2,'Value') ;
centy1 =handles.data_file(4).cdata.L(track_what).cdata.Centroid;
vec=ones(1,size(centy1,2));
for ii=1:size(centy1,2)
    try
        centy1(ii).cdata(:,4:5);
    catch
        vec(ii)= 0;
    end
end
figure
plot(vec, 'Marker','*',  'LineStyle','none', 'Color',[0 0 1]);
ylim([-1 2])
% ---------------------------------------------------
function Untitled_54_Callback(~, ~, handles)
%  get all
%             open the MATRIX:
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


 
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
Data.MATRIX=MATRIX;

 

 
% %            FOLD  the MATRIX:
% Data.vec_temp1=MATRIX(:);
% Data.vec_temp2=find(Data.vec_temp1~=0);
% Data.vec_temp1(Data.vec_temp1==0)=[];
% Data.N=size(MATRIX,1);
% Data.M=size(MATRIX,2);
 
figure
imagesc(MATRIX)
set(gcf,'userdata',Data)



% --- Executes on key release with focus on figure1 or any of its controls.
function figure1_WindowKeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)
%  eventdata.Character
% eventdata.Key
stat=get(handles.slide_zoom_option,'value');
global mode_4  mode_7 mode_8 paint_matrix


if strfind(eventdata.Key ,'rightarrow')
    if stat==1
        set(handles.slide_zoom_option,'string','slide'); set(handles.slide_zoom_option,'value',0);
    end
    set(gcf,'Pointer','right')
    set(handles.mode_text,'string','Sliding frames','Visible','on')
    event.VerticalScrollCount=+1;
    figure1_WindowScrollWheelFcn([], event, handles)
    Mode = '';
    set(gcf,'Pointer','arrow')
    %     set(handles.axes1,'userdata',[])
    if stat==1
        set(handles.slide_zoom_option,'string','zoom'); set(handles.slide_zoom_option,'value',1);
    end
    
end

if strfind(eventdata.Key, 'leftarrow')
    if stat==1
        set(handles.slide_zoom_option,'string','slide'); set(handles.slide_zoom_option,'value',0);
    end
    set(gcf,'Pointer','right')
    %     set(handles.axes1,'userdata',[])
    set(handles.mode_text,'string','Sliding frames','Visible','on')
    event.VerticalScrollCount=-1;
    figure1_WindowScrollWheelFcn([], event, handles)
    Mode = '';
    set(gcf,'Pointer','arrow')
    if stat==1
        set(handles.slide_zoom_option,'string','zoom'); set(handles.slide_zoom_option,'value',1);
    end
end




% if strfind(eventdata.Key ,'alt')


% segmentation_type=get(handles.segmentation_type1,'value');
% track_what1=get(handles.track_what1,'Value') ;
% track_what=get(handles.track_what2,'Value') ;
% n=get(handles.Raw_listbox,'value');

% Projected_by =get(handles.Projected_by,'String');

% box_list=get(handles.Raw_listbox,'string');
% filename=char(box_list(n));
% [temp,centy1,full_filename]= read_image2(n,segmentation_type,Projected_by, filename,handles.data_file,track_what1,track_what);
% set(handles.edit_axes1,'String',full_filename);
% n= get(handles.Raw_listbox,'value');
% point1 = get(hObject,'CurrentPoint')  ;
% sel_typ = get(gcbf,'SelectionType')
%  box_Raw=get(handles.Raw_listbox,'string') ;
%  n=get(handles.Raw_listbox,'value')
%  filename=char(box_Raw(n))  ;
% full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
%
%         if isempty(matrix)~=1
%             full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
%             matrix=flipdim(matrix,1);
%             imwrite(matrix, full_filename_Segmentation);  %save file to hard drive
%             pushbutton27_Callback(hObject, eventdata, handles,'show_wheel')
%         end
% end

if strfind(eventdata.Key ,'downarrow')
    if stat==0
        set(handles.slide_zoom_option,'string','zoom'); set(handles.slide_zoom_option,'value',1);
    end
    set(gcf,'Pointer','right')
    set(handles.mode_text,'string','Sliding frames','Visible','on')
    event.VerticalScrollCount=+1;
    figure1_WindowScrollWheelFcn([], event, handles)
    Mode = '';
    set(gcf,'Pointer','arrow')
    if stat==0
        set(handles.slide_zoom_option,'string','slide'); set(handles.slide_zoom_option,'value',0);
    end
    
end

if strfind(eventdata.Key, 'uparrow')
    if stat==0
        set(handles.slide_zoom_option,'string','zoom'); set(handles.slide_zoom_option,'value',1);
    end
    set(gcf,'Pointer','right')
    
    set(handles.mode_text,'string','Sliding frames','Visible','on')
    event.VerticalScrollCount=-1;
    figure1_WindowScrollWheelFcn([], event, handles)
    Mode = '';
    set(gcf,'Pointer','arrow')
    if stat==0
        set(handles.slide_zoom_option,'string','slide'); set(handles.slide_zoom_option,'value',0);
    end
end


if strfind(eventdata.Key ,'d')
  set(handles.mode_text,'Visible','on')
end
    

if strfind(eventdata.Key ,'s')
    if  mode_8==1
        n=get(handles.Raw_listbox,'Value');
        
        
        switch get(handles.imread_mode,'value')
            case 1 
                global box_Raw 
                filename=char(box_Raw(n))  ;
                track_what= get(handles.track_what2,'Value') ;
	
full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
                
            case 3
                str=char(handles.data_file(1).cdata(n));
                
                ind1=findstr(str,filesep);
                ind1=ind1(end);
                pathname_raw=str(1:ind1); Filename =str(ind1+1:end);
                
                switch    get(handles.track_what2,'Value') ;
                    case 1
                       
                        pathname_Segmented=char(strcat(pathname_raw,'ch00_Segmented',filesep));
                        filename_Segmented=char(strcat(Filename ,'_ch00_Segmented.tif'));
                    case 2
                       
                        pathname_Segmented=char(strcat(pathname_raw,'ch01_Segmented',filesep'));
                        filename_Segmented=char(strcat(Filename ,'_ch01_Segmented.tif'));
                    case 3
                        
                        pathname_Segmented=char(strcat(pathname_raw,'ch02_Segmented',filesep'));
                        filename_Segmented=char(strcat(Filename ,'_ch02_Segmented.tif'));
                end
                full_filename_Segmentation=char(strcat(pathname_Segmented,filename_Segmented));
        end
        
        
                full_filename_Segmentation=regexprep(full_filename_Segmentation, '/', filesep)  ;
        
        
        if isempty(paint_matrix)~=1
            set(handles.mode_text,'string','saved painting','visible','on')
            % the new painted pixels are the difference between the
            % existing file and paint_matrix
            
            %imfill onl
            temp_bw=imread_cross(full_filename_Segmentation);
            paint_matrix2=paint_matrix;
            paint_matrix2(temp_bw==1)=0;
            paint_matrix2=imfill(paint_matrix2,'holes');
            paint_matrix(paint_matrix2==1)=1;
            imwrite(paint_matrix, full_filename_Segmentation);  %save file to hard drive
        end
    end
    
    if  mode_7~=1
        if get(handles.Automatic_labeling_option,'value')==2
            
            if get(handles.Automatic_labeling_option,'value')==2
                pushbutton27_Callback2(hObject, eventdata, handles,n)
            else
                Raw_listbox_Callback([], eventdata, handles)
            end
            
            
        else
             Raw_listbox_Callback([], eventdata, handles)
        end
    end
    
end





if strfind(eventdata.Key ,'f')
    
    n=round(get(handles.Raw_listbox,'Value')) ;
    Projected_by =get(handles.Projected_by,'String') ;
    box_Raw=get(handles.Raw_listbox,'string') ;
    track_what2=get(handles.track_what2,'Value') ;
    paint_matrix= read_image2(n ,3,Projected_by, char(box_Raw(n)), track_what2,track_what2);
    try
        show_frame( handles,n,'axes')
    end
    set(handles.showcurrentframe,'String',num2str(n ));
    
    
    
end









if isempty(strfind(eventdata.Key ,'control')) && isempty(strfind(eventdata.Modifier ,'control'))
    return
end



if strfind(eventdata.Key ,'r')
    if  mode_8==1
        pushbutton27_Callback(hObject, eventdata, handles,'relabel in mode 8')
        Update_new_cells_list_Callback(hObject, eventdata, handles)
    else
        try
        pushbutton27_Callback(hObject, eventdata, handles )
        end
    end
end



if strfind(eventdata.Key ,'a')  %associate again, in regardless to selective operator
    
    vector_associated=get(handles.axess3,'userdata') ;
    n=get(handles.Raw_listbox,'value')   ;
    track_what=get(handles.track_what2,'Value') ;
    centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid;
    edit_relabel_range=handles.edit_relabel_range;
    max_distance=handles.max_distance;
    selective_operator=  get(handles.selective_operator,'Value');
    centy1= reassociation( vector_associated,centy1,track_what,edit_relabel_range,selective_operator, max_distance,n) ;
    handles.data_file(4).cdata.L(track_what).cdata.Centroid= centy1;
    guidata(hObject,handles);
    
    
    %global h_BacFormatics;
    %     h_BacFormatics=handles;
    
    show_frame( handles,n,'axes');
    update_labelmatrix(handles)
    
    
end

if strfind(eventdata.Key ,'o')
    global mode_5
if  mode_5==1 
set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch');  
vval = select_mode5_options;
switch vval 
    case 1 
        set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch'); 
        mode5_vec= handles.mode5_vec; 
        handles.mode5_vec= [];
        guidata(hObject,handles)
        if isempty(mode5_vec)~=1
            for ii=1:length(mode5_vec)
                Val=mode5_vec(ii);
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
            end
        end 
        track_what= get(handles.track_what1,'Value') ;
        box_Raw=get(handles.Raw_listbox,'string');
        n=get(handles.Raw_listbox,'Value') ;
        filename=char(box_Raw(n))   ; 
        full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ; 
        temp_Segmentation=imread_cross( full_filename_Segmentation);
        temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation); 
        L =bwlabel(temp_Segmentation,4);
        bw=ismember(L,mode5_vec); 
        L =bwlabel(bw,4);
        s=regionprops(bw,'BoundingBox'); 
        Ignore_ROI=handles.Ignore_ROI(n).cdata; 
        for jj=1:size(s,1)
            BoundingBox=s(jj).BoundingBox;
            if isempty(Ignore_ROI)==1
                Ignore_ROI= BoundingBox;
            else
                Ignore_ROI(end+1,:)= BoundingBox;
            end
        end 
        handles.Ignore_ROI(n).cdata=Ignore_ROI;
        handles.xy_matrix =[];
    case 2 
        split_function_mode5(handles)% mark on cell
    case 3
        merge_function_mode5(handles)% mark two cells
         case 4
        merge_then_split_function_mode5(handles) % mark on cell
         case 5
             remove_function_mode5(handles) % mark on cell
    case 6
%         cla(handles.axes1)
%         [filename2put, pathname2put, filterindex]=uiputfile('*.tif','name of multistack file');
%         prompt = {'Enter first frame:','Enter last frame:'};
%         dlg_title = 'Input frames number';
%         num_lines = 1;
%         def = {'',''};
%         answer = inputdlg(prompt,dlg_title,num_lines,def);
%         start_export= str2num(char(answer(1))); %#ok<ST2NM>
%         end_export=str2num(char(answer(2))); %#ok<ST2NM>
%         % colorbar('location','north')
%         % create movie:
%         xy_matrix=handles.xy_matrix ;
%         for n= start_export:end_export
%             show_frame( handles,n,'axes') ;
%             Ind= xy_matrix(:,5)==n;
%             xy=  xy_matrix(Ind,1:4);
%             temp=getframe ;  title(num2str(n))
%             pause(0.2);
%             imwrite( temp(1).cdata ,[pathname2put filename2put],'WriteMode','append');
%             mov(n)=temp;
%             pause(0.2);
%         end
%         
%         
msgbox('under construction')        
%         
%         
end 

if vval~=6
handles.Forward=[];
handles.box_cell_ind=[];handles.box_cell_ind_Label=[];
guidata(hObject, handles);
if get(handles.Automatic_labeling_option,'value')==2
    Update_new_cells_list_Callback(hObject, eventdata, handles)
end
Raw_listbox_Callback([], eventdata, handles)
end

set(handles.edit_axes1,'string','ready','ForegroundColor','w')
end
set(gcf,'Pointer','arrow');
end



% -------------------------------------
% -------------------------------------
if strfind(eventdata.Key ,'1')
    mode_1_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'2')
   mode_2_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'3')
    mode_3_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'4')
    mode_4_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'5')
     mode_5_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'6')
    mode_6_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'7')
    mode_7_Callback(hObject, eventdata, handles)
end
if strfind(eventdata.Key ,'8')
    mode_8_Callback(hObject, eventdata, handles)
end

function Split_segment(~)
disp('under development')
% ---------------------------------------------------
function Untitled_56_Callback(~, ~, ~)


hh=centy_window;
drawnow
jframe = getjframe_BACWrapper(hh);
% on_top=get(handles.on_top,'value');
set(jframe,'AlwaysOnTop',1)
global h_centy_window
centy_window('Untitled_1_Callback', h_centy_window.Untitled_1,[],h_centy_window)
% ---------------------------------------------------
function Untitled_57_Callback(hObject, eventdata, handles)
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid ;
dlg_title = 'Format';
prompt = {'Please input frame to start:','Please input frame to end:'};
def = {num2str(n),num2str(size(centy1,2) )};
answer  = inputdlg(prompt,dlg_title,1,def);
answer=str2double(answer);
m    = answer(1);
n    = answer(2);
h=timebar_BACWrapper('Remove centroids. Please wait....');
set(h,'color','w');
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    handles.data_file(4).cdata.L(track_what).cdata(ii).cdata=[];
    handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata=[];
    timebar_BACWrapper(h,ii/n)
end
guidata(hObject,handles);
%global h_BacFormatics
% h_BacFormatics=handles
close(h)
Untitled_51_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
function Untitled_58_Callback(hObject, eventdata, handles)
%global h_BacFormatics;
n=get(handles.Raw_listbox,'Value') ;
dlg_title = 'Format';
def = {num2str(n)};
prompt = {'Please input last frame in trajectories MATRIX:'};
dlg_title = 'Delete';
num_lines = 1;
def = {' ' };
answer = inputdlg(prompt,dlg_title,num_lines,def);
answer=str2double(answer);
h=timebar_BACWrapper(['Remove trajectories from frame' num2str(answer)  '. Please wait....']);
set(h,'color','w');
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1; vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
MATRIX(:, answer*2-1:end)=[];

Data.vec_temp1=MATRIX(:);Data.vec_temp2=  find(Data.vec_temp1~=0) ; Data.vec_temp1(Data.vec_temp1==0)=[];Data.N=size(MATRIX,1);Data.M=size(MATRIX,2); set(handles.show_tracks,'userdata',Data)
guidata(hObject,handles)
track_what2_Callback(hObject, eventdata, handles)
% h_BacFormatics=handles;
function pushbutton30_Callback(~, ~, ~)
% ---------------------------------------------------

function Untitled_63_Callback(~, ~, ~)
% hObject    handle to Untitled_63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------
function Untitled_70_Callback(~, ~, ~)
% hObject    handle to New_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% hObject    handle to Colorebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------



% ---------------------------------------------------
function Robut_Module_Callback(~, ~, handles)
if isempty(handles.data_file)~=1
    run_BAC('BAC_Robust_Module',handles.data_file) ;
else
    run_BAC('BAC_Robust_Module') ;
end

% --- Executes during object creation, after setting all properties.
function axess3_CreateFcn(~, ~, ~)
% hObject    handle to axess3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function update_labelmatrix(handles)


track_what=get(handles.track_what2,'Value') ; 
global box_Raw 
sizey=size(box_Raw,1) 
try
if isempty(handles.data_file(4).cdata.L(track_what).cdata)==1 
     axes(handles.axess3)   
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ; 
    RGB=cat(3,green,red,blue); 
    imagesc(RGB)%Hitt;
    axis tight  
    vec= linspace(1,sizey,5) ;
     vec(2)=10*round(vec(2)/10);
       vec(3)=10*round(vec(3)/10);
         vec(4)=10*round(vec(4)/10);
    try
       axes(handles.axess3)   
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ; 
    RGB=cat(3,green,red,blue); 
    imagesc(RGB)%Hitt;
    axis tight  
    set(handles.axess3, 'YTickLabel',[],'YTick',[],'XColor','w', 'YColor','w','FontSize',5)
     set(handles.axess3, 'XTickLabel',{vec},'XTick',vec )
    axes(handles.axes1)
    end
    return
end
catch
          set(handles.axess3, 'YTickLabel',[],'YTick',[],'XColor','w', 'YColor','w','FontSize',5) 
    axes(handles.axes1)
    
end
try
centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid ;
 


if get(handles.selective_operator  ,'value')==3
    jj=1;
    for ii=1:sizey
        try
            centy1(ii).cdata(:,5);
            vec(jj)=ii;jj=jj+1;
        end
    end
    sizey=length(vec);
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ;
    green(1,:)=255;
    red(2,:)=255;
    RGB=cat(3,green,red,blue);
    imagesc(RGB)%Hitt;   axis tight
    set(handles.axess3,'userdata',vec);
else
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ;
    for ii=1:sizey
        try
            
            if isempty(centy1(ii).cdata)~=1
                green(1,ii)=255;
                try
                    centy1(ii).cdata(:,4:5);
                    red(2,ii)=255;
                    
                end
            end
        end
    end
    axes(handles.axess3) 
    RGB=cat(3,green,red,blue);
    imagesc(RGB)%Hitt;
    axis tight
    set(handles.axess3,'userdata',find(red(2,:)/255));
    set(handles.axess3, 'YTickLabel',[],'YTick',[],'XColor','w', 'YColor','w','FontSize',5)
     set(handles.axess3, 'XTickLabel',{1:sizey},'XTick',1:sizey )
    axes(handles.axes1)
end
catch
 axes(handles.axess3)   
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ; 
    RGB=cat(3,green,red,blue); 
    imagesc(RGB)%Hitt;
    axis tight  
    vec= linspace(1,sizey,5) ;
     vec(2)=10*round(vec(2)/10);
       vec(3)=10*round(vec(3)/10);
         vec(4)=10*round(vec(4)/10);
   try set(handles.axess3, 'YTickLabel',[],'YTick',[],'XColor','w', 'YColor','w','FontSize',5)
     set(handles.axess3, 'XTickLabel',{vec},'XTick',vec )
    axes(handles.axes1)
   end
end
% --- Executes during object creation, after setting all properties.
function nobjects_CreateFcn(~, ~, ~)

% ---------------------------------------------------
function Untitled_82_Callback(hObject, eventdata, handles)
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid ;
centy2 = handles.data_file(4).cdata.L(track_what).cdata ;
dlg_title = 'Format';
prompt = {'Please input frame to start:','Please input frame to end:','Please input minimum size:'};
def = {num2str(n),num2str(size(centy1,2) ),'user input critiria'};
answer  = inputdlg(prompt,dlg_title,1,def);
answer=str2double(answer);
m    = answer(1);
n    = answer(2);
Critiria    = answer(3);
h=timebar_BACWrapper('Remove centroids. Please wait....');
set(h,'color','w');
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    timebar_BACWrapper(h,ii/n)
    try
        X=centy1(ii).cdata.centy11(:,1);  Y=centy1(ii).cdata.centy11(:,2);
        centy22 = centy2(ii).cdata;
        for jj=1:size(centy22,1)
            if  centy22(jj).Area<Critiria
                XY=centy22(jj).Centroid;
                centy1(ii).cdata(ismember((abs(X-XY(1))+abs(Y-XY(2))),0),:)=[];
            end
        end
    end
end
handles.data_file(4).cdata.L(track_what).cdata.Centroid=  centy1 ;
guidata(hObject,handles);
%global h_BacFormatics
% h_BacFormatics=handles;
close(h)

% ---------------------------------------------------
function Untitled_84_Callback(~, ~, ~)
% hObject    handle to Untitled_84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------
function Untitled_85_Callback(hObject, eventdata, handles)
msgbox('please confirm that there is segmented grid in the selected channel')
box_list=get(handles.Raw_listbox,'string');
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what1,'Value') ;
pathname_Segmentation=handles.data_file(2).cdata(track_what,3) ;
filename_Segmentation=box_list(n)  ;
full_filename_Segmentation=char(strcat(pathname_Segmentation,    filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif'));
temp =imread_cross( full_filename_Segmentation);
temp2=bwlabel(temp);
temp2(temp2~=5)=0;
temp2=temp2./temp2;
temp2(isnan(temp2))=0;
stats=regionprops(temp2,'BoundingBox');
XY=stats(1).BoundingBox;
XY(3)=XY(1)+XY(3); XY(4)=XY(2)+XY(4);
XY =[XY(1) XY(2); XY(1) XY(4)  ;   XY(3) XY(4);  XY(3) XY(2)];
ROI=XY;
prompt = {'Please input frame to start:','Please input frame to end:'};
dlg_title = 'Merging..';
num_lines = 1;
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid ;
centy2 = handles.data_file(4).cdata.L(track_what).cdata ;
def = {num2str(n),num2str(size(centy1,2) )};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
answer=str2double(answer);
m    = answer(1);
n    = answer(2);
h=timebar_BACWrapper('Remove objects outside region. Please wait....');
set(h,'color','w');
track_what=get(handles.track_what2,'Value');
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    try
        temp_centy=centy1(ii).cdata;
        in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2));
        centy1(ii).cdata= temp_centy(ismember(in,1),:);
    end
end
handles.data_file(4).cdata.L(track_what).cdata.Centroid=  centy1 ;
for ii=m:n %2 Procced only if the complimantory Segmentation file was found
    timebar_BACWrapper(h,ii/n)
    kk=1;   clear centy3 % imprtant: centry3=[] is not good here!
    for jj=1:size(centy2(ii).cdata,1);
        temp_centy= centy2(ii).cdata(jj).Centroid  ;
        in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2))  ;
        if in==1
            centy3(kk) =centy2(ii).cdata(jj)  ;  kk=kk+1;
        end
    end
    try
        centy2(ii).cdata=centy3';
    catch
        centy2(ii).cdata=[];
    end
end
close(h)
handles.data_file(4).cdata.L(track_what).cdata=  centy2  ;
guidata(hObject,handles);
%global h_BacFormatics
% h_BacFormatics=handles;
% --- Executes on button press in mode_7.
function edit_axes1_CreateFcn(~, ~, ~)




 
function pushbutton33_Callback(~, ~, ~)
function pushbutton34_Callback(~, ~, ~)

function pushbutton36_Callback(~, ~, ~)
function pushbutton37_Callback(~, ~, ~)



% ---------------------------------------------------
function Untitled_86_Callback(hObject, eventdata, handles)


track_what=get(handles.track_what2,'Value') ;


vec = get(handles.axess3,'userdata'  )   ;
centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid ;


handles.data_file(12).cdata.split_tracks=0;



%global h_BacFormatics h_cell_tracks_window;

%  try
[Data, centy1]= Find_Tracks_vectorized(centy1,vec) ;

handles.data_file(4).cdata.L(track_what).cdata.Centroid = centy1 ;
% catch
%     msgbox('Could not run linker. Please cheack that: (1)Frames were assocoated (2)if associated is selective, change to non-Selective Mode and try again')
% end



set(handles.show_tracks,'userdata',Data)
handles.data_file(7).cdata(track_what,3) ={'Y'};
guidata(hObject,handles);
Raw_listbox_Callback([], eventdata, handles)
update_icons(handles)



function selective_operator_Callback(hObject, eventdata, handles)
try
    track_what=get(handles.track_what2,'Value') ;
    centy1 =handles.data_file(4).cdata.L(track_what).cdata.Centroid   ;
    box_Raw=get(handles.Raw_listbox,'string') ;
    sizey=size(box_Raw,1); 
    set(handles.Raw_listbox,'Value',1) ;set(handles.showcurrentframe,'String','1');
    update_labelmatrix(handles)
    figure1_WindowScrollWheelFcn([], eventdata, handles)
end
% --- Executes during object creation, after setting all properties.
function selective_operator_CreateFcn(~, ~, ~)
%
% ---------------------------------------------------
function Untitled_89_Callback(hObject, eventdata, handles)

n=get(handles.Raw_listbox,'Value') ;
box_Raw=get(handles.Raw_listbox,'string');


track_what=get(handles.track_what2,'Value') ;


str=eval(strcat('handles.data_file(3).cdata(',num2str(track_what),',1)'));
str=str2double(str);
if str==0
    return
end







handles.data_file(4).cdata.L(track_what).cdata= Find_L(handles,track_what,box_Raw,n,n ) ;


guidata(hObject,handles);
%global h_BacFormatics;h_BacFormatics=handles;
show_frame( handles,n,'axes');
update_labelmatrix(handles)



% ---------------------------------------------------
function Untitled_90_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ---------------------------------------------------
function Untitled_91_Callback(hObject, eventdata, handles)
Message={'Shortcuts and controls: '...
    'hold mouse middle button - Pan '...
    'mouse wheel - zoom/shift frames '...
    'mouse right button  - select '...
    ' right arrow - Next frame '...
    'left arrow - Previous frame '...
    'space - label frame again '...
    'A - Associate frame in selected range around n'...
    'F - Format painting  '...
    'V - Visuilize segment'...
    '____________________'...
    'Ctrl+O - Open Experiment '...
    'Ctrl+S - Save modified painting '...
    'Ctrl+L - Label cells '...
    'Ctrl+A - accept label changes for fame n '...
    'Ctrl+U - Undo association for fame n '...
    'Ctrl+R - Remove Objects '...
    'Ctrl+T - Tracking linker vectorized (default) '...
    };



h = msgbox(Message,'Help','help');
% --- Executes on selection change in Projected_by.



function max_distance_Callback(hObject, eventdata, handles)
% hObject    handle to max_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_distance as text
%        str2double(get(hObject,'String')) returns contents of max_distance as a double


% --- Executes during object creation, after setting all properties.
function max_distance_CreateFcn(hObject, eventdata, handles)




function edit_relabel_range_Callback(hObject, eventdata, handles)

function edit_relabel_range_CreateFcn(hObject, eventdata, handles)
% ---------------------------------------------------
function Untitled_94_Callback(hObject, eventdata, handles)


h=msgbox('wait...');
vector_associated=get(handles.axess3,'userdata') ;
n=get(handles.Raw_listbox,'value')   ;
track_what=get(handles.track_what2,'Value') ;
centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid;
edit_relabel_range=handles.edit_relabel_range;
max_distance=handles.max_distance;
selective_operator=  get(handles.selective_operator,'Value');
centy1= unassociation( vector_associated,centy1,track_what,edit_relabel_range,selective_operator, max_distance,n) ;
handles.data_file(4).cdata.L(track_what).cdata.Centroid= centy1;
guidata(hObject,handles);


%global h_BacFormatics;
% h_BacFormatics=handles;

show_frame( handles,n,'axes');
update_labelmatrix(handles)
% try
% centy_window('Untitled_1_Callback', h_centy_window.File,[],h_centy_window)
% end
close(h)


% --------------------------------------------------------
function pushbutton27_Callback(hObject, eventdata, handles,MODE )

set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch'); 
n=get(handles.Raw_listbox,'value')   ;
vec=get(handles.axess3,'userdata') ;
vec(end+1)=n;
vec=sort(unique(vec));
set(handles.axess3,'userdata',vec)
update_labelmatrix(handles)
%
%     'hi'
%     return
% %


box_Raw=get(handles.Raw_listbox,'string');



track_what=get(handles.track_what2,'Value') ;



if nargin==4
    
    
    filename=char(box_Raw(n))  ;
    
    full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    global paint_matrix
    if isempty(paint_matrix)~=1
        set(handles.mode_text,'string','saved painting','visible','on')
        imwrite(paint_matrix, full_filename_Segmentation);  %save file to hard drive
    end
end



data_file(4).cdata=handles.data_file(4).cdata;
pathname_Segmentation= handles.data_file(2).cdata(track_what,3)  ;
filename_Segmentation=box_Raw(n) ;
full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
temp_Segmentation=imread_cross( full_filename_Segmentation);
L=bwlabel(temp_Segmentation,4);

XYdata= regionprops(L, 'BoundingBox','Centroid');


temp_Centroid= cat(1,XYdata.Centroid);
temp_Centroid=  round(temp_Centroid*100)/100;
temp_Centroid(:,3)=n;


data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata= temp_Centroid;
data_file(4).cdata.L(track_what).cdata.BoundingBox(n).cdata=  cat(1,XYdata.BoundingBox);





try
    
    n0=n-1;
    n1=n;
    
    filename_Segmentation=box_Raw(n0) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix0=imread_cross( full_filename_Segmentation);
    
    filename_Segmentation=box_Raw(n1) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix1=imread_cross( full_filename_Segmentation);
    
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=fast_ass( matrix0,matrix1,30);
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
    
    
    
    
    
catch
    ['couldnt re-associate ' num2str(n0) ' to: ' num2str(n0)];
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=-1;
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
end
try
    
    n0=n ;
    n1=n+1;
    
    filename_Segmentation=box_Raw(n0) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix0=imread_cross( full_filename_Segmentation);
    
    filename_Segmentation=box_Raw(n1) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix1=imread_cross( full_filename_Segmentation);
    
    
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=fast_ass( matrix0,matrix1,30);
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
    
    
catch
    ['couldnt re-associate ' num2str(n0) ' to: ' num2str(n0)];
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=-1;
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
end


handles.data_file(4).cdata=data_file(4).cdata;


guidata(hObject,handles);
set(handles.edit_axes1,'string','ready','ForegroundColor','w')
Raw_listbox_Callback([], eventdata, handles)
update_labelmatrix(handles)
set(gcf,'Pointer','arrow');
% ---------------------------------------------------

% --------------------------------------------------------
function pushbutton27_Callback2(hObject, eventdata, handles,n )
nn=n;
set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch'); 
vec=get(handles.axess3,'userdata') ;
vec(end+1)=n;
vec=sort(unique(vec));
set(handles.axess3,'userdata',vec)
update_labelmatrix(handles)
%
%     'hi'
%     return
% %


box_Raw=get(handles.Raw_listbox,'string');



track_what=get(handles.track_what2,'Value') ;








switch get(handles.imread_mode,'value')
    case 1
        data_file(4).cdata=handles.data_file(4).cdata;
        pathname_Segmentation= handles.data_file(2).cdata(track_what,3)  ;
        filename_Segmentation=box_Raw(n) ;
        full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    case 2
        str=char(handles.data_file(1).cdata(n));  
        ind1=findstr(str,filesep);
        ind1=ind1(end);
        pathname_raw=str(1:ind1); Filename =str(ind1+1:end);
        filename_raw=char(strcat(Filename ,'_ch00.tif'));
        pathname_Segmented=char(strcat(pathname_raw,'ch00_Segmented',filesep));
        filename_Segmented=char(strcat(Filename ,'_ch00_Segmented.tif'));
        full_filename_Segmentation=char(strcat(pathname_Segmented,filename_Segmented));
        
end




temp_Segmentation=imread_cross( full_filename_Segmentation);



global paint_matrix
paint_matrix= temp_Segmentation;



L=bwlabel(temp_Segmentation,4);

XYdata= regionprops(L, 'BoundingBox','Centroid');


temp_Centroid= cat(1,XYdata.Centroid);
temp_Centroid=  round(temp_Centroid*100)/100;
temp_Centroid(:,3)=n;


data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata= temp_Centroid;
data_file(4).cdata.L(track_what).cdata.BoundingBox(n).cdata=  cat(1,XYdata.BoundingBox);





try
    
    n0=n-1;
    n1=n;
    
    filename_Segmentation=box_Raw(n0) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix0=imread_cross( full_filename_Segmentation);
    
    filename_Segmentation=box_Raw(n1) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix1=imread_cross( full_filename_Segmentation);
    
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=fast_ass( matrix0,matrix1,30);
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
    
    
    
    
    
catch
    ['couldnt re-associate ' num2str(n0) ' to: ' num2str(n0)];
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=-1;
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
end
try
    
    n0=n ;
    n1=n+1;
    
    filename_Segmentation=box_Raw(n0) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix0=imread_cross( full_filename_Segmentation);
    
    filename_Segmentation=box_Raw(n1) ;
    full_filename_Segmentation= char(strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
    matrix1=imread_cross( full_filename_Segmentation);
    
    
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=fast_ass( matrix0,matrix1,30);
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
    
    
catch
    ['couldnt re-associate ' num2str(n0) ' to: ' num2str(n0)];
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,4)=-1;
    data_file(4).cdata.L(track_what).cdata.Centroid(n1).cdata(:,5)=n0  ;
    
end


handles.data_file(4).cdata=data_file(4).cdata;


guidata(hObject,handles);
set(handles.edit_axes1,'string','ready','ForegroundColor','w')
%  Raw_listbox_Callback([], eventdata, handles)
update_labelmatrix(handles)
set(gcf,'Pointer','arrow');

















Update_stat=handles.flags.autosearch;


h_alert=msgbox('relabeling....please wait');
global Cell_list N_frames
Cell_list=[];





track_what=get(handles.track_what2,'Value') ;
% vec=get(handles.axess3,'userdata'  )   ;

set(handles.shift_frame,'Visible','on')

switch get(handles.popupmenu69,'value')
    
    case 1
        matrix=[];
        for ii=2:N_frames
            %             ii=vec(n);
            centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata  ;
            if ~isempty(centy1)
                
                Ind =(centy1(:,1)<100) | (centy1(:,1)>1276);
                if isempty(Ind)~=1
                    centy1(Ind ,4)=0;
                end
                
                
                Ind =(centy1(:,2)<100) | (centy1(:,2)>932);
                if isempty(Ind)~=1
                    centy1(Ind ,4)=0;
                end
                
                
                
                if Update_stat==0
                    Ignore_ROI=handles.Ignore_ROI(ii).cdata;
                    if  isempty(Ignore_ROI)~=1
                        if   size(Ignore_ROI,1)==1
                            BoundingBox=Ignore_ROI;
                            BoundingBox(3)=BoundingBox(1)+BoundingBox(3);
                            BoundingBox(4)=BoundingBox(2)+BoundingBox(4);
                            
                            Ind =(centy1(:,1)< BoundingBox(3)) & (centy1(:,1)>BoundingBox(1)) &  (centy1(:,2)<BoundingBox(4)) | (centy1(:,2)>BoundingBox(2));
                            if isempty(Ind)~=1
                                centy1(Ind ,4)=0;
                            end
                        else
                            for jj=1:size(Ignore_ROI,1)
                                BoundingBox=Ignore_ROI(jj,:);
                                BoundingBox(3)=BoundingBox(1)+BoundingBox(3);
                                BoundingBox(4)=BoundingBox(2)+BoundingBox(4);
                                
                                Ind =(centy1(:,1)< BoundingBox(3)) & (centy1(:,1)>BoundingBox(1)) &  (centy1(:,2)<BoundingBox(4)) | (centy1(:,2)>BoundingBox(2));
                                if isempty(Ind)~=1
                                    centy1(Ind ,4)=0;
                                end
                            end
                        end
                    end
                end
                
                
                
                
                
                VC=find(centy1(:,4)==-1); VC(:,2)=ii;
                if isempty(VC)~=1
                    if isempty(matrix)==1
                        matrix=VC;
                    else
                        matrix(end+1:end+size(VC,1),:)=VC;
                    end
                end
                
                
                
            end
        end
        
        
        
        
        if isempty(matrix)==1
            msgbox('Couldn`t find new merging cells!')
            
            
            
            set(handles.new_cells_data,'string', '...')
            set(handles.new_cells_data,'value', 1)
            set(handles.new_cells_data,'userdata', [])
            Cell_list =[];
            return
        end
        
        for ii=1:size(matrix,1)
            Location=  matrix(ii,1); n=matrix(ii,2) ;
            X=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(Location,1);
            Y=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(Location,2);
            matrix2(ii,1)=X;
            matrix2(ii,2)=Y;
        end
        
        
        
        
        set(handles.new_cells_data,'string', {num2str(matrix(:,2))})
        set(handles.new_cells_data,'max', size(matrix,1))
        set(handles.new_cells_data,'value', 1)
        set(handles.new_cells_data,'userdata', matrix2)
        Cell_list =matrix(:,2);
        
        
        
        
    case 2
        msgbox('under development')
    case 3
        track_what=get(handles.track_what2,'Value') ;
        Data=get(handles.show_tracks,'userdata' );
        
        
        vec_temp2=Data.vec_temp2 ;
        vec_temp1=Data.vec_temp1;
        N=Data.N  ;
        M=Data.M ;
        vec_temp3(vec_temp2)=vec_temp1;
        vec_temp3 (end+1:  M*N)=0;
        MATRIX = reshape(vec_temp3',N,M);
        
        
        
        MATRIX2=MATRIX;
        %
        %
        % figure
        % imagesc(MATRIX2)
        
        
        MATRIX2(MATRIX2>0)=1;
        
        %
        % figure
        % imagesc(MATRIX3)
        
        
        matrix=[];Cell_list=[];Counter=1;
        for ii=2:size(MATRIX2,1)
            v1= MATRIX2(ii ,:)   ;
            v0= MATRIX2(ii-1,:)   ;
            ind0=find(~v0);
            ind1=find(v1);
            appear=intersect(ind0,ind1);
            
            if  isempty(appear)~=1
                
                
                N1=length(appear)/2;
                
                for nn=1:N1
                    
                    X_n1=   MATRIX(ii,appear(nn*2-1));
                    Y_n1=   MATRIX(ii,appear(nn*2)) ;
                    
                    if X_n1>100 & X_n1<1276 & Y_n1>100 & Y_n1<932
                        
                        matrix(Counter,1)= X_n1;matrix(Counter,2)= Y_n1;
                        
                        Cell_list(Counter)=ii;
                        Counter=Counter+1;
                        
                    end
                end
            end
        end
        set(handles.new_cells_data,'string', {num2str(Cell_list')})
        set(handles.new_cells_data,'userdata', matrix)
        
    case 4
        
        track_what=get(handles.track_what2,'Value') ;
        Data=get(handles.show_tracks,'userdata' );
        
        
        vec_temp2=Data.vec_temp2 ;
        vec_temp1=Data.vec_temp1;
        N=Data.N  ;
        M=Data.M ;
        vec_temp3(vec_temp2)=vec_temp1;
        vec_temp3 (end+1:  M*N)=0;
        MATRIX = reshape(vec_temp3',N,M);
        
        
        
        MATRIX2=MATRIX;
        %
        %
        % figure
        % imagesc(MATRIX2)
        
        
        MATRIX2(MATRIX2>0)=1;
        
        %
        % figure
        % imagesc(MATRIX3)
        
        
        matrix=[];Cell_list=[];Counter=1;
        for ii=2:size(MATRIX2,1)
            v1= MATRIX2(ii ,:)   ;
            v0= MATRIX2(ii-1,:)   ;
            
            ind0=find(v0);
            ind1=find(~v1);
            disappear=intersect(ind0,ind1);
            
            
            if  isempty(disappear)~=1
                
                
                N0=length(disappear)/2;
                
                for nn=1:N0
                    X_n0=   MATRIX(ii-1,disappear(nn*2-1));
                    Y_n0=   MATRIX(ii-1,disappear(nn*2)) ;
                    
                    
                    if X_n0>100 & X_n0<1276 & Y_n0>100 & Y_n0<932
                        
                        matrix(Counter,1)= X_n0;matrix(Counter,2)= Y_n0;
                        
                        Cell_list(Counter)=ii-1;
                        Counter=Counter+1;
                        
                    end
                end
            end
        end
        set(handles.new_cells_data,'string', {num2str(Cell_list')})
        set(handles.new_cells_data,'userdata', matrix)
end

close(h_alert)

if get(handles.Automatic_labeling_option,'value')==3
    hh=new_cells_list_window;
    drawnow
    jframe = getjframe_BACWrapper(hh);
    set(jframe,'AlwaysOnTop',1)
    h_New = findobj('userdata','new_cells_list_window'); h_new_cells_list_window  =         guidata(  h_New);
    new_cells_list_window('Update_new_cells_list_Callback_window_Callback', h_new_cells_list_window.Update_new_cells_list_Callback_window,[], h_new_cells_list_window)
end



axes(handles.axes1)




try
    show_frame( handles,nn,'axes')
end


















function axess3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axess3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
track_what=get(handles.track_what2,'Value');
centy1 =handles.data_file(4).cdata.L(track_what).cdata.Centroid   ;
box_Raw=get(handles.Raw_listbox,'string') ;
sizey=size(box_Raw,1);
if get(handles.selective_operator  ,'value')==3
    jj=1;
    for ii=1:sizey
        try
            centy1(ii).cdata(:,5);
            vec(jj)=ii;jj=jj+1;
        end
    end
    sizey=length(vec);
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ;
    green(1,:)=255;
    red(2,:)=255;
    RGB=cat(3,green,red,blue);
    figure
    imagesc(RGB);  axis tight
    set(gca,'userdata',vec);
else
    green= uint8(zeros(2,sizey))  ;
    red= green  ;
    blue= green  ;
    for ii=1:sizey
        try
            if isempty(centy1(ii).cdata)~=1
                green(1,ii)=255;
                try
                    centy1(ii).cdata(:,4:5);
                    red(2,ii)=255;
                    
                end
            end
        end
    end
    RGB=cat(3,green,red,blue);
    figure
    imagesc(RGB);  axis tight
    
    
    set(gca,'userdata',find(red(2,:)/255));
end
axes(handles.axes1);


% --- Executes on button press in on_top.
function on_top_Callback(hObject, eventdata, handles)
% hObject    handle to on_top (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of on_top


 


% --- Executes during object creation, after setting all properties.
function track_length_before_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function track_length_after_CreateFcn(hObject, eventdata, handles)

function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
 'WindowButtonDownFcn'

%     normal left
%     alt right
%   open double click
%   extend mouse wheel button
%
global posmatrix Axes_in Axes_out 
sel_typ = get(gcbf,'SelectionType') ;
  point  = get(gcf,'CurrentPoint')  ;
yy=point(2) 
xx=point(1)  

 


for ii=1:size(posmatrix,1)
     eval(strcat('posmatrix(', num2str(ii),',1:4)=get(handles.axes', num2str(ii),',','''','Position','''',')'))  ;  
end
 

 
Axes=find(posmatrix(:,1)<xx & posmatrix(:,2)<yy &   xx<(posmatrix(:,1)+posmatrix(:,3))  & yy<(posmatrix(:,2)+posmatrix(:,4)));


if ~isempty(Axes) 
 Axes_in=Axes;
['inside axes: ' num2str(Axes_in)]

posmatrix( Axes_in,:)


point1(1,1)=(xx-posmatrix( Axes_in,1))/posmatrix( Axes_in,3)
point1(2,1)=point1(1,1);

point1(1,2)=1-(yy-posmatrix( Axes_in,2))/posmatrix( Axes_in,4)
point1(2,2)=point1(1,2);

point1(1,3)=0
point1(2,3)=1

 axes_ButtonDownFcn(hObject, eventdata, handles,Axes_in,point1,sel_typ)
return
else
    clc
 ['outside any axes'] 
 
 
Radius=0.03;
Left_squareX=   ((posmatrix(:,1)-Radius<=xx & posmatrix(:,1)>=xx)) 
Left_squareY= (posmatrix(:,2)-Radius<=yy & (posmatrix(:,2)+posmatrix(:,4)+Radius)>=yy) 
Left_square=Left_squareX & Left_squareY

Buttom_squareX=   ((posmatrix(:,1)<=xx & (posmatrix(:,1)+posmatrix(:,3))>=xx)) 
Buttom_squareY= (posmatrix(:,2)-Radius<=yy & posmatrix(:,2)>=yy) 
Buttom_square=Buttom_squareX & Buttom_squareY

Right_squareX=((posmatrix(:,1)+posmatrix(:,3))<=xx & (posmatrix(:,1)+posmatrix(:,3)+Radius)>=xx) 
Right_squareY=(posmatrix(:,2)-Radius<=yy & (posmatrix(:,2)+posmatrix(:,4)+Radius)>=yy) 
Right_square=Right_squareX & Right_squareY

Upper_squareX=   ((posmatrix(:,1)<=xx & (posmatrix(:,1)+posmatrix(:,3))>=xx)) 
Upper_squareY= ((posmatrix(:,2)+posmatrix(:,4))<=yy & (posmatrix(:,2)+posmatrix(:,4)+Radius)>=yy) 
Upper_square=Upper_squareX & Upper_squareY

 Axes= find(Left_square | Buttom_square |  Right_square | Upper_square)

 
 
 
 global  Axes_mode 

if  ~isempty(Axes)
    Axes_out=Axes;
    ['outside, but close to border of axes: ' num2str(Axes_out)]
    
   
  if strcmp(sel_typ,'alt')==1
      'mouse right click' 
 
Left_squareX=   ((posmatrix(Axes,1)-Radius<=xx & posmatrix(Axes,1)>=xx)) 
Left_squareY= (posmatrix(Axes,2)-Radius<=yy & (posmatrix(Axes,2)+posmatrix(Axes,4)+Radius)>=yy) 
Left_square=Left_squareX & Left_squareY

Buttom_squareX=   ((posmatrix(Axes,1)<=xx & (posmatrix(Axes,1)+posmatrix(Axes,3))>=xx)) 
Buttom_squareY= (posmatrix(Axes,2)-Radius<=yy & posmatrix(Axes,2)>=yy) 
Buttom_square=Buttom_squareX & Buttom_squareY

Right_squareX=((posmatrix(Axes,1)+posmatrix(Axes,3))<=xx & (posmatrix(Axes,1)+posmatrix(Axes,3)+Radius)>=xx) 
Right_squareY=(posmatrix(Axes,2)-Radius<=yy & (posmatrix(Axes,2)+posmatrix(Axes,4)+Radius)>=yy) 
Right_square=Right_squareX & Right_squareY

Upper_squareX=   ((posmatrix(Axes,1)<=xx & (posmatrix(Axes,1)+posmatrix(Axes,3))>=xx)) 
Upper_squareY= ((posmatrix(Axes,2)+posmatrix(Axes,4))<=yy & (posmatrix(Axes,2)+posmatrix(Axes,4)+Radius)>=yy) 
Upper_square=Upper_squareX & Upper_squareY

if Left_square
    'Left_square'
    X=posmatrix(Axes,1)
    Y=yy;
    if Y<posmatrix(Axes,2)
        Y= posmatrix(Axes,2)
    end
    if Y>posmatrix(Axes,2)+posmatrix(Axes,4)
        Y= posmatrix(Axes,2)+posmatrix(Axes,4)
    end
    
    
elseif  Buttom_square
    'Buttom_square '
    Y=posmatrix(Axes,2);
    X=xx;
    %     if Y<posmatrix(Axes,2)
    %         Y= posmatrix(Axes,2)
    %     end
    %      if Y>posmatrix(Axes,2)+posmatrix(Axes,4)
    %         Y= posmatrix(Axes,2)+posmatrix(Axes,4)
    %      end
elseif  Right_square
    'Right_square'
    X=posmatrix(Axes,1)+posmatrix(Axes,3);
    
     Y=yy;
    if Y<posmatrix(Axes,2)
        Y= posmatrix(Axes,2)
    end
    if Y>posmatrix(Axes,2)+posmatrix(Axes,4)
        Y= posmatrix(Axes,2)+posmatrix(Axes,4);
    end
elseif Upper_square
    'Upper_square '
    Y=posmatrix(Axes,2)+posmatrix(Axes,4);
    X=xx;
end
 

global moveX moveY
  clc
moveX=X-posmatrix(Axes,1)
moveY=Y-posmatrix(Axes,2)
 
     
         
      Axes_mode= 'Axes_move'
      set(gcf,'Pointer','fleur') 
      
  end
    if strcmp(sel_typ,'normal')==1
        'mouse left click' 
      
      
        xxx(1)=posmatrix(Axes_out,1);%botl
        yyy(1)=posmatrix(Axes_out,2);
        
        xxx(2)=posmatrix(Axes_out,1);%topl
        yyy(2)=posmatrix(Axes_out,2)+posmatrix(Axes_out,4);
        
        xxx(3)=posmatrix(Axes_out,1)+posmatrix(Axes_out,3);%topr
        yyy(3)=posmatrix(Axes_out,2)+posmatrix(Axes_out,4);
        
        xxx(4)=posmatrix(Axes_out,1)+posmatrix(Axes_out,3);%botr
        yyy(4)=posmatrix(Axes_out,2);
      
      
      dist=sqrt((point(1)-xxx(:)).^2+(point(2)-yyy(:)).^2) ; 
      dist= find(dist<Radius);
      if max(dist)>0
           global Xtopr Ytopr Xbotl Ybotl
           Axes_mode= 'Axes_strech'
              Xbotl=posmatrix(Axes_out,1)  ;
              Ybotl=posmatrix(Axes_out,2)  ; 
               Xtopr=posmatrix(Axes_out,1)+posmatrix(Axes_out,3) ;
               Ytopr=posmatrix(Axes_out,2)+posmatrix(Axes_out,4) ; 
      
      switch dist 
          case 1
              set(gcf,'Pointer','botl')
          case 2
              set(gcf,'Pointer','topl')
          case 3
              set(gcf,'Pointer','topr')
          case 4
              set(gcf,'Pointer','botr')
      end
 
 end
      
    end
      return
end    
      
   
      
      
      
end
  
 

 
 
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
 
    
handles.data_file(12).cdata.draw=0;guidata(hObject, handles);
% --- Executes on mouse motion over figure - except title and menu.
 
global  Axes_mode
if strcmp(Axes_mode,'Axes_move') |  strcmp(Axes_mode,'Axes_strech')
    global Axes_out posmatrix
 Axes_mode='move_off'  
    eval(strcat('Pos=get(handles.axes', num2str(Axes_out),',','''','Position','''',')'))  ; 
    posmatrix(Axes_out,1:4)=Pos;
end
 
global Axes_in
if ~isempty(Axes_in)
    eval(strcat('zoom(handles.axes',num2str(Axes_in),',','''','off','''',')'))
    eval(strcat('pan(handles.axes',num2str(Axes_in),',','''','off','''',')'))
end
global Mode Draw mode_8
Mode = '' ;Draw=0;
set(gcf,'Pointer','arrow')


global  patch_clicked 
     patch_clicked=0;
           

 



function figure1_WindowButtonMotionFcn(~, ~, handles)
     set(handles.backward_button,'BackgroundColor',[0.8 0.8 0.8] )
       set(handles.forward_button,'BackgroundColor',[0.8 0.8 0.8] )
 
    global  patch_clicked  Axes_in Axes_out
    if patch_clicked
        global this_patch x_patch y_patch  
        % Get the Mouse Location
        eval(strcat('curr_pt = get(handles.axes',num2str(Axes_in),',','''','CurrentPoint','''',');'))  
        % Change the Position of the Patch
        set(this_patch,'XData',x_patch+curr_pt(1,1),'YData',y_patch+curr_pt(1,2));
    end
    
    
    if  toc<0.05
        return
    end
    tic
    
    point_figure  = get(gcf,'CurrentPoint')  ; 
    x = point_figure(1)  ;
    y = point_figure(2)  ;
    
    global  Axes_mode   posmatrix     
    if strcmp(Axes_mode, 'Axes_strech')
        
      global Xtopr Ytopr Xbotl Ybotl
    
    % use Axes box location to create line with parent : 
        eval(['global h_Parent_' num2str(Axes_out)])  
        
        
        
        
        Pointer=get(gcf,'Pointer')
        if strcmp(Pointer,'botl')
            Pos=[x y  Xtopr-x  Ytopr-y ]
        end
         if strcmp(Pointer,'topl')
            Pos=[x Ybotl  Xtopr-x   y-Ybotl]
         end
         if strcmp(Pointer,'topr')
            Pos=[Xbotl Ybotl   x-Xbotl   y-Ybotl ]
         end
         if strcmp(Pointer,'botr')
            Pos=[Xbotl y   x-Xbotl  Ytopr-y ]
         end
         
         
        
         eval(strcat('set(handles.axes', num2str(Axes_out),',','''','Position','''',',','[',num2str(Pos),'])')) ;
   
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
       if strcmp(Axes_mode, 'Axes_move')
        global moveX moveY
    
    % use Axes box location to create line with parent : 
        eval(['global h_Parent_' num2str(Axes_out)]) 
        Pos=[x-moveX y-moveY  posmatrix(Axes_out,3)  posmatrix(Axes_out,4) ];
        eval(strcat('set(handles.axes', num2str(Axes_out),',','''','Position','''',',','[',num2str(Pos),'])')) ; 

       end
%     ###############
    
%         create the arrows:
if strcmp(Axes_mode, 'Axes_move')    |  strcmp(Axes_mode, 'Axes_strech')
    
    Parent=posmatrix(Axes_out,5);%if it has a parent (only axes 1 has no parent)
    if Parent~=0
      
        
        try
            eval(['delete(h_Parent_' num2str(Axes_out) ')'])
        end
        
       [XX,YY]=  setup_node_arrows(Pos,posmatrix,Parent);

   
        
      
        C=[0  1 0 ];
        
        
        eval(['h_Parent_' num2str(Axes_out) '=annotation(' '''' 'arrow' '''' ',[' num2str(XX) '],[' num2str(YY) '],','''','linewidth','''',',',num2str(2),',','''','color','''',',[',num2str(C) '],', '''','HeadStyle','''', ',', '''','Plain','''',')'])%Hitt
       
    end
        
        
        
         
        
        
        
        
        Child2=find(posmatrix(:,5)==Axes_out); 
        
        
        if ~isempty(Child2)
            
            for ii=1:length(Child2)
            Child=Child2(ii);
            
            eval(['global h_Parent_' num2str(Child)]) 
               try
                eval(['delete(h_Parent_' num2str(Child) ')'])
            end
      
               [XX,YY]=  setup_node_arrows(Pos,posmatrix,Child);
             
               a=YY(2); YY(2)=YY(1);YY(1)=a
                a=XX(2); XX(2)=XX(1);XX(1)=a
          
            
             C=[0 1 0 ];
          
            eval(['h_Parent_' num2str(Child) '=annotation(' '''' 'arrow' '''' ',[' num2str(XX) '],[' num2str(YY) '],','''','linewidth','''',',',num2str(2),',','''','color','''',',[',num2str(C) '],', '''','HeadStyle','''', ',', '''','Plain','''',')'])
       
            
            end
            
            
        end
        return
      end 




% if not in Axes_out mode:
    global Mode Draw mode_8 cx cy
     global  Axis_in
 Axes_in=find(posmatrix(:,1)<x  & posmatrix(:,2)<y  &    x<(posmatrix(:,1)+posmatrix(:,3))  &  y<(posmatrix(:,2)+posmatrix(:,4))); 
 if ~isempty(Axes_in)
    eval(strcat('point_axes = get(handles.axes',num2str(Axes_in),',','''','CurrentPoint','''',');')) 
    
    
    x = point_axes(2,1)  ;
    y = point_axes(2,2)  ;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
  
    
    
 
    
    
      
 
         if strcmp(Mode, 'pan')
        
        % calc change in position
        eval(strcat('[x_rel, y_rel] = abs2relCoords(handles.axes',num2str(Axes_in),', x, y)'))
          eval(strcat('[cx_rel, cy_rel] = abs2relCoords(handles.axes',num2str(Axes_in),', cx, cy)'));
        
        
        delta_x_rel = x_rel - cx_rel;
        delta_y_rel = y_rel - cy_rel;
        
        
        % set new limits
        eval(strcat('[new_xlim(1) , new_ylim(1)] = rel2absCoords(handles.axes',num2str(Axes_in),', -delta_x_rel, -delta_y_rel)'));
        eval(strcat('[new_xlim(2) , new_ylim(2)] = rel2absCoords(handles.axes',num2str(Axes_in),', 1-delta_x_rel, 1-delta_y_rel)'));
        eval(strcat('setNewLimits(handles.axes',num2str(1),', new_xlim, new_ylim)'));
%         eval(strcat('setNewLimits(handles.axes',num2str(2),', new_xlim, new_ylim)'));
%         eval(strcat('setNewLimits(handles.axes',num2str(3),', new_xlim, new_ylim)'));
%          eval(strcat('setNewLimits(handles.axes',num2str(4),', new_xlim, new_ylim)'));
%         
        
        
        return
    end
      
    
    if   mode_8==1
        
        global paint_matrix spot_size spot_type     h_paint   SE_paint
        
        
        if Draw==-1
            
            
            
            [m,n]=size( paint_matrix);
            cm=round(y);
            cn=round(x);
            
            %         SE_paint=strel(spot_type,spot_size);
            
            
            if(strcmp(cellstr(spot_type),  'square'))
                Spot_size2= spot_size-1;
                paint_matrix(round(max(cm-Spot_size2,1)):round(min(cm+Spot_size2,m)),round(max(cn-Spot_size2,1)):round(min(cn+Spot_size2,n)))= 1;
            elseif (strcmp(cellstr(spot_type),  'disk'))
                
                
                %
                Spot_size2= spot_size-1;
                
                paint_matrix(round(max(cm-Spot_size2,1)):round(min(cm+Spot_size2,m)),round(max(cn-Spot_size2,1)):round(min(cn+Spot_size2,n)))=...
                    paint_matrix(round(max(cm-Spot_size2,1)):round(min(cm+Spot_size2,m)),round(max(cn-Spot_size2,1)):round(min(cn+Spot_size2,n)))+SE_paint;
            end
            
            
            
            
            
            
            %         try
            %         paint_matrix(
            %         catch
            %             paint_matrix(round(max(cm-spot_size,1)):round(min(cm+spot_size,m)),round(max(cn-spot_size,1)):round(min(cn+spot_size,n)))= 1;
            %         end
            
            
            %         n=round(get(handles.Raw_listbox,'Value')) ;
            %         show_frame( handles,n,'axes')
            
            %
            [b2,b1]=find(paint_matrix);
            try
                delete(h_paint)
            end
            
            h_paint =line( b1,b2 ,'LineStyle','none','Marker','+')%Hitt  ;
            
            return
        end
        if Draw== 1
            
            
            [m,n]=size( paint_matrix);
            cm=round(y);
            cn=round(x);
            try
                delete(h_paint)
            end
            if(strcmp(cellstr(spot_type),  'square'))
                Spot_size2= spot_size-1;
                paint_matrix(round(max(cm-Spot_size2,1)):round(min(cm+Spot_size2,m)),round(max(cn-Spot_size2,1)):round(min(cn+Spot_size2,n)))= 0;
            elseif (strcmp(cellstr(spot_type),  'disk'))
                
                
                %
                Spot_size2= spot_size-1;
                
                paint_matrix(round(max(cm-Spot_size2,1)):round(min(cm+Spot_size2,m)),round(max(cn-Spot_size2,1)):round(min(cn+Spot_size2,n)))=...
                    paint_matrix(round(max(cm-Spot_size2,1)):round(min(cm+Spot_size2,m)),round(max(cn-Spot_size2,1)):round(min(cn+Spot_size2,n))).*~SE_paint;
            end
            %         n=round(get(handles.Raw_listbox,'Value')) ;
            %          show_frame( handles,n,'axes')
            [b2,b1]=find(paint_matrix);
            h_paint =line( b1,b2 ,'LineStyle','none','Marker','+')%Hitt  ;
            return
        end
        
    end
    
    
%     
%     XLim = get(handles.axes1, 'xlim');
%     YLim = get(handles.axes1, 'ylim');
%     if  x<XLim(1) || x>XLim(2) || y<YLim(1) || y>YLim(2)
        %     set(handles.mode_text,'Visible','off')
        
        
 else
      
        global icons_positions 
Ind=find(icons_positions(:,1)<x  & icons_positions(:,2)<y  &    x<(icons_positions(:,1)+icons_positions(:,3))  &  y<(icons_positions(:,2)+icons_positions(:,4)));
 
if ~isempty(Ind)
    Ind=Ind(1);
    if Ind~=0
str =icons_positions_str(handles.flags,Ind);
if Ind<19
 set(handles.mode_text,'string',str,'Visible','on') 
else
   set(handles.mode_text2,'string',str,'Visible','on')   
end
    end
end
  return
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x_rel, y_rel] = abs2relCoords(h_ax, x, y)
XLim = get(h_ax, 'xlim');
if strcmp(get(h_ax, 'XScale'), 'log')
    x_rel = log(x/XLim(1))/log(XLim(2)/XLim(1));
else
    x_rel = (x-XLim(1))/(XLim(2)-XLim(1));
end
YLim = get(h_ax, 'ylim');
if strcmp(get(h_ax, 'YScale'), 'log')
    y_rel = log(y/YLim(1))/log(YLim(2)/YLim(1));
else
    y_rel = (y-YLim(1))/(YLim(2)-YLim(1));
end


function [x, y] = rel2absCoords(h_ax, x_rel, y_rel)
XLim = get(h_ax, 'xlim');
if strcmp(get(h_ax, 'XScale'), 'log')
    x = exp(x_rel*log(XLim(2)/XLim(1))+log(XLim(1)));
else
    x = x_rel*diff(XLim)+XLim(1);
end
YLim = get(h_ax, 'ylim');
if strcmp(get(h_ax, 'YScale'), 'log')
    y = exp(y_rel*log(YLim(2)/YLim(1))+log(YLim(1)));
else
    y = y_rel*diff(YLim)+YLim(1);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function setNewLimits(ax, Xlim, Ylim)
validX = ~any(isnan(Xlim)) && ~any(isinf(Xlim)) && diff(Xlim)>0;
if strcmp(get(ax,'XScale'),'log')
    validX = validX && ~isinf(Xlim(2)/Xlim(1));
end
if validX
    set(ax, 'Xlim', Xlim);
else
    if strcmp(tX.Running, 'off')
        old_color = get(ax, 'YColor');
        set(ax,'YColor','r');
        tX.TimerFcn = @(x,y)set(ax,'YColor',old_color);
        start(tX);
    end
end

validY = ~any(isnan(Ylim)) && ~any(isinf(Ylim)) && diff(Ylim)>0;
if strcmp(get(ax,'YScale'),'log')
    validY = validY && ~isinf(Ylim(2)/Ylim(1));
end
if validY
    set(ax, 'Ylim', Ylim);
else
    if strcmp(tY.Running, 'off')
        old_color = get(ax, 'XColor');
        set(ax,'XColor','r');
        tY.TimerFcn = @(x,y)set(ax,'XColor',old_color);
        start(tY);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function figure1_WindowScrollWheelFcn(~, eventdata, handles)
if  toc<0.01
    return
end
tic

global Axes_in
if isempty(Axes_in)
    return
end
  eval(strcat('xy1=get(handles.axes', num2str(Axes_in),',','''','Position','''',')'))  ;  
point  = get(gcf,'CurrentPoint')  ;
 

if  get(handles.slide_zoom_option,'value')==1
     
      eval(strcat('point_axes = get(handles.axes',num2str(Axes_in),',','''','CurrentPoint','''',');')) 
    
    x = point_axes(2,1)  ;
    y = point_axes(2,2)  ;
    
    
    eval(strcat('XLim = get(handles.axes',num2str(Axes_in),',','''','xlim','''',');')) 
    eval(strcat('YLim = get(handles.axes',num2str(Axes_in),',','''','ylim','''',');')) 
    
    if  x<XLim(1) || x>XLim(2) || y<YLim(1) || y>YLim(2)
        return
    end
    
    
    
    
    sc =   eventdata.VerticalScrollCount ;
    
    if sc<0
        set(handles.mode_text,'string','Zoomed in','Visible','on')
    else
        set(handles.mode_text,'string','Zoomed out','Visible','on')
    end
    
    
    % calc change in position
    
     [x_rel, y_rel] = abs2relCoords(handles.axes1, x, y);
%     eval(strcat('[x_rel , y_rel] = rel2absCoords(handles.axes',num2str(Axes_in),', x , y )'));
    
    zoomFactor = abs(sc)*(1+20/100)^sign(sc) ;
    
    new_xlim_rel = ([0,1] - x_rel) * zoomFactor + x_rel;
    new_ylim_rel = ([0,1] - y_rel) * zoomFactor + y_rel;
    
    x1=new_xlim_rel(1);x2=new_xlim_rel(2);
    y1=new_ylim_rel(1);y2=new_ylim_rel(2);
%     [new_xlim(1) , new_ylim(1)] = rel2absCoords(handles.axes1, new_xlim_rel(1), new_ylim_rel(1));
%     [new_xlim(2) , new_ylim(2)] = rel2absCoords(handles.axes1, new_xlim_rel(2), new_ylim_rel(2));
    
        eval(strcat('[new_xlim(1) , new_ylim(1)] = rel2absCoords(handles.axes',num2str(Axes_in),', x1, y1)'));
        eval(strcat('[new_xlim(2) , new_ylim(2)] = rel2absCoords(handles.axes',num2str(Axes_in),', x2, y2)'));
        
        eval(strcat('setNewLimits(handles.axes',num2str(1),', new_xlim, new_ylim)'));
%          eval(strcat('setNewLimits(handles.axes',num2str(2),', new_xlim, new_ylim)'));
        
%     setNewLimits(handles.axes1, new_xlim, new_ylim)
%     
%     
%     
    
    
      % set new limits
         
        
        
    return
end



box_list=get(handles.Raw_listbox,'string');
sizey=size(box_list,1);


n=str2num(get(handles.showcurrentframe,  'string'))     ;


if get(handles.selective_operator  ,'value')==3
    vec=get(handles.axess3,'userdata'  );
    
    [~,N_new]=min(abs(vec-n));
    
    N_new=N_new+eventdata.VerticalScrollCount ;
    N = vec(N_new);
    
    if N> sizey || N<1
        return
    end
    set(handles.slider1,  'Value',N ); 
    set(handles.Raw_listbox,'value',N  );
    set(handles.showcurrentframe,  'string',num2str(N))      ;
    
else
    
    N=n+eventdata.VerticalScrollCount    ;
    if N> sizey || N<1
        return
    end
    
    
    set(handles.Raw_listbox,'value',N); Raw_listbox_Callback([], eventdata, handles) 
    
end
return
n=N; %#ok<*UNRCH>


if eventdata.VerticalScrollCount==1
    set(handles.forward_button,'Visible','on')
    set(handles.backward_button,'Visible','off')
elseif eventdata.VerticalScrollCount==-1
    set(handles.forward_button,'Visible','off')
    set(handles.backward_button,'Visible','on')
end







function figure1_KeyPressFcn(hObject, eventdata, handles)
if  toc<0.1
    return
end
tic


if strcmp(eventdata.Key,'shift')==1
    global Mode
    Mode = 'Sliding-frames' ;
    set(gcf,'Pointer','right')
    set(handles.mode_text,'string','Sliding frames','Visible','on')
end


% --- Executes on key release with focus on figure1 and none of its controls.
function figure1_KeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was released, in lower case
 
global Mode
Mode = '' ;
set(handles.mode_text,'Visible','off')
set(handles.mode_text2,'Visible','off')
set(gcf,'Pointer','arrow')
% handles    structure with handles and user data (see GUIDATA)






% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton50.
function pushbutton50_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function track_length_after_Callback(hObject, eventdata, handles)
% hObject    handle to track_length_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of track_length_after as text
%        str2double(get(hObject,'String')) returns contents of track_length_after as a double



function track_length_before_Callback(hObject, eventdata, handles)
% hObject    handle to track_length_before (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of track_length_before as text
%        str2double(get(hObject,'String')) returns contents of track_length_before as a double


% --- Executes on button press in forward_button.
function forward_button_Callback(hObject, eventdata, handles)
% hObject    handle to forward_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.forward_button,'value',1)
set(handles.backward_button,'value',0)
set(handles.backward_button,'BackgroundColor',[0.8 0.8 0.8] )
 set(handles.forward_button,'BackgroundColor',[0.8 0.8 0.8] )
global hTimer
try
    import java.awt.Robot;
    import java.awt.event.*;
    SimKey=Robot;
    SimKey.keyPress(KeyEvent.VK_CONTROL);
    SimKey.keyPress(KeyEvent.VK_C);
    SimKey.keyRelease(KeyEvent.VK_CONTROL);
    SimKey.keyRelease(KeyEvent.VK_C);
end
try
    
    stop(hTimer);
end
try
    delete(timerfindall('tag','animationTimer'));
    
end


clear SimKey
Period=str2num(get(handles.Period,'string'));



% Create timer object for animation

hTimer = timer(...
    'ExecutionMode'       , 'fixedSpacing', ...
    'ObjectVisibility'    , 'off', ...
    'Tag'                 , 'animationTimer', ...
    'StartFcn'            , @startTimer, ...
    'StopFcn'             , @stopTimer, ...
    'TimerFcn'            , @updateTimer, ...
    'Period'              , Period, ...
    'UserData'            , hObject);

% Start animation timer
start( hTimer);



% hObject    handle to forward_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)











% --- Executes on button press in backward_button.
function backward_button_Callback(hObject, eventdata, handles)
% hObject    handle to backward_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.backward_button,'value',1)
set(handles.forward_button,'value',0)
set(handles.backward_button,'BackgroundColor',[0.8 0.8 0.8] )
 set(handles.forward_button,'BackgroundColor',[0.8 0.8 0.8] )


global hTimer
try
    import java.awt.Robot;
    import java.awt.event.*;
    SimKey=Robot;
    SimKey.keyPress(KeyEvent.VK_CONTROL);
    SimKey.keyPress(KeyEvent.VK_C);
    SimKey.keyRelease(KeyEvent.VK_CONTROL);
    SimKey.keyRelease(KeyEvent.VK_C);
end
try
    
    stop(hTimer);
end
try
    delete(timerfindall('tag','animationTimer'));
    
end


clear SimKey
Period=str2num(get(handles.Period,'string'));



% Create timer object for animation

hTimer = timer(...
    'ExecutionMode'       , 'fixedSpacing', ...
    'ObjectVisibility'    , 'off', ...
    'Tag'                 , 'animationTimer', ...
    'StartFcn'            , @startTimer, ...
    'StopFcn'             , @stopTimer, ...
    'TimerFcn'            , @updateTimer, ...
    'Period'              , Period, ...
    'UserData'            , hObject);

% Start animation timer
start( hTimer);



% hObject    handle to forward_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)













% ---------------------------------------------------



% ---------------------------------------------------



% --- Executes on button press in icon_1.
function icon_1_Callback(hObject, eventdata, handles)
Open_Experiment_Callback(hObject, eventdata, handles)

% --- Executes on button press in icon_2.
function icon_2_Callback(hObject, eventdata, handles)
Save_Experiment_Callback(hObject, eventdata, handles)

% --- Executes on button press in icon_3.
function icon_3_Callback(hObject, eventdata, handles)

Relabel_the_cells_Callback(hObject, eventdata, handles)
iImage = imread('Label_8.png'); % icon file name (.png) has to be equal to icon name
dImage = double(iImage(:,:,1));
dImage = dImage./max(dImage(:)); dImage=dImage ;
dImage=cat(3,dImage ,dImage*0,dImage*0);
set(handles.icon_3, 'cdata',  dImage  )


% --- Executes on button press in icon_4.
function icon_4_Callback(hObject, eventdata, handles)



function icon_5_Callback(hObject, eventdata, handles)
Untitled_45_Callback(hObject, [], handles)
% ---------------------------------------------------
iImage = imread('Link_9.png'); % icon file name (.png) has to be equal to icon name
dImage = double(iImage(:,:,1));
dImage = dImage./max(dImage(:)); dImage=dImage ;
dImage=cat(3,dImage*0,dImage,dImage*0);
set(handles.icon_5, 'cdata',  dImage  )
% --- Executes on button press in icon_8.
function icon_6_Callback(hObject, eventdata, handles)
 
 
    
 

 
function icon_7_Callback(hObject, eventdata, handles)
Untitled_86_Callback(hObject, eventdata, handles)

iImage = imread('Track_10.png'); % icon file name (.png) has to be equal to icon name
dImage = double(iImage(:,:,1));
dImage = dImage./max(dImage(:)); dImage=dImage ;
dImage=cat(3,dImage*0,dImage*0,dImage );
set(handles.icon_7, 'cdata',  dImage  )

function icon_8_Callback(hObject, eventdata, handles)







mode7_vec=handles.mode7_vec;
handles.mode7_vec= [];
guidata(hObject,handles)




if isempty(mode7_vec)~=1
    
    
    h=timebar_BACWrapper('Update trajectories, Please wait....');
    
     
    
    
    n=get(handles.Raw_listbox,'value')   ;
    track_what=get(handles.track_what2,'Value')  
    centy0 =handles.data_file(4).cdata.L(track_what).cdata.Centroid(n-1).cdata 
    centy1 =handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata 
    
    
    for ii=1:length(mode7_vec)
        ii
        Val=mode7_vec(ii);
        %             try
        eval(['global h_imline_mode7_' num2str(Val)])
        
        pos_1234= eval([' h_imline_mode7_' num2str(Val) '.getPosition']);%get position of each line
        pos_12=[pos_1234(2) pos_1234(4)];
        %
        XY= (( centy0(:,1)-pos_12(1)).^2+ (centy0(:,2)-pos_12(2)).^2).^2    ;
        
        centy1(Val,4)= find(ismember(XY,(min(XY)))) ;
        
        
        eval( ['delete(h_imline_mode7_' num2str(Val) ')'])
        %             end
    end
 


handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata=  centy1 ;


guidata(hObject,handles);
close(h)
delete( findobj(gca,'Type','text'))
Update_new_cells_list_Callback(hObject, eventdata, handles)

% Raw_listbox_Callback([], eventdata, handles)

end



















































% --- Executes on button press in icon_9.
function icon_9_Callback(hObject, eventdata, handles)

% box_Raw=get(handles.Raw_listbox,'string')   ;
%
% n=get(handles.Raw_listbox,'value')   ;
% filename=char(box_Raw(n))  ;
% framePos = getpixelposition(handles.axes2)
% framePos(2)= framePos(2)*1.09;
% framePos(4)= framePos(4)/1.15;
% h=figure('color','w','units','pixels','position',  framePos,'numbertitle','off', 'name',char(filename),'colormap',handles.c)
% hold on
% show_frame(ff
% box('on')
n=get(handles.Raw_listbox,'value')   ;
show_frame(handles,n,'figure')

% --- Executes on button press in icon_10.
function icon_10_Callback(hObject, eventdata, handles)

% ---------------------------------------------------
function Untitled_105_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




 
function Red_factor_Callback(hObject, eventdata, handles)
Red_factor=get(handles.Red_factor,'value');
set(handles.Red_factor_edit,'string',num2str(Red_factor))
Raw_listbox_Callback([], [], handles) 
function Red_factor_CreateFcn(hObject, eventdata, handles) 
function Green_factor_Callback(hObject, eventdata, handles)
Green_factor=get(handles.Green_factor,'value');
set(handles.Green_factor_edit,'string',num2str(Green_factor))
Raw_listbox_Callback([], [], handles) 
function Green_factor_CreateFcn(hObject, eventdata, handles) 
function Blue_factor_Callback(hObject, eventdata, handles)
Blue_factor=get(handles.Blue_factor,'value');
set(handles.Blue_factor_edit,'string',num2str(Blue_factor))
Raw_listbox_Callback([], [], handles) 
function Blue_factor_CreateFcn(hObject, eventdata, handles) 
function Red_factor_edit_CreateFcn(hObject, eventdata, handles)
function Green_factor_edit_CreateFcn(hObject, eventdata, handles) 
function Blue_factor_edit_CreateFcn(hObject, eventdata, handles) 
function Vis_option_Callback(hObject, eventdata, handles) 
Raw_listbox_Callback([], [], handles)  
function Vis_option_CreateFcn(hObject, eventdata, handles) 
function figure1_ButtonDownFcn(hObject, eventdata, handles) 
function segmentation_type_33_Callback(hObject, eventdata, handles) 
Raw_listbox_Callback([], [], handles) 
function segmentation_type_33_CreateFcn(hObject, eventdata, handles) 
function track_what_33_Callback(hObject, eventdata, handles) 
Raw_listbox_Callback([], [], handles) 
function track_what_33_CreateFcn(hObject, eventdata, handles)  
function track_what_22_Callback(hObject, eventdata, handles) 
Raw_listbox_Callback([], [], handles) 
function track_what_22_CreateFcn(hObject, eventdata, handles) 
function segmentation_type_22_Callback(hObject, eventdata, handles) 
Raw_listbox_Callback([], [], handles) 
function segmentation_type_22_CreateFcn(hObject, eventdata, handles) 
function Red_factor_DeleteFcn(hObject, eventdata, handles)   
    function slider1_Callback(hObject, ~, handles)
 function slider1ContValCallback(hFigure,eventdata)
       handles = guidata(hFigure) ; 
     
n = round(get(handles.slider1,'Value'))  
 
 


 
    if  toc<0.05
        return
    end
    tic
    
    m=str2num(get(handles.showcurrentframe,'String'))
    set(handles.showcurrentframe,'String',num2str(n ));
    if m>n
      set(handles.backward_button,'BackgroundColor',[0  1 0 ])
      set(handles.forward_button,'BackgroundColor',[0.8 0.8 0.8] )
    
elseif n>m
    set(handles.forward_button,'BackgroundColor',[0  1 0 ])
      set(handles.backward_button,'BackgroundColor',[0.8 0.8 0.8] )
     
else
      set(handles.backward_button,'BackgroundColor',[0.8 0.8 0.8] )
       set(handles.forward_button,'BackgroundColor',[0.8 0.8 0.8] )
    end
    
 
 vec=get(handles.axess3,'userdata'  )   ; 

if get(handles.selective_operator  ,'value')==3
    [~,N]=min(abs(vec-n));
    if vec(N)~=n
        return
    end
end
  
    
     axes(handles.axes1)
set(handles.axes1,'userdata',[])
global paint_matrix
 


Projected_by =get(handles.Projected_by,'String') ;

box_Raw=get(handles.Raw_listbox,'string') ;
track_what2=get(handles.track_what2,'Value') ;
shift_frame=str2num(get(handles.shift_frame,'string'));
if n==1
    shift_frame=0;
end
paint_matrix= read_image2(n-shift_frame ,3,Projected_by, char(box_Raw(n-shift_frame)), track_what2,track_what2);



try
      show_frame( handles,n,'axes')
end

set(handles.Raw_listbox,'value',n);
global N_frames
str=char([num2str(n) filesep num2str(N_frames)])
set(handles.mode_text,'Visible','on')
set(handles.mode_text,'String',str);

 


 

 return
 
 

%         drawnow('expose');

%
% --- Executes on button press in slide_zoom_option.
function slide_zoom_option_Callback(hObject, eventdata, handles)
% hObject    handle to slide_zoom_option (see GCBO)
if get(hObject,'value')==1
    set(hObject,'string','zoom')
    set(hObject,'ForeGroundColor',[1 1 0])
else
    set(hObject,'string','slide')
    set(hObject,'ForeGroundColor',[0 1 1])
end 
% ---------------------------------------------------
function Untitled_112_Callback(hObject, eventdata, handles) 
track_what=get(handles.track_what1,'value');
centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid;
vec=zeros(1,size(centy1,2));
for ii=1:size(centy1,2)
    try
        size(centy1(ii).cdata,1)
        vec(ii)=size(centy1(ii).cdata,1);
    end
end

if get(handles.selective_operator,'value')  == 1
    
    msgbox('function requires selective_operator = 2')
end


vector_associated=get(handles.axess3,'userdata');
vec3=nan(size(vec));
vec3(vector_associated)=1;
vec=vec.*vec3   ;
%
% diff_vec=abs(diff(vec));
% diff_vec(diff_vec<30)=0;diff_vec(diff_vec>0)=1;
% Ind=find(diff_vec)


%%the next code lines were not written by R.S (validated and works): 
% Cook's Distance for a given data point measures the extent to
% which a regression model would change if this data point
% were excluded from the regression. Cook's Distance is
% sometimes used to suggest whether a given data point might be an outlier.

% Use regstats to calculate Cook's Distance

Y=vec'; X=1:length(Y);X=X'; 
stats = regstats(Y,X,'linear'); 
% if Cook's Distance > n/4 is a typical treshold that is used to suggest
% the presence of an outlier
potential_outlier = stats.cookd > 1/length(X);
potential_outlier = X(potential_outlier); 
% figure
% % Display the index of potential outliers and graph the results
% X(potential_outlier)
% scatter(X,Y, 'b.')
% hold on
% scatter(X(potential_outlier),Y(potential_outlier), 'r.')
%%




for ii=1:length(potential_outlier)
    vector_associated=get(handles.axess3,'userdata');
    n=potential_outlier(ii);
    
    edit_relabel_range=handles.edit_relabel_range;
    max_distance=handles.max_distance;
    selective_operator=  get(handles.selective_operator,'Value');
    centy1= unassociation( vector_associated,centy1,track_what,edit_relabel_range,selective_operator, max_distance,n) ;
    handles.data_file(4).cdata.L(track_what).cdata.Centroid= centy1;
    guidata(hObject, handles);
    update_labelmatrix(handles)
    
end 
% ---------------------------------------------------
function Untitled_119_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_119 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global box_Raw
box_Raw= handles.data_file(1).cdata(:,1) ;

global data_file_2
data_file_2=handles.data_file(2).cdata;





h=waitbar(0,'Saving data as global variables');


% global box_Raw
% box_Raw=get(handles.Raw_listbox,'string') ;
%
% global data_file_2
% data_file_2=handles.data_file(2).cdata;
%
%
%
%




track_length_before=str2num(get(handles.track_length_before,'String'));
track_length_after=str2num(get(handles.track_length_after,'String'));


track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' ) ;
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

for n=1:size(MATRIX,1)
    X=MATRIX(n,1:2:end); Y=MATRIX(n,2:2:end);
    vecN=find(X>0)  ;
    X=X(X>0); Y=Y(Y>0);
    
    eval(char(strcat('global  vecN_',num2str(n))))
    eval(char(strcat(' vecN_',num2str(n),'=vecN;')));
    
    eval(char(strcat('global  vecX_',num2str(n))))
    eval(char(strcat(' vecX_',num2str(n),'=X;')));
    
    
    eval(char(strcat('global  vecY_',num2str(n))))
    eval(char(strcat(' vecY_',num2str(n),'=Y;')));
    
end
%      before we start we need to allocare for each cell from the MATRIX of trajectories
% its color

CC=distinguishable_colors_BACWrapper(64,'k');


for rr=1:M/2
    [~,randval]=sort(rand(1,64));randval=randval(1);
    C(rr,:)=CC(randval,:);
end






for Cell=1:M/2
    
    
    waitbar(2*Cell/M )
    
    
    
    
    
    
    temp_vec_X=MATRIX(:,2*Cell-1);
    temp_vec_Y=MATRIX(:,2*Cell);
    
    IND=find(temp_vec_X>0);
    
    
    
    
    
    
    
    IND_cell_apear=IND(1);
    IND_cell_disapear=IND_cell_apear+IND(end)-1;
    
    
    for jj=IND_cell_apear:IND_cell_disapear
        Ind_start=jj-track_length_before ;
        Ind_end=jj+track_length_after ;
        
        
        
        if Ind_start<IND_cell_apear
            Ind_start=IND_cell_apear;
        end
        
        if Ind_end> IND_cell_disapear
            Ind_end=IND_cell_disapear;
        end
        
        if Ind_start<1
            Ind_start=1;
        end
        if Ind_end>N
            Ind_end=N;
        end
        
        
        
        vec_X=temp_vec_X(Ind_start:Ind_end);
        vec_X(isnan( vec_X))=[]; vec_X( vec_X<=0)=[] ;
        vec_Y=temp_vec_Y(Ind_start:Ind_end);
        vec_Y(isnan( vec_Y))=[]; vec_Y( vec_Y<=0)=[] ;
        
        
        
        n=jj;
        %
        try
            kkkk=size(dataX(n).cdata,2)+1;
        catch
            kkkk=1;
        end
        
        %
        dataX(n).cdata(kkkk).cdata=uint16(vec_X) ;
        dataY(n).cdata(kkkk).cdata=uint16(vec_Y) ;
        dataColormap(n).cdata(kkkk).cdata=C(Cell,:);
        
        
        
        
        
        
        
    end
    
end

close(h)





h=timebar_BACWrapper('Render trajectories. Please wait....');
for n=1:N
    timebar_BACWrapper(h,n/N)
    DataX= dataX(n).cdata   ;
    DataY= dataY(n).cdata ;
    DataColormap= dataColormap(n).cdata ;
    
    for kk=1:size(DataX,2)
        
        
        maxi=0;
        
        if maxi<length(DataX(kk).cdata)
            maxi=length(DataX(kk).cdata);
        end
    end
    
    
    
    matrixX=nan(maxi,size(  DataX,2) );
    matrixY=nan(maxi,size(  DataX,2) );
    matrixColormap=nan(size(  DataColormap,2),3);
    
    for kk=1:size(DataX,2)
        matrixX(1:length(DataX(kk).cdata),kk)=DataX(kk).cdata;
        matrixY(1:length(DataY(kk).cdata),kk)=DataY(kk).cdata;
        matrixColormap(kk,1:length(DataColormap(kk).cdata))=DataColormap(kk).cdata;
    end
    
    
    matrixX( matrixX==0)=nan;  matrixY( matrixY==0)=nan;
    
    
    
    
    
    eval(char(strcat('global  matrixX_',num2str(n))))
    eval(char(strcat(' matrixX_',num2str(n),'=matrixX;')));
    
    eval(char(strcat('global  matrixY_',num2str(n))))
    eval(char(strcat(' matrixY_',num2str(n),'=matrixY;')));
    
    eval(char(strcat('global  matrixColormap_',num2str(n))))
    eval(char(strcat(' matrixColormap_',num2str(n),'=matrixColormap;')));
    
end
close(h)



handles.flags.Xdata_global=1; guidata(hObject, handles);





















function togglebutton1_CreateFcn(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function togglebutton2_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function togglebutton3_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function togglebutton4_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function togglebutton5_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function togglebutton6_CreateFcn(hObject, eventdata, handles)
 
function togglebutton1_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
    set(hObject,'BackgroundColor','k')
end
  Raw_listbox_Callback([], eventdata, handles) 
function togglebutton2_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
    set(hObject,'BackgroundColor','k')
end
  Raw_listbox_Callback([], eventdata, handles) 
function togglebutton3_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
    set(hObject,'BackgroundColor','k')
end
  Raw_listbox_Callback([], eventdata, handles)
function togglebutton4_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
    set(hObject,'BackgroundColor','k')
end
  Raw_listbox_Callback([], eventdata, handles)  
function togglebutton5_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
    set(hObject,'BackgroundColor','k')
end
  Raw_listbox_Callback([], eventdata, handles)
function togglebutton6_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    set(hObject,'BackgroundColor',[0  0.2   0  ])
else
    set(hObject,'BackgroundColor','k')
end
  Raw_listbox_Callback([], eventdata, handles)


function togglebutton1_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,1)
function togglebutton2_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,2)
function togglebutton3_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,3)
function togglebutton4_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,4)
function togglebutton5_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,5)
function togglebutton6_ButtonDownFcn(hObject, eventdata, handles)
Togglebutton(hObject, eventdata, handles,6)



function Togglebutton(hObject, eventdata, handles,Togglebutton_ind)

cell_list=[];
n=get(handles.Raw_listbox,'value');
axes(handles.axes1);
% global h_rectangle
h_rectangle = impoly(gca);
setColor(h_rectangle,[0 0.8 0.2]);
ROI= wait(h_rectangle) ;


track_what=get(handles.track_what2,'Value') ;




temp_centy  =handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata;




in=inpolygon( temp_centy(:,1), temp_centy(:,2),ROI(:,1),ROI(:,2));
temp_centy=temp_centy(in,1:2);


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


data.cell_list    =    cell_list;

gate_name_str = inputdlg('Please give the gate a name');

eval(char(strcat('set(handles.togglebutton',num2str(Togglebutton_ind),',''userdata','''',' , data)')))
eval(char(strcat('set(handles.togglebutton',num2str(Togglebutton_ind),',''string','''',' , gate_name_str)')))
eval(char(strcat('set(handles.togglebutton',num2str(Togglebutton_ind),',''ForegroundColor','''',' , data.color)')))


show_frame( handles,n,'axes')  ;





% --- Executes on button press in togglebutton5.
function togglebutton7_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton5


% --- Executes on button press in togglebutton6.
function togglebutton8_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton6


% ---------------------------------------------------
function Untitled_120_Callback(hObject, eventdata, handles)
global box_Raw
box_Raw= handles.data_file(1).cdata(:,1) ;

global data_file_2
data_file_2=handles.data_file(2).cdata;


h=waitbar(0,'Saving data as global variables');


track_length_before=str2num(get(handles.track_length_before,'String'));
track_length_after=str2num(get(handles.track_length_after,'String')) ;

track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

%      before we start we need to allocare for each cell from the MATRIX of trajectories
% its color
C =ones(M/2,3);



if get(handles.togglebutton1,'value')==1
    Data=get(handles.togglebutton1,'userdata');
    if isempty(Data)~=1
        cell_list=Data.cell_list;
        
        if isempty(cell_list)~=1
            for rr=1:length(Data.cell_list)
                Ind=Data.cell_list(rr);
                C(Ind,:)=Data.color ;
            end
        end
    end
end


if get(handles.togglebutton2,'value')==1
    Data=get(handles.togglebutton2,'userdata');
    if isempty(Data)~=1
        cell_list=Data.cell_list;
        if isempty(cell_list)~=1
            for rr=1:length(Data.cell_list)
                Ind=Data.cell_list(rr);
                C(Ind,:)=Data.color ;
            end
        end
    end
end


if get(handles.togglebutton1,'value')==1
    Data=get(handles.togglebutton1,'userdata');
    if isempty(Data)~=1
        cell_list=Data.cell_list;
        if isempty(cell_list)~=1
            for rr=1:length(Data.cell_list)
                Ind=Data.cell_list(rr);
                C(Ind,:)=Data.color ;
            end
        end
    end
end




if get(handles.togglebutton2,'value')==1
    Data=get(handles.togglebutton2,'userdata');
    if isempty(Data)~=1
        cell_list=Data.cell_list;
        if isempty(cell_list)~=1
            for rr=1:length(Data.cell_list)
                Ind=Data.cell_list(rr);
                C(Ind,:)=Data.color ;
            end
        end
    end
end



if get(handles.togglebutton3,'value')==1
    Data=get(handles.togglebutton3,'userdata');
    if isempty(Data)~=1
        cell_list=Data.cell_list;
        if isempty(cell_list)~=1
            for rr=1:length(Data.cell_list)
                Ind=Data.cell_list(rr);
                C(Ind,:)=Data.color ;
            end
        end
    end
end


if get(handles.togglebutton4,'value')==1
    Data=get(handles.togglebutton4,'userdata');
    if isempty(Data)~=1
        cell_list=Data.cell_list;
        if isempty(cell_list)~=1
            for rr=1:length(Data.cell_list)
                Ind=Data.cell_list(rr);
                C(Ind,:)=Data.color ;
            end
        end
    end
end

for Cell=1:M/2
    waitbar(2*Cell/M )
    temp_vec_X=MATRIX(:,2*Cell-1);
    temp_vec_Y=MATRIX(:,2*Cell);
    
    IND=find(temp_vec_X>0);
    IND_cell_apear=IND(1);
    IND_cell_disapear=IND_cell_apear+IND(end)-1;
    
    
    for jj=IND_cell_apear:IND_cell_disapear
        Ind_start=jj-track_length_before ;
        Ind_end=jj+track_length_after ;
        
        
        
        if Ind_start<IND_cell_apear
            Ind_start=IND_cell_apear;
        end
        
        if Ind_end> IND_cell_disapear
            Ind_end=IND_cell_disapear;
        end
        
        if Ind_start<1
            Ind_start=1;
        end
        if Ind_end>N
            Ind_end=N;
        end
        
        
        
        vec_X=temp_vec_X(Ind_start:Ind_end);
        vec_X(isnan( vec_X))=[]; vec_X( vec_X<=0)=[] ;
        vec_Y=temp_vec_Y(Ind_start:Ind_end);
        vec_Y(isnan( vec_Y))=[]; vec_Y( vec_Y<=0)=[] ;
        
        
        
        n=jj;
        %
        try
            kkkk=size(dataX(n).cdata,2)+1;
        catch
            kkkk=1;
        end
        
        %
        dataX(n).cdata(kkkk).cdata=uint16(vec_X) ;
        dataY(n).cdata(kkkk).cdata=uint16(vec_Y) ;
        dataColormap(n).cdata(kkkk).cdata=C(Cell,:);
    end
end

close(h)

h=timebar_BACWrapper('Render trajectories. Please wait....');
for n=1:N
    timebar_BACWrapper(h,n/N)
    DataX= dataX(n).cdata   ;
    DataY= dataY(n).cdata ;
    DataColormap= dataColormap(n).cdata ;
    
    for kk=1:size(DataX,2)
        maxi=0;
        
        if maxi<length(DataX(kk).cdata)
            maxi=length(DataX(kk).cdata);
        end
    end
    
    matrixX=nan(maxi,size(  DataX,2) );
    matrixY=nan(maxi,size(  DataX,2) );
    matrixColormap=nan(size(  DataColormap,2),3);
    
    for kk=1:size(DataX,2)
        matrixX(1:length(DataX(kk).cdata),kk)=DataX(kk).cdata;
        matrixY(1:length(DataY(kk).cdata),kk)=DataY(kk).cdata;
        matrixColormap(kk,1:length(DataColormap(kk).cdata))=DataColormap(kk).cdata;
    end
    
    matrixX( matrixX==0)=nan;  matrixY( matrixY==0)=nan;
    
    eval(char(strcat('global  matrixX_',num2str(n))))
    eval(char(strcat(' matrixX_',num2str(n),'=matrixX;')));
    
    eval(char(strcat('global  matrixY_',num2str(n))))
    eval(char(strcat(' matrixY_',num2str(n),'=matrixY;')));
    
    eval(char(strcat('global  matrixColormap_',num2str(n))))
    eval(char(strcat(' matrixColormap_',num2str(n),'=matrixColormap;')));
    
end
close(h)
handles.flags.Xdata_global=1; guidata(hObject, handles);


% --- Executes on selection change in new_cells_data.
function new_cells_data_Callback(hObject, eventdata, handles)
% hObject    handle to new_cells_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns new_cells_data contents as cell array
%        contents{get(hObject,'Value')} returns selected item from new_cells_data
Cell=get(handles.new_cells_data,'value')  ;
Cell_str=get(handles.new_cells_data,'String')  ;
Cell=str2num(Cell_str{Cell});
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
n=get(handles.Raw_listbox,'value');
X=MATRIX(n,Cell*2-1);Y=MATRIX(n,Cell*2);
global paint_matrix
Projected_by =get(handles.Projected_by,'String') ;
box_Raw=get(handles.Raw_listbox,'string') ;
track_what2=get(handles.track_what2,'Value') ;
[paint_matrix]= read_image2(n ,3,Projected_by, char(box_Raw(n)),track_what2,track_what2);
show_frame( handles,n,'axes')
set(handles.showcurrentframe,'String',num2str(n ));
axes(handles.axes1)
limx=[X-handles.new_cells_data_lim/3  X+handles.new_cells_data_lim/3];
limy=[Y-handles.new_cells_data_lim/3  Y+handles.new_cells_data_lim/3];
xlim(limx);ylim(limy)
return

Cell=get(handles.new_cells_data,'value')  ;
Cell_str=get(handles.new_cells_data,'String')  ;
% size(Cell_str)
% 
% pause
n=str2num(Cell_str{Cell});



matrix=get(handles.new_cells_data,'userdata') ;
X=matrix(Cell,1);Y=matrix(Cell,2);
track_what=get(handles.track_what2,'Value') ;
set(handles.Raw_listbox,'value',n)







global paint_matrix

n=round(get(handles.Raw_listbox,'Value')) ;

Projected_by =get(handles.Projected_by,'String') ;

box_Raw=get(handles.Raw_listbox,'string') ;
track_what2=get(handles.track_what2,'Value') ;
[paint_matrix]= read_image2(n ,3,Projected_by, char(box_Raw(n)),track_what2,track_what2);










show_frame( handles,n,'axes')
set(handles.showcurrentframe,'String',num2str(n ));

axes(handles.axes1)
limx=[X-handles.new_cells_data_lim  X+handles.new_cells_data_lim];
limy=[Y-handles.new_cells_data_lim  Y+handles.new_cells_data_lim];

xlim(limx);ylim(limy)

% --- Executes during object creation, after setting all properties.
function new_cells_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to new_cells_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over new_cells_data.
function new_cells_data_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to new_cells_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.new_cells_data_lim=70;
guidata(hObject, handles);



% ---------------------------------------------------
function Untitled_122_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_122 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% ---------------------------------------------------
function Untitled_124_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_124 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_125_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------
function Untitled_127_Callback(hObject, eventdata, handles)
Untitled_170_Callback(hObject, eventdata, handles)
    data_file=handles.data_file;
global MATRIX_data_direction MATRIX_data  





track_what=1;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

MATRIX_data_direction= nan(size(MATRIX,1),size(MATRIX,2)/2);
MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating direction and velocity data....');
for ii=1:size(MATRIX,2)/2 %for each cell
       timebar_BACWrapper(h,ii/(size(MATRIX,2)/2))
    temp_ve
    c_X=MATRIX(:,2*ii-1); Vx= nandiff(temp_vec_X'); %or try without ' (only temp_vec)
    temp_vec_Y=MATRIX(:,2*ii); Vy= nandiff(temp_vec_Y'); %or try without ' (only temp_vec)'
    for jj=1:length(Vx)
        MATRIX_data_direction(jj, ii)=VxVy2angle(Vx(jj),Vy(jj));
    end
end

   close(h)
% 
% length_before=str2num(get(handles.track_length_before,'String'));
% length_after=str2num(get(handles.track_length_after,'String'));
% 
% if  length_before+length_after~=0
%     h=timebar_BACWrapper('creating MA....');
%     for ii=1:size(MATRIX,2)/2 %for each cell
%         timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
%         MATRIX_data_direction(:, ii)=   movavg(MATRIX_data_direction(:, ii),length_before,length_after)  ;
%     end
%     close(h)
% end

% need to show histogram to help the user to decide:
max_direction = 360;
MATRIX_data_direction(MATRIX_data_direction>max_direction)=max_direction;
MATRIX_data=MATRIX_data_direction;

MATRIX_data_direction6=MATRIX_data_direction; 
save MATRIX_data_direction6 MATRIX_data_direction6

load   MATRIX_data_labeled_Spotx_movie6 
load   MATRIX_data_labeled_Spoty_movie6   
MATRIX_data_labeled_Spotx_movie=MATRIX_data_labeled_Spotx_movie6;
MATRIX_data_labeled_Spoty_movie=MATRIX_data_labeled_Spoty_movie6;

track_what2=3;
MATRIX_data_SpotI=nan(size(MATRIX_data_labeled_Spotx_movie));
global N_frames box_Raw
for ii=1:N_frames 
    filename_Segmentation=box_Raw(ii) ;
    pathname_Segmentation2=handles.data_file(2).cdata(track_what2,2)  ;   
    full_filename_Segmentation2= strcat(pathname_Segmentation2,filename_Segmentation,'_ch0',num2str(track_what2-1),'_Filtered.tif') ;                  
    full_filename_Segmentation2=char(full_filename_Segmentation2) ;                  
    matrix=imread_cross( full_filename_Segmentation2);   
    
    vecx=MATRIX_data_labeled_Spotx_movie(ii,:);
    vecy=MATRIX_data_labeled_Spoty_movie(ii,:);
   
     
    for jj=1:length(vecx)
     if vecx(jj)~=0 & ~isnan(vecx(jj))
%          matrix(vecx(jj),vec(jj)) 
         MATRIX_data_SpotI(ii, jj)= matrix(vecx(jj),vecy(jj));
    end
    end
end

  MATRIX_data_SpotI6=MATRIX_data_SpotI;
  save MATRIX_data_SpotI6 MATRIX_data_SpotI6
    
    
% ---------------------------------------------------
function Untitled_130_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_130 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_131_Callback(hObject, eventdata, handles)

choice = questdlg('Do you want to run the analysis module?','Hello User','Yes','No','Yes');
switch choice
    case 'No'
        return
end

global data_file MATRIX MATRIX_data_velocity MATRIX_data_displacement  MATRIX_data_direction   MATRIX_data_orientation  MATRIX_data_MajorAxisLength




data_file=handles.data_file;

track_what=1;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);





for ii=1:6
    eval(char(strcat('global  togglebutton_value_',num2str(ii))))
    eval(char(strcat('togglebutton_value= get(handles.togglebutton',num2str(ii),',''value'')')));
    eval(char(strcat(' togglebutton_value_',num2str(ii),'=togglebutton_value;')));
    
    eval(char(strcat('global  togglebutton_userdata_',num2str(ii))))
    eval(char(strcat('togglebutton_userdata= get(handles.togglebutton',num2str(ii),',''userdata'')')));
    eval(char(strcat(' togglebutton_userdata_',num2str(ii),'=togglebutton_userdata;')));
    
    eval(char(strcat('global  togglebutton_ForegroundColor_',num2str(ii))))
    eval(char(strcat('togglebutton_ForegroundColor= get(handles.togglebutton',num2str(ii),',''ForegroundColor'')')));
    eval(char(strcat(' togglebutton_ForegroundColor_',num2str(ii),'=togglebutton_ForegroundColor;')));
    
    eval(char(strcat('global  togglebutton_BackgroundColor_',num2str(ii))))
    eval(char(strcat('togglebutton_BackgroundColor= get(handles.togglebutton',num2str(ii),',''BackgroundColor'')')));
    eval(char(strcat(' togglebutton_BackgroundColor_',num2str(ii),'=togglebutton_BackgroundColor;')));
    
    
    eval(char(strcat('global  togglebutton_String_',num2str(ii))))
    eval(char(strcat('togglebutton_String= get(handles.togglebutton',num2str(ii),',''String'')')));
    eval(char(strcat(' togglebutton_String_',num2str(ii),'=togglebutton_String;')));
end

 
analysis_options_interface
% ---------------------------------------------------
function Untitled_137_Callback(hObject, eventdata, handles) 
File_renamer 
function Untitled_139_Callback(hObject, eventdata, handles) 
function Untitled_142_Callback(hObject, eventdata, handles)
  % ---------------------------------------------------  
merging_bacteria_cells_function(handles.data_file)
box_Raw=get(Raw_listbox,'string') ;
read_global_stack([1 0 0])

function Generate_Callback(hObject, eventdata, handles)
% ---------------------------------------------------
function Mesh_Callback(hObject, eventdata, handles)
% hObject    handle to Mesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function [xx,yy,zz] = evolve_cell_segments(p1,p2,R) 

 p3=(p1+p2)/2;
 p3(:,3)=R; 
 p1(:,3)=0;p2(:,3)=0; 
%        plot3(p1(:,1),p1(:,2),p1(:,3),'ro'); 
%        hold on;
%        plot3(p2(:,1),p2(:,2),p2(:,3),'go');
%        plot3(p3(:,1),p3(:,2),p3(:,3),'bo'); 
 
 [center,rad,v1,v2] = circlefit3d(p1,p2,p3);
xx=[];
yy=[];
zz=[];
Counter=1;
% jjj=[0 60 120 180 240 300]
jjj=[0 30 60 90 120 160 180  210 240  270 300 330]

      for iiii=1:12 % 2 is resolution parameter that was set manually by R.S
          
          a = (jjj(iiii))/180*pi; 
          x = center(:,1)+sin(a)*rad.*v1(:,1)+cos(a)*rad.*v2(:,1);
          y = center(:,2)+sin(a)*rad.*v1(:,2)+cos(a)*rad.*v2(:,2);
          z = center(:,3)+sin(a)*rad.*v1(:,3)+cos(a)*rad.*v2(:,3); 
          xx(Counter,:)=x;
          yy(Counter,:)=y;
          zz(Counter,:)=z;
          Counter=Counter+1;
      end
      
% ---------------------------------------------------
function Detect_polar_points_Callback(hObject, eventdata, handles) 
global N_frames box_Raw
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  
% Extract line segments based on Hough transform to detect polar points
% FillGap and MinLength are parameters for the  Hough Line
% XY_data= handles.data_file(4).cdata.L(track_what).cdata;

prompt = {'Number of pixels to thick around cells: ','FillGap : ','MinLength: ','Enter frame to start :','Enter frame to end:' };
dlg_title = 'Input';
num_lines = 1;
def = {num2str(0),num2str(3),num2str(7),num2str(n),num2str(N_frames) };
answer = inputdlg(prompt,dlg_title,num_lines,def); 
Thick=str2double(char(answer(1)));
handles.Detect_polar_points_param_Thick=Thick;
FillGap=str2double(char(answer(2)));
MinLength=str2double(char(answer(3)));
start_track =str2num(char(answer(4)));
end_track =str2num(char(answer(5))) ;

if end_track> N_frames
    end_track= N_frames;
end
if start_track< 1
    start_track= 1;
end 
 
pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper(char(['Detect polar points to frames: ' num2str(start_track) ':' num2str(end_track) ' . Please wait....']));
set(h,'color','w');

 
set(handles.Generate_Centerline,'Enable','on') 
handles.data_file(14).cdata.flags.Generate_Centerline=1;


set(handles.Generate_Mesh,'Enable','off')
 handles.data_file(14).cdata.flags.Generate_Mesh=0;
  
 set(handles.detect_z_ring_and_centerline_junction,'Enable','off') 
handles.data_file(14).cdata.flags.detect_z_ring_and_centerline_junction=0;  



choice = questdlg(['Do you want to cheak if there are non-filled regions within the cell segments:?'],'Hello User','Yes','No','Yes');
 
 
        
        
for ii=start_track:end_track % 
    
    set(handles.mode_text,'String',[num2str(ii) filesep num2str(end_track-start_track+1)],'Visible','on') 
    filename_Segmentation=box_Raw(ii) ;
    full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;
    full_filename_Segmentation=char(full_filename_Segmentation) ;
    bw=imread_cross( full_filename_Segmentation); 
    
    
    
    
    
    switch choice
    case 'Yes'
    if ~isfill(bw)  
  bw2=imfill(bw,'holes');
   bw2(bw==1)=0;  
        close(h)
        figure(1)
        imagesc(bw)
        hold on
        [X,Y]=find(bw2);
        plot(Y,X ,'rx','LineWidth',2,  'MarkerSize',5 )
        colormap(gray)
        title(char(['binary image contains non-filled cells in frame: ' num2str(ii)]))
        msgbox(char(['binary image contains non-filled cells in frame: ' num2str(ii) '. Please fix these cells segments and try again']))
        return
    end
    end
   
    if Thick>0
        bw=bwmorph(bw,'thick',Thick);  %only option. In some cases can improve the accurcy
    end
    L=bwlabel(bw,4);
    XY_data=regionprops(L,'BoundingBox', 'Centroid','BoundingBox','MajorAxisLength','MinorAxisLength','Orientation');
    
    
    Pole1_x=[];
    Pole1_y=[];
    Pole2_x=[];
    Pole2_y=[];
    X1_vec=[];
    Y1_vec=[];
    
    Position=get(h,'Position');
    Position(2)=Position(2)+100;
    h2=timebar_BACWrapper('Please wait....');
    set(h2,'color','w');
    set(h2,'Position',Position)
    
    

for jj=1:max(L(:))%197:197%249
    timebar_BACWrapper(h2,jj/max(L(:))) 
    XY=XY_data(jj).BoundingBox;
    
    
    if (XY(1)+XY(3))>size(L,2)
        XY(1)=floor(XY(1));
    end
    if (XY(2)+XY(4))>size(L,1)
        XY(2)=floor(XY(2));
    end
    X1=round(XY(2)) ;
    Y1=round(XY(1));
    X2=round(XY(2)+XY(4));
    Y2=round(XY(1)+XY(3));
    ROI_bw=  L(X1:X2,Y1:Y2) ;
    ROI_bw=ROI_bw==jj; 
        ROI_perim=bwperim(ROI_bw);
        ROI_bw2=ROI_bw;
        try
            [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength);
        catch
            try
                ROI_bw2=bwmorph(ROI_bw,'thicken',1);
                [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw2,FillGap,MinLength);
            catch
                try
                    ROI_bw2=bwmorph(ROI_bw,'thicken',2);
                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw2,FillGap,MinLength);
                catch
                    try
                        ROI_bw2=bwmorph(ROI_bw,'thicken',3);
                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw2,FillGap,MinLength);
                    catch
                        r=0.4*XY_data(jj).MajorAxisLength;
                        theta=XY_data(jj).Orientation;
                        if theta>=0 &  theta<=90 ;
                            theta=     -  theta +180;
                        end
                        if theta<0 &  theta>=-90;
                            theta =     -  theta +180;
                        end
                        x=XY_data(jj).Centroid(:,1);
                        y=XY_data(jj).Centroid(:,2);
                        pole1_y =  x  + r .* cosd( theta)  ;
                        pole1_x=   y + r .* sind( theta)   ;
                        pole2_y =  x  + r .* cosd( theta+180)  ;
                        pole2_x =  y  + r .* sind( theta+180)  ;
                        [Y,X]=find(ROI_perim);
                        [~,ind_min1]=min((((Y-pole1_y).^2)+((X-pole1_x).^2)));pole1_y=Y(ind_min1);pole1_x=X(ind_min1);
                        [~,ind_min2]=min((((Y-pole2_y).^2)+((X-pole2_x).^2)));pole2_y=Y(ind_min2);pole2_x=X(ind_min2);
                        
                        fprintf(1,'Could only estimate the polar points of this cell segment %d.\n',jj)   
                        
                        
                end
            end
        end
        
    end
        Pole1_x(jj) = pole1_x;
        Pole1_y(jj) = pole1_y;
        Pole2_x(jj) = pole2_x;
        Pole2_y(jj) = pole2_y;
        X1_vec(jj)=X1;
        Y1_vec(jj)=Y1; 
    
end
%     end
    close(h2)
    handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(ii).cdata=Pole1_x;
    handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(ii).cdata=Pole1_y;
    handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(ii).cdata=Pole2_x;
    handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(ii).cdata=Pole2_y;
    
  
    
    handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata=X1_vec;
    handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata=Y1_vec;
       guidata(hObject, handles);
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
end 
 
 
close(h)
 
show_frame( handles,n,'axes')  ;
% ---------------------------------------------------
function Generate_Centerline_Callback(hObject, eventdata, handles) 
global N_frames box_Raw
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  
try
Thick=handles.Detect_polar_points_param_Thick  ;
catch
    
    Thick=0;
end
% XY_data= handles.data_file(4).cdata.L(track_what).cdata;

% prompt = {'Steps: ','Number of points between pixels (range from 1 to 5): ','spans: ','smooth distance vector: ','Enter frame to start :','Enter frame to end:' };

prompt = {'Number of points between pixels(values between 1 and 10. 1 is fastest,10 more precise): ','smooth distance vector (values between 1 and 100. 1 is fastest,100 smoothest): ','Enter frame to start :','Enter frame to end:' };
dlg_title = 'Input';
num_lines = 1;
def = {num2str(1),num2str(30),num2str(n),num2str(N_frames) };
answer = inputdlg(prompt,dlg_title,num_lines,def);  

% Steps=str2double(char(answer(1)));
Steps=0.5;
Npoints=str2double(char(answer(1)));Npoints=round(Npoints);
Spans=str2double(char(answer(2)));Spans=round(Spans);
Spans_distance_vector=500;
% Spans_distance_vector=str2double(char(answer(4)));
start_track =str2num(char(answer(3)));
end_track =str2num(char(answer(4))) ;
if end_track> N_frames
    end_track= N_frames;
end
if start_track< 1
    start_track= 1;
end 
 choice = questdlg(['Do you want to abort if could not find centerline:?'],'Hello User','Yes','No','Yes');

pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper('Interpolate centerline. Please wait....');
set(h,'color','w');
  
set(handles.Generate_Mesh,'Enable','on')  
handles.data_file(14).cdata.flags.Generate_Mesh=1;

for ii=start_track:end_track % 
    
    set(handles.mode_text,'String',[num2str(ii) filesep num2str(end_track-start_track+1)],'Visible','on') 
    filename_Segmentation=box_Raw(ii) ;
    full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;
    full_filename_Segmentation=char(full_filename_Segmentation) ;
    bw=imread_cross( full_filename_Segmentation);
     
    
   
    
    bw=bwmorph(bw,'thick',Thick);  %only option
    L=bwlabel(bw,4);
    S=regionprops(L,'Centroid','BoundingBox','MajorAxisLength');
    
    Pole1_x=handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(ii).cdata;
    Pole1_y=handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(ii).cdata;
    Pole2_x=handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(ii).cdata;
    Pole2_y=handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(ii).cdata;
      
    
    Cell_centerline=[];
    Dist_cell_centerline=[];
    Cell_radiusCurvature=[];
    
    
    
 Position=get(h,'Position');
  Position(2)=Position(2)+100;
  h2=timebar_BACWrapper('Please wait....');
set(h2,'color','w'); 
  set(h2,'Position',Position)
  jjj=1
    for jj=1:max(L(:)) 
        
           timebar_BACWrapper(h2,jj/max(L(:)))
       
  
       
        XY=S(jj).BoundingBox;
        
        
        if (XY(1)+XY(3))>size(L,2)
            XY(1)=floor(XY(1));
        end
        if (XY(2)+XY(4))>size(L,1)
            XY(2)=floor(XY(2));
        end
        X1=round(XY(2)) ;
        Y1=round(XY(1));
        X2=round(XY(2)+XY(4));
        Y2=round(XY(1)+XY(3));
        ROI_bw=  L(X1:X2,Y1:Y2) ;
        ROI_bw=ROI_bw==jj; 
        
      
        
        try        
        ROI_perim=bwperim(ROI_bw);
        pole1_x= Pole1_x(jj);
        pole1_y= Pole1_y(jj);
        pole2_x= Pole2_x(jj);
        pole2_y= Pole2_y(jj);            
        [cell_centerline,dist_cell_centerline]=interpolate_backbone(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y,Steps,Npoints*round(S(jj).MajorAxisLength),Spans ); 
       
        catch
            try
                
                ROI_bw=bwmorph(ROI_bw,'thicken',1);
                
                
                FillGap=3;MinLength=7; %defaults settings set by R.S.
                try
                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength);
                catch
                    try
                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength-1);
                    catch
                        try
                            [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength-2);
                        catch
                            try
                                [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap-1,MinLength);
                            catch
                                try
                                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap-1,MinLength-1);
                                catch
                                    try
                                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap-1,MinLength-2);
                                    catch
                                        XY_data=regionprops(ROI_bw,'Centroid','MajorAxisLength','MinorAxisLength','Orientation');
                                        r=0.4*XY_data.MajorAxisLength;
                                        theta=XY_data.Orientation;
                                        if theta>=0 &  theta<=90 ;
                                            theta=     -  theta +180;
                                        end
                                        if theta<0 &  theta>=-90;
                                            theta =     -  theta +180;
                                        end
                                        x=XY_data.Centroid(:,1);
                                        y=XY_data.Centroid(:,2);
                                        pole1_y =  x  + r .* cosd( theta)  ;
                                        pole1_x=   y + r .* sind( theta)   ;
                                        pole2_y =  x  + r .* cosd( theta+180)  ;
                                        pole2_x =  y  + r .* sind( theta+180)  ;
                                        [X,Y]=find(bwperim(ROI_bw));
                                        [~,ind_min1]=min((((Y-pole1_y).^2)+((X-pole1_x).^2)));pole1_y=Y(ind_min1);pole1_x=X(ind_min1);
                                        [~,ind_min2]=min((((Y-pole2_y).^2)+((X-pole2_x).^2)));pole2_y=Y(ind_min2);pole2_x=X(ind_min2);
                                    end
                                end
                            end
                        end
                    end
                end
                
                
            
                
                
                ROI_perim=bwperim(ROI_bw);
                [cell_centerline,dist_cell_centerline]=interpolate_backbone(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y,Steps,Npoints*round(S(jj).MajorAxisLength),Spans );
                
     
            catch
               
                try
                
                  
                 ROI_bw=imclose(ROI_bw,strel('disk',2)); 
                 ROI_bw=bwmorph(ROI_bw,'thicken',2);
                 
                FillGap=3;MinLength=7; %defaults settings set by R.S.
                try
                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength);
                catch
                    try
                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength-1);
                    catch
                        try
                            [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap,MinLength-2);
                        catch
                            try
                                [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap-1,MinLength);
                            catch
                                try
                                    [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap-1,MinLength-1);
                                catch
                                    try
                                        [pole1_x,pole1_y,pole2_x,pole2_y] = find_cell_poles(ROI_bw,FillGap-1,MinLength-2);
                                    catch
                                        XY_data=regionprops(ROI_bw,'Centroid','MajorAxisLength','MinorAxisLength','Orientation');
                                        r=0.4*XY_data.MajorAxisLength;
                                        theta=XY_data.Orientation;
                                        if theta>=0 &  theta<=90 ;
                                            theta=     -  theta +180;
                                        end
                                        if theta<0 &  theta>=-90;
                                            theta =     -  theta +180;
                                        end
                                        x=XY_data.Centroid(:,1);
                                        y=XY_data.Centroid(:,2);
                                        pole1_y =  x  + r .* cosd( theta)  ;
                                        pole1_x=   y + r .* sind( theta)   ;
                                        pole2_y =  x  + r .* cosd( theta+180)  ;
                                        pole2_x =  y  + r .* sind( theta+180)  ;
                                        [X,Y]=find(bwperim(ROI_bw));
                                        [~,ind_min1]=min((((Y-pole1_y).^2)+((X-pole1_x).^2)));pole1_y=Y(ind_min1);pole1_x=X(ind_min1);
                                        [~,ind_min2]=min((((Y-pole2_y).^2)+((X-pole2_x).^2)));pole2_y=Y(ind_min2);pole2_x=X(ind_min2);
                                    end
                                end
                            end
                        end
                    end
                end
                 
                
                
                ROI_perim=bwperim(ROI_bw);
                [cell_centerline,dist_cell_centerline]=interpolate_backbone(ROI_perim,pole1_x,pole1_y,pole2_x,pole2_y,Steps,Npoints*round(S(jj).MajorAxisLength),Spans );
                
                
                catch
              
    
    switch choice
    case 'Yes' 
        close(h)
        figure(1)
        imagesc(bw)
        hold on
        bw2=L==jj;
        [X,Y]=find(bw2);
        plot(Y,X ,'rx','LineWidth',2,  'MarkerSize',5 )
        colormap(gray)
        str=['Centerline could not be estimated for aberrant cell/segment shape ' num2str(jj) ' in frame '  num2str(ii)];
        title(str)
        msgbox(char([str '. Please fix these cells segments and try again']))
        return
            end
                end
              end
        end
        
        
           dist_cell_centerline(dist_cell_centerline<median(dist_cell_centerline))=median(dist_cell_centerline);
           dist_cell_centerline=smooth(dist_cell_centerline,Spans_distance_vector);
              dist_cell_centerline(dist_cell_centerline<median(dist_cell_centerline))=median(dist_cell_centerline);
           dist_cell_centerline=smooth(dist_cell_centerline,Spans_distance_vector);
          
              
              
              
        Cell_centerline(jjj).cdata=cell_centerline;
        Dist_cell_centerline(jjj).cdata=dist_cell_centerline; 
        Cell_radiusCurvature(jjj).cdata=radiusCurvature_BACWrapper(cell_centerline(:,1), cell_centerline(:,2));
         cell_centerline(:,1)=cell_centerline(:,1)+X1-1;
         cell_centerline(:,2)=cell_centerline(:,2)+Y1-1;
        if jjj==1
            Vercat_Cell_centerline= cell_centerline;
        else 
            Vercat_Cell_centerline= vertcat(Vercat_Cell_centerline, cell_centerline) ;         
        end
        
        jjj=jjj+1;
      
 
    end
    close(h2)
    handles.data_file(4).cdata.L(track_what).cdata.Cell_centerline(ii).cdata=Cell_centerline;
    handles.data_file(4).cdata.L(track_what).cdata.Vercat_Cell_centerline(ii).cdata=Vercat_Cell_centerline;
    handles.data_file(4).cdata.L(track_what).cdata.Dist_cell_centerline(ii).cdata=Dist_cell_centerline;
    handles.data_file(4).cdata.L(track_what).cdata.Cell_radiusCurvature(ii).cdata=Cell_radiusCurvature;
    guidata(hObject, handles);
    
 timebar_BACWrapper(h,ii/(end_track-start_track+1))
 
    
end


 

close(h) 
show_frame( handles,n,'axes')  ;
% ---------------------------------------------------
function Generate_Mesh_Callback(hObject, eventdata, handles)

    
global N_frames  
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  

 
prompt = {'jumps coeff: ','Number of breaks: ','spans 1: ','Iteration: ','spans 2: ','Enter frame to start :','Enter frame to end:' };




dlg_title = 'Input';
num_lines = 1;
def = {num2str(1),num2str(10),num2str(50),num2str(0),num2str(50),num2str(n),num2str(N_frames) };
answer = inputdlg(prompt,dlg_title,num_lines,def);  


 


jumps_coeff=str2double(char(answer(1)));
Nbreaks=str2double(char(answer(2)));
Span1=str2double(char(answer(3)));
Iteration=str2double(char(answer(4)));
Span2=str2double(char(answer(5)));
start_track =str2num(char(answer(6)));
end_track =str2num(char(answer(7))) ;
if end_track> N_frames
    end_track= N_frames;
end
if start_track< 1
    start_track= 1;
end 
%  
% pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper('Generate mesh. Please wait....');
set(h,'color','w');
  
  Cell_centerline_stack= handles.data_file(4).cdata.L(track_what).cdata.Cell_centerline;
Dist_cell_centerline_stack=handles.data_file(4).cdata.L(track_what).cdata.Dist_cell_centerline;



 
 
set(handles.detect_z_ring_and_centerline_junction,'Enable','on') 
handles.data_file(14).cdata.flags.detect_z_ring_and_centerline_junction=1;
for ii=start_track:end_track %  
 
    Cell_centerline= Cell_centerline_stack(ii).cdata;
    Dist_cell_centerline=Dist_cell_centerline_stack(ii).cdata;
    
    X1=handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata;
    Y1=handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata;
    
    temp_Centroid=[];
    
    
    Position=get(h,'Position');
    Position(2)=Position(2)+100;
    h2=timebar_BACWrapper('Please wait....');
    set(h2,'color','w');
    set(h2,'Position',Position)
     jj_counter=1;
    for jj=1:size(Cell_centerline,2)
      timebar_BACWrapper(h2,jj/(size(Cell_centerline,2)))
        
        cell_centerline=Cell_centerline(jj).cdata;
        dist_cell_centerline=Dist_cell_centerline(jj).cdata;
        
        
    try
%         
        [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour(cell_centerline,dist_cell_centerline,jumps_coeff,Nbreaks,Span1) ; 
%         for iii=1:Iteration 
%             cell_mesh(:,1)=smooth(cell_mesh(:,1), Span2,'rlowess' )  ;
%             cell_mesh(:,2)=smooth(cell_mesh(:,2), Span2,'rlowess' )  ;
%             cell_mesh(:,3)=smooth(cell_mesh(:,3), Span2,'rlowess' )  ;
%             cell_mesh(:,4)=smooth(cell_mesh(:,4), Span2,'rlowess' )  ; 
%             dist_cell_centerline=sqrt((cell_mesh(:,3)-cell_mesh(:,1)).^2+(cell_mesh(:,4)-cell_mesh(:,2)).^2)  
%             [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour( [(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2],dist_cell_centerline, 1,Nbreaks,Span1);
%         end
    catch
   try 
              cell_centerline(:,1)=smooth(cell_centerline(:,1), 100,'rlowess' )  ;
              cell_centerline(:,2)=smooth(cell_centerline(:,2), 100,'rlowess' )  ;
%              
               dist_cell_centerline =10*ones(size(dist_cell_centerline)); 
             [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour(cell_centerline,dist_cell_centerline,jumps_coeff*2,Nbreaks,Span1) ; 
%  catch
%  
   end
%         
   end
       
             
         try    
             
             
        
            Cell_centerline(jj).cdata=cell_centerline;
%         Dist_cell_centerline(jj).cdata=dist_cell_centerline; 
        
         cell_centerline(:,1)=cell_centerline(:,1)+X1(jj)-1;
         cell_centerline(:,2)=cell_centerline(:,2)+Y1(jj)-1;
        if  jj_counter==1
            Vercat_Cell_centerline= cell_centerline;
        else 
            Vercat_Cell_centerline= vertcat(Vercat_Cell_centerline, cell_centerline) ;         
        end
 

 
 
        
        cell_centerline=[(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2]; 
        d=diff(cell_centerline,1,1);
        l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
        [~,middle_ind]=min(abs(l-max(l)/2)); 
        temp_Centroid(jj,:)=[cell_centerline(middle_ind,2) cell_centerline(middle_ind,1) ];
        
        
     
     
                          Cell_mesh_with_poles =vertcat([cell_mesh(:,1) cell_mesh(:,2)],[flipdim(cell_mesh(:,3),1)  flipdim(cell_mesh(:,4),1)]);
                          Cell_mesh_with_poles(end+1,:)= Cell_mesh_with_poles(1,:);
                          Cell_mesh_with_poles= interparc(200,Cell_mesh_with_poles(:,1),Cell_mesh_with_poles(:,2)) ; 
                          Cell_mesh_with_poles_stack(jj).cdata=Cell_mesh_with_poles; 
                          Cell_mesh_with_poles=[Cell_mesh_with_poles(:,1)+X1(jj)-1 Cell_mesh_with_poles(:,2)+Y1(jj)-1]; 
        
        
         
        
        
        
                          if  jj_counter==1
                              Vercat_Cell_mesh_with_poles=Cell_mesh_with_poles;
                          else
                              Vercat_Cell_mesh_with_poles= vertcat(Vercat_Cell_mesh_with_poles,Cell_mesh_with_poles) ;
                          end
                          
                          
                          
              jj_counter= jj_counter+1;            
                          
         end               
                          
        end
    
       close(h2)
    
    
% %   
    handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh_with_poles(ii).cdata=Cell_mesh_with_poles_stack;
    handles.data_file(4).cdata.L(track_what).cdata.Vercat_Cell_mesh_with_poles(ii).cdata=Vercat_Cell_mesh_with_poles;
%  
    
    
    handles.data_file(4).cdata.L(track_what).cdata.ML(ii).cdata=Cell_centerline;
    handles.data_file(4).cdata.L(track_what).cdata.Vercat_ML(ii).cdata=Vercat_Cell_centerline;
    
    
    temp_Centroid=  round(temp_Centroid*100)/100;
    temp_Centroid(:,3)=ii;
    temp_Centroid(:,2)=temp_Centroid(:,2)+X1'-1 ;
    temp_Centroid(:,1)=temp_Centroid(:,1)+Y1'-1 ; 
    handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata = temp_Centroid  ;
    
    
    guidata(hObject, handles);
    
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
    
    
    
end

 
 
close(h) 
show_frame( handles,n,'axes')  ;


 
 % ---------------------------------------------------
  
function detect_z_ring_and_centerline_junction_Callback(hObject, eventdata, handles)
 
  global N_frames box_Raw
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  

prompt = {'Enter frame to start :','Enter frame to end:' };
dlg_title = 'Input';
num_lines = 1;
def = {num2str(n),num2str(N_frames) };
answer = inputdlg(prompt,dlg_title,num_lines,def);  
 
start_track =str2num(char(answer(1)));
end_track =str2num(char(answer(2))) ;
if end_track> N_frames
    end_track= N_frames;
end
if start_track< 1
    start_track= 1;
end 
  
h=timebar_BACWrapper('Re-label cells before exporting to Houdini. Please wait....');
set(h,'color','w');
 
  Cell_centerline_stack= handles.data_file(4).cdata.L(track_what).cdata.ML; 
  
  for ii=start_track:end_track %
      
      set(handles.mode_text,'String',[num2str(ii) filesep num2str(end_track-start_track+1)],'Visible','on')
      
      bw_cell = read_image2( ii,3,1);
      bw_ring = read_image2( ii,3,2);
      
      Cell_centerline= Cell_centerline_stack(ii).cdata;
      
      
      L=bwlabel(bw_cell,4);
      S=regionprops(L,'BoundingBox');
      
      intersection_z_centerline=nan(max(L(:)),2) ;
      
      for jj=1:max(L(:))
          L2=L==jj;
          XY=S(jj).BoundingBox;
          
          
          if (XY(1)+XY(3))>size(L,2)
              XY(1)=floor(XY(1));
          end
          if (XY(2)+XY(4))>size(L,1)
              XY(2)=floor(XY(2));
          end
          X1=round(XY(2)) ;
          Y1=round(XY(1));
          X2=round(XY(2)+XY(4));
          Y2=round(XY(1)+XY(3));
          
          
          ROI_cell=  L2(X1:X2,Y1:Y2) ;
          ROI_ring  = bw_ring(X1:X2,Y1:Y2);
          ROI_ring(ROI_cell==0)=0;
          
          if sum(ROI_ring(:))>0 %not empty
              
              cell_centerline=Cell_centerline(jj).cdata;
              
              ROI_ring=bwmorph(ROI_ring,'thin',inf);
              
              
              
              
              while sum(ROI_ring(:))>2
                  ROI_ring=bwmorph(ROI_ring,'thin',inf);
                  ROI_ring2=bwmorph(ROI_ring,'endpoints');
                  ROI_ring(ROI_ring2==1)=0;
              end
              
              
              
              if sum(ROI_ring(:))==2
                  
                  [x_ring, y_ring]=find(ROI_ring);
                  
                  x_ring=x_ring(1);y_ring=y_ring(1);
                  vec_dis=((cell_centerline(:,1)-x_ring).^2+(cell_centerline(:,2)-y_ring).^2) ;
                  [min1,ind1]=min(vec_dis);
                  [x_ring, y_ring]=find(ROI_ring);
                  x_ring=x_ring(2);y_ring=y_ring(2);
                  vec_dis=((cell_centerline(:,1)-x_ring).^2+(cell_centerline(:,2)-y_ring).^2) ;
                  [min2,ind2]=min(vec_dis);
                  
                  if min2<min1
                      ind=ind2;
                  else
                      ind=ind1;
                  end
                   ind=ind(1);
                   try
                      intersection_z_centerline(jj,:)=[cell_centerline( ind,1) cell_centerline( ind,2)];
                   end
                  
                  
              elseif sum(ROI_ring(:))==1
                  
                  [x_ring, y_ring]=find(ROI_ring);
                  x_ring=x_ring(1);y_ring=y_ring(1);
                  vec_dis=((cell_centerline(:,1)-x_ring).^2+(cell_centerline(:,2)-y_ring).^2) ;
                  [~ ,ind ]=min(vec_dis);
                   ind=ind(1);
                  try
                      intersection_z_centerline(jj,:)=[cell_centerline( ind,1) cell_centerline( ind,2)]; 
                  end
             
              end
              
              
              %             d=diff(cell_centerline,1,1);
              %             l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
              %             Diff=abs((l(ind)-l(end)/2)/l(end));
          end
      end
      intersection_z_centerline_stack(ii).cdata=intersection_z_centerline;
      timebar_BACWrapper(h,ii/(end_track-start_track+1))
      
  end

            
  handles.data_file(4).cdata.L(track_what).cdata.Intersection_z_centerline=intersection_z_centerline_stack;

guidata(hObject, handles);
close(h)
    

  function Untitled_297_Callback(hObject, eventdata, handles)
 
function Untitled_298_Callback(hObject, eventdata, handles) 
 track_what=get(handles.track_what2,'Value') ;  
    n=get(handles.Raw_listbox,'Value') ;
    bw= read_image2( n,3,1);
    bw_perim=bwperim(bw);
    [vecX,vecY]=find(bw_perim); 
    global h_patch x_patch y_patch
    np=length( h_patch)/2; 
    
    h=timebar_BACWrapper('Please wait....');
set(h,'color','w');
    for kk = 1:np*2 
        timebar_BACWrapper(h,kk/(np*2))
        Data=[get(h_patch(kk),'ydata')   get(h_patch(kk),'xdata')];
        [~,Center] = kmeans(Data,1)  ; %new Center 
        vec=(vecX-Center(1)).^2+(vecY-Center(2)).^2 ;
        [~,ind]= min(vec);
        ind=ind(1); 
        if kk<=np
            Pole1_x(kk) = vecX(ind);
            Pole1_y(kk) = vecY(ind);
        else
            Pole2_x(kk-np) = vecX(ind);
            Pole2_y(kk-np) = vecY(ind);
        end 
    end
    
    
    X1=  handles.data_file(4).cdata.L(track_what).cdata.X1(n).cdata ;
    Y1=  handles.data_file(4).cdata.L(track_what).cdata.Y1(n).cdata ;

    
    handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(n).cdata=Pole1_x-X1+1 ;
    handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(n).cdata=Pole1_y-Y1+1 ;
    handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(n).cdata=Pole2_x-X1+1 ;
    handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(n).cdata=Pole2_y-Y1+1 ; 
  
guidata(hObject, handles);
close(h)
show_frame( handles,n,'axes')  ;





% ---------------------------------------------------
function update_icons(handles)
track_what=get(handles.track_what2,'Value') ;
if findstr(char(handles.data_file(7).cdata(track_what,1)),'Y')==1
    iImage = imread('Label_8.png'); % icon file name (.png) has to be equal to icon name
    dImage = double(iImage(:,:,1));
    dImage = dImage./max(dImage(:)); dImage=dImage ;
    dImage=cat(3,dImage ,dImage*0 ,dImage*0);
    set(handles.icon_3, 'cdata',  dImage  )
else
    iImage = imread('Label_8.png'); % icon file name (.png) has to be equal to icon name
    dImage = double(iImage(:,:,1));
    dImage = dImage./max(dImage(:)); dImage=dImage ;
    dImage  = repmat(dImage, [1 1 3]);
    set(handles.icon_3, 'cdata',  dImage  )
end

if findstr(char(handles.data_file(7).cdata(track_what,2)),'Y')==1
    iImage = imread('Link_9.png'); % icon file name (.png) has to be equal to icon name
    dImage = double(iImage(:,:,1));
    dImage = dImage./max(dImage(:)); dImage=dImage ;
    dImage=cat(3,dImage*0 ,dImage,dImage*0 );
    set(handles.icon_5, 'cdata',  dImage  )
else
    iImage = imread('Link_9.png'); % icon file name (.png) has to be equal to icon name
    dImage = double(iImage(:,:,1));
    dImage = dImage./max(dImage(:)); dImage=dImage ;
    dImage  = repmat(dImage, [1 1 3]);
    set(handles.icon_5, 'cdata',  dImage  )
end

if findstr(char(handles.data_file(7).cdata(track_what,3)),'Y')==1
    iImage = imread('Track_10.png'); % icon file name (.png) has to be equal to icon name
    dImage = double(iImage(:,:,1));
    dImage = dImage./max(dImage(:)); dImage=dImage ;
    dImage=cat(3,dImage*0 ,dImage*0,dImage);
    set(handles.icon_7, 'cdata',  dImage  )
else
    iImage = imread('Track_10.png'); % icon file name (.png) has to be equal to icon name
    dImage = double(iImage(:,:,1));
    dImage = dImage./max(dImage(:)); dImage=dImage ;
    dImage  = repmat(dImage, [1 1 3]);
    set(handles.icon_7, 'cdata',  dImage  )
end



function Cell_index_Callback(hObject, eventdata, handles)
% hObject    handle to Cell_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cell_index as text
%        str2double(get(hObject,'String')) returns contents of Cell_index as a double


% --- Executes during object creation, after setting all properties.
function Cell_index_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cell_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: main_edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% ---------------------------------------------------
function Untitled_144_Callback(hObject, eventdata, handles)
splitting_bacteria_cells_function(handles.data_file) 
box_Raw=get(Raw_listbox,'string') ;
read_global_stack([1 0 0])




% --- Executes on selection change in popupmenu67.
function popupmenu67_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu67 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu67


% --- Executes during object creation, after setting all properties.
function popupmenu67_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Projected_by_Callback(hObject, eventdata, handles)
% hObject    handle to Projected_by (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Projected_by as text
%        str2double(get(hObject,'String')) returns contents of Projected_by as a double


% --- Executes during object creation, after setting all properties.
function edit48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Projected_by (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: main_edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
function imread_mode_CreateFcn(hObject, eventdata, handles) 
% ---------------------------------------------------
function Untitled_145_Callback(hObject, eventdata, handles)

track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);



MATRIX2=MATRIX;
%
%
% figure
% imagesc(MATRIX2)


MATRIX2(MATRIX2>0)=1;

%
% figure
% imagesc(MATRIX3)


for ii=2:size(MATRIX2,1)
    v1= MATRIX2(ii ,:)   ;
    v0= MATRIX2(ii-1,:)   ;
    
    ind0=find(v0);
    ind1=find(~v1);
    disappear=intersect(ind0,ind1);
    
    
    ind0=find(~v0);
    ind1=find(v1);
    appear=intersect(ind0,ind1);
    
    
    if isempty(disappear)~=1 & isempty(appear)~=1
        
        
        
        N0=length(disappear)/2;
        N1=length(appear)/2;
        
        
        D=inf(N1,N0);
        
        for nn=1:N1
            
            X_n1=   MATRIX(ii,appear(nn*2-1));
            Y_n1=   MATRIX(ii,appear(nn*2)) ;
            
            if X_n1>100 & X_n1<1276 & Y_n1>100 & Y_n1<932
                for kk=1:N0
                    X_n0=   MATRIX(ii-1,disappear(kk*2-1));
                    Y_n0=   MATRIX(ii-1,disappear(kk*2)) ;
                    if X_n0>100 & X_n0<1276 & Y_n0>100 & Y_n0<932
                        D(nn,kk)=sqrt((X_n1-X_n0)^2+(Y_n1-Y_n0)^2);
                    end
                end
            end
        end
        
        
        D(D>70)=inf;
        clc
        vec= munkres_BACWrapper(D);
        
        
        Vector_to_remove=[];Counter=1;
        
        for iii=1:length(vec)
            temp_vec=vec(iii);
            if temp_vec~=0
                appear(iii*2-1):appear(iii*2);
                disappear(temp_vec*2-1):disappear(temp_vec*2);
                MATRIX(ii:end,disappear(temp_vec*2-1):disappear(temp_vec*2) )=MATRIX(ii:end, appear(iii*2-1):appear(iii*2)) ;
                
                Vector_to_remove(Counter)= appear(iii*2-1);    Counter=Counter+1;
                Vector_to_remove(Counter)= appear(iii*2-1);    Counter=Counter+1;
            end
        end
        if Counter~=1
            MATRIX(:,Vector_to_remove)=[];
            MATRIX2(:,Vector_to_remove)=[];
        end
    end
end

M=MATRIX./MATRIX;[a,start_XY]=nanmin(M);Index= isnan(a); MATRIX(:,Index)=[];
Data.vec_temp1=MATRIX(:);
Data.vec_temp2=  find(Data.vec_temp1~=0) ;
Data.vec_temp1(Data.vec_temp1==0)=[];
Data.N=size(MATRIX,1);
Data.M=size(MATRIX,2);
set(handles.show_tracks,'userdata',Data );
edit_labeling(hObject, eventdata, handles)
show_frame( handles,n,'axes')  ;


% --- Executes on selection change in popupmenu69.
function popupmenu69_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu69 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu69


% --- Executes during object creation, after setting all properties.
function popupmenu69_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% ---------------------------------------------------
function Untitled_148_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_148 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global box_Raw
box_Raw= handles.data_file(1).cdata(:,1) ;

global data_file_2
data_file_2=handles.data_file(2).cdata;


h=waitbar(0,'Saving data as global variables');


track_length_before=str2num(get(handles.track_length_before,'String'));
track_length_after=str2num(get(handles.track_length_after,'String')) ;

track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

%      before we start we need to allocate for each cell from the MATRIX of trajectories
% its color
Length=track_length_after -track_length_before+1;
C=jet(Length);




for Cell=1:M/2
    waitbar(2*Cell/M )
    temp_vec_X=MATRIX(:,2*Cell-1);
    temp_vec_Y=MATRIX(:,2*Cell);
    
    IND=find(temp_vec_X>0);
    IND_cell_apear=IND(1);
    IND_cell_disapear=IND_cell_apear+IND(end)-1;
    
    
    for jj=IND_cell_apear:IND_cell_disapear
        Ind_start=jj-track_length_before ;
        Ind_end=jj+track_length_after ;
        
        
        
        if Ind_start<IND_cell_apear
            Ind_start=IND_cell_apear;
        end
        
        if Ind_end> IND_cell_disapear
            Ind_end=IND_cell_disapear;
        end
        
        if Ind_start<1
            Ind_start=1;
        end
        if Ind_end>N
            Ind_end=N;
        end
        
        
        
        vec_X=temp_vec_X(Ind_start:Ind_end);
        vec_X(isnan( vec_X))=[]; vec_X( vec_X<=0)=[] ;
        vec_Y=temp_vec_Y(Ind_start:Ind_end);
        vec_Y(isnan( vec_Y))=[]; vec_Y( vec_Y<=0)=[] ;
        
        
        
        n=jj;
        %
        try
            kkkk=size(dataX(n).cdata,2)+1;
        catch
            kkkk=1;
        end
        
        %
        dataX(n).cdata(kkkk).cdata=uint16(vec_X) ;
        dataY(n).cdata(kkkk).cdata=uint16(vec_Y) ;
        dataColormap(n).cdata(kkkk).cdata=C(Cell,:);
    end
end

close(h)

h=timebar_BACWrapper('Render trajectories. Please wait....');
for n=1:N
    timebar_BACWrapper(h,n/N)
    DataX= dataX(n).cdata   ;
    DataY= dataY(n).cdata ;
    DataColormap= dataColormap(n).cdata ;
    
    for kk=1:size(DataX,2)
        maxi=0;
        
        if maxi<length(DataX(kk).cdata)
            maxi=length(DataX(kk).cdata);
        end
    end
    
    matrixX=nan(maxi,size(  DataX,2) );
    matrixY=nan(maxi,size(  DataX,2) );
    matrixColormap=nan(size(  DataColormap,2),3);
    
    for kk=1:size(DataX,2)
        matrixX(1:length(DataX(kk).cdata),kk)=DataX(kk).cdata;
        matrixY(1:length(DataY(kk).cdata),kk)=DataY(kk).cdata;
        matrixColormap(kk,1:length(DataColormap(kk).cdata))=DataColormap(kk).cdata;
    end
    
    matrixX( matrixX==0)=nan;  matrixY( matrixY==0)=nan;
    
    eval(char(strcat('global  matrixX_',num2str(n))))
    eval(char(strcat(' matrixX_',num2str(n),'=matrixX;')));
    
    eval(char(strcat('global  matrixY_',num2str(n))))
    eval(char(strcat(' matrixY_',num2str(n),'=matrixY;')));
    
    eval(char(strcat('global  matrixColormap_',num2str(n))))
    eval(char(strcat(' matrixColormap_',num2str(n),'=matrixColormap;')));
    
end
close(h)
handles.flags.Xdata_global=1; guidata(hObject, handles);


% ---------------------------------------------------
edit_labeling(hObject, eventdata, handles)
show_frame( handles,n,'axes')  ;

% ---------------------------------------------------
function Untitled_150_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_150 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% hObject    handle to Untitled_148 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global box_Raw
box_Raw= handles.data_file(1).cdata(:,1) ;

global data_file_2
data_file_2=handles.data_file(2).cdata;


h=waitbar(0,'Saving data as global variables');


track_length_before=str2num(get(handles.track_length_before,'String'));
track_length_after=str2num(get(handles.track_length_after,'String')) ;

track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

%      before we start we need to allocare for each cell from the MATRIX of trajectories
% its color
Length=track_length_after -track_length_before+1;
C=jet(Length);




for Cell=1:M/2
    waitbar(2*Cell/M )
    temp_vec_X=MATRIX(:,2*Cell-1);
    temp_vec_Y=MATRIX(:,2*Cell);
    
    IND=find(temp_vec_X>0);
    IND_cell_apear=IND(1);
    IND_cell_disapear=IND_cell_apear+IND(end)-1;
    
    
    for jj=IND_cell_apear:IND_cell_disapear
        Ind_start=jj-track_length_before ;
        Ind_end=jj+track_length_after ;
        
        
        
        if Ind_start<IND_cell_apear
            Ind_start=IND_cell_apear;
        end
        
        if Ind_end> IND_cell_disapear
            Ind_end=IND_cell_disapear;
        end
        
        if Ind_start<1
            Ind_start=1;
        end
        if Ind_end>N
            Ind_end=N;
        end
        
        
        
        vec_X=temp_vec_X(Ind_start:Ind_end);
        vec_X(isnan( vec_X))=[]; vec_X( vec_X<=0)=[] ;
        vec_Y=temp_vec_Y(Ind_start:Ind_end);
        vec_Y(isnan( vec_Y))=[]; vec_Y( vec_Y<=0)=[] ;
        
        
        
        n=jj;
        %
        try
            kkkk=size(dataX(n).cdata,2)+1;
        catch
            kkkk=1;
        end
        
        %
        dataX(n).cdata(kkkk).cdata=uint16(vec_X) ;
        dataY(n).cdata(kkkk).cdata=uint16(vec_Y) ;
        %         dataColormap(n).cdata(kkkk).cdata=C(Cell,:);
    end
end

close(h)

h=timebar_BACWrapper('Render trajectories. Please wait....');
for n=1:N
    timebar_BACWrapper(h,n/N)
    DataX= dataX(n).cdata   ;
    DataY= dataY(n).cdata ;
    %     DataColormap= dataColormap(n).cdata ;
    
    for kk=1:size(DataX,2)
        maxi=0;
        
        if maxi<length(DataX(kk).cdata)
            maxi=length(DataX(kk).cdata);
        end
    end
    
    matrixX=nan(maxi,size(  DataX,2) );
    matrixY=nan(maxi,size(  DataX,2) );
    %     matrixColormap=nan(size(  DataColormap,2),3);
    
    for kk=1:size(DataX,2)
        matrixX(1:length(DataX(kk).cdata),kk)=DataX(kk).cdata;
        matrixY(1:length(DataY(kk).cdata),kk)=DataY(kk).cdata;
        %         matrixColormap(kk,1:length(DataColormap(kk).cdata))=DataColormap(kk).cdata;
    end
    
    matrixX( matrixX==0)=nan;  matrixY( matrixY==0)=nan;
    
    eval(char(strcat('global  matrixX_',num2str(n))))
    eval(char(strcat(' matrixX_',num2str(n),'=matrixX;')));
    
    eval(char(strcat('global  matrixY_',num2str(n))))
    eval(char(strcat(' matrixY_',num2str(n),'=matrixY;')));
    
    %     eval(char(strcat('global  matrixColormap_',num2str(n))))
    %     eval(char(strcat(' matrixColormap_',num2str(n),'=matrixColormap;')));
    %
end
close(h)
handles.flags.Xdata_global=1; guidata(hObject, handles);


% ---------------------------------------------------
edit_labeling(hObject, eventdata, handles)
show_frame( handles,n,'axes')  ;


% Called when figure is closed  % stop and delete timer object.
function figure1_DeleteFcn(hObject, eventdata, handles)
try
    stop(timerfindall('tag','animationTimer'));
    delete(timerfindall('tag','animationTimer'));
    
end
% --- Executes on button press in BImage.
function BImage_Callback(hObject, eventdata, handles)
% hObject    handle to BImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in FImage.
function FImage_Callback(hObject, eventdata, handles)
% hObject    handle to FImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)







function Period_Callback(hObject, eventdata, handles)

function startTimer(hTimer, eventData, varargin)
%     try
%         handles = guidata(hTimer.UserData);
%         set(handles.pauseImage, 'CData', handles.icons.pauseCData, 'alphadata', handles.icons.pauseAlpha);
%     catch
%         a=1;
%     end

function stopTimer(hTimer, eventData, varargin)
%     try
%         handles = guidata(hTimer.UserData);
%         set(handles.pauseImage, 'CData', handles.icons.playCData, 'alphadata', handles.icons.playAlpha);
%     catch
%         a=1;
%     end

function updateTimer(hTimer, eventData, varargin)



handles = guidata(hTimer.UserData);
forward_button=get(handles.forward_button,'value') ;
backward_button=get(handles.backward_button,'value') ;

if forward_button==0 & backward_button==0
    return
end
if forward_button==1 & backward_button==0
    global N_frames 
    n = get(handles.Raw_listbox,'value') ; n=n+1;
    if n>N_frames
        return
    end
end
if forward_button==0 & backward_button==1
    n = get(handles.Raw_listbox,'value') ; n=n-1;
     if n<1
        return
    end
end

set(handles.Raw_listbox,'value',n)
show_frame( handles,n,'axes')

set(handles.showcurrentframe,'String',num2str(n));
set(handles.Raw_listbox,'value',n);

 set(handles.slider1,'value',n);


% --- Executes during object creation, after setting all properties.
function pushbutton70_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Period as text
%        str2double(get(hObject,'String')) returns contents of Period as a double


% --- Executes during object creation, after setting all properties.
function Period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: main_edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stop_button.
function stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.backward_button,'BackgroundColor',[0.8 0.8 0.8] )
       set(handles.forward_button,'BackgroundColor',[0.8 0.8 0.8] )
set(handles.backward_button,'value',0)
set(handles.forward_button,'value',0)
% try
    import java.awt.Robot;
    import java.awt.event.*;
    SimKey=Robot;
    SimKey.keyPress(KeyEvent.VK_CONTROL);
    SimKey.keyPress(KeyEvent.VK_C);
    SimKey.keyRelease(KeyEvent.VK_CONTROL);
    SimKey.keyRelease(KeyEvent.VK_C);
% end
% try
    global hTimer;    stop(hTimer);
% end
% try
    delete(timerfindall('tag','animationTimer'));
    
% end


clear SimKey



% --- Executes on selection change in Color_parameters.
function Color_parameters_Callback(hObject, eventdata, handles)
% hObject    handle to Color_parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Color_parameters contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Color_parameters
Raw_listbox_Callback([], [], handles)


% ---------------------------------------------------
function Create_Orientation_matrix_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value');
Cutoff=180
create_MATRIX_Data_function(handles.data_file(4).cdata ,'Orientation',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

function right_panel_Callback(hObject, eventdata, handles)
    
str_right=get(handles.right_panel,'string') 
str_left=get(handles.left_panel,'string') 

if  strcmp(str_left,'<') & strcmp(str_right,'>')
    'a'
    
    set(hObject,'string','<')
    show_left_panel(hObject, eventdata, handles)
elseif strcmp(str_left,'<') & strcmp(str_right,'<')
     'b'
    set(hObject,'string','>')
    show_right_panel_and_left_panel(hObject, eventdata, handles)
elseif strcmp(str_left,'>') & strcmp(str_right,'>')
     'c'
    set(hObject,'string','<')
    hide_panels(hObject, eventdata, handles)
elseif strcmp(str_left,'>') & strcmp(str_right,'<')
     'd'
    set(hObject,'string','>')
    show_right_panel(hObject, eventdata, handles)
end


% --- Executes on button press in right_panel.
function left_panel_Callback(hObject, eventdata, handles)
str_right=get(handles.right_panel,'string') ;
str_left=get(handles.left_panel,'string');
 
if  strcmp(str_left,'<') & strcmp(str_right,'>')
    set(hObject,'string','>')
    show_right_panel(hObject, eventdata, handles)
elseif strcmp(str_left,'>') & strcmp(str_right,'>')
    set(hObject,'string','<')
    show_right_panel_and_left_panel(hObject, eventdata, handles)
elseif strcmp(str_left,'<') & strcmp(str_right,'<')
    set(hObject,'string','>')
    hide_panels(hObject, eventdata, handles)
elseif strcmp(str_left,'>') & strcmp(str_right,'<')
    set(hObject,'string','<')
    show_left_panel(hObject, eventdata, handles)
end





 
function hide_panels(hObject, eventdata, handles)
'hide_panels';
Pos=get(handles.axes1,'position')
if Pos(3)>0.7   
    set(handles.axes1,'position', [0.075     0.105   0.9-0.03   0.89  ]) 
global posmatrix    
 posmatrix(1,1:4)= [0.075     0.105   0.9-0.03   0.89  ]
  
end

set(handles.Raw_listbox,'Visible','off')
set(handles.Control_panel,'Visible','off') 
 set(handles.Panel_Selection,'value',6)
for ii=1:8
    eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''off''',')'))
end
for ii=1:10
    eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''off''',')'))
end 
set(handles.Show_Spots,'Visible','off')
set(handles.Show_Contour,'Visible','off')
set(handles.Show_Segment,'Visible','off')
set(handles.Show_Box,'Visible','off')
set(handles.Show_Events,'Visible','off')
set(handles.Show_Arrows,'Visible','off') 
set(handles.Show_Polar_Points,'Visible','off')
set(handles.Show_Centerline,'Visible','off')
set(handles.Show_Mesh,'Visible','off')
set(handles.Show_Center,'Visible','off')
set(handles.Show_Intersection,'Visible','off') 
set(handles.slide_zoom_option,'Visible','off')
set(handles.slider2,'Visible','off')
set(handles.Projected_by,'Visible','off')
  set(handles.cell_selection_panel,'Visible','off')
  set(handles.rgb_panel,'Visible','off')
  set(handles.STREL_panel,'Visible','off')
   set(handles.Frame_range_panel,'Visible','off');
    set(handles.Noise_control_panel,'Visible','off')
    set(handles.graphics_config_panel,'Visible','off') 
   set(handles.logo1_panel,'Visible','off') 
 set(handles.mode_text2,'Visible','off')
set(handles.mode_text,'Visible','off')
function show_right_panel(hObject, eventdata, handles)
'show right panel';
Pos=get(handles.axes1,'position')
if Pos(3)>0.7   
set(handles.axes1,'position',[0.075 0.105 0.7957-0.05-0.03 0.89])
global posmatrix    
 posmatrix(1,1:4)= [0.075 0.105 0.7957-0.05-0.03 0.89];
 
%  Pos=[0.075     0.105   0.9   0.89  ]
end
set(handles.Raw_listbox,'Visible','on')
set(handles.Control_panel,'Visible','on')
set(handles.Show_Spots,'Visible','on')
set(handles.Show_Contour,'Visible','on')
set(handles.Show_Segment,'Visible','on')
set(handles.Show_Box,'Visible','on')
set(handles.Show_Events,'Visible','on')
set(handles.Show_Arrows,'Visible','on') 
set(handles.Show_Polar_Points,'Visible','on')
set(handles.Show_Centerline,'Visible','on')
set(handles.Show_Mesh,'Visible','on')
set(handles.Show_Center,'Visible','on')
set(handles.Show_Intersection,'Visible','on')
 set(handles.mode_text2,'Visible','on')
set(handles.mode_text,'Visible','off')
 

for ii=1:8
    eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''off''',')'))
end
for ii=1:10
    eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''off''',')'))
end
set(handles.slide_zoom_option,'Visible','off')
set(handles.slider2,'Visible','off')
set(handles.Projected_by,'Visible','off')
get(handles.Control_panel,'position')
 
function show_left_panel(hObject, eventdata, handles)


set(handles.Raw_listbox,'Visible','off')
set(handles.Control_panel,'Visible','off') 
set(handles.Show_Contour,'Visible','off')
set(handles.Show_Spots,'Visible','off')
set(handles.Show_Segment,'Visible','off')
set(handles.Show_Box,'Visible','off')
set(handles.Show_Events,'Visible','off')
set(handles.Show_Arrows,'Visible','off') 
set(handles.Show_Polar_Points,'Visible','off')
set(handles.Show_Centerline,'Visible','off')
set(handles.Show_Mesh,'Visible','off')
set(handles.Show_Center,'Visible','off')
set(handles.Show_Intersection,'Visible','off')
 set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','off'); 
             set(handles.Noise_control_panel,'Visible','off')
             set(handles.graphics_config_panel,'Visible','off')
             set(handles.logo1_panel,'Visible','off') 
 set(handles.Panel_Selection,'value',6)  
 set(handles.mode_text2,'Visible','off')
set(handles.mode_text,'Visible','on')
%unix systems:


% try

% win systems:
%    z=findobj(handles.icon_1);
% jEdit = findjobj_BACWrapper(z) 
% if ~isempty (jEdit.Border)
%     set(handles.Leftpanel,'Visible','on') 
%     h=timebar_BACWrapper('Initializing. Please wait....');
% set(h,'color','w');
%     for ii=1:10
%         eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
%         try
%             eval(strcat('z=findobj(handles.icon_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         catch
%             pause(0.05)
%             eval(strcat('z=findobj(handles.icona_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         end
%         timebar_BACWrapper(h,ii/18)
%     end
%     for ii=1:8
%         eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
%         try
%             eval(strcat('z=findobj(handles.mode_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         catch
%             pause(0.05)
%             eval(strcat('z=findobj(handles.mode_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         end
%         timebar_BACWrapper(h,(ii+10)/18)
%     end
%     pause(1)
%     set(handles.Leftpanel,'Visible','off')
       
%     handles.flags.show_left_panel=1;
%     guidata(hObject, handles);
%     close(h)
% else
    for ii=1:10
        eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
    end
    for ii=1:8
        eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
    end
%  end
%   catch
%    for ii=1:10
%         eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
%     end
%     for ii=1:8
%         eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
%     end
% end

Pos=get(handles.axes1,'position')
if Pos(3)>0.5  
set(handles.axes1,'position',[0.075 0.105  0.945-0.075 0.89])
global posmatrix    
 posmatrix(1,1:4)= [0.075 0.105  0.945-0.075 0.89];
end

% for ii=1:10
%     eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
% end
% for ii=1:8
%     eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
% end
set(handles.slide_zoom_option,'Visible','on')
set(handles.slider2,'Visible','on')
set(handles.Projected_by,'Visible','on')


 
% ---------------------------------------------------
function show_right_panel_and_left_panel(hObject, eventdata, handles)
% hObject    handle to Untitled_109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% try
% z=findobj(handles.icon_1);
% jEdit = findjobj_BACWrapper(z);
% if ~isempty (jEdit.Border)
%     set(handles.Leftpanel,'Visible','on')
% 
% %  if  handles.flags.show_left_panel==0;
%     h=timebar_BACWrapper('Initializing. Please wait....');
% set(h,'color','w');
%     for ii=1:10
%         eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
%         try
%             eval(strcat('z=findobj(handles.icon_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         catch
%             pause(0.05)
%             eval(strcat('z=findobj(handles.icona_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         end
%         timebar_BACWrapper(h,ii/18)
%     end
%     for ii=1:8
%         eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
%         try
%             eval(strcat('z=findobj(handles.mode_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         catch
%             pause(0.05)
%             eval(strcat('z=findobj(handles.mode_',num2str(ii),');'))
%             jEdit = findjobj_BACWrapper(z)   ; jEdit.Border = [];
%         end
%         timebar_BACWrapper(h,(ii+10)/18)
%     end
%     pause(1)
%     set(handles.Leftpanel,'Visible','off')
     set(handles.mode_text,'Visible','on')
%     handles.flags.show_left_panel=1;
%     guidata(hObject, handles);
%     close(h)
% else
    for ii=1:10
        eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
    end
    for ii=1:8
        eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
    end
% end
% catch
%      for ii=1:10
%         eval(strcat('set(handles.icon_',num2str(ii),' ,''Visible''',',','''on''',')'))
%     end
%     for ii=1:8
%         eval(strcat('set(handles.mode_',num2str(ii),' ,''Visible''',',','''on''',')'))
%     end
% end
% 0.7957    0.3554    0.2102    0.6429
% if no in nodes mode:
Pos=get(handles.axes1,'position')
if Pos(3)>0.75  

  set(handles.axes1,'position',[0.075 0.105    0.7957-0.05-0.03 0.89])
global posmatrix    
 posmatrix(1,1:4)= [0.075 0.105    0.7957-0.05-0.03 0.89];
end

 
set(handles.slide_zoom_option,'Visible','on')
set(handles.slider2,'Visible','on')
set(handles.Projected_by,'Visible','on')

 
set(handles.Raw_listbox,'Visible','on')
set(handles.Control_panel,'Visible','on')
set(handles.Show_Spots,'Visible','on')
set(handles.Show_Contour,'Visible','on')
set(handles.Show_Segment,'Visible','on')
set(handles.Show_Box,'Visible','on')
set(handles.Show_Events,'Visible','on')
set(handles.Show_Arrows,'Visible','on') 
set(handles.Show_Polar_Points,'Visible','on')
set(handles.Show_Centerline,'Visible','on')
set(handles.Show_Mesh,'Visible','on')
set(handles.Show_Center,'Visible','on')
set(handles.Show_Intersection,'Visible','on')



 set(handles.mode_text2,'Visible','on')
set(handles.mode_text,'Visible','on')


 





% --- Executes on button press in axess3.
function axes3_Callback(hObject, eventdata, handles)
% hObject    handle to axess3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function spot_size_Callback(hObject, eventdata, handles)
global spot_size
spot_size=get(handles.spot_size,'string');
spot_size=round(str2num(spot_size));
 spot_type_Callback(hObject, eventdata, handles)

% Hints: get(hObject,'String') returns contents string')of spot_size as text
%        str2double(get(hObject,'String')) returns contents of spot_size as a double


% --- Executes during object creation, after setting all properties.
function spot_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spot_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: main_edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popupmenu71.
function popupmenu71_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu71 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu71


% --- Executes during object creation, after setting all properties.
function popupmenu71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Automatic_labeling_option.
function Automatic_labeling_option_Callback(hObject, eventdata, handles)
% hObject    handle to Automatic_labeling_option (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Automatic_labeling_option





function shift_frame_Callback(hObject, eventdata, handles)
% hObject    handle to shift_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shift_frame as text
%        str2double(get(hObject,'String')) returns contents of shift_frame as a double


% --- Executes during object creation, after setting all properties.
function shift_frame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shift_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: main_edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function show_tracks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_tracks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_events.
function show_merged_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], [], handles)


if get(hObject,'value')
    set(hObject,'ForegroundColor','y')
else
    set(hObject,'ForegroundColor','w')
end
% --- Executes on button press in show_arrows.
function show_arrows_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], eventdata, handles)

if get(hObject,'value')
    set(hObject,'ForegroundColor','y')
else
    set(hObject,'ForegroundColor','w')
end

% --- Executes on button press in Show_box_cell.
function Show_box_cell_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], [], handles)
if get(hObject,'value')
    set(hObject,'ForegroundColor','y')
else
    set(hObject,'ForegroundColor','w')
end

% Hint: get(hObject,'Value') returns toggle state of Show_box_cell


% --- Executes on button press in togglebutton23.
function togglebutton23_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton23


% --- Executes on button press in text35.
function text35_Callback(hObject, eventdata, handles)
% hObject    handle to text35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




Cell=get(handles.Cell_index,'string')  ;  
Cell=str2num(char(Cell))  
Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1; vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
z=MATRIX(:,Cell*2);
z=cumsum(z);
z(z==0)=max(z);
[~,n]=min(z)  ;
  

X=MATRIX(n,Cell*2-1);
Y=MATRIX(n,Cell*2);
 
track_what=get(handles.track_what2,'Value') ;
set(handles.Raw_listbox,'value',n) 
show_frame( handles,n,'axes')

set(handles.showcurrentframe,'String',num2str(n));

axes(handles.axes1)
limx=[X-handles.new_cells_data_lim  X+handles.new_cells_data_lim];
limy=[Y-handles.new_cells_data_lim  Y+handles.new_cells_data_lim];

xlim(limx);ylim(limy)


 
function imread_mode_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to imread_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 
% for n=1:900
%     
%     cla(handles.axes1)
%     eval(char(['global matrixX_' num2str(n) ' matrixY_' num2str(n) ]))
%     Length= eval(char(['size( matrixX_' num2str(n) ',1)']));
%     matrixColormap =jet(   Length);
%     %                 set( 1, 'ColorOrder'  ,   matrixColormap )
%     set(handles.axes1, 'ColorOrder'  ,   matrixColormap )
%     eval(char(['line(rot90(matrixX_' num2str(n) '),rot90(matrixY_' num2str(n) '),''Hittest'',''Off'',''LineStyle'',''none'',''Marker'',''.'',''MarkerSize'',5);']))
%     pause(0.01)
% end
% 
% 
% 
% 
% 
% 
% 
% %     save all
% return
segmentation_type1=get(handles.segmentation_type1,'value');
track_what1=get(handles.track_what1,'value');
if track_what1~=1
    msgbox('this channel is under development for RAM')
    return
end
global box_Raw 
switch segmentation_type1
    case 1
        read_global_stack([0 0 1])
    case 2
        read_global_stack([0 1 0])
    case 3
        read_global_stack([1 0 0])
end


% --- Executes on button press in Update_new_cells_list_Callback.


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over icon_4.
function icon_4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to icon_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
n=get(handles.Raw_listbox,'value')   ;
handles.Ignore_ROI(n).cdata=[];
guidata(hObject, handles);




% --- Executes on button press in Update_new_cells_list.
function Update_new_cells_list_Callback(hObject, eventdata, handles)

Update_stat=handles.flags.autosearch;


h_alert=msgbox('relabeling....please wait');
global Cell_list N_frames
Cell_list=[];





track_what=get(handles.track_what2,'Value') ;
% vec=get(handles.axess3,'userdata'  )   ;

set(handles.shift_frame,'Visible','on')

switch get(handles.popupmenu69,'value')
    
    case 1
        matrix=[];
        for ii=2:N_frames
            %             ii=vec(n);
            centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata  ;
            if ~isempty(centy1)
                
                Ind =(centy1(:,1)<40) | (centy1(:,1)>1306);
                if isempty(Ind)~=1
                    centy1(Ind ,4)=0;
                end
                
                
                Ind =(centy1(:,2)<40) | (centy1(:,2)>962);
                if isempty(Ind)~=1
                    centy1(Ind ,4)=0;
                end
                
                
                
                if Update_stat==0
                    Ignore_ROI=handles.Ignore_ROI(ii).cdata;
                    if  isempty(Ignore_ROI)~=1
                        if   size(Ignore_ROI,1)==1
                            BoundingBox=Ignore_ROI;
                            BoundingBox(3)=BoundingBox(1)+BoundingBox(3);
                            BoundingBox(4)=BoundingBox(2)+BoundingBox(4);
                            
                            Ind =(centy1(:,1)< BoundingBox(3)) & (centy1(:,1)>BoundingBox(1)) &  (centy1(:,2)<BoundingBox(4)) | (centy1(:,2)>BoundingBox(2));
                            if isempty(Ind)~=1
                                centy1(Ind ,4)=0;
                            end
                        else
                            for jj=1:size(Ignore_ROI,1)
                                BoundingBox=Ignore_ROI(jj,:);
                                BoundingBox(3)=BoundingBox(1)+BoundingBox(3);
                                BoundingBox(4)=BoundingBox(2)+BoundingBox(4);
                                
                                Ind =(centy1(:,1)< BoundingBox(3)) & (centy1(:,1)>BoundingBox(1)) &  (centy1(:,2)<BoundingBox(4)) | (centy1(:,2)>BoundingBox(2));
                                if isempty(Ind)~=1
                                    centy1(Ind ,4)=0;
                                end
                            end
                        end
                    end
                end
                
                
                
                
                
                VC=find(centy1(:,4)==-1); VC(:,2)=ii;
                if isempty(VC)~=1
                    if isempty(matrix)==1
                        matrix=VC;
                    else
                        matrix(end+1:end+size(VC,1),:)=VC;
                    end
                end
                
                
                
            end
        end
        
        
        
        
        if isempty(matrix)==1
            msgbox('Couldn`t find new merging cells!')
            
            
            
            set(handles.new_cells_data,'string', '...')
            set(handles.new_cells_data,'value', 1)
            set(handles.new_cells_data,'userdata', [])
            Cell_list =[];
            return
        end
        
        for ii=1:size(matrix,1)
            Location=  matrix(ii,1); n=matrix(ii,2) ;
            X=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(Location,1);
            Y=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(Location,2);
            matrix2(ii,1)=X;
            matrix2(ii,2)=Y;
        end
        
        
        
        
        set(handles.new_cells_data,'string', {num2str(matrix(:,2))})
        set(handles.new_cells_data,'max', size(matrix,1))
        set(handles.new_cells_data,'value', 1)
        set(handles.new_cells_data,'userdata', matrix2)
        Cell_list =matrix(:,2);
        
        
        
        
    case 2
        
        matrix=[];
        for ii=1:N_frames-1
            %             ii=vec(n);
            
            centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata  ;
            centy2=handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii+1).cdata  ;
            %             the trick is to look on centy1 but where cells are new to give -1 and the rest 0
            V1=1:size(centy1,1);% 1 2 3 4 5 6 7 8
            V2=centy2(:,4);
            VV=ismember(V1,V2)  ;
            centy1(:,4)=-(~VV);
            
            
            
            
            
            
            if ~isempty(centy1)
                Ind =(centy1(:,1)<60) | (centy1(:,1)>1306);
                if isempty(Ind)~=1
                    centy1(Ind ,4)=0;
                end
                
                
                Ind =(centy1(:,2)<60) | (centy1(:,2)>962);
                if isempty(Ind)~=1
                    centy1(Ind ,4)=0;
                end
                
                
                
                if Update_stat==0
                    Ignore_ROI=handles.Ignore_ROI(ii).cdata;
                    if  isempty(Ignore_ROI)~=1
                        if   size(Ignore_ROI,1)==1
                            BoundingBox=Ignore_ROI;
                            BoundingBox(3)=BoundingBox(1)+BoundingBox(3);
                            BoundingBox(4)=BoundingBox(2)+BoundingBox(4);
                            
                            Ind =(centy1(:,1)< BoundingBox(3)) & (centy1(:,1)>BoundingBox(1)) &  (centy1(:,2)<BoundingBox(4)) | (centy1(:,2)>BoundingBox(2));
                            if isempty(Ind)~=1
                                centy1(Ind ,4)=0;
                            end
                        else
                            for jj=1:size(Ignore_ROI,1)
                                BoundingBox=Ignore_ROI(jj,:);
                                BoundingBox(3)=BoundingBox(1)+BoundingBox(3);
                                BoundingBox(4)=BoundingBox(2)+BoundingBox(4);
                                
                                Ind =(centy1(:,1)< BoundingBox(3)) & (centy1(:,1)>BoundingBox(1)) &  (centy1(:,2)<BoundingBox(4)) | (centy1(:,2)>BoundingBox(2));
                                if isempty(Ind)~=1
                                    centy1(Ind ,4)=0;
                                end
                            end
                        end
                    end
                end
                
                
                
                
                
                VC=find(centy1(:,4)==-1);
                VC(:,2)=ii;
                if isempty(VC)~=1
                    if isempty(matrix)==1
                        matrix=VC;
                    else
                        matrix(end+1:end+size(VC,1),:)=VC;
                    end
                end
                
                
                
            end
        end
        
        
        
        
        if isempty(matrix)==1
            msgbox('Couldn`t find new merging cells!')
            
            
            
            set(handles.new_cells_data,'string', '...')
            set(handles.new_cells_data,'value', 1)
            set(handles.new_cells_data,'userdata', [])
            Cell_list =[];
            return
        end
        
        for ii=1:size(matrix,1)
            Location=  matrix(ii,1); n=matrix(ii,2) ;
            X=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(Location,1);
            Y=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(Location,2);
            matrix2(ii,1)=X;
            matrix2(ii,2)=Y;
        end
        
        
        
        
        set(handles.new_cells_data,'string', {num2str(matrix(:,2))})
        set(handles.new_cells_data,'max', size(matrix,1))
        set(handles.new_cells_data,'value', 1)
        set(handles.new_cells_data,'userdata', matrix2)
        Cell_list =matrix(:,2);
        
        
    case 3
        track_what=get(handles.track_what2,'Value') ;
        Data=get(handles.show_tracks,'userdata' );
        
        
        vec_temp2=Data.vec_temp2 ;
        vec_temp1=Data.vec_temp1;
        N=Data.N  ;
        M=Data.M ;
        vec_temp3(vec_temp2)=vec_temp1;
        vec_temp3 (end+1:  M*N)=0;
        MATRIX = reshape(vec_temp3',N,M);
        
        
        
        MATRIX2=MATRIX;
        %
        %
        % figure
        % imagesc(MATRIX2)
        
        
        MATRIX2(MATRIX2>0)=1;
        
        %
        % figure
        % imagesc(MATRIX3)
        
        
        matrix=[];Cell_list=[];Counter=1;
        for ii=2:size(MATRIX2,1)
            v1= MATRIX2(ii ,:)   ;
            v0= MATRIX2(ii-1,:)   ;
            ind0=find(~v0);
            ind1=find(v1);
            appear=intersect(ind0,ind1);
            
            if  isempty(appear)~=1
                
                
                N1=length(appear)/2;
                
                for nn=1:N1
                    
                    X_n1=   MATRIX(ii,appear(nn*2-1));
                    Y_n1=   MATRIX(ii,appear(nn*2)) ;
                    
                    if X_n1>100 & X_n1<1276 & Y_n1>100 & Y_n1<932
                        
                        matrix(Counter,1)= X_n1;matrix(Counter,2)= Y_n1;
                        
                        Cell_list(Counter)=ii;
                        Counter=Counter+1;
                        
                    end
                end
            end
        end
        set(handles.new_cells_data,'string', {num2str(Cell_list')})
        set(handles.new_cells_data,'userdata', matrix)
        
    case 4
        
        track_what=get(handles.track_what2,'Value') ;
        Data=get(handles.show_tracks,'userdata' );
        
        
        vec_temp2=Data.vec_temp2 ;
        vec_temp1=Data.vec_temp1;
        N=Data.N  ;
        M=Data.M ;
        vec_temp3(vec_temp2)=vec_temp1;
        vec_temp3 (end+1:  M*N)=0;
        MATRIX = reshape(vec_temp3',N,M);
        
        
        
        MATRIX2=MATRIX;
        %
        %
        % figure
        % imagesc(MATRIX2)
        
        
        MATRIX2(MATRIX2>0)=1;
        
        %
        % figure
        % imagesc(MATRIX3)
        
        
        matrix=[];Cell_list=[];Counter=1;
        for ii=2:size(MATRIX2,1)
            v1= MATRIX2(ii ,:)   ;
            v0= MATRIX2(ii-1,:)   ;
            
            ind0=find(v0);
            ind1=find(~v1);
            disappear=intersect(ind0,ind1);
            
            
            if  isempty(disappear)~=1
                
                
                N0=length(disappear)/2;
                
                for nn=1:N0
                    X_n0=   MATRIX(ii-1,disappear(nn*2-1));
                    Y_n0=   MATRIX(ii-1,disappear(nn*2)) ;
                    
                    
                    if X_n0>100 & X_n0<1276 & Y_n0>100 & Y_n0<932
                        
                        matrix(Counter,1)= X_n0;matrix(Counter,2)= Y_n0;
                        
                        Cell_list(Counter)=ii-1;
                        Counter=Counter+1;
                        
                    end
                end
            end
        end
        set(handles.new_cells_data,'string', {num2str(Cell_list')})
        set(handles.new_cells_data,'userdata', matrix)
end

close(h_alert)

if get(handles.Automatic_labeling_option,'value')==3
    hh=new_cells_list_window;
    drawnow
    jframe = getjframe_BACWrapper(hh);
    set(jframe,'AlwaysOnTop',1)
    h_New = findobj('userdata','new_cells_list_window'); h_new_cells_list_window  =         guidata(  h_New);
    new_cells_list_window('Update_new_cells_list_Callback_window_Callback', h_new_cells_list_window.Update_new_cells_list_Callback_window,[], h_new_cells_list_window)
end

% %
%  h_new_cells_list_window = findobj('userdata','new_cells_list_window'); h_new_cells_list_window  =         guidata(new_cells_list_window)
% new_cells_list_window('Update_new_cells_list_Callback_window', h_new_cells_list_window.Update_new_cells_list_Callback_window,[], h_new_cells_list_window)
% %


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Update_new_cells_list.
function Update_new_cells_list_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Update_new_cells_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.flags.autosearch==1
    set(hObject,'string','search-L')
    handles.flags.autosearch=0;
else
    set(hObject,'string','search-A')
    handles.flags.autosearch=1;
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Update_new_cells_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Update_new_cells_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% ---------------------------------------------------


% ---------------------------------





% hObject    handle to Untitled_156 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_156_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_156 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('this step comes after accurate tracking, and needs to be followed by repeat step of segmentation,association, and tracking')


track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc

Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid;
BoundingBox=handles.data_file(4).cdata.L(track_what).cdata.BoundingBox;
h=timebar_BACWrapper('searching cell with missing pixels....');
MajorAxisLength_MATRIX=nan(size(MATRIX,1),size(MATRIX,2)/2);
for ii=1:N  %on the base of frame
    timebar_BACWrapper(h,ii/M)
    MajorAxisLength=handles.data_file(4).cdata.L(track_what).cdata.MajorAxisLength(ii).cdata;
    Ind= Centy(ii).cdata(:,6)  ;
    temp_vec= find(MATRIX(ii,:)>0); temp_vec(1:2:length( temp_vec))=[];temp_vec=temp_vec/2;
    for jj=1:length(temp_vec)
        JJ=temp_vec(jj);
        Ind2= ismember(Ind,JJ);
        MajorAxisLength_MATRIX(ii,JJ)=MajorAxisLength(Ind2);
    end
end
close(h)

M=size(MajorAxisLength_MATRIX,2);
%
%
MajorAxisLength_MATRIX2=[];
for ii=1:M  %on the base of cell
    MajorAxisLength_MATRIX2(:,ii)=nandiff(MajorAxisLength_MATRIX(:,ii));
end




MajorAxisLength_MATRIX3=MajorAxisLength_MATRIX2;



MajorAxisLength_MATRIX3(MajorAxisLength_MATRIX3<7)=nan;
MajorAxisLength_MATRIX3(MajorAxisLength_MATRIX3>=7)=1;
MajorAxisLength_MATRIX3(isnan(MajorAxisLength_MATRIX3))=0;

MajorAxisLength_MATRIX2(MajorAxisLength_MATRIX2>-7 | MajorAxisLength_MATRIX<-14)=nan;
MajorAxisLength_MATRIX2(MajorAxisLength_MATRIX2<=-7 & MajorAxisLength_MATRIX>=-14)=1;
MajorAxisLength_MATRIX2(isnan(MajorAxisLength_MATRIX2))=0;


MajorAxisLength_MATRIX4=[];
for jj=1:M  %on the base of cell
    c= MajorAxisLength_MATRIX2(:,jj) ;
    d= MajorAxisLength_MATRIX3(:,jj) ;
    
    vec=[] ;Const=0;
    for ii=1:length(c)
        C=c(ii);D=d(ii);
        if C==1 & D==0
            %                   'jump down in ii'
            vec(ii)=1;
            Const=0;
        end
        if C==0 & D==1
            %                     'jump up in ii'
            vec(ii)=0;
            Const=0;
        end
        
        if C==0 & D==0
            if ii~=1
                if Const<6
                    %                    'ii no change from before'
                    vec(ii)= vec(ii-1);
                else
                    vec(ii)= 0;   Const=0;
                end
            else
                vec(ii)=0;
            end
            Const=Const+1;
        end
    end
    
    
    MajorAxisLength_MATRIX4(:,jj)=vec;
end


global refine_matrix
Counter=1;refine_matrix=[];
for Cell=1:M  %on the base of cell
    vec= MajorAxisLength_MATRIX4(:,Cell);
    frame_vec=find(vec);
    for jj=1:length(frame_vec)
        try
            Frame=frame_vec(jj);
            Ind2=find(ismember(Centy(Frame).cdata(:,6),Cell));
            refine_matrix(Counter,1)=Cell  ;
            refine_matrix(Counter,2)= Frame;
            refine_matrix(Counter,3)= Ind2;
            refine_matrix(Counter,4:5)=Centy(Frame).cdata(Ind2,1:2)  ;
            refine_matrix(Counter,6:9)=BoundingBox(Frame).cdata(Ind2,:);
            
            
            Counter=Counter+1;
            %         scatter( Cxy(1), Cxy(2))
        end
    end
end
%
ind= ismember(  refine_matrix(:,3),0);
refine_matrix(ind,:)=[];
%
%
%









% ---------------------------------------------------
function Untitled_158_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_158 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_159_Callback(hObject, eventdata, handles)
box_Raw=get(handles.Raw_listbox,'string');
end_frame=size(box_Raw,1);
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;


str=eval(strcat('handles.data_file(3).cdata(',num2str(track_what),',1)'));
str=str2double(str);
if str==0
    return
end

if isempty(eventdata)
    prompt = {'Enter frame to start:','Enter frame to end:'};
    dlg_title = 'Input';
    num_lines = 1;
    def = {num2str(n),num2str(end_frame)};
    answer = inputdlg(prompt,dlg_title,num_lines,def);
    start_track =str2num(char(answer(1)));
    end_track =str2num(char(answer(2)));
else
    start_track=1;
    end_track =end_frame;
end

XY_data= handles.data_file(4).cdata.L(track_what).cdata;
% pathname_Raw=handles.data_file(2).cdata(track_what,1)
pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper('Label cells. Please wait....');
set(h,'color','w');


for ii=start_track:end_track %2 Procced only if the complimantory Segmented file was found
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
    set(handles.mode_text,'String',[num2str(ii) filesep num2str(end_track-start_track+1)],'Visible','on')
    
    
    
    filename_Segmentation=box_Raw(ii) ;
    full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;
    full_filename_Segmentation=char(full_filename_Segmentation) ;
    temp_Segmentation=imread_cross( full_filename_Segmentation);
    
    
    L=bwlabel(temp_Segmentation ,4);
    XYdata=regionprops(L, 'Orientation');
    XY_data.Orientation(ii).cdata= cat(1,XYdata.Orientation)+90;
end
close(h)
handles.data_file(4).cdata.L(track_what).cdata= XY_data;
guidata(hObject, handles);






% ---------------------------------------------------
function Untitled_163_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_163 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_162_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_162 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  MATRIX_data_labeled  
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

MATRIX_data_labeled=nan(size(MATRIX,1) ,size(MATRIX,2)/2 );
MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating velocity and velocity data....');

 
for ii=1:size(MATRIX,2)/2 %for each cell 
    timebar_BACWrapper(h,ii/(size(MATRIX,2)/2))
    temp_vec_X=MATRIX(:,2*ii-1); Vx= nandiff(temp_vec_X'); %or try without ' (only temp_vec)
    temp_vec_Y=MATRIX(:,2*ii); Vy= nandiff(temp_vec_Y'); %or try without ' (only temp_vec)'
    MATRIX_data_labeled(:, ii)= sqrt(Vx.^2+Vy.^2);
end
close(h)
% for ii=1:size(MATRIX,2)/2 %for each cell
%        timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
%       MATRIX_data_labeled(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_labeled_velocity(:, ii),5);
% end

if get(handles.MA_option,'value')==1
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));


if  length_before+length_after~=0
    h=timebar_BACWrapper('creating MA....');
    for ii=1:size(MATRIX,2)/2 %for each cell
        timebar_BACWrapper(h,ii/(size(MATRIX,2)/2))
        MATRIX_data_labeled(:, ii)=   movavg(MATRIX_data_labeled(:, ii),length_before,length_after)  ;
    end
    close(h)
end
else
disp('moving average was not applied (was not defined by the user')
end
%need to show histogram to help the user to decide:
Cutoff= inputdlg('Please input maximum value for Velocity or leave automatic as default','Input',1,{'5'}); 
Cutoff=str2num(char(Cutoff)); 
MATRIX_data_labeled(MATRIX_data_labeled>Cutoff)=Cutoff;



 
function Untitled_166_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_166 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_167_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_167 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_168_Callback(hObject, eventdata, handles)
 
global MATRIX_data_labeled CC
 


MATRIX_data_velocity=MATRIX_data_labeled;
track_what =1 ;
max_velocity=nanmax(MATRIX_data_velocity(:));
MATRIX_data_velocity=round(100*MATRIX_data_velocity/max_velocity);%converting range from 0 to 100 altough possible
MATRIX_data_velocity(MATRIX_data_velocity==0)=1;%converting range from 1 to 100 altough possible

h=timebar_BACWrapper('creating direction and velocity data....');
global N_frames
for ii=1:N_frames %on the base of frame
    try
    timebar_BACWrapper(h,ii/size(MATRIX_data_velocity,1))
    Ind= handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6) ;
    velocity_vec=MATRIX_data_velocity(ii,Ind);
    matrixColormap=[];
    for jj=1:length(velocity_vec)
        if isnan(velocity_vec(jj))~=1
            matrixColormap(jj,:)=CC(velocity_vec(jj),:);
        else
            matrixColormap(jj,:)=[nan nan nan];
        end
        matrixColormap=round(matrixColormap*10)/10 ;
        eval(char(strcat('global  Velocity_matrixColormap_',num2str(ii))))
        eval(char(strcat('Velocity_matrixColormap_',num2str(ii),'=matrixColormap;')));
    end
    
 
    end
end
close(h)
% ---------------------------------------------------
function Untitled_169_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_169 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_170_Callback(hObject, eventdata, handles)

Cutoff= inputdlg('Please input maximum value for displacment or leave automatic as default','Input',1,{'20'}); 
max_displacement=str2num(char(Cutoff));
global MATRIX_data_displacement MATRIX_data
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

MATRIX_data_displacement=nan(size(MATRIX,1) ,size(MATRIX,2)/2 );
MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating displacement and displacement data....');


length_before=str2num(get(handles.track_length_before,'String')) ;
length_after=str2num(get(handles.track_length_after,'String')) ;

 

for ii=1:size(MATRIX,2)/2 %for each cell
      timebar_BACWrapper(h,ii/(size(MATRIX,2)/2))
    temp_vec_X=MATRIX(:,2*ii-1) ;
    temp_vec_Y=MATRIX(:,2*ii) ;
    
 
    MATRIX_data_displacement(:, ii)= mean_displacement(temp_vec_X',temp_vec_Y',length_before, length_after);
    
end
close(h)


MATRIX_data_displacement(MATRIX_data_displacement>max_displacement)=max_displacement;
MATRIX_data=MATRIX_data_displacement;

   
 

% ---------------------------------------------------
function Untitled_172_Callback(hObject, eventdata, handles)
%
% global MATRIX_data CC N_frames
% % MATRIX_data_displacement=MATRIX_data;
% % track_what =1 ;
% % max_displacement=nanmax(MATRIX_data_displacement(:));
% % MATRIX_data_displacement=round(100*MATRIX_data_displacement/max_displacement);%converting range from 0 to 100 altough possible
% % MATRIX_data_displacement(MATRIX_data_displacement==0)=1;%converting range from 1 to 100 altough possible
% % % 
%   h=timebar_BACWrapper('creating direction and displacement data....');
% for ii=1:N_frames
%     try
%        timebar_BACWrapper(h,ii/size(MATRIX_data_displacement,1))
%     Ind= handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6)  
%     displacement_vec=MATRIX_data_displacement(ii,Ind);
%     
%     temp_Segmentation=read_image2(ii,3,track_what);
%     L=bwlabel( temp_Segmentation,4);
%     R_matrix=zeros(size(L));G_matrix=zeros(size(L));B_matrix=zeros(size(L));
%     
%     for jj=1:length(displacement_vec)
%         if isnan(displacement_vec(jj))~=1
%             R_matrix(L==jj)=CC(displacement_vec(jj),1);
%             G_matrix(L==jj)=CC(displacement_vec(jj),2);
%             B_matrix(L==jj)=CC(displacement_vec(jj),3);
%         end
%     end
%     RGB_matrix=cat(3,R_matrix,G_matrix,B_matrix);
%     
%     figure(1)
%     imagesc(RGB_matrix)
%     %       matrixColormap=round(matrixColormap*10)/10;
%     %     eval(char(strcat('global  matrixColormap_',num2str(ii))))
%     %     eval(char(strcat(' matrixColormap_',num2str(ii),'=matrixColormap;')));
%     %     end
%     
%     a(ii).cdata=RGB_matrix;
% end
% % close(h)
% save a a
% return
  global MATRIX_data MATRIX_data_displacement CC N_frames
MATRIX_data_displacement=MATRIX_data;
track_what =1 ;
max_displacement=nanmax(MATRIX_data_displacement(:));
MATRIX_data_displacement=round(100*MATRIX_data_displacement/max_displacement);%converting range from 0 to 100 altough possible
MATRIX_data_displacement(MATRIX_data_displacement==0)=1;%converting range from 1 to 100 altough possible

 h=timebar_BACWrapper('creating direction and displacement data....');
for ii=1:N_frames %on the base of frame
    timebar_BACWrapper(h,ii/size(MATRIX_data_displacement,1))
    Ind= handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6) ;
    
       displacement_vec=nan(length(Ind),1);
    for kk=1:length(Ind)
        if ~isnan(Ind(kk))
            displacement_vec(kk)=MATRIX_data_displacement(ii,Ind(kk));
        end
    end
    
     
    matrixColormap=[];
    for jj=1:length(displacement_vec)
        if ~isnan(displacement_vec(jj)) 
            matrixColormap(jj,:)=CC(displacement_vec(jj),:);
        else
            matrixColormap(jj,:)=[nan nan nan];
        end
        matrixColormap=round(matrixColormap*10)/10;
        eval(char(strcat('global  Displacement_matrixColormap_',num2str(ii))))
        eval(char(strcat('Displacement_matrixColormap_',num2str(ii),'=matrixColormap;')));
    end
end
close(h)
 
 

% ---------------------------------------------------
function Untitled_179_Callback(hObject, eventdata, handles)
global MATRIX_data CC MATRIX_data_displacement

MATRIX_data_direction=MATRIX_data;
track_what =1 ;
max_direction=nanmax(MATRIX_data_direction(:));
MATRIX_data_direction=round(100*MATRIX_data_direction/max_direction);%converting range from 0 to 100 altough possible
MATRIX_data_direction(MATRIX_data_direction==0)=1;  %converting range from 1 to 100 altough possible
h=timebar_BACWrapper('creating direction and displacement data....');
global N_frames
for ii=1:N_frames %on the base of frame
    timebar_BACWrapper(h,ii/size(MATRIX_data_displacement,1))
    Ind= handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6) ;
    
    
   direction_vec=nan(length(Ind),1);
    for kk=1:length(Ind)
        if ~isnan(Ind(kk))
            direction_vec(kk)=MATRIX_data_direction(ii,Ind(kk));
        end
    end
    
    
     
    matrixColormap=[];
    for jj=1:length(direction_vec)
        if isnan(direction_vec(jj))~=1
            matrixColormap(jj,:)=CC(direction_vec(jj),:);
        else
            matrixColormap(jj,:)=[nan nan nan];
        end
        matrixColormap=round(matrixColormap*10)/10;
        eval(char(strcat('global  Direction_matrixColormap_',num2str(ii))))
        eval(char(strcat('Direction_matrixColormap_',num2str(ii),'=matrixColormap;')));
    end
end
close(h)
% ---------------------------------------------------
 
% ---------------------------------------------------
function Untitled_177_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'Orientation',track_what)  
% ---------------------------------------------------
function Untitled_180_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_181_Callback(hObject, eventdata, handles)

 

% ---------------------------------------------------
function Untitled_184_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_184 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_185_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value'); 
Cutoff= inputdlg('Please input maximum value for MajorAxisLength or leave automatic as default','Input',1,{'200'}); 
Cutoff=str2num(char(Cutoff));
create_MATRIX_Data_function(handles.data_file(4).cdata ,'MajorAxisLength',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

% ---------------------------------------------------
function Untitled_187_Callback(hObject, eventdata, handles) 
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'MajorAxisLength',track_what) 

% ---------------------------------------------------
function Untitled_188_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_188 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_189_Callback(hObject, eventdata, handles)

global  MATRIX_data_gates CC

data_file=handles.data_file;
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc



MATRIX_data_gates1=MATRIX;
MATRIX_data_gates1(:,2:2:M)=[];
MATRIX_data_gates1(MATRIX_data_gates1>0)=1;
MATRIX_data_gates1(MATRIX_data_gates1==0)=nan;
MATRIX_data_gates=MATRIX_data_gates1;
CC=[];
CC(1,:)=[1 1 1];
for ii=1:6
    eval(char(strcat('global  togglebutton_value_',num2str(ii))))
    eval(char(strcat('togglebutton_value= get(handles.togglebutton',num2str(ii),',''value'')')));
    
    if togglebutton_value==1
        eval(char(strcat('global  togglebutton_userdata_',num2str(ii))))
        eval(char(strcat('Data= get(handles.togglebutton',num2str(ii),',''userdata'')')));
        
        
        if isempty(Data)~=1
            cell_list=Data.cell_list;
            if isempty(cell_list)~=1
                MATRIX_data_gates(:,cell_list)= MATRIX_data_gates1(:,cell_list)*(ii+1);
            end
        end
    end
    %
    %        eval(char(strcat('global  togglebutton_ForegroundColor_',num2str(ii))))
    %        eval(char(strcat('togglebutton_ForegroundColor= get(handles.togglebutton',num2str(ii),',''ForegroundColor'')')));
    %        eval(char(strcat(' togglebutton_ForegroundColor_',num2str(ii),'=togglebutton_ForegroundColor;')));
    %
    %        eval(char(strcat('global  togglebutton_BackgroundColor_',num2str(ii))))
    %        eval(char(strcat('togglebutton_BackgroundColor= get(handles.togglebutton',num2str(ii),',''BackgroundColor'')')));
    %        eval(char(strcat(' togglebutton_BackgroundColor_',num2str(ii),'=togglebutton_BackgroundColor;')));
    %
    %
    %        eval(char(strcat('global  togglebutton_String_',num2str(ii))))
    %        eval(char(strcat('togglebutton_String= get(handles.togglebutton',num2str(ii),',''String'')')));
    %        eval(char(strcat(' togglebutton_String_',num2str(ii),'=togglebutton_String;')));
    
    
    CC(ii+1,:)= eval(char(['get(handles.togglebutton' num2str(ii) ',' '''ForegroundColor'')']));
end

% ---------------------------------------------------
function Untitled_190_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_190 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MATRIX_data_gates CC

track_what =1 ;

h=timebar_BACWrapper('creating MajorAxisLength and displacement data....');
global N_frames
for ii=1:N_frames %on the base of frame
    timebar_BACWrapper(h,ii/size(MATRIX_data_gates,1))
    Ind= handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6) ;
    gates_vec=MATRIX_data_gates(ii,Ind);
    matrixColormap=[];
    for jj=1:length(gates_vec)
        if isnan(gates_vec(jj))~=1
            matrixColormap(jj,:)=CC(gates_vec(jj),:);
        else
            matrixColormap(jj,:)=[nan nan nan];
        end
        matrixColormap=round(matrixColormap*10)/10;
        eval(char(strcat('global  matrixColormap_',num2str(ii))))
        eval(char(strcat(' matrixColormap_',num2str(ii),'=matrixColormap;')));
    end
end
close(h)


% -


% ---------------------------------------------------
function Untitled_194_Callback(hObject, eventdata, handles)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Cell_index.
function Cell_index_ButtonDownFcn(hObject, eventdata, handles)



track_what=get(handles.track_what2,'Value') ;


Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);



for ii=1:N  %on the base of frame
    matrix_bw=read_image2(ii,3,track_what);
    LL(ii).cdata=bwlabel(matrix_bw,4);
end
Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid;



MATRIX3=nan(N,M/2);


%    h=timebar_BACWrapper('WAIT....');
for jj=1:M/2
    %     timebar_BACWrapper(h,jj/M/2)
    
    for ii=1:N  %on the base of frame
        try
            Ind= Centy(ii).cdata(:,6)  ;
            Ind2=find(ismember(Ind,jj));
            XY=handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(ii).cdata(Ind2,:);
            L=LL(ii).cdata;
            
            if (XY(1)+XY(3))>size(L,2)
                XY(1)=floor(XY(1));
            end
            if (XY(2)+XY(4))>size(L,1)
                XY(2)=floor(XY(2));
            end
            X1=round(XY(2)) ;
            Y1=round(XY(1));
            X2=round(XY(2)+XY(4));
            Y2=round(XY(1)+XY(3));
            
            
            
            ROI_bw=  L(X1:X2,Y1:Y2) ;
            
            
            
            
            ROI_bw(ROI_bw~=Ind2)=0;
            ROI_bw(ROI_bw==Ind2)=1;
            
            ROI_thin=bwmorph(ROI_bw,'thin',inf);
            
            
            %    figure(1)
            %    subplot(2,1,1)
            %    imagesc(ROI_thin+ROI_bw)
            %  axis equal
            % [x,y]=find(ROI_thin);
            
            %  tic
            %  fun=@minutie;
            %   L = nlfilter(ROI_thin,[3 3],fun);
            %   toc
            %   tic
            ROI_endpoints=bwmorph(ROI_thin,'endpoints');
            
            
            %
            %  [X,Y]=find(L2);
            %  X=X(1);
            %  Y=Y(1);
            %
            %
            % toc
            
            %
            
            %    subplot(2,1,1)
            %    imagesc(ROI_thin+ROI_bw)
            %     save L L
            
            
            %
            % L3=bwdistgeodesic(L,
            %
            %
            %
            %
            % [x,y]=find(L);
            % xx=x;yy=y;
            %
            %  [X,Y]=find(L);
            %  X=X(1);
            %  Y=Y(1);
            %
            %   Ind=find(x==X & y==Y)  ;
            %   x(Ind)=nan; y(Ind)=nan;
            %   Vec=[];
            %   Vec(1)=Ind;
            %  for kk=1:length(x)-1
            %   [~,min_dist_ind]=nanmin(sqrt((x-X).^2+(y-Y).^2)) ;
            %   Vec(kk+1)=min_dist_ind;
            %   X=x(min_dist_ind);
            %   Y=y(min_dist_ind) ;
            %   x(min_dist_ind)=nan; y(min_dist_ind)=nan;
            %  end
            %
            %
            %   x=xx(Vec);  y=yy(Vec);
            %
            %       f=sqrt(diff(x).^2+diff(y).^2);
            %
            %
            %
            %
            %
            MATRIX3(ii,jj)= max_thin_length_function(ROI_thin,ROI_endpoints);
        end
    end
    figure(1)
    imagesc(MATRIX3)
end
save  MATRIX3 MATRIX3
return
projection=thin_population
maxi=zeros(1,size(projection,1));
for ii=1: size(projection,2)
    maxi(ii)= size(projection(ii).cdata,2);
end


maxi=max(maxi)+1;
projection_matrix=zeros(maxi,size(projection,1));
for ii=1: size(projection,2)
    temp_vector=(projection(ii).cdata)';
    difference_length=round((maxi-length(temp_vector))/2);
    projection_matrix( difference_length:difference_length+length(temp_vector)-1,ii)= temp_vector;
end

%
%  %
figure
imagesc(projection_matrix)
%








clc


track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc


cell_index=get(handles.Cell_index,'string')
cell_index=str2num(cell_index)


Cell_CentX=MATRIX(:,cell_index*2-1);
Cell_CenY=MATRIX(:,cell_index*2);

Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid;



%   h=timebar_BACWrapper('WAIT....');
for jj=1:1%M
    %    timebar_BACWrapper(h,jj/M)
    Counter=1;
    clear projection
    clear Montage
    clear rojection2
    clear Montage2
    
    for ii=1:N  %on the base of frame
        
        
        Ind= Centy(ii).cdata(:,6)  ;
        Ind2=find(ismember(Ind,cell_index));
        Orientation=handles.data_file(4).cdata.L(track_what).cdata.Orientation(ii).cdata(Ind2);
        
        XY=handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(ii).cdata(Ind2,:);
        
        matrix_raw =  read_image2(ii,1,track_what);
        matrix_bw=read_image2(ii,3,track_what);
        
        
        L=bwlabel(matrix_bw,4);
        
        
        if (XY(1)+XY(3))>size(L,2)
            XY(1)=floor(XY(1));
        end
        if (XY(2)+XY(4))>size(L,1)
            XY(2)=floor(XY(2));
        end
        X1=round(XY(2)) ;
        Y1=round(XY(1));
        X2=round(XY(2)+XY(4));
        Y2=round(XY(1)+XY(3));
        
        
        
        % X1=round(xy(2)) ;
        % Y1=round(xy(1));
        % X2=round(xy(2)+xy(4));
        % Y2=round(xy(1)+xy(3));
        %
        
        
        % if X1<1
        %     X1=1;
        % end
        % if Y1<1
        %     Y1=1;
        % end
        % if X2> size(L,2)
        %     X2= size(L,2);
        % end
        % if Y2< size(L,1)
        %     Y2=size(L,1);
        % end
        
        % figure
        % imagesc(L)
        % figure
        % imagesc(matrix_raw)
        % figure(1)
        % imagesc(matrix_bw)
        
        % X1:X2
        % Y1:Y2
        %
        %  pause
        
        ROI_bw=  L(X1:X2,Y1:Y2) ;
        ROI_raw =double(matrix_raw(X1:X2,Y1:Y2));
        
        ROI_bw(ROI_bw~=Ind2)=0;
        ROI_bw(ROI_bw==Ind2)=1;
        
        ROI_thin=bwmorph(ROI_bw,'thin',inf);
        
        
        
        %    figure(1)
        %    subplot(2,1,1)
        %    imagesc(ROI_thin+ROI_bw)
        %  axis equal
        % [x,y]=find(ROI_thin);
        
        %  tic
        %  fun=@minutie;
        %   L = nlfilter(ROI_thin,[3 3],fun);
        %   toc
        %   tic
        L=bwmorph(ROI_thin,'endpoints');
        [X,Y]=find(L)
        X=X(1); Y=Y(1);
        %
        L=bwdistgeodesic(ROI_thin,Y,X,'quasi-euclidean');
        
        
        
        %
        %
        %  [X,Y]=find(L2);
        %  X=X(1);
        %  Y=Y(1);
        %
        %
        % toc
        
        %
        figure(1)
        %    subplot(2,1,1)
        %    imagesc(ROI_thin+ROI_bw)
        %     save L L
        
        
        %
        % L3=bwdistgeodesic(L,
        %
        %
        %
        %
        % [x,y]=find(L);
        % xx=x;yy=y;
        %
        %  [X,Y]=find(L);
        %  X=X(1);
        %  Y=Y(1);
        %
        %   Ind=find(x==X & y==Y)  ;
        %   x(Ind)=nan; y(Ind)=nan;
        %   Vec=[];
        %   Vec(1)=Ind;
        %  for kk=1:length(x)-1
        %   [~,min_dist_ind]=nanmin(sqrt((x-X).^2+(y-Y).^2)) ;
        %   Vec(kk+1)=min_dist_ind;
        %   X=x(min_dist_ind);
        %   Y=y(min_dist_ind) ;
        %   x(min_dist_ind)=nan; y(min_dist_ind)=nan;
        %  end
        %
        %
        %   x=xx(Vec);  y=yy(Vec);
        %
        %       f=sqrt(diff(x).^2+diff(y).^2);
        %
        %
        %
        %
        %
        %
        % thin_stack(Counter)=sum(f)
        thin_stack(Counter)=max(L(:))
        subplot(2,1,2)
        % figure(1)
        plot(thin_stack)
        Counter=Counter+1;
        pause(0.11)
    end
    save thin_stack thin_stack
end

return





clc


track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc


cell_index=get(handles.Cell_index,'string')
cell_index=str2num(cell_index)


Cell_CentX=MATRIX(:,cell_index*2-1);
Cell_CenY=MATRIX(:,cell_index*2);

Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid;



%   h=timebar_BACWrapper('WAIT....');
for jj=1:1%M
    %    timebar_BACWrapper(h,jj/M)
    Counter=1;
    clear projection
    clear Montage
    clear rojection2
    clear Montage2
    
    for ii=1:N  %on the base of frame
        
        
        Ind= Centy(ii).cdata(:,6)  ;
        Ind2=find(ismember(Ind,cell_index));
        Orientation=handles.data_file(4).cdata.L(track_what).cdata.Orientation(ii).cdata(Ind2);
        
        XY=handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(ii).cdata(Ind2,:);
        
        matrix_raw =  read_image2(ii,1,track_what);
        matrix_bw=read_image2(ii,3,track_what);
        
        
        L=bwlabel(matrix_bw,4);
        
        
        if (XY(1)+XY(3))>size(L,2)
            XY(1)=floor(XY(1));
        end
        if (XY(2)+XY(4))>size(L,1)
            XY(2)=floor(XY(2));
        end
        X1=round(XY(2)) ;
        Y1=round(XY(1));
        X2=round(XY(2)+XY(4));
        Y2=round(XY(1)+XY(3));
        
        
        
        % X1=round(xy(2)) ;
        % Y1=round(xy(1));
        % X2=round(xy(2)+xy(4));
        % Y2=round(xy(1)+xy(3));
        %
        
        
        % if X1<1
        %     X1=1;
        % end
        % if Y1<1
        %     Y1=1;
        % end
        % if X2> size(L,2)
        %     X2= size(L,2);
        % end
        % if Y2< size(L,1)
        %     Y2=size(L,1);
        % end
        
        % figure
        % imagesc(L)
        % figure
        % imagesc(matrix_raw)
        % figure(1)
        % imagesc(matrix_bw)
        
        % X1:X2
        % Y1:Y2
        %
        %  pause
        
        ROI_bw=  L(X1:X2,Y1:Y2) ;
        ROI_raw =double(matrix_raw(X1:X2,Y1:Y2));
        
        ROI_bw(ROI_bw~=Ind2)=0;
        ROI_bw(ROI_bw==Ind2)=1;
        
        
        
        % if ii==513
        %     save all
        %     figure
        %     return
        % end
        ROI_raw(ROI_bw~=1)=nan;
        
        % Orientation= Orientation+90;
        if  Orientation<0
            Orientation=Orientation+270 ;
        end
        
        Data_out=imrotate(ROI_bw,-Orientation) ;
        Data_out(Data_out==0)=nan;
        
        Data_out2=imrotate(ROI_raw,-Orientation) ;
        Data_out2=Data_out.*Data_out2;
        
        %
        Data_out= Data_out./max(Data_out(:)) ;
        
        %
        %
        %    figure(1)
        %         imagesc(Data_out2)
        %
        
        projection(Counter).cdata=(nanmean(Data_out,2))' ;
        Montage(Counter).cdata=Data_out;
        
        Data_out2= Data_out2./max(Data_out2(:)) ;
        projection2(Counter).cdata=(nanmean(Data_out2,2))' ;
        Montage2(Counter).cdata=Data_out2;
        
        
        Counter=Counter+1;
    end
    
    projection_stack(jj).cdata=projection;
    Montage_stack(jj).cdata=Montage;
    
    projection2_stack(jj).cdata=projection2;
    Montage2_stack(jj).cdata=Montage2;
    jj
end



save all
maxi=zeros(1,size(projection,1));
for ii=1: size(projection,2)
    maxi(ii)= size(projection(ii).cdata,2);
end


maxi=max(maxi)+1;
projection_matrix=zeros(maxi,size(projection,1));
for ii=1: size(projection,2)
    temp_vector=(projection(ii).cdata)';
    difference_length=round((maxi-length(temp_vector))/2);
    projection_matrix( difference_length:difference_length+length(temp_vector)-1,ii)= temp_vector;
end

%
%  %
figure
imagesc(projection_matrix)
%

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
scrsz = get(0,'ScreenSize') ;
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;
scrsz(4)=scrsz(4)/2 ;
scrsz(3)=scrsz(4);
scrsz(2)=scrsz(1);
figure('color','w','units','pixels','position', scrsz) ;


D=zeros(max_x,max_y,1,ii);
for ii=1:size(Montage,2)
    D(end-size(Montage(ii).cdata,1)+1:end, end-size(Montage(ii).cdata,2)+1:end,1,ii)=Montage(ii).cdata(:,:) ;
end

montage(D, 'DisplayRange', []);










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
imagesc(projection_matrix2)
%

max_x=0;
max_y=0;
for ii=1:size(Montage2,2)
    if max_x<size(Montage2(ii).cdata,1)
        max_x=size(Montage2(ii).cdata,1);
    end
    if max_y<size(Montage2(ii).cdata,2)
        max_y=size(Montage2(ii).cdata,2);
    end
end
scrsz = get(0,'ScreenSize') ;
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;
scrsz(4)=scrsz(4)/2 ;
scrsz(3)=scrsz(4);
scrsz(2)=scrsz(1);
figure('color','w','units','pixels','position', scrsz) ;


D=zeros(max_x,max_y,1,ii);
for ii=1:size(Montage2,2)
    D(end-size(Montage2(ii).cdata,1)+1:end, end-size(Montage2(ii).cdata,2)+1:end,1,ii)=Montage2(ii).cdata(:,:) ;
end

montage(D, 'DisplayRange', []);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pause

save projection_stack projection_stack
save Montage_stack Montage_stack

save projection_stack2 projection_stack2
save Montage_stack2 Montage_stack2
return


maxi=zeros(1,size(projection,1));
for ii=1: size(projection,2)
    maxi(ii)= size(projection(ii).cdata,2);
end


maxi=max(maxi)+1;
projection_matrix=zeros(maxi,size(projection,1));
for ii=1: size(projection,2)
    temp_vector=(projection(ii).cdata)';
    difference_length=round((maxi-length(temp_vector))/2);
    projection_matrix( difference_length:difference_length+length(temp_vector)-1,ii)= temp_vector;
end

%
%  %
%   figure(1)
%   imagesc(projection_matrix)
%

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
scrsz = get(0,'ScreenSize') ;
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;
scrsz(4)=scrsz(4)/2 ;
scrsz(3)=scrsz(4);
scrsz(2)=scrsz(1);
figure('color','w','units','pixels','position', scrsz) ;


D=zeros(max_x,max_y,1,ii);
for ii=1:size(Montage,2)
    D(end-size(Montage(ii).cdata,1)+1:end, end-size(Montage(ii).cdata,2)+1:end,1,ii)=Montage(ii).cdata(:,:) ;
end

montage(D, 'DisplayRange', []);

pause(1)


RETURN
clc


track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );


tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc


cell_index=get(handles.Cell_index,'string')
cell_index=str2num(cell_index)


Cell_CentX=MATRIX(:,cell_index*2-1);
Cell_CenY=MATRIX(:,cell_index*2);

Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid;



h=timebar_BACWrapper('WAIT....');
for jj=1:M
    timebar_BACWrapper(h,jj/M)
    Counter=1;projection=[];Montage=[];projection2=[];Montage2=[];
    
    for ii=1:N  %on the base of frame
        
        
        Ind= Centy(ii).cdata(:,6)  ;
        Ind2=find(ismember(Ind,cell_index));
        Orientation=handles.data_file(4).cdata.L(track_what).cdata.Orientation(ii).cdata(Ind2);
        
        xy=handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(ii).cdata(Ind2,:);
        
        matrix_raw =  read_image2(ii,1,track_what);
        matrix_bw=read_image2(ii,3,track_what);
        
        
        L=bwlabel(matrix_bw,4);
        
        X1=round(xy(2)) ;
        Y1=round(xy(1));
        X2=round(xy(2)+xy(4));
        Y2=round(xy(1)+xy(3));
        
        
        
        ROI_bw=  L(X1:X2,Y1:Y2) ;
        ROI_raw =double(matrix_raw(X1:X2,Y1:Y2));
        
        ROI_bw(ROI_bw~=Ind2)=0;
        ROI_bw(ROI_bw==Ind2)=1;
        ROI_raw(ROI_bw~=1)=nan;
        
        % Orientation= Orientation+90;
        if  Orientation<0
            Orientation=Orientation+270 ;
        end
        
        Data_out=imrotate(ROI_bw,-Orientation) ;
        Data_out(Data_out==0)=nan;
        
        Data_out2=imrotate(ROI_raw,-Orientation) ;
        Data_out2=Data_out.*Data_out2;
        %      figure(1)
        %      imagesc(Data_out2)
        %
        
        Data_out= Data_out./max(Data_out(:)) ;
        projection(Counter).cdata=(nanmean(Data_out,2))' ;
        Montage(Counter).cdata=Data_out;
        
        Data_out2= Data_out2./max(Data_out2(:)) ;
        projection2(Counter).cdata=(nanmean(Data_out2,2))' ;
        Montage2(Counter).cdata=Data_out2;
        
        
        Counter=Counter+1;
    end
    
    projection_stack(jj).cdata=projection;
    Montage_stack(jj).cdata=Montage;
    
    projection2_stack(jj).cdata=projection2;
    Montage2_stack(jj).cdata=Montage2;
    
    pause
end


save projection_stack projection_stack
save Montage_stack Montage_stack

save projection_stack2 projection_stack2
save Montage_stack2 Montage_stack2
return


maxi=zeros(1,size(projection,1));
for ii=1: size(projection,2)
    maxi(ii)= size(projection(ii).cdata,2);
end


maxi=max(maxi)+1;
projection_matrix=zeros(maxi,size(projection,1));
for ii=1: size(projection,2)
    temp_vector=(projection(ii).cdata)';
    difference_length=round((maxi-length(temp_vector))/2);
    projection_matrix( difference_length:difference_length+length(temp_vector)-1,ii)= temp_vector;
end

%
%  %
%   figure(1)
%   imagesc(projection_matrix)
%

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
scrsz = get(0,'ScreenSize') ;
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;
scrsz(4)=scrsz(4)/2 ;
scrsz(3)=scrsz(4);
scrsz(2)=scrsz(1);
figure('color','w','units','pixels','position', scrsz) ;


D=zeros(max_x,max_y,1,ii);
for ii=1:size(Montage,2)
    D(end-size(Montage(ii).cdata,1)+1:end, end-size(Montage(ii).cdata,2)+1:end,1,ii)=Montage(ii).cdata(:,:) ;
end

montage(D, 'DisplayRange', []);

pause(1)


return






% ---------------------------------------------------
function Untitled_254_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_254 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_255_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_255 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 
% ---------------------------------------------------
function Untitled_260_Callback(hObject, eventdata, handles)
    
web('https://github.com/ithreeMIF/BacFormatics')
% ---------------------------------------------------
function Untitled_261_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_261 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_262_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_262 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Untitled_263_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_263 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ---------------------------------------------------
function Acknowledgments_Callback(hObject, eventdata, handles)
 
track_what=get(handles.track_what2,'Value') 
Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid; 

 

cell_list=[1388 418 431 350 1385]
frame_list=[170 41 50 57 80]
for ii=1:5 %on the base of cell
    Cell=cell_list(ii); 
    Frame=frame_list(ii);
    for jj=1:10 
        n=Frame+(jj-1)*2;%n is the temp frame
        Centy1=Centy(n).cdata(:,6);
        Ind= find(Centy1== Cell);
   

matrix_bw=read_image(n,3,1);%  Seperate channels
matrix_raw=read_image(n,1,1);%  Seperate channels


xy=handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(n).cdata(Ind,:) 

L=bwlabel(matrix_bw,4);
matrix_bw= L==Ind;



       
  
  
  
  
  
  
  
  

Orientation=handles.data_file(4).cdata.L(track_what).cdata.Orientation(n).cdata(Ind,:)-90
 

%% %%%%%%%%%%%%%%%%%%%

% Below is code to decide which point is inn the direction of movment:
n_forward=n+2;
Centy2=Centy(n_forward).cdata(:,6);
Ind2= find(Centy2== Cell);
Cxy2=handles.data_file(4).cdata.L(track_what).cdata.Centroid( n_forward).cdata(Ind2,1:2)
Cxy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid( n).cdata(Ind,1:2)
  major_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p1(n).cdata(Ind,:)  
  major_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p2(n).cdata(Ind,:)  


X1=  handles.data_file(4).cdata.L(track_what).cdata.X1(n).cdata ;
Y1=  handles.data_file(4).cdata.L(track_what).cdata.Y1(n).cdata ;

Pole1_y= handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(n).cdata+X1-1;
Pole1_x= handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(n).cdata+Y1-1 ;
Pole2_y= handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(n).cdata+X1-1 ;
Pole2_x= handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(n).cdata+Y1-1 ;


major_axis_p1=[Pole1_x(Ind) Pole1_y(Ind)] 
major_axis_p2=[Pole2_x(Ind) Pole2_y(Ind)] 

 
  
    
major_axis_p1(1)=ceil(major_axis_p1(1)) 
major_axis_p2(1)=ceil(major_axis_p2(1))
major_axis_p1(2)=floor(major_axis_p1(2)) 
major_axis_p2(2)=floor(major_axis_p2(2))




x3=Cxy2(:,1);
x2=Cxy1(:,1);
x11=major_axis_p1(:,1);

y3=Cxy2(:,2);
y2=Cxy1(:,2);
y11=major_axis_p1(:,2);



Theta1=angle_deg_2d_BACWrapper( [x11 y11],[x2 y2],[x3 y3]);
if  Theta1>180 
    Theta1=360-Theta1;
end
     
 

x22=major_axis_p2(:,1);
y22=major_axis_p2(:,2);



Theta2=angle_deg_2d_BACWrapper( [x22 y22],[x2 y2],[x3 y3]);
if  Theta2>180 
    Theta2=360-Theta2;
end 
 








%% %%%%%%%%%%%%%%%%%%%
 
      

 
matrix_p1=matrix_bw*0;
matrix_p1(y11,x11)=1;
try
    matrix_p1(y11+1,x11)=1;
end
try
    matrix_p1(y11-1,x11)=1;
end
try
    matrix_p1(y11,x11+1)=1;
end
try
    matrix_p1(y11+1,x11-1)=1;
end





matrix_p2=matrix_bw*0;
matrix_p2(y22,x22)=1;


try
    matrix_p2(y22+1,x22)=1;
end
try
    matrix_p2(y22-1,x22)=1;
end
try
    matrix_p2(y22,x22+1)=1;
end
try
    matrix_p2(y22+1,x22-1)=1;
end



 
 

Centroid_Detect_spots_ch02=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch02(n).cdata(Ind,1:2)
sx1=round(Centroid_Detect_spots_ch02(1));
sy1=round(Centroid_Detect_spots_ch02(2));




matrix_spot=matrix_bw*0;matrix_spot(sy1,sx1)=1;
  
try
    matrix_spot(sy1+1,sx1)=1;
end
try
    matrix_spot(sy1-1,sx1)=1;
end
try
    matrix_spot(sy1,sx1+1)=1;
end
try
    matrix_spot(sy1+1,sx1-1)=1;
end



 
 
 
 X1=round(xy(2)) ;
 Y1=round(xy(1));
 X2=round(xy(2)+xy(4));
 Y2=round(xy(1)+xy(3));
 ROI_bw= matrix_bw(X1:X2,Y1:Y2) ;
 ROI_raw= matrix_raw(X1:X2,Y1:Y2) ;
 
 ROI_p1=matrix_p1(X1:X2,Y1:Y2) ;
 ROI_p2=matrix_p2(X1:X2,Y1:Y2) ;
 ROI_spot=matrix_spot(X1:X2,Y1:Y2) ;

 
        
         
        if  Orientation<90
            Orientation=Orientation-90 ;% imrotate rotate in a counterclockwise direction , so orientation angle must be negative
        elseif    Orientation>90
            
              Orientation=90-Orientation ;
        end
       
 ROI_bw= imrotate(ROI_bw,-Orientation+90);
 ROI_p1= imrotate( ROI_p1,-Orientation+90);
 ROI_p2= imrotate( ROI_p2,-Orientation+90);
ROI_spot= imrotate( ROI_spot,-Orientation+90);

 ROI_raw= imrotate(ROI_raw,-Orientation+90);

% 
%   figure(1)
%         imagesc( ROI_p1) 
%         figure(2)
%         imagesc( ROI_p2)
%         figure(3)
%         imagesc( ROI_spot)
%         
% %         
%         pause
%  figure(1)
%  imagesc( ROI_p1)
%  
%    
%  figure(2)
%  imagesc( ROI_p2)
 
 
% first find new points in the rotated image
[y11,x11]=find( ROI_p1);x11=x11(1);
[y22,x22]=find( ROI_p2);x22=x22(1);
 

 

% now,  i want that the leading point will be in right side. 
% first i need to know whch point is the leading point?
  
%    ok so we want that the leading point is in the right side. thereore i cheack if the leading point is ine right, and if not, then rotate the omage 180 gedrees
  

if Theta1>Theta2
    'p2 is leading point'
    
    if x11>x22
        ROI_bw= imrotate(ROI_bw,180);
        ROI_p1= imrotate( ROI_p1,180);
        ROI_p2= imrotate( ROI_p2,180);
        ROI_spot= imrotate( ROI_spot,180);
        ROI_raw= imrotate(ROI_raw,180);
      
    end
else
    'p1 is leading point'
    if x11<x22
        ROI_bw= imrotate(ROI_bw,180);
        ROI_p1= imrotate( ROI_p1,180);
        ROI_p2= imrotate( ROI_p2,180);
        ROI_spot= imrotate( ROI_spot,180);
        
          ROI_raw= imrotate(ROI_raw,180);
    end
end
 

  
  if ii==5 & jj==7
        ROI_bw= imrotate(ROI_bw,180); 
        ROI_spot= imrotate( ROI_spot,180);
        ROI_raw= imrotate(ROI_raw,180); 
end
  
  
  
  
  if jj>5
        ROI_bw= imrotate(ROI_bw,180); 
        ROI_spot= imrotate( ROI_spot,180);
        ROI_raw= imrotate(ROI_raw,180); 
end
  
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
 while max(ROI_bw(:,1))==0
     ROI_bw(:,1)=[];ROI_spot(:,1)=[];   ROI_raw(:,1)=[];
 end
 
  
 while max(ROI_bw(:,end))==0
     ROI_bw(:,end)=[]; ROI_spot(:,end)=[]; ROI_raw(:,end)=[];
 end
 
  
 while max(ROI_bw(1,:))==0
     ROI_bw(1,:)=[]; ROI_spot(1,:)=[]; ROI_raw(1,:)=[];
 end
 
  
 while max(ROI_bw(end,:))==0
     ROI_bw(end,:)=[]; ROI_spot(end,:)=[]; ROI_raw(end,:)=[];
 end

 ROI_raw(ROI_bw==0)=0;
 ROI_raw_stack(ii).cdata(jj).cdata=ROI_raw ;
 ROI_bw_stack(ii).cdata(jj).cdata=ROI_bw;
  ROI_spot_stack(ii).cdata(jj).cdata=ROI_spot;
  
 
    end
    ii
end
 SizeX=[]; SizeY=[];

for ii=1:5
    for jj=1:10
         ROI_bw=ROI_bw_stack(ii).cdata(jj).cdata ;
   
%          sizeX AND sizeY are the sizes of temp boundingbox
          SizeX(ii,jj)=size(ROI_bw,2);
          SizeY(ii,jj)=size(ROI_bw,1);
          
    end 
end  
%        STEP 2 ALLOCATE MAXIMUM Y AFTER RESHAPING, IN CORESPONDING TO A
%        FIX X DIMENSION:   this step is requied in real data

Xresize=300;

Yresize=[];
for ii=1:5
    for jj=1:10
        
%          sizeX AND sizeY are the sizes of temp boundingbox
          sizeX=SizeX(ii,jj);
          sizeY=SizeY(ii,jj); 

Yresize(ii,jj)=round((sizeY/sizeX)*Xresize);

    end
end
    Yresize=max(max(Yresize));
 
    
% step 3  here is abit different just because we repeat generation of simulated bounding box roi umage
% in this step we greate ROI which is the resied temporal normilized bounding box (need to do it for each channel
% we then put it within grid
% 
% 
% % for Grid:
 DeltaX=10;
 DeltaY=8;
 
% 
%  
% 

% 
  for ii=1:5
     for jj=1:10
        
%          sizeX AND sizeY are the sizes of temp boundingbox
          sizeX=SizeX(ii,jj);
          sizeY=SizeY(ii,jj);
           ROI_bw=ROI_raw_stack(ii).cdata(jj).cdata ;
           
            ROI_spot=ROI_spot_stack(ii).cdata(jj).cdata ;
  
         ROI_bw2= imresize(ROI_bw, [Yresize Xresize]);
  ROI_spot2= imresize(ROI_spot, [Yresize Xresize]);
         figure(1)
         imagesc(  ROI_bw2)
        Grid=zeros(Yresize+DeltaY*2,Xresize+DeltaX*2);
         Grid_spot=zeros(Yresize+DeltaY*2,Xresize+DeltaX*2);
       


Grid(DeltaY:(DeltaY+size(ROI_bw2,1))-1,DeltaX:(DeltaX+size(ROI_bw2,2))-1)=ROI_bw2;
Grid_spot(DeltaY:(DeltaY+size(ROI_bw2,1))-1,DeltaX:(DeltaX+size(ROI_bw2,2))-1)=ROI_spot2;



if jj==1;
    matrix_grid_jj=Grid;  matrix_grid_jj_spot=Grid_spot;
else
    matrix_grid_jj(:,end+1:end+size(Grid,2))=Grid;    matrix_grid_jj_spot(:,end+1:end+size(Grid,2))=Grid_spot;
end

 
     end
     
     
    if ii==1;
    matrix_grid_ii= matrix_grid_jj;  matrix_grid_ii_spot= matrix_grid_jj_spot;
else
    matrix_grid_ii(end+1:end+size( matrix_grid_jj,1),:)= matrix_grid_jj; matrix_grid_ii_spot(end+1:end+size( matrix_grid_jj,1),:)= matrix_grid_jj_spot;
end

 
     
     
  end
 figure(1)
 imagesc(matrix_grid_ii)
  figure(2)
 imagesc(matrix_grid_ii_spot)
 
 figure(3)
 imagesc(matrix_grid_ii+matrix_grid_ii_spot)
matrix_grid_ii=uint8(255*matrix_grid_ii);
 
imwrite(matrix_grid_ii,'matrix_grid_ii_choo_ch00.tif')
 matrix_grid_ii_spot=uint8(255*matrix_grid_ii_spot);
imwrite(matrix_grid_ii_spot,'matrix_grid_ii_choo_ch02.tif')
msgbox('ready')
return







% lllllll
    load vec
    set(handles.new_cells_data,'string',{vec})
%     
%  load data_file
%  handles.data_file(1).cdata=data_file(1).cdata
%  guidata(hObject,handles)
 
popupmessage_BACWrappe('Acknowledgment.txt','Acknowledgments' )

% ---------------------------------------------------


% -----------------------
% --- Otherwise, executes on mouse press in 5 pixel border or over Show_boundingbox.
function Show_boundingbox_ButtonDownFcn(hObject, eventdata, handles)
 

% --------------------------------------------------------------------
function Untitled_300_Callback(hObject, eventdata, handles)
    track_what=get(handles.track_what2,'Value') ;
    n=get(handles.Raw_listbox,'Value') ;
    Vercat_ML=handles.data_file(4).cdata.L(track_what).cdata.Vercat_ML(n).cdata;
    vecX=Vercat_ML(:,1);
    vecY =Vercat_ML(:,2) ;
  intersection_z_centerline=handles.data_file(4).cdata.L(track_what).cdata.Intersection_z_centerline(n).cdata; 
    global h_patch x_patch y_patch
    np=length( h_patch) ; 
    
    h=timebar_BACWrapper('Please wait....');
set(h,'color','w');
    for kk = 1:np   
        timebar_BACWrapper(h,kk/np) 
        if ~isnan(intersection_z_centerline(kk,1)) & ~isnan(intersection_z_centerline(kk,2))
        Data=[get(h_patch(kk),'ydata')   get(h_patch(kk),'xdata')]; 
        [~,Center] = kmeans(Data,1)  ; %new Center 
        vec=(vecX-Center(1)).^2+(vecY-Center(2)).^2 ;
        [~,ind]= min(vec);
        ind=ind(1);  
              intersection_z_centerline(kk,1) = vecX(ind);
              intersection_z_centerline(kk,2) = vecY(ind); 
        else
            intersection_z_centerline(kk,1) = nan;
              intersection_z_centerline(kk,2) = nan; 
        end
    end
    
    
    X1=  handles.data_file(4).cdata.L(track_what).cdata.X1(n).cdata ;
    Y1=  handles.data_file(4).cdata.L(track_what).cdata.Y1(n).cdata ;

     intersection_z_centerline(:,1)=intersection_z_centerline(:,1)-X1'+1;
     intersection_z_centerline(:,2)=intersection_z_centerline(:,2)-Y1'+1    ;
     
  handles.data_file(4).cdata.L(track_what).cdata.Intersection_z_centerline(n).cdata=   intersection_z_centerline; 
 
  
  
guidata(hObject, handles);
close(h)
show_frame( handles,n,'axes')  ;


   
    


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over spot_type.
function spot_type_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to spot_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in spot_type.
function spot_type_Callback(hObject, eventdata, handles)
 global spot_type spot_size  SE_paint 
spot_type_str=get(handles.spot_type,'string');
spot_type_val=get(handles.spot_type,'value');
spot_type= char(spot_type_str(spot_type_val)) ;
 
 
 
 
 
  if(strcmp(cellstr(spot_type),  'square')) 
        SE_paint=getnhood(strel(spot_type,spot_size)); 
    elseif (strcmp(cellstr(spot_type),  'disk')) 
        
        if spot_size==1
        SE_paint=1;
        else  
  SE_paint=getnhood(strel(spot_type,spot_size-1 ,0));   
  end
  end
 
  

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns spot_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from spot_type


% --- Executes on button press in nodes_list.
function nodes_list_Callback(hObject, eventdata, handles)
global Axes
Axes=get(hObject,'value')
eval(strcat('axes(handles.axes',num2str(Axes),')'))
eval(strcat('set(handles.axes',num2str(Axes),',','''','userdata','''',',[])')) 
global paint_matrix

n=round(get(handles.Raw_listbox,'Value'));


Projected_by =get(handles.Projected_by,'String') ;

box_Raw=get(handles.Raw_listbox,'string') ;
track_what2=get(handles.track_what2,'Value') ;
 


shift_frame=str2num(get(handles.shift_frame,'string'));
if n==1
    shift_frame=0;
end
paint_matrix= read_image2(n-shift_frame ,3,Projected_by, char(box_Raw(n-shift_frame)), track_what2,track_what2);


 
try
    show_frame( handles,n,'axes')
end
set(handles.showcurrentframe,'String',num2str(n ));
  axis tight
% --------------------------------------------------------------------
function Untitled_302_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_302 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global posmatrix
Parent = inputdlg('Please allocate parent node');
 Parent = str2num(char(Parent))
 if Parent>size(posmatrix,1) | isnan(Parent) | isempty(Parent)
      
    msgbox('error-parent node is not exist')
    return
 end
if isempty(Parent)
    msgbox('wrong input for parent node.')
end
str='filter'

 
 
 Axes=size(posmatrix,1)+1;
  
 
 
   Pos=posmatrix(Parent,1:4);
   Pos(2)=Pos(2)-Pos(4)-0.1
   
     %if we already have a aquaare there we will place the new square in he
   %corner
   
   
   
   posmatrix3=zeros(100,100);
   Pos2=round(100*Pos);
   Pos2( Pos2==0)=1; 
   try
   posmatrix3(Pos2(2):Pos2(2)+Pos2(4),Pos2(1):Pos2(1)+Pos2(3)) =1;
   catch
       msgbox('not enough space for the new node.')
   return
   end
    
 eval(strcat('handles.axes',num2str(Axes),'=axes;'))
 guidata(hObject, handles) 
 
   sum_posmatrix3=sum(posmatrix3(:)); 
   posmatrix2=round(100*posmatrix(:,1:4));
   posmatrix2(posmatrix2==0)=1; 
   for ii=1:size(posmatrix2,1)
       posmatrix3(posmatrix2(ii,2):posmatrix2(ii,2)+posmatrix2(ii,4),posmatrix2(ii,1):posmatrix2(ii,1)+posmatrix2(ii,3)) =0; 
   end 
   if sum(posmatrix3(:))<sum_posmatrix3*0.9%max ovelap set by R.S is 0.9
       Pos=[0.05 0.1  0.1 0.15]; 
   end
   posmatrix3=zeros(100,100);
   Pos2=round(100*Pos);
   Pos2( Pos2==0)=1; 
   posmatrix3(Pos2(2):Pos2(2)+Pos2(4),Pos2(1):Pos2(1)+Pos2(3)) =1;
   sum_posmatrix3=sum(posmatrix3(:)); 
   posmatrix2=round(100*posmatrix(:,1:4));
   posmatrix2(posmatrix2==0)=1; 
   for ii=1:size(posmatrix2,1)
       posmatrix3(posmatrix2(ii,2):posmatrix2(ii,2)+posmatrix2(ii,4),posmatrix2(ii,1):posmatrix2(ii,1)+posmatrix2(ii,3)) =0; 
   end 
   if sum(posmatrix3(:))<sum_posmatrix3*0.9%max ovelap set by R.S is 0.9
       Pos=[0.85 0.1  0.1 0.15]; 
   end
  
   
   
   
   
   
   
   
   
   
   
   
 posmatrix(Axes,1:4)= Pos 
 posmatrix(Axes,5)=Parent
 
 eval(strcat('set(handles.axes',num2str(Axes),',','''','FontSize','''',',[',num2str(5),'])'))
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Position','''',',[',num2str(Pos),'])'))
  eval(strcat('set(handles.axes',num2str(Axes),',','''','Box','''',',','''','on','''',')'))
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Color','''',',','''','w','''',')'))
  eval(strcat('set(handles.axes',num2str(Axes),',','''','XColor','''',',','''','w','''',')'))
  eval(strcat('set(handles.axes',num2str(Axes),',','''','YColor','''',',','''','w','''',')'))
 eval(strcat('h_title=get(handles.axes',num2str(Axes),',','''','ylabel','''',')'))
 
 str=char(['Node' num2str(Axes) ' : ' str])
 set(h_title,'string',str,'color','w') 
 
 str=get(handles.nodes_list,'string')
 str(Axes)={['Node-' num2str(Axes)]}
set(handles.nodes_list,'string',str)
%%%%%%%%%
% use Axes box location to create line with parent :



eval(['global h_Parent_' num2str(Axes)])
 
  



Parent=posmatrix(Axes,5);%must have a parent



X1=posmatrix(Axes,1)+ posmatrix(Axes,3)/2
X2=posmatrix(Parent,1)+ posmatrix(Parent,3)/2
Y1=posmatrix(Axes,2)+posmatrix(Axes,4)
Y2=posmatrix(Parent,2)
try
    eval(['delete(h_Parent_' num2str(Axes) ')'])
     
end

XX=[X2 X1] ;
YY=[Y2 Y1];

C=[0  1 0 ];

% eval(['h_Parent_' num2str(Axes) '=annotation(' '''' 'line' '''' ',[' num2str(XX) '],[' num2str(YY) '],','''','linewidth','''',',',num2str(2),',','''','color','''',',[',num2str(C) '])']) 
 eval(['h_Parent_' num2str(Axes) '=annotation(' '''' 'arrow' '''' ',[' num2str(XX) '],[' num2str(YY) '],','''','linewidth','''',',',num2str(2),',','''','color','''',',[',num2str(C) '],', '''','HeadStyle','''', ',', '''','Plain','''',',','''','ButtonDownFcn','''',',  @nodes_arrows_ButtonDown)'])
     

 
 
    function  nodes_arrows_ButtonDown(src,evnt)
%  
 


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)


% 

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
 

 function slider2ContValCallback(hFigure,eventdata, handles)
 % test it out - get the handles object and display the current value
 handles = guidata(hFigure) ;
n=get(handles.slider2,'Value') ;
 n=round(n)  ;
    if n==1
        str='Imean';
    elseif n==2
        str='Imax';
    else
        str=char(strcat('z',num2str(n-2)));
    end
    set(handles.Projected_by,'string',str)
    
    if (n~=1 && n<8)
        
        Raw_listbox_Callback([], [], handles)
    end
 
% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 'hi'
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global Projected_by
Projected_by =get(handles.Projected_by,'String');

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
 

  


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function Untitled_303_Callback(hObject, eventdata, handles)
  
%  set(gcf,'color', [ 0.08039    0.08784    0.19686])
 % --------------------------------------------------------------------
 global posmatrix
 posmatrix=[];
Axes=1
 Pos=[0.4   0.8     0.1    0.15]
 
 posmatrix(Axes,1:4)= Pos 
 posmatrix(Axes,5)=0
 
   eval(strcat('set(handles.axes',num2str(Axes),',','''','FontSize','''',',[',num2str(5),'])'))
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Position','''',',[',num2str(Pos),'])'))
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Box','''',',','''','on','''',')'))
 eval(strcat('h_title=get(handles.axes',num2str(Axes),',','''','ylabel','''',')'))
 
%
  
 eval(strcat('set(handles.axes',num2str(Axes),',','''','Color','''',',','''','w','''',')'))
  eval(strcat('set(handles.axes',num2str(Axes),',','''','XColor','''',',','''','w','''',')'))
  eval(strcat('set(handles.axes',num2str(Axes),',','''','YColor','''',',','''','w','''',')')) 
 
 
 
 str=get(handles.nodes_list,'string')
 str(Axes)={['Node-' num2str(Axes)]}
set(handles.nodes_list,'string',str)


%  eval(strcat('h_title=get(handles.axes',num2str(Axes),',','''','title','''',')'))
 set(h_title,'string','Node 1:source','color','w') 
 str(1)={'Node-1'}
set(handles.nodes_list,'string',str)
handles.flags.AR_lock=0;
    guidata(hObject, handles);
 
    
    
    
    
    
    




function updateTimer_test(hTimer_test, eventData, varargin) 
 global  XXX
 global YYY
 global hhh
 global hCounter
 try
 delete(hhh)
 end
%  hhh=scatter(YYY(hCounter),XXX(hCounter))
 line( YYY ,XXX ,'LineStyle','none','Marker','.'  ,'Color',[rand(1) rand(1) rand(1)], 'MarkerSize',6)%Hitt  ;
 hCounter=hCounter+1 
 if  hCounter>10
     hCounter=1;
 end
 


% --------------------------------------------------------------------
function Untitled_304_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_304 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HCA_module_zvi 


% --------------------------------------------------------------------
function Untitled_305_Callback(hObject, eventdata, handles)
convert_dv_into_tifs


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
choice = questdlg('Do you wish to close BacFormatics Toolbox?', 'Did you save your data?', 'Close', 'Cancel','Cancel');
if strcmp(choice, 'Cancel'); return; end;
delete(hObject);

% --- Executes on selection change in segmentation_type_44.
function segmentation_type_44_Callback(hObject, eventdata, handles)
% hObject    handle to segmentation_type_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns segmentation_type_44 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from segmentation_type_44


% --- Executes during object creation, after setting all properties.
function segmentation_type_44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to segmentation_type_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in track_what_44.
function track_what_44_Callback(hObject, eventdata, handles)
% hObject    handle to track_what_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns track_what_44 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from track_what_44


% --- Executes during object creation, after setting all properties.
function track_what_44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to track_what_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over track_what_22.
function track_what_22_ButtonDownFcn(hObject, eventdata, handles)
 Color_type_44= get(handles.track_what_44,'ForegroundColor') ;
        Color_type_33= get(handles.track_what_33,'ForegroundColor') ;
          choice = questdlg(['What color do you want to assign for this channel?'],'Hello User','Red','Green','Blue','Red');
switch choice
    case 'Red' 
        if (Color_type_33(1)==1 & Color_type_33(2)==0 & Color_type_33(3)==0) 
              set(handles.track_what_33,'ForegroundColor',[1 1 1])  ;       set(handles.segmentation_type_33,'ForegroundColor',[1 1 1])  ;
        end
        if (Color_type_44(1)==1 & Color_type_44(2)==0 & Color_type_44(3)==0)
            set(handles.track_what_44,'ForegroundColor',[1 1 1])  ;        set(handles.segmentation_type_44,'ForegroundColor',[1 1 1])  ;
        end 
        set(handles.track_what_22,'ForegroundColor',[1 0 0])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[1 0 0])  ;
    case 'Green'
         if (Color_type_33(1)==0 & Color_type_33(2)==1 & Color_type_33(3)==0)
               set(handles.track_what_33,'ForegroundColor',[1 1 1])  ;       set(handles.segmentation_type_33,'ForegroundColor',[1 1 1])  ;
         end
         if (Color_type_44(1)==0 & Color_type_44(2)==1 & Color_type_44(3)==0)
             set(handles.track_what_44,'ForegroundColor',[1 1 1])  ;        set(handles.segmentation_type_44,'ForegroundColor',[1 1 1])  ;
         end 
        set(handles.track_what_22,'ForegroundColor',[0 1 0])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[0 1 0])  ;
    case 'Blue'
         if (Color_type_33(1)==0 & Color_type_33(2)==0 & Color_type_33(3)==1) 
               set(handles.track_what_33,'ForegroundColor',[1 1 1])  ;       set(handles.segmentation_type_33,'ForegroundColor',[1 1 1])  ;
         end
         if (Color_type_44(1)==0 & Color_type_44(2)==0 & Color_type_44(3)==1)
             set(handles.track_what_44,'ForegroundColor',[1 1 1])  ;        set(handles.segmentation_type_44,'ForegroundColor',[1 1 1])  ;
        end
        set(handles.track_what_22,'ForegroundColor',[0 0 1])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[0 0 1])  ;
end
function track_what_33_ButtonDownFcn(hObject, eventdata, handles)
     Color_type_22= get(handles.track_what_22,'ForegroundColor') ;
        Color_type_44= get(handles.track_what_44,'ForegroundColor') ;
   
        choice = questdlg(['What color do you want to assign for this channel?'],'Hello User','Red','Green','Blue','Red');
switch choice
    case 'Red' 
        if (Color_type_22(1)==1 & Color_type_22(2)==0 & Color_type_22(3)==0)
         set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
        end
        if (Color_type_44(1)==1 & Color_type_44(2)==0 & Color_type_44(3)==0)
                 set(handles.track_what_44,'ForegroundColor',[1 1 1])  ;
        set(handles.segmentation_type_44,'ForegroundColor',[1 1 1])  ;
        end 
        set(handles.track_what_33,'ForegroundColor',[1 0 0])  ;
        set(handles.segmentation_type_33,'ForegroundColor',[1 0 0])  ;
    case 'Green'
         if (Color_type_22(1)==0 & Color_type_22(2)==1 & Color_type_22(3)==0)
                 set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
         end
         if (Color_type_44(1)==0 & Color_type_44(2)==1 & Color_type_44(3)==0)
               set(handles.track_what_44,'ForegroundColor',[1 1 1])  ;
        set(handles.segmentation_type_44,'ForegroundColor',[1 1 1])  ;
         end 
        set(handles.track_what_33,'ForegroundColor',[0 1 0])  ;
        set(handles.segmentation_type_33,'ForegroundColor',[0 1 0])  ;
    case 'Blue'
         if (Color_type_22(1)==0 & Color_type_22(2)==0 & Color_type_22(3)==1) 
                 set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
         end
         if (Color_type_44(1)==0 & Color_type_44(2)==0 & Color_type_44(3)==1)
                set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;
        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
        end
        set(handles.track_what_33,'ForegroundColor',[0 0 1])  ;
        set(handles.segmentation_type_33,'ForegroundColor',[0 0 1])  ;
end

function track_what_44_ButtonDownFcn(hObject, eventdata, handles) 
 Color_type_22= get(handles.track_what_22,'ForegroundColor') ;
 Color_type_33= get(handles.track_what_33,'ForegroundColor') ;
        
        choice = questdlg(['What color do you want to assign for this channel?'],'Hello User','Red','Green','Blue','Red');
switch choice
    case 'Red' 
        if (Color_type_22(1)==1 & Color_type_22(2)==0 & Color_type_22(3)==0) 
             set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
        end
        if (Color_type_33(1)==1 & Color_type_33(2)==0 & Color_type_33(3)==0)
           set(handles.track_what_33,'ForegroundColor',[1 1 1])  ;       set(handles.segmentation_type_33,'ForegroundColor',[1 1 1])  ;
        end 
        set(handles.track_what_44,'ForegroundColor',[1 0 0])  ;
        set(handles.segmentation_type_44,'ForegroundColor',[1 0 0])  ;
    case 'Green'
         if (Color_type_22(1)==0 & Color_type_22(2)==1 & Color_type_22(3)==0)
              set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
         end
         if (Color_type_33(1)==0 & Color_type_33(2)==1 & Color_type_33(3)==0)
             set(handles.track_what_33,'ForegroundColor',[1 1 1])  ;       set(handles.segmentation_type_33,'ForegroundColor',[1 1 1])  ;
         end 
        set(handles.track_what_44,'ForegroundColor',[0 1 0])  ;
        set(handles.segmentation_type_44,'ForegroundColor',[0 1 0])  ;
    case 'Blue'
         if (Color_type_22(1)==0 & Color_type_22(2)==0 & Color_type_22(3)==1) 
               set(handles.track_what_22,'ForegroundColor',[1 1 1])  ;        set(handles.segmentation_type_22,'ForegroundColor',[1 1 1])  ;
         end
         if (Color_type_33(1)==0 & Color_type_33(2)==0 & Color_type_33(3)==1)
             set(handles.track_what_33,'ForegroundColor',[1 1 1])  ;       set(handles.segmentation_type_33,'ForegroundColor',[1 1 1])  ;
        end
        set(handles.track_what_44,'ForegroundColor',[0 0 1])  ;
        set(handles.segmentation_type_44,'ForegroundColor',[0 0 1])  ;
end 



    % ---------------------------------------------------------------
function axes_ButtonDownFcn(hObject, eventdata, handles,Axes_in,point1,sel_typ)
  set(gcf,'Pointer','watch') % if Axes_in==1
%
%     return%next version should fix that
% end
point1 %= get(hObject,'CurrentPoint')  
% save point1 point1
sel_typ %= get(gcbf,'SelectionType')  
'hi'
 
global mode_1 mode_2 mode_3 mode_4 mode_5 mode_6   spot_size spot_type N_frames  stop_point;


global Mode cx cy Draw mode_8  
eval(strcat(' XLim=get(handles.axes',num2str(Axes_in),',','''','xlim','''',');')) ;
eval(strcat(' YLim=get(handles.axes',num2str(Axes_in),',','''','ylim','''',');')) ;
eval(strcat('point_axes=get(handles.axes',num2str(Axes_in),',','''','CurrentPoint','''',');')) ;
cx = point_axes(2,1)  ;
cy = point_axes(2,2)  ;



if strcmp(sel_typ,'extend')==1 
    Mode = 'pan' ;
    set(gcf,'Pointer','fleur') 
   
     
    if  cx<XLim(1) || cx>XLim(2) || cy<YLim(1) || cy>YLim(2)
        return
    end 
    set(handles.mode_text,'string','Pan','Visible','on')
end








segmentation_type=get(handles.segmentation_type1,'value');
track_what1=get(handles.track_what1,'Value') ;
track_what=get(handles.track_what2,'Value') ;
n=get(handles.Raw_listbox,'value');

Projected_by =get(handles.Projected_by,'String');

box_list=get(handles.Raw_listbox,'string');
filename=char(box_list(n));



 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ========================
if  mode_1 ==1
    if strcmp(sel_typ,'normal')==1
        if   findstr(char(handles.data_file(7).cdata(track_what,1)),'Y')==1
            Data=get(handles.show_tracks,'userdata' );vec_temp2=Data.vec_temp2 ;vec_temp1=Data.vec_temp1;N=Data.N  ;M=Data.M ;  vec_temp3(vec_temp2)=vec_temp1; vec_temp3 (end+1: M*N)=0;MATRIX = reshape(vec_temp3',N,M);
            sizee=size(MATRIX,2)/2;
            matrix=repmat([1 NaN;NaN 1],1,sizee );
            X=matrix(1,:).*MATRIX(n,:);
            Y=matrix(2,:).*MATRIX(n,:);
            X(isnan(X))=[]; %take off all nans from X vector
            Y(isnan(Y))=[]; %take off all nans from Y vector
            X2=X;
            Y2=Y;
            X2(X2==0)=[];
            Y2(Y2==0)=[];
            x=find((X>0)) ;
            xx=x*2-1;
            xxx=xx+1;
            min_XY=4096 ; % largest predicted image size
            
            
      
            
            
            for ii=1:length(xx)
                X2=MATRIX(:,xx(ii)); Y2=MATRIX(:,xxx(ii));
                XY= sqrt((X2-cx).^2+ (Y2-cy).^2)  ;
                if   min(XY) < min_XY
                    [min_XY,Frame_index]=min(XY);
                end
            end
            set(handles.Raw_listbox,'value',Frame_index);
            show_frame( handles,Frame_index,'axes')  ;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ========================
if  mode_2 ==1
    if strcmp(sel_typ,'normal')==1
        track_what=get(handles.track_what2,'Value') ;
        Data=get(handles.show_tracks,'userdata' );
        vec_temp2=Data.vec_temp2 ;
        vec_temp1=Data.vec_temp1;
        N=Data.N  ;
        M=Data.M ;
        vec_temp3(vec_temp2)=vec_temp1;
        vec_temp3 (end+1:  M*N)=0;
        MATRIX = reshape(vec_temp3',N,M);
        
        
        
        if isempty(MATRIX)==1
            return
        end
        stat=0;
%         point1 = get(hObject,'CurrentPoint')  ; 
%         sel_typ = get(gcbf,'SelectionType');
        n= get(handles.Raw_listbox,'value');
        
        sizee=size(MATRIX,2)/2;
        matrix=repmat([1 NaN;NaN 1],1,sizee );
        X=matrix(1,:).*MATRIX(n,:);
        Y=matrix(2,:).*MATRIX(n,:);
        X(isnan(X))=[];
        Y(isnan(Y))=[];
        
         
         
        XY= (X-cx).^2+ (Y-cy).^2     ;
        closest_track=find(ismember(XY,(min(XY)))) ;
        
        
        if isempty(closest_track)==1
            closest_track=1;
        end
        %find closest centroid to the selected point:
        XY= (centy1(:,1)-cx).^2+ (centy1(:,2)-cy).^2;
        XY_min_index=find(ismember(XY,(min(XY))))  ;
        for ii=1: size(handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata,1)
            xy= handles.data_file(4).cdata.L(track_what).cdata(n).cdata(ii).BoundingBox ;
            % find coresponding  bounding box to the closet centroid.
            % If the point is inside the bounding box eliminate the centroid
            if centy1(XY_min_index,1:2)== handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(ii,1:2)
                if xy(1)<cx && xy(2)<cy && cx<(xy(1)+xy(3)) && cy<(xy(2)+xy(4))
                    stat=1;
                    break
                end
            end
        end
        if     stat==0
            return
        end
        %  =====================
        
        
        [MATRIX,centy1,selection]=Tracking_option_GUI(closest_track,n,XY_min_index,XY,MATRIX,handles.data_file(4).cdata.L(track_what).cdata.Centroid, div_cells_Vec);
        
        
        if selection<10
            
            
            Data.vec_temp1=MATRIX(:);Data.vec_temp2=  find(Data.vec_temp1~=0) ; Data.vec_temp1(Data.vec_temp1==0)=[];Data.N=size(MATRIX,1);Data.M=size(MATRIX,2); set(handles.show_tracks,'userdata',Data)
            guidata(hObject,handles)
            
            show_frame( handles,n,'axes')  ;
        elseif selection>10
            handles.data_file(4).cdata.L(track_what).cdata.Centroid =centy1  ;
            guidata(hObject,handles)
            Untitled_25_Callback(hObject, eventdata, handles)
        end
        
        try
            cell_tracks_window('Untitled_1_Callback', h_cell_tracks_window.Untitled_1,[],h_cell_tracks_window)
        end
    end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if  mode_3==1
    h_split=waitbar(0,'Splitting cell...'); 
    if strcmp(sel_typ,'normal')==1
        [temp_Segmentation , full_filename_Segmentation]= read_image2(n ,3,Projected_by, filename, track_what,track_what);
       waitbar(0.15)
       matrix_raw= read_image2(n ,1,Projected_by, filename, track_what,track_what);
     waitbar(0.25) 
        temp_Segmentation2=bwlabel(temp_Segmentation,4);
         waitbar(0.45)
        x=  ceil(cx);  % ceil(XLim(1)+point1(1)*(XLim(2)-XLim(1)));
        y=  ceil(cy);  % ceil(YLim(1)+point1(3)*(YLim(2)-YLim(1)));
        %         convert to pixels:
       
        Val=temp_Segmentation2( y,x);
        
        new_temp=temp_Segmentation2==Val;
         waitbar(0.55)
 
        
        temp_Segmentation=temp_Segmentation-new_temp;
        s=regionprops(new_temp,'BoundingBox');  xy= s.BoundingBox ;
         waitbar(0.6)
        X1=round(xy(2)) ;
        Y1=round(xy(1));
        X2=round(xy(2)+xy(4));
        Y2=round(xy(1)+xy(3));
        matrix_bw= new_temp(X1:X2,Y1:Y2) ;
        matrix_raw=double(matrix_raw(X1:X2,Y1:Y2));
          waitbar(0.7)
        ROI= I_split_Xaxis_delta(matrix_bw, matrix_raw) ;
         waitbar(0.95)
        if max(max(bwlabel(ROI,4)))==1
            ROI=   South_North_function(matrix_bw) ;
        end
        
        temp_Segmentation(X1:X2,Y1:Y2)=temp_Segmentation(X1:X2,Y1:Y2) + ROI ;
        %         full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
        imwrite(logical(temp_Segmentation), full_filename_Segmentation);  %save file to hard drive
        close(h_split)
        if get(handles.Automatic_labeling_option,'value')==2
            try
                pushbutton27_Callback(hObject, eventdata, handles)
                Update_new_cells_list_Callback(hObject, eventdata, handles)
            catch
                Raw_listbox_Callback([], eventdata, handles)
            end
        else
            Raw_listbox_Callback([], eventdata, handles)
        end
    end
    
    if strcmp(sel_typ,'alt')==1
        
        [temp_Segmentation , full_filename_Segmentation]= read_image2(n ,3,Projected_by, filename, track_what,track_what);
         waitbar(0.15)
        %         temp_Segmentation=read_image2(n,3,track_what);
       x=  ceil(cx);  % ceil(XLim(1)+point1(1)*(XLim(2)-XLim(1)));
        y=  ceil(cy);  % ceil(YLim(1)+point1(3)*(YLim(2)-YLim(1)))
          
        
     
        
        
        temp_Segmentation2=bwlabel(temp_Segmentation,4);
         waitbar(0.25)
        Val=temp_Segmentation2( y,x);
        new_temp=temp_Segmentation2==Val;
         waitbar(0.35)
        temp_Segmentation=temp_Segmentation-new_temp;
        s=regionprops(new_temp,'BoundingBox');  xy= s.BoundingBox ;
         waitbar(0.45)
        X1=round(xy(2)) ;
        Y1=round(xy(1));
        X2=round(xy(2)+xy(4));
        Y2=round(xy(1)+xy(3));
        matrix_bw= new_temp(X1:X2,Y1:Y2) ; 
        ROI = middle_split_segment_ROI(matrix_bw) ;
        
         if max(max(bwlabel(ROI,4)))==1
              matrix_raw= read_image2(n ,1,Projected_by, filename, track_what,track_what);
              matrix_raw=double(matrix_raw(X1:X2,Y1:Y2));
              
              
             ROI= Split_Xaxis_delta(matrix_bw, matrix_raw) ;
             
         end
          
          waitbar(0.85)
        %         if max(max(bwlabel(ROI,4)))==1%still one
        %             ROI=   South_North_function(matrix_bw) ;
        %         end
        
        %         ROI(ROI>0)=1;
        
        temp_Segmentation(X1:X2,Y1:Y2)=temp_Segmentation(X1:X2,Y1:Y2) + ROI ;
            waitbar(0.9)
        %         full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
        imwrite(logical(temp_Segmentation), full_filename_Segmentation);  %save file to hard drive
        waitbar(1)
         close(h_split)
        if get(handles.Automatic_labeling_option,'value')==2
            try
                pushbutton27_Callback(hObject, eventdata, handles)
                Update_new_cells_list_Callback(hObject, eventdata, handles)
            catch
                Raw_listbox_Callback([], eventdata, handles)
            end
        else
            Raw_listbox_Callback([], eventdata, handles)
        end
    end
end
if  mode_4==1
    if strcmp(sel_typ,'alt')==1
         temp_Segmentation= read_image2(n ,3,Projected_by, filename, track_what,track_what);
        temp_Segmentation2=bwlabel(temp_Segmentation,4);
        x=  ceil(cx);  % ceil(XLim(1)+point1(1)*(XLim(2)-XLim(1)));
        y=  ceil(cy);  % ceil(YLim(1)+point1(3)*(YLim(2)-YLim(1)))
         
        %         convert to pixels:
        Val=temp_Segmentation2( y,x);
        
      
        
        [Y,X]=find (temp_Segmentation2==Val);
        mode5_vec= handles.mode5_vec;
        if isempty(mode5_vec)==1
            mode5_vec(1)=Val;
            h_imline_temp= line( X,Y ,'LineStyle','none','Marker','.'  ,'Color',handles.Colors_Line1, 'MarkerSize',6)%Hitt  ;
            eval(['global h_imline_mode5_' num2str(Val)])
            eval( ['h_imline_mode5_' num2str(Val) '=h_imline_temp'])
        else
            ind=find(mode5_vec==Val);
            if isempty(ind)~=1
                mode5_vec(ind)=[];
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
            else
                mode5_vec(end+1)=Val;
                h_imline_temp= line( X,Y ,'LineStyle','none','Marker','.'  ,'Color',handles.Colors_Line1, 'MarkerSize',6)%Hitt  ;
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['h_imline_mode5_' num2str(Val) '=h_imline_temp'])
            end
        end
        handles.mode5_vec= mode5_vec;
        guidata(hObject,handles)
    end
    if strcmp(sel_typ,'normal')==1
        set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch'); 
        mode5_vec= handles.mode5_vec;
        
        handles.mode5_vec= [];
        guidata(hObject,handles)
        if isempty(mode5_vec)~=1
            for ii=1:length(mode5_vec)
                Val=mode5_vec(ii);
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
            end
        end
        
        
        
        
        
        
        SE=strel(spot_type,spot_size);
        track_what= get(handles.track_what1,'Value') ;
        box_Raw=get(handles.Raw_listbox,'string');
        
        filename=char(box_Raw(n))   ;
        [temp_Segmentation , full_filename_Segmentation]= read_image2(n ,3,Projected_by, filename, track_what,track_what);
        
        
        temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation);
        
        
        L =bwlabel(temp_Segmentation,4);
        
        
        bw=ismember(L,mode5_vec);
        
        
        
        
        temp_Segmentation(bw==1)=0;
        
        %
        %
        
        bw =imclose(bw  ,SE ) ;
        bw =imfill(bw,'holes' ) ;
        
        
        max_dist_between_concaves=5;
        max_pixel_between_concaves=8;
        bw=patch_ROI(bw, max_dist_between_concaves,max_pixel_between_concaves); %8 and 5 are parameters that manually adjusted by R.S
        
        
        
        
        L =bwlabel(bw,4);
        s=regionprops(L,'BoundingBox'); %#ok<*MRPBW>
        xy_matrix=s.BoundingBox;
        xy_matrix(5)=n;
        
        
        
        
        temp_Segmentation(bw ==1)=1;
        %
        imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive
        
        
        handles.n=[];
        handles.xy_matrix =xy_matrix;
        handles.Forward=[];
        handles.box_cell_ind=[];handles.box_cell_ind_Label=[];
        guidata(hObject, handles);
        
        
        if get(handles.Automatic_labeling_option,'value')==2
            pushbutton27_Callback2(hObject, eventdata, handles,n)
        else
            Raw_listbox_Callback([], eventdata, handles)
        end
        
        
        
        
        
        
        
        
        
        set(handles.edit_axes1,'string','ready','ForegroundColor','w')
        
        
        
        
        
    end
end

% ========================%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if  mode_5==1
    if strcmp(sel_typ,'alt')==1
        temp_Segmentation= read_image2(n ,3,Projected_by, filename, track_what,track_what);
        temp_Segmentation2=bwlabel(temp_Segmentation,4);
 
 
       x=  ceil(cx);  % ceil(XLim(1)+point1(1)*(XLim(2)-XLim(1)));
        y=  ceil(cy);  % ceil(YLim(1)+point1(3)*(YLim(2)-YLim(1)))
        
      
        %         convert to pixels:
        Val=temp_Segmentation2( y,x) ;
        
    
        [X,Y]=find (temp_Segmentation2==Val);
        mode5_vec= handles.mode5_vec;
        
        if isempty(mode5_vec)==1  
            mode5_vec=Val ;
            h_imline_temp= line( Y,X ,'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',6)%Hitt  ;
            eval(['global h_imline_mode5_' num2str(Val)])
            eval( ['h_imline_mode5_' num2str(Val) '=h_imline_temp'])
        else
           
            ind=find(mode5_vec==Val) ;
            if isempty(ind)~=1 
                mode5_vec(ind)=[];
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
            else 
                mode5_vec(end+1)=Val;
                h_imline_temp= line( Y,X ,'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',6)%Hitt  ;
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['h_imline_mode5_' num2str(Val) '=h_imline_temp'])
            end
        end
        handles.mode5_vec= mode5_vec;
        guidata(hObject,handles)
    end
    if strcmp(sel_typ,'normal')==1
        set(handles.edit_axes1,'string','please wait...','ForegroundColor','r'); set(gcf,'Pointer','watch'); 
        mode5_vec= handles.mode5_vec;
        
        handles.mode5_vec= [];
        guidata(hObject,handles)
        if isempty(mode5_vec)~=1
            for ii=1:length(mode5_vec)
                Val=mode5_vec(ii);
                eval(['global h_imline_mode5_' num2str(Val)])
                eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
            end
        end
        
        
        
        Forward=[];
        choice = questdlg('How do you want to track the selected cell?', ...
            'Hello User', ...
            'Rewind','Forward','Forward');
        % Handle response
        pause(0.1)
        switch choice
            case 'Rewind'
                Forward = 0;
            case 'Forward'
                Forward = 1;
        end
        
        if isempty(Forward)==1
            msgbox('user aborted')
            return
        end
        
        
        n_frames_to_track=[];
        
        n_frames_to_track = inputdlg('Please input number of frames to follow or leave automatic as default','Input',1,{'automatic'});
        
        pause(0.1)
        
        if isempty(n_frames_to_track)==1
            msgbox('user aborted')
            return
        end
        n_frames_to_track=str2double(char(n_frames_to_track)) ;
        
        
        if  Forward==1
            if isnan(n_frames_to_track)
                for kk=1:length(mode5_vec)
                    Val=mode5_vec(kk);
                    val_vec=[];
                      temp_str=char(['Track selected cell:  ' num2str(Val) ' . Please wait.']) ;
                    h=waitbar(0,temp_str);
                    Counter=1;
                    val_vec(Counter)=Val;
                    
                    
                    
                    Counter=2;
                    
                    for ii=1:N_frames-n
                        waitbar(ii/(N_frames-n))
                        
                        filename0=char(box_list(ii+n-1));
                        temp_Segmentation0 = read_image2(ii+n ,3,Projected_by, filename0, track_what,track_what);
                        L0=bwlabel(temp_Segmentation0,4);
                        
                        filename1=char(box_list(ii+n));
                        temp_Segmentation1  = read_image2(ii+n-1 ,3,Projected_by, filename1, track_what,track_what);
                        
                        L1=bwlabel(temp_Segmentation1,4);
                        LL1=L1;
                        
                        
                        
                        
                        
                        L1(L0~=Val)=0;
                        
                        L1_VEC=L1;
                        L1_VEC(L1_VEC==0)=[];
                        Val= mode(L1_VEC);
                        
                        
                        val_vec(Counter)=Val  ;
                        matrix3=LL1==Val;
                        
                        
                        if isempty(matrix3)~=1
                            if sum(matrix3(:))<200
                                n_frames_to_track  =ii;
                                break
                            end
                        else
                            n_frames_to_track  =ii;
                            break
                        end
                        
                        Counter=Counter+1;
                    end
                    val_vec_kk(kk).cdata=val_vec;
                    close(h)
                end
            else
                
                for kk=1:length(mode5_vec)
                    Val=mode5_vec(kk);
                    val_vec=[];
                      temp_str=char(['Track selected cell:  ' num2str(Val) ' . Please wait.']) ;
                    h=waitbar(0,temp_str);
                    Counter=1;
                    
                    val_vec(Counter)=Val;
                    Counter=2;
                    
                    for ii=1:n_frames_to_track-1
                        waitbar(ii/n_frames_to_track)
                        
                        filename0=char(box_list(ii+n-1));
                        temp_Segmentation0 = read_image2(ii+n ,3,Projected_by, filename0, track_what,track_what);
                        L0=bwlabel(temp_Segmentation0,4);
                        
                        filename1=char(box_list(ii+n));
                        temp_Segmentation1  = read_image2(ii+n-1 ,3,Projected_by, filename1, track_what,track_what);
                        L1=bwlabel(temp_Segmentation1,4);
                        
                        LL1=L1;
                        
                        L1(L0~=Val)=0;
                        
                        L1_VEC=L1;
                        L1_VEC(L1_VEC==0)=[];
                        Val= mode(L1_VEC);
                        val_vec(Counter)=Val ;
                        Counter=Counter+1;
                    end
                    
                    val_vec_kk(kk).cdata=val_vec;
                    close(h)
                end
            end
        end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        if  Forward==0
            if isnan(n_frames_to_track)
                for kk=1:length(mode5_vec)
                    Val=mode5_vec(kk);
                    val_vec=[];
                    h=waitbar(0,'Loading images and track selected cells. Please wait ....');
                    Counter=1;
                    val_vec(Counter)=Val;
                    Counter=2;
                    
                    
                    for ii=n:-1:2
                        waitbar(1-ii/n)
                        filename0=char(box_list(ii));
                        temp_Segmentation0 = read_image2(ii ,3,Projected_by, filename0,track_what,track_what);
                        L0=bwlabel(temp_Segmentation0,4);
                        
                        filename1=char(box_list(ii-1));
                        temp_Segmentation1  = read_image2(ii-1 ,3,Projected_by, filename1, track_what,track_what);
                        
                        L1=bwlabel(temp_Segmentation1,4);
                        LL1=L1;
                        
                        L1(L0~=Val)=0;
                        
                        L1_VEC=L1;
                        L1_VEC(L1_VEC==0)=[];
                        Val= mode(L1_VEC);
                        
                        
                        val_vec(Counter)=Val ;
                        matrix3=LL1==Val;
                        
                        
                        if isempty(matrix3)~=1
                            if sum(matrix3(:))<200
                                n_frames_to_track  =ii;
                                break
                            end
                        else
                            n_frames_to_track  =ii;
                            break
                        end
                        
                        Counter=Counter+1;
                    end
                    val_vec_kk(kk).cdata=val_vec;
                    close(h)
                end
            else
                
                for kk=1:length(mode5_vec)
                    Val=mode5_vec(kk);
                    val_vec=[]; Sum_vec=[];
                    temp_str=char(['Track selected cell:  ' num2str(Val) ' . Please wait.']) ;
                    h=waitbar(0,temp_str);
                    Counter=1;
                    
                    val_vec(Counter)=Val;
                    Counter=2;
                    for ii=n:-1:(n-n_frames_to_track+2)
                        waitbar(1-ii/n)
                        filename0=char(box_list(ii));
                        temp_Segmentation0 = read_image2(ii ,3,Projected_by, filename0, track_what,track_what);
                        L0=bwlabel(temp_Segmentation0,4);
                        
                        filename1=char(box_list(ii-1));
                        temp_Segmentation1  = read_image2(ii-1 ,3,Projected_by, filename1, track_what,track_what);
                        L1=bwlabel(temp_Segmentation1,4);
                        
                        
                        
                        LL1=L1;
                        
                        L1(L0~=Val)=0;
                        
                        L1_VEC=L1;
                        L1_VEC(L1_VEC==0)=[];
                        Val= mode(L1_VEC);
                        
                        
                        val_vec(Counter)=Val ;
                        Counter=Counter+1;
                    end
                    val_vec_kk(kk).cdata=val_vec;
                    close(h)
                end
                
            end
        end
        
        
        
        
        
        Montage=[];xy_matrix=[];
        
        mini=N_frames;
        
        for kk=1:size( val_vec_kk,2)
            temp_vec=   val_vec_kk(kk).cdata;
            temp_vec(isnan(temp_vec))=[];
            if mini>size( temp_vec,2);
                mini=size( temp_vec,2);
            end
        end
        
        for kk=1:size( val_vec_kk,2)
            val_vec_kk(kk).cdata=val_vec_kk(kk).cdata(1:mini);
        end
        
        
            h=waitbar(0,'Create montage. Please wait ....');
        for ii=1:mini
             waitbar(ii/mini)
            temp_val_vec=[];
            if  Forward==1
                N=n+ii-1;
            elseif Forward==0
                N=n-ii+1     ;
            end
            
            
            
            filename =char(box_list(N));
            temp_Segmentation= read_image2( N ,3,Projected_by, filename, track_what,track_what);
            L1=bwlabel(temp_Segmentation,4);
            temp_Raw  = read_image2(N  ,1,Projected_by, filename, track_what,track_what);
            
            
            for kk=1:size( val_vec_kk,2)
                temp_val_vec(kk)=val_vec_kk(kk).cdata(ii) ;
            end
            
            matrix3 =  ismember(L1, temp_val_vec);
            box_cell_ind_Label(N).cdata=temp_val_vec;
            
            
            [cellXind , cellYind]=find( matrix3);
            temp_box_cell_ind=[];
            temp_box_cell_ind(:,1)=cellXind;
            temp_box_cell_ind(:,2)=cellYind; 
            box_cell_ind(N).cdata=temp_box_cell_ind;
            Sum_vec(ii)=sum(matrix3(:));
            L_matrix3=bwlabel(matrix3,4);
            s=regionprops(L_matrix3,'BoundingBox');
            temp_xy=[];
            for kk=1:size(s,1)
                temp_xy(kk,:)=s(kk).BoundingBox  ;
            end
            
            temp_xy(:,3)= temp_xy(:,1)+ temp_xy(:,3);
            temp_xy(:,4)= temp_xy(:,2)+ temp_xy(:,4);
            
            Y1=min(temp_xy(:,1)); Y2=max(temp_xy(:,3));
            X1=min(temp_xy(:,2)); X2=max(temp_xy(:,4));
            
            xy(2) = X1 ;
            xy(1) = Y1;
            xy(4)=X2-X1  ;
            xy(3)=Y2-Y1  ;
            xy_matrix(ii,1:4)=xy;xy_matrix(ii,5)=N;
            Montage(ii).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2)); 
        end
        close(h)
        
        
        %            if  Forward==0
        %                ii=1;
        %           for N=n:-1:(n-+1)
        %               temp_val_vec=[];
        %
        %               filename =char(box_list(N));
        %               temp_Segmentation= read_image2( N ,3,Projected_by, filename,handles.data_file, track_what,track_what);
        %               L1=bwlabel(temp_Segmentation,4);
        %               temp_Raw  = read_image2(N  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
        %
        %
        %              for kk=1:size( val_vec_kk,2)
        %                 temp_val_vec(kk)=val_vec_kk(kk).cdata(ii) ;
        %              end
        %
        %                 matrix3 =  ismember(L1, temp_val_vec);
        %                  [cellXind  cellYind]=find( matrix3);
        %                 temp_box_cell_ind=[];
        %                 temp_box_cell_ind(:,1)=cellXind;
        %                 temp_box_cell_ind(:,2)=cellYind;
        %                 box_cell_ind(N).cdata=temp_box_cell_ind;
        %
        %                 Sum_vec(ii)=sum(matrix3(:));
        %                 L_matrix3=bwlabel(matrix3,4);
        %
        %
        %                 s=regionprops(L_matrix3,'BoundingBox');
        %                  temp_xy=[];
        %                 for kk=1:size(s,1)
        %                 temp_xy(kk,:)=s(kk).BoundingBox  ;
        %                 end
        %
        %                 temp_xy(:,3)= temp_xy(:,1)+ temp_xy(:,3);
        %                 temp_xy(:,4)= temp_xy(:,2)+ temp_xy(:,4);
        %
        %                 Y1=min(temp_xy(:,1)); Y2=max(temp_xy(:,3));
        %                 X1=min(temp_xy(:,2)); X2=max(temp_xy(:,4));
        %
        %                 xy(2) = X1 ;
        %                 xy(1) = Y1;
        %                 xy(4)=X2-X1  ;
        %                 xy(3)=Y2-Y1  ;
        %                 xy_matrix(ii,1:4)=xy;xy_matrix(ii,5)=N;
        %                 Montage(ii).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
        %                 ii=ii+1;
        %           end
        %           end
       
        
        
        hh=plot_cell_track(Sum_vec ,Montage ,n,Forward);
        drawnow
        jframe = getjframe_BACWrapper(hh);
        % on_top=get(handles.on_top,'value');
        set(jframe,'AlwaysOnTop',1)
        uiwait(hh)
        
        
        
        
        %             figure(1)
        
        
        if isempty(stop_point)
            set(handles.edit_axes1,'string','Process was aborted...','ForegroundColor','w')
            return
        end
        
        
        
        
        
        if  Forward==1
            %            counting, lets say we have from 10 to 20, but only 15 is good.(stop  point=5)
            %            then,the new one will be tranfered : 11 12 13 14 15. then it stops
            
            for ii=1:stop_point
                N=n+ii-1;
                box_cell_ind2(N).cdata=box_cell_ind(N).cdata;
                box_cell_ind2_Label(N).cdata=box_cell_ind_Label(N).cdata;
            end
        elseif Forward==0
            
            for ii=1:stop_point
                N=n-ii+1;
                box_cell_ind2(N).cdata=box_cell_ind(N).cdata;
                box_cell_ind2_Label(N).cdata=box_cell_ind_Label(N).cdata;
            end
        end
        
        %                ii=1:5
        %                n=10
        %
        %                10 9 8 7 6
        
        
        
        
        
        
        %              handles.val_vec_kk=val_vec_kk;
        handles.n=n;
        handles.xy_matrix =xy_matrix ;
        handles.Forward=Forward;
        handles.box_cell_ind=box_cell_ind2;
        handles.box_cell_ind_Label=box_cell_ind2_Label;
        guidata(hObject, handles);
        show_frame( handles,n,'axes')
        
        set(handles.edit_axes1,'string','ready','ForegroundColor','w')
        
        
        
        
        
        
        %            [temp_Segmentation ,~]= read_image2(n ,3,Projected_by, filename,handles.data_file, track_what,track_what);
        %            temp_Segmentation2=bwlabel(temp_Segmentation,4);
        %            mode5_vec= handles.mode5_vec;
        %            handles.mode5_vec= [];     guidata(hObject,handles)
        %            bw = ismember(temp_Segmentation2,  mode5_vec);
        %            SE=strel('disk',spot_size);
        %            bw =imclose(bw  ,SE ) ;
        %            bw =imfill(bw,'holes' ) ;
        %            temp_Segmentation(bw ==1)=1;
        %            full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
        %            temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation);
        %            imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive
        %            handles.mode5_vec= [];
        %            guidata(hObject,handles)
        %            if isempty(mode5_vec)~=1
        %                for ii=1:length(mode5_vec)
        %                    Val=mode5_vec(ii);
        %                    eval(['global h_imline_mode5_' num2str(Val)])
        %                    eval( ['delete(h_imline_mode5_' num2str(Val) ')'])
        %                end
        %            end
        %            if get(handles.Automatic_labeling_option,'value')==2
        %                pushbutton27_Callback(hObject, eventdata, handles)
        %                Update_new_cells_list_Callback(hObject, eventdata, handles)
        %            else
        %                Raw_listbox_Callback([], eventdata, handles)
        %            end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if  mode_6==1 
    if strcmp(sel_typ,'normal')==1
        [ temp_Segmentation, full_filename_Segmentation]= read_image2(n ,3,Projected_by, filename, track_what,track_what);
        temp_Segmentation2=bwlabel(temp_Segmentation,4);
        x=  ceil(cx);  % ceil(XLim(1)+point1(1)*(XLim(2)-XLim(1)));
        y=  ceil(cy);  % ceil(YLim(1)+point1(3)*(YLim(2)-YLim(1)))
         
        %         convert to pixels:
        Val=temp_Segmentation2( y,x);
        temp_Segmentation(temp_Segmentation2==Val)=0;
%         bw_perim=bwperim(bw);
%         global XXX
%         global YYY
%           [XXX,YYY]=find(bw_perim) ;
% % % % % % %         %%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % % % % % start
% % % % % % % 
% % % % % % %  
% % % % % % % 
% % % % % % % global hTimer_test hCounter
% % % % % % % try
% % % % % % %     import java.awt.Robot;
% % % % % % %     import java.awt.event.*;
% % % % % % %     SimKey=Robot;
% % % % % % %     SimKey.keyPress(KeyEvent.VK_CONTROL);
% % % % % % %     SimKey.keyPress(KeyEvent.VK_C);
% % % % % % %     SimKey.keyRelease(KeyEvent.VK_CONTROL);
% % % % % % %     SimKey.keyRelease(KeyEvent.VK_C);
% % % % % % % end
% % % % % % % try
% % % % % % %     
% % % % % % %     stop(hTimer_test);
% % % % % % % end
% % % % % % % try
% % % % % % %     delete(timerfindall('tag','animationTimer_test'));
% % % % % % %     
% % % % % % % end
% % % % % % % 
% % % % % % % 
% % % % % % % clear SimKey
% % % % % % % Period=0.5%str2num(get(handles.Period,'string'));
% % % % % % %  
% % % % % % % hCounter=1;
% % % % % % % 
% % % % % % % 
% % % % % % % % Create timer object for animation
% % % % % % % 
% % % % % % % hTimer_test = timer(...
% % % % % % %     'ExecutionMode'       , 'fixedSpacing', ...
% % % % % % %     'ObjectVisibility'    , 'off', ...
% % % % % % %     'Tag'                 , 'animationTimer_test', ...
% % % % % % %     'StartFcn'            , @startTimer, ...
% % % % % % %     'StopFcn'             , @stopTimer, ...
% % % % % % %     'TimerFcn'            , @updateTimer_test, ...
% % % % % % %     'Period'              , Period, ...
% % % % % % %     'UserData'            , hObject);
% % % % % % % 
% % % % % % % % Start animation timer
% % % % % % % start( hTimer_test);
% % % % % % % 
% % % % % % % %%%%%%%%%%%%%%%%%
% % % % % % % 
% % % % % % % %         
% % % % % % % %         
% % % % % % %          return
%         temp_Segmentation(temp_Segmentation2==Val)=0;
%         
%         temp_Segmentation(temp_Segmentation>1)=1;temp_Segmentation=logical(temp_Segmentation);
%     
        imwrite(temp_Segmentation, full_filename_Segmentation);  %save file to hard drive
        if get(handles.Automatic_labeling_option,'value')==2
            pushbutton27_Callback(hObject, eventdata, handles)
            Update_new_cells_list_Callback(hObject, eventdata, handles)
        else
            Raw_listbox_Callback([], eventdata, handles)
        end
    end
end

if mode_8==1 
    if strcmp(sel_typ,'alt')==1 
        Draw = 1 ;  set(gcf,'Pointer','circle')
        set(handles.mode_text,'string','Painting:destructive','Visible','on') 
    end
    if strcmp(sel_typ,'normal')==1
        set(handles.mode_text,'string','Painting:contrastive','Visible','on')
        Draw = -1 ;  set(gcf,'Pointer','circle')
        
    end
end
 


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over mode_4.
   set(gcf,'Pointer','arrow') % if Axes_in==1
% hObject    handle to mode_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
function mode_4_ButtonDownFcn(hObject, eventdata, handles)
 popupmessage_BACWrappe('mode_4_info.txt','Info: Merge Cells Mode' ) 
  [a,b]=config_strel;
set(handles.spot_type,'value',a)
set(handles.spot_size,'string',b)
function mode_6_ButtonDownFcn(hObject, eventdata, handles)
msgbox('This mode will allow the user to remove selected segemnts with a mouse left click on a pointed segment','Info') 
function mode_3_ButtonDownFcn(hObject, eventdata, handles)
msgbox('This mode will allow the user to split selected segemnts with a mouse left click on a pointed segment','Info') 
function mode_7_ButtonDownFcn(hObject, eventdata, handles)
 popupmessage_BACWrappe('mode_7_info.txt','Info: Edit Association Mode' )   
function mode_8_ButtonDownFcn(hObject, eventdata, handles) 
popupmessage_BACWrappe('mode_8_info.txt','Info: Painting Mode' )    
[a,b]=config_strel;
set(handles.spot_type,'value',a)
set(handles.spot_size,'string',b)


 
function Show_Centerline_Callback(hObject, eventdata, handles) 
if get(hObject,'value')
        handles.flags.Centerline=abs(handles.flags.Centerline);
    else
        handles.flags.Centerline=-abs(handles.flags.Centerline);
    end
    guidata(hObject, handles);
    switch handles.flags.Centerline
        case 1
            Img = imread('Centerline.png'); % icon file name (.png) has to be equal to icon name 
        case -1
            Img = Img_imread('Centerline.png'); % icon file name (.png) has to be equal to icon name 
    end
    set(handles.Show_Centerline,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles)
    figure1_WindowButtonMotionFcn([], [], handles) 
    
function Show_Polar_Points_Callback(hObject, eventdata, handles)
if get(hObject,'value')
        handles.flags.Polar_Points=abs(handles.flags.Polar_Points);
    else
        handles.flags.Polar_Points=-abs(handles.flags.Polar_Points);
    end
    guidata(hObject, handles);
    switch handles.flags.Polar_Points
        case 1
            Img = imread('Polar_Points.png'); % icon file name (.png) has to be equal to icon name 
        case -1
            Img = Img_imread('Polar_Points.png'); % icon file name (.png) has to be equal to icon name 
    end
    set(handles.Show_Polar_Points,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles)
    figure1_WindowButtonMotionFcn([], [], handles)
function Show_Center_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    handles.flags.Center=abs(handles.flags.Center);
else
    handles.flags.Center=-abs(handles.flags.Center);
end
guidata(hObject, handles);
str=char(strcat('Center',num2str(abs(handles.flags.Center)),'.png'));
if handles.flags.Center<0
    Img =Img_imread(str);
elseif handles.flags.Center>0
    Img = imread(str);
end
set(handles.Show_Center,'cdata',Img)
Raw_listbox_Callback([], eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)   
function Show_Intersection_Callback(hObject, eventdata, handles)
if get(hObject,'value')
        handles.flags.Intersection=abs(handles.flags.Intersection);
    else
        handles.flags.Intersection=-abs(handles.flags.Intersection);
    end
    guidata(hObject, handles);
    switch handles.flags.Intersection
        case 1
            Img = imread('Intersection.png'); % icon file name (.png) has to be equal to icon name 
        case -1
            Img = Img_imread('Intersection.png'); % icon file name (.png) has to be equal to icon name 
    end
    set(handles.Show_Intersection,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles) 
function Show_Contour_Callback(hObject, eventdata, handles)
    if get(hObject,'value')
        handles.flags.Contour=abs(handles.flags.Contour);
    else
        handles.flags.Contour=-abs(handles.flags.Contour);
    end
    guidata(hObject, handles);
    switch handles.flags.Contour
        case 1
            Img = imread('With_contour_dots.png'); % icon file name (.png) has to be equal to icon name
        case 2
            Img = imread('With_contour.png'); % icon file name
        case -1
            Img = Img_imread('With_contour_dots.png'); % icon file name (.png) has to be equal to icon name
        case -2
            Img = Img_imread('With_contour.png'); % icon file name
    end
    set(handles.Show_Contour,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles) 
    figure1_WindowButtonMotionFcn([], [], handles)
 
function Show_Box_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    handles.flags.Box=abs(handles.flags.Box);
else
    handles.flags.Box=-abs(handles.flags.Box);
end
guidata(hObject, handles);
str=char(strcat('Box',num2str(abs(handles.flags.Box)),'.png'));
if handles.flags.Box<0
    Img =Img_imread(str);
elseif handles.flags.Box>0
    Img = imread(str);
end
set(handles.Show_Box,'cdata',Img)
Raw_listbox_Callback([], eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)  
function Show_Events_Callback(hObject, eventdata, handles)
if get(hObject,'value')
        handles.flags.Events=abs(handles.flags.Events);
    else
        handles.flags.Events=-abs(handles.flags.Events);
    end
    guidata(hObject, handles);
    switch handles.flags.Events
        case 1
            Img = imread('Events.png'); % icon file name (.png) has to be equal to icon name 
        case -1
            Img = Img_imread('Events.png'); % icon file name (.png) has to be equal to icon name 
    end
    set(handles.Show_Events,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles) 
function Show_Arrows_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    handles.flags.Arrows=abs(handles.flags.Arrows);
else
    handles.flags.Arrows=-abs(handles.flags.Arrows);
end
guidata(hObject, handles);
str=char(strcat('Arrows',num2str(abs(handles.flags.Arrows)),'.png'));
if handles.flags.Arrows<0
    Img =Img_imread(str);
elseif handles.flags.Arrows>0
    Img = imread(str);
end
set(handles.Show_Arrows,'cdata',Img)
Raw_listbox_Callback([], eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles) 
function Show_Contour_ButtonDownFcn(hObject, eventdata, handles)
 Flag=handles.flags.Contour;
 if Flag<0
     flag_mode=-1;
 else
       flag_mode=1;
 end
 Flag=abs(Flag)+1; 
  if   Flag > 2 %for each icon different nunber of options. i.e: 2 for contour (smooth line or dots)
        Flag=1;
    end
if flag_mode==1  
    switch Flag
        case 1
           Img = imread('With_contour_dots.png'); % icon file name (.png) has to be equal to icon name
        case 2
           Img = imread('With_contour.png'); % icon file name  
    end
end
if flag_mode==-1  
    switch Flag
        case 1
           Img = Img_imread('With_contour_dots.png'); % icon file name (.png) has to be equal to icon name
        case 2
           Img = Img_imread('With_contour.png'); % icon file name  
    end
end 
    set(handles.Show_Contour,'cdata',Img) 
    handles.flags.Contour=flag_mode*Flag;
    guidata(hObject, handles); 
    n=get(handles.Raw_listbox,'value')   ;
    show_frame( handles,n,'axes')  
    figure1_WindowButtonMotionFcn([], [], handles)
    
function Show_Mesh_ButtonDownFcn(hObject, eventdata, handles)
  Flag=handles.flags.Mesh;
 if Flag<0
     flag_mode=-1;
 else
       flag_mode=1;
 end
 Flag=abs(Flag)+1; 
  if   Flag > 3 %for each icon different nunber of options. i.e: 2 for Mesh (smooth line or dots)
        Flag=1;
    end
if flag_mode==1  
    switch Flag
        case 1
           Img = imread('Mesh_ribons_and_dots.png'); % icon file name (.png) has to be equal to icon name
        case 2
           Img = imread('Mesh_only_dots.png'); % icon file name  
           case 3
           Img = imread('Mesh_with_poles.png'); % icon file name  
    end
end
if flag_mode==-1 
 
    switch Flag
        case 1
           Img = Img_imread('Mesh_ribons_and_dots.png'); % icon file name (.png) has to be equal to icon name
        case 2
           Img = Img_imread('Mesh_only_dots.png'); % icon file name 
            case 3
           Img = Img_imread('Mesh_with_poles.png'); % icon file name 
    end
end 
    set(handles.Show_Mesh,'cdata',Img) 
    handles.flags.Mesh=flag_mode*Flag;
    guidata(hObject, handles); 
    n=get(handles.Raw_listbox,'value')   ;
    show_frame( handles,n,'axes') 
    figure1_WindowButtonMotionFcn([], [], handles) 
function Show_Segment_ButtonDownFcn(hObject, eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles) 
function Show_Segment_Callback(hObject, eventdata, handles)
if get(hObject,'value')
        handles.flags.Segment=abs(handles.flags.Segment);
    else
        handles.flags.Segment=-abs(handles.flags.Segment);
    end
    guidata(hObject, handles);
    switch handles.flags.Segment
        case 1
            Img = imread('Segment.png'); % icon file name (.png) has to be equal to icon name 
        case -1
            Img = Img_imread('Segment.png'); % icon file name (.png) has to be equal to icon name 
    end
    set(handles.Show_Segment,'cdata',Img)
    
    
   
n=round(get(handles.Raw_listbox,'Value')) ;

if handles.flags.Segment==1
    
    
    Projected_by =get(handles.Projected_by,'String') ;
    
    box_Raw=get(handles.Raw_listbox,'string') ;
    track_what2=get(handles.track_what2,'Value') ;
    
    shift_frame=str2num(get(handles.shift_frame,'string'));
    if n==1
        shift_frame=0;
    end
    
    global paint_matrix
    paint_matrix= read_image2(n-shift_frame ,3,Projected_by, char(box_Raw(n-shift_frame)), track_what2,track_what2);
    
    
end

show_frame( handles,n,'axes');
figure1_WindowButtonMotionFcn([], [], handles)

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Show_Box.
function Show_Box_ButtonDownFcn(hObject, eventdata, handles)
 
    Flag=handles.flags.Box;
    if Flag<0
        flag_mode=-1;
    else
        flag_mode=1;
    end
    Flag=abs(Flag)+1;
    if   Flag > 5  
        Flag=1;
    end
    
    str=char(strcat('Box',num2str(Flag),'.png'))
    
    if flag_mode==1
        Img = imread(str); % icon file name (.png) has to be equal to icon name
    end
    if flag_mode==-1
        Img =Img_imread(str);
    end
    set(handles.Show_Box,'cdata',Img)
    handles.flags.Box=flag_mode*Flag;
    guidata(hObject, handles);
    n=get(handles.Raw_listbox,'value')   ;
  show_frame( handles,n,'axes')
    figure1_WindowButtonMotionFcn([], [], handles)

 
% --- Executes during object creation, after setting all properties.
function Automatic_labeling_option_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Automatic_labeling_option (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Panel_Selection.
function Panel_Selection_Callback(hObject, eventdata, handles)
    Val=get(handles.Panel_Selection,'value')
    switch Val
        case 1
            set(handles.cell_selection_panel,'Visible','on')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','off') 
            set(handles.Noise_control_panel,'Visible','off')
               set(handles.graphics_config_panel,'Visible','off')
             set(handles.logo1_panel,'Visible','off') 
        case 2
            set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','on')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','off')
            set(handles.Noise_control_panel,'Visible','off')
               set(handles.graphics_config_panel,'Visible','off')
             set(handles.logo1_panel,'Visible','off')
        case 3
            set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','on')
            set(handles.Frame_range_panel,'Visible','off')
            set(handles.Noise_control_panel,'Visible','off')
               set(handles.graphics_config_panel,'Visible','off')
             set(handles.logo1_panel,'Visible','off')
        case 4
            set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','on')
            set(handles.Noise_control_panel,'Visible','off')
               set(handles.graphics_config_panel,'Visible','off')
              set(handles.logo1_panel,'Visible','off')
         case 5
            set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','off')
            set(handles.Noise_control_panel,'Visible','on')
               set(handles.graphics_config_panel,'Visible','off')
            set(handles.logo1_panel,'Visible','off')
        case 6   
         set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','off')
            set(handles.Noise_control_panel,'Visible','off')
               set(handles.graphics_config_panel,'Visible','on')
            set(handles.logo1_panel,'Visible','off') 
        case 7   
         set(handles.cell_selection_panel,'Visible','off')
            set(handles.rgb_panel,'Visible','off')
            set(handles.STREL_panel,'Visible','off')
            set(handles.Frame_range_panel,'Visible','off')
            set(handles.Noise_control_panel,'Visible','off')
               set(handles.graphics_config_panel,'Visible','off')
            set(handles.logo1_panel,'Visible','on') 
    end
 
  

% --- Executes during object creation, after setting all properties.
function Panel_Selection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Panel_Selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over mode_5.
function mode_5_ButtonDownFcn(hObject, eventdata, handles)
msgbox('This mode allow to edit particular sequences. Read p. 16-17 in BacFomatics use guide','Info')

% --- Executes on button press in BacFormatics_emblem.
function BacFormatics_emblem_Callback(hObject, eventdata, handles)
% hObject    handle to BacFormatics_emblem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function imread_mode_Callback(hObject, eventdata, handles)
 global imread_mode
imread_mode=get(handles.imread_mode,'value');
   
    
function show_frame(handles,n,MODE,get_image_from_axes)

global Axes  N_frames
eval(strcat('axes(handles.axes',num2str(Axes),')'))

if nargin==4 &  strcmp(get_image_from_axes,'get_image_from_axes')
    matrix_out=get(handles.axes1,'userdata');
else
    track_what = get(handles.track_what1,'Value');
    segmentation_type= get(handles.segmentation_type1,'Value') ;
    
    switch get(handles.Vis_option,'value')
        case 1 
            [matrix_out, full_filename] = read_image(n,segmentation_type,track_what);%  Seperate channels
            set(handles.edit_axes1,'String',full_filename);
        case 2
            matrix_out=show_frame_colocalize_tracking_module(handles,n);
        case 3
            disp('Co-plot under construction')
        case 4
 track_length_before=str2num(get(handles.MA_before,'String'))  ;
track_length_after=str2num(get(handles.MA_after,'String'))   ;
total_num_frames=get(handles.Raw_listbox,'max')   ;
start_MA_frame = n - track_length_before ;
if start_MA_frame<1
    start_MA_frame=1 ;
end

end_MA_frame = n + track_length_after ;
if end_MA_frame>total_num_frames
    end_MA_frame=total_num_frames ;
end
            matrix_out=  Moving_Average(n,segmentation_type,track_what, start_MA_frame,end_MA_frame);
    end
end 

Box=handles.flags.Box ; 
 if  Box>1
    try
        xy_matrix=handles.xy_matrix ;
        Ind= xy_matrix(:,5)==n;
        xy=  xy_matrix(Ind,1:4);
        rectangle('Position',xy,'LineWidth',3,'LineStyle','--','EdgeColor','r');
    end
    try
        bw = read_image(n,3,track_what);%
        L=bwlabel(bw,4);
        box_cell_ind_Label=handles.box_cell_ind_Label(n).cdata;
        if ~isempty(box_cell_ind_Label) 
        bw=ismember(L,box_cell_ind_Label) ;
        end
    end
 end

 if Box==5
     try
         if ~isempty(box_cell_ind_Label) 
           matrix_out(bw~=1)=0;
         end
     end
 end

if strcmp(MODE,'figure')
    
    
    
    MODE; %#ok<*VUNUS>
%     framePos = get(0,'screensize');%getpixelposition(handles.axes1) ;
%     framePos=[1  (framePos(4)-(  framePos(3) /2))  framePos(3) /2  (framePos(3)/2)-((framePos(4)-(framePos(3)/2)))/2];

 
       
    
framePos = getpixelposition(handles.axes1) ; scrsz = get(0,'ScreenSize') ;
framePos(1)= 1;
framePos(2)= framePos(2)*1.4;
framePos(3)=   scrsz(3)/2
framePos(4)=framePos(4)*0.925;
  
    global  h_figure
    [~, full_filename] = read_image(n,segmentation_type,track_what);% 
    h_figure=figure('color','w','units','pixels','position',  framePos,'numbertitle','off', 'name',char(full_filename),'colormap',handles.c) ;
    
    raw_image=matrix_out; 
    imagesc( matrix_out)%Hitt;
    set( h_figure,'userdata', matrix_out)
    hold on
    hh=get( h_figure,'children');
    xlabel('X','FontSize',12,'Color',[0 0 0]);
    ylabel('Y','FontSize',12,'Color',[0 0 0]);
   
    title(full_filename) ;
    %  axis tight; axis manual;
    index=1;
    YLim=get(handles.axes1,'YLim');
    set(hh,'ylim',YLim);
    XLim=get(handles.axes1,'XLim');
    set(hh,'xlim',XLim);
    % set(h,'YLim',YLim);
    
 
%      axis tight; axis manual;
    
    
         
    
    
    vec=get(handles.axess3,'userdata'  )   ;
    show_tracks=  get(handles.show_tracks,'value') ;
    
    
    
    switch show_tracks
        case 1
            selective_operator=get(handles.selective_operator  ,'value')   ;
            if selective_operator~=3
                if  isempty(intersect(vec,n))==0
                    eval(char(['global  matrixColormap_' num2str(n) ' matrixX_' num2str(n) ' matrixY_' num2str(n) ]))
                    eval(char( ['set(hh,''ColorOrder''' ,  ',matrixColormap_',num2str(n),')']))
                    eval(char(['    line(matrixX_' num2str(n) ',matrixY_' num2str(n) ',''Hittest'',''Off'',''Marker'',''.'',''MarkerSize'',5);']))
                end
            end
            
    end
    
    %  --------------------------------------------------
else
   
  'before:'
      eval(strcat('Xlim=get(handles.axes',num2str(Axes),',','''','xlim','''',')'))    
      eval(strcat('Ylim=get(handles.axes',num2str(Axes),',','''','ylim','''',')')) 
      
     cla %without cla the image will overlap with privous annotation! (well, can be good for some apps)
        
  
      h=imagesc( matrix_out)%Hitt; 
       
      
      
 eval(strcat('set(handles.axes',num2str(Axes),',','''','XColor','''',',','''','w','''',')'))
  eval(strcat('set(handles.axes',num2str(Axes),',','''','YColor','''',',','''','w','''',')')) 
 
 
     
     eval(strcat('set(handles.axes',num2str(Axes),',','''','xlim','''',',[',num2str(Xlim),'])'))
     eval(strcat('set(handles.axes',num2str(Axes),',','''','ylim','''',',[',num2str(Ylim),'])'))  
%   'set new xlim'
%       eval(strcat('xlim=get(handles.axes',num2str(Axes),',','''','xlim','''',')'))    
%        strcat('set(handles.axes',num2str(Axes),',','''','xlim','''',',[',num2str(xlim),'])')
%   
%      eval(strcat('set(handles.axes',num2str(Axes),',','''','ylim','''',',[',num2str(ylim),'])'))
 
%   
  if handles.flags.AR_lock==1
       AR=[1 1 1]
          eval(strcat('set(handles.axes', num2str(Axes),',','''','DataAspectRatio','''',',','[',num2str(AR),'])')) ;
      
  end
end 
 
    if  handles.flags.Contour>0 || handles.flags.Segment>0
        try
        global paint_matrix 
        if handles.flags.Segment==1
            [b2,b1]=find(paint_matrix);
            global h_paint
            h_paint =line( b1,b2 ,'LineStyle','none','Marker','+')%Hitt  ;
        end
         
        if  handles.flags.Contour==1 
            [Y,X]=find(bwperim(paint_matrix));
            line( X,Y ,'LineStyle','none','Marker','.'  ,'Color',handles.Colors_Line2, 'MarkerSize',handles.Width_Line2) 
        end
        if  handles.flags.Contour==2
            paint_matrix2=bwdist(~paint_matrix); 
            hold on
            contour( paint_matrix2,[1 1],'Color',handles.Colors_Line2) 
        end
        end
    end
 

 
 
 
    if handles.flags.Events==1
        hold on
        centy1 = handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata; 
         set(handles.nobjects,'string',num2str(size(centy1,1)))
        Ind=find(centy1(:,4)==-1)  ;
        plot(centy1(Ind,1),centy1(Ind,2), 'rx','LineWidth',4,  'MarkerSize',12  )%Hitt;
        
        
        Ind=1:size(centy1,1);
        b = handles.data_file(4).cdata.L(track_what).cdata.Centroid(n+1).cdata(:,4);
        b(b==-1)=[];
        Ind(b)=[];
        plot(centy1(Ind,1),centy1(Ind,2), 'c+','LineWidth',4,  'MarkerSize',17 )%Hitt;
        
        try
        
        BoundingBox=handles.Events(n).cdata;
        %     BoundingBox= handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(n).cdata    ;
        BoundingBox(:,3)=  BoundingBox(:,1)+  BoundingBox(:,3);
        BoundingBox(:,4)=  BoundingBox(:,2)+  BoundingBox(:,4);
        line([BoundingBox(:,1) BoundingBox(:,3)]',[BoundingBox(:,2) BoundingBox(:,2)]','Color','r')
        line([BoundingBox(:,1) BoundingBox(:,3)]',[BoundingBox(:,4) BoundingBox(:,4)]','Color','r')
        line([BoundingBox(:,1) BoundingBox(:,1)]',[BoundingBox(:,2) BoundingBox(:,4)]','Color','r')
        line([BoundingBox(:,3) BoundingBox(:,3)]',[BoundingBox(:,2) BoundingBox(:,4)]','color','r') 
    end
    end
 

try 
    track_what =get(handles.track_what2,'Value');  
  Color_parameters=get(handles.Color_parameters,'value');

%        global matrixColormap v1 v2 C
   
    switch  Color_parameters
        case 1 
            matrixColormap=handles.Colors_Line1  ;
        case 2
            matrixColormap=handles.Colors_Line1  ;
        case 3
            try 
                eval(char(['global  Velocity_matrixColormap_' num2str(n)])) 
                eval(char( ['matrixColormap=Velocity_matrixColormap_',num2str(n) ';']    )  ) 
              
            catch
                disp('please generate colormap for velocity annotations.')
            end
        case 4
                 try
                eval(char(['global  Displacement_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Displacement_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for Displacement annotations.')
                 end 
        case 5
           disp('under development')
        case 6 
            try
                eval(char(['global  Direction_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Direction_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for direction annotations.')
            end
        case 7
               disp('under development') 
        case 8
            try
                eval(char(['global  Orientation_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Orientation_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for orientation annotations.')
            end
        case 9
            try
                eval(char(['global  MajorAxisLength_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=MajorAxisLength_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for majorAxis annotations.')
            end
             case 10
            try
                eval(char(['global  MinorAxisLength_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=MinorAxisLength_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for minorAxis annotations.')
            end
            
               case 11
            try
                eval(char(['global  Eccentricity_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Eccentricity_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for Eccentricity annotations.')
            end
              case 12
            try
                eval(char(['global  Curvature_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Curvature_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for Curvature annotations.')
            end
              case 13
            try
                eval(char(['global  Area_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Area_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for Area annotations.')
            end
             case 14
            try
                eval(char(['global  Circularity_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Circularity_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for Circularity annotations.')
            end
                 eval(char(['global  Circularity_matrixColormap_' num2str(n)]))
                 eval(char( ['matrixColormap=Circularity_matrixColormap_',num2str(n) ';']    )  ) 
        case 15
            try
                eval(char(['global  Interpulated_Length_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=Interpulated_Length_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for Interpulated length annotations.')
            end
            
          case 16
            disp('under development')
            
            case 18
                
                  eval(char(['global  leading_polar_direction_angle_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=leading_polar_direction_angle_matrixColormap_',num2str(n) ';']    )  )
        case 19 
               try
                eval(char(['global  TracksLength_matrixColormap_' num2str(n)]))
                eval(char( ['matrixColormap=TracksLength_matrixColormap_',num2str(n) ';']    )  )
            catch
                disp('please generate colormap for TracksLength annotations.')
            end  
               
    end
    try
    matrixColormap(isnan(matrixColormap))=1; 
    
    if (Box==4  || Box==5) && handles.flags.Arrows~=4
        matrixColormap=matrixColormap(box_cell_ind_Label,:); 
    end
    eval(strcat('set(handles.axes',num2str(Axes),',','''','ColorOrder','''',',matrixColormap)'))
    end
      
   
            
 
          

 
    
    % if findstr(char(handles.data_file(7).cdata(track_what,2)),'Y')
    
    
    %  bug start here:
    %          if findstr(char(handles.data_file(7).cdata(track_what,1)),'Y')==1
    
    vec=get(handles.axess3,'userdata'  )   ;
    show_tracks=  get(handles.show_tracks,'value') ;
    
    
    
    
    switch show_tracks
        case 1
            selective_operator=get(handles.selective_operator  ,'value')   ;
            if selective_operator~=3
                if  isempty(intersect(vec,n))==0
                    eval(char(['global  matrixColormap_' num2str(n) ' matrixX_' num2str(n) ' matrixY_' num2str(n) ]))
                    eval(char( ['set(handles.axes1,''ColorOrder''' ,  ',matrixColormap_',num2str(n),')']))
                    eval(char(['    line(matrixX_' num2str(n) ',matrixY_' num2str(n) ',''Hittest'',''Off'',''Marker'',''.'',''MarkerSize'',17);']))
                end
            end
            
        case 2
            selective_operator=get(handles.selective_operator  ,'value')   ;
            if selective_operator~=3
                if  isempty(intersect(vec,n))==0
                    eval(char(['global  matrixColormap_' num2str(n) ' matrixX_' num2str(n) ' matrixY_' num2str(n) ]))
                    eval(char( ['set(handles.axes1,''ColorOrder''' ,  ',matrixColormap_',num2str(n),')']))
                    eval(char(['    line(matrixX_' num2str(n) ',matrixY_' num2str(n) ',''Hittest'',''Off'',''Marker'',''.'',''MarkerSize'',17);']))
                end
            end
        case 3
            selective_operator=get(handles.selective_operator  ,'value')   ;
            if selective_operator~=3
                if  isempty(intersect(vec,n))==0
                    eval(char(['global matrixX_' num2str(n) ' matrixY_' num2str(n) ]))
                    Length= eval(char(['size( matrixX_' num2str(n) ',1)']));
                    matrixColormap =jet(   Length);
                    set(handles.axes1, 'ColorOrder'  ,   matrixColormap )
                    eval(char(['line(rot90(matrixX_' num2str(n) '),rot90(matrixY_' num2str(n) '),''Hittest'',''Off'',''LineStyle'',''none'',''Marker'',''.'',''MarkerSize'',17);']))
                end
            end
        case 4
            selective_operator=get(handles.selective_operator  ,'value')   ;
            if selective_operator~=3
                if  isempty(intersect(vec,n))==0
                    
                    eval(char(['global  matrixColormap_' num2str(n) ' matrixX_' num2str(n) ' matrixY_' num2str(n) ' vecN_' num2str(n) ' vecX_' num2str(n) ' vecY_',num2str(n)]))
                    eval(char( ['set(handles.axes1,''ColorOrder''' ,  ',matrixColormap_',num2str(n),')']))
                    eval(char(['line(matrixX_' num2str(n) ',matrixY_' num2str(n) ',''Hittest'',''Off'',''Marker'',''.'',''MarkerSize'',6)']))
                    
                    eval(char( ['vecX=vecX_',num2str(n) ';']    )  )
                    eval(char( ['vecY=vecY_',num2str(n) ';']    )  )
                    eval(char( ['vecN=vecN_',num2str(n) ';']    )  )
%                     try
                      text( vecX    , vecY  ,{vecN} ,'Color','w','FontSize',10)
                      disp('developer R.S. needs to fix that, as it doesnt work on MATLB 2014 and above')
%                     end
                end
            end
            
    end
end
%  figure
%           hold on
%  
%   w=get(handles.togglebutton1,'Value')
%  w=w*1
%  
%  pause
% %     handles.data_file(4).cdata.L(track_what).cdata
%    z=handles.data_file(4).cdata.L(track_what).cdata
%    z
%   pause
if handles.flags.Spots==1
    hold on
      spots_channel =get(handles.spots_channel,'Value') 
      switch spots_channel
         case 1 
           Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch00(n).cdata ;  
          case 2
                      Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch01(n).cdata ;   
          case 3  
             
                       Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch02(n).cdata ;    
          case 4
                       Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch03(n).cdata ;  
      end
      if Box==4  || Box==5 %this is abit more tricky. we need to find the centroids of box_cell_ind_Label then to choose this cells (if exist) from Cell_ind:
 
           Centroid_Detect_spots=Centroid_Detect_spots(box_cell_ind_Label,:) 
      end
      
 
        line(Centroid_Detect_spots(:,1),Centroid_Detect_spots(:,2),'LineStyle','none','Marker',handles.Type_Mark1  ,'Color',handles.Colors_Mark1, 'MarkerSize',handles.Size_Mark1)%Hitt  ;
   
end



    if  handles.flags.Polar_Points>0 ||   handles.flags.Centerline>0 || handles.flags.Mesh>0  
      hold on
    track_what =get(handles.track_what2,'Value');
    try
    X1=  handles.data_file(4).cdata.L(track_what).cdata.X1(n).cdata ;
    Y1=  handles.data_file(4).cdata.L(track_what).cdata.Y1(n).cdata ;
    end
    global h_patch patch_clicked this_patch   x_patch y_patch
    if handles.flags.Polar_Points>0
        try
        Pole1_x= handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(n).cdata+X1-1;
        Pole1_y= handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(n).cdata+Y1-1 ;
        Pole2_x= handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(n).cdata+X1-1 ;
        Pole2_y= handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(n).cdata+Y1-1 ; 
        line( Pole1_y,Pole1_x ,'LineStyle','none','Marker','+'  ,'Color','m', 'MarkerSize',6)%Hitt  ;
        line(Pole2_y,Pole2_x ,'LineStyle','none','Marker','x'  ,'Color','c', 'MarkerSize',6)%Hitt  ;
        % Create the Patches
        sides=50;
        np=length(Pole1_y);
        h_patch = zeros(1,2*np); % patch handles
        x_patch = cell(1,2*np); % shape x-values
        y_patch = cell(1,2*np); % shape y-values
        psi = 2*pi*(0.5 + (0:sides-1)/sides);
        x_patch  = 2*cos(psi); % shape XData
        y_patch  = 2*sin(psi); % shape YData
        for kk = 1:2*np
            %     psi = 2*pi*(rand + (0:sides-1)/sides);
            if kk<=np
                clr = [0.2 0.4 0.7]; % shape Color
                h_patch(kk) = patch(y_patch+Pole1_y(kk) ,x_patch+Pole1_x(kk) ,clr);
            else
                clr = [0.7 0  0.2]; % shape Color
                h_patch(kk) = patch(y_patch+Pole2_y(kk-np) ,x_patch+Pole2_x(kk-np) ,clr);
            end
            set(h_patch(kk),'UserData',kk,'ButtonDownFcn', @move_poles_ButtonDown );
        end
        patch_clicked = 0;
        this_patch = h_patch(1);
    end
    end
    end
    if handles.flags.Centerline>0
        try
        Vercat_cell_centerline=handles.data_file(4).cdata.L(track_what).cdata.Vercat_Cell_centerline(n).cdata;
        line(Vercat_cell_centerline(:,2),Vercat_cell_centerline(:,1),'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',5)%Hitt  ;
        end
    end
    
  if handles.flags.Mesh>0
      try
         
        
         if handles.flags.Mesh==1
          Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Vercat_Cell_mesh(n).cdata;
        plot(Vercat_cell_mesh(:,[2 4])' ,Vercat_cell_mesh(:,[1 3])' ,'color','r'); 
        z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]);
        line( z(:,2),z(:,1) ,'LineStyle','none','Marker','.'  ,'Color','c', 'MarkerSize',6)%Hitt  ;
        Vercat_cell_centerline=handles.data_file(4).cdata.L(track_what).cdata.Vercat_ML(n).cdata;
        line(Vercat_cell_centerline(:,2),Vercat_cell_centerline(:,1),'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',5)%Hitt  ;
         end
         if handles.flags.Mesh==2 
               if Box==4  || Box==5
                 
                 
                 for kk=1:length(box_cell_ind_Label)
                    Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(box_cell_ind_Label(kk)).cdata  ; 
                     z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) 
                     line( z(:,2)+Y1(box_cell_ind_Label(kk))-1,z(:,1)+X1(box_cell_ind_Label(kk))-1 ,'LineStyle','none','Marker','.'  ,'Color','c', 'MarkerSize',6)%Hitt  ;
                 end
             else
                  z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]); 
                 line( z(:,2),z(:,1) ,'LineStyle','none','Marker','.'  ,'Color','c', 'MarkerSize',6)%Hitt  ;
                 
               end
         end
             
             
              if handles.flags.Mesh==3
%                 figure
%                    
%                    save box_cell_ind_Label box_cell_ind_Label
%                    save n n
%                    figure
%                     zzz= handles.data_file(4).cdata.L(track_what).cdata 
%                     save zzz zzz
%                    pause
                 
               if Box==4  || Box==5
                 
 
  
                 
                 for kk=1:length(box_cell_ind_Label) 
                    Cell_mesh_with_poles=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh_with_poles(n).cdata(box_cell_ind_Label(kk)).cdata  ; 
                     line(Cell_mesh_with_poles(:,2)+Y1(box_cell_ind_Label(kk))-1,Cell_mesh_with_poles(:,1)+X1(box_cell_ind_Label(kk))-1 ,'LineStyle','none','Marker','.'  ,'Color','c', 'MarkerSize',6)%Hitt  ;
                 end
               else   
                  Vercat_cell_mesh_with_poles=handles.data_file(4).cdata.L(track_what).cdata.Vercat_Cell_mesh_with_poles(n).cdata  ; 
                  line( Vercat_cell_mesh_with_poles(:,2),Vercat_cell_mesh_with_poles(:,1) ,'LineStyle','none','Marker','.'  ,'Color','c', 'MarkerSize',1)%Hitt  ; 
             end
              end
             
%               for kk=1:25%length(box_cell_ind_Label)
%                     Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;  
% %                     save  Vercat_cell_mesh  Vercat_cell_mesh
% %                     pause
% %                     save Vercat_cell_mesh Vercat_cell_mesh
% %                     pause
%                        z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[flipdim(Vercat_cell_mesh(:,3),1)  flipdim(Vercat_cell_mesh(:,4),1)]);
%                        z(end+1,:)=z(1,:);
%                         z = interparc(200,z(:,1),z(:,2)) ;
%                        line( z(:,2)+Y1(kk)-1,z(:,1)+X1(kk)-1 ,'LineStyle','none','Marker','.'  ,'Color','b', 'MarkerSize',3)%Hitt  ; 
%                       
%                       
% %                     
%                        if kk==1
%                        xyz=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1]; 
%                        z2=kk*ones(size(z,1),1); z2(end+1)=kk;
%                        else
%                              temp=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1];  
%                              temp2=kk*ones(size(z,1),1);temp2(end+1)=kk;
%                             xyz=vertcat(xyz,temp)
%                               z2=vertcat(z2,temp2);
%                        end
%               end 
%               line(xyz(:,2),xy(:,1) ,'LineStyle','none','Marker','.'  ,'Color','b', 'MarkerSize',3)%Hitt  ;  
%               
                          
%     str=['xy_blue_great.chan'] ; 
%     save(str, 'xyz', '-ASCII')
%              
%        str=['z_blue_great.chan'] ; 
%     save(str, 'z2', '-ASCII')
    
    
%     
%        for kk=26:50%length(box_cell_ind_Label)
%                     Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;  
% %                     save Vercat_cell_mesh Vercat_cell_mesh
% %                     pause
%                          z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[flipdim(Vercat_cell_mesh(:,3),1)  flipdim(Vercat_cell_mesh(:,4),1)]);
%                           z(end+1,:)=z(1,:);
%                         z = interparc(200,z(:,1),z(:,2)) ;
%                        line( z(:,2)+Y1(kk)-1,z(:,1)+X1(kk)-1 ,'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',3)%Hitt  ; 
%                       
%                        
% %                     
%                        
%                        if kk==26 
%                        xyz=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1];xyz(end+1,:)=xyz(1,:);
%                        z2=kk*ones(size(z,1),1); z2(end+1)=kk;
%                        else
%                              temp=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1]; temp(end+1,:)=temp(1,:);
%                              temp2=kk*ones(size(z,1),1);temp2(end+1)=kk;
%                             xyz=vertcat(xyz,temp)
%                               z2=vertcat(z2,temp2);
%                        end
%        end 
     
              
%       line(xy(:,2),xy(:,1) ,'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',3)%Hitt  ;  
%        
%                           
%     str=['xy_red_great.chan'] ; 
%     save(str, 'xyz', '-ASCII')
%              
%        str=['z_red_great.chan'] ; 
%     save(str, 'z2', '-ASCII')
%                for kk=1:50%length(box_cell_ind_Label)
%                     Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;  
% %                     save Vercat_cell_mesh Vercat_cell_mesh
% %                     pause
%                       z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) ;
%                        line( z(:,2)+Y1(kk)-1,z(:,1)+X1(kk)-1 ,'LineStyle','none','Marker','.'  ,'Color','b', 'MarkerSize',3)%Hitt  ; 
%                       
%                        
% %                     
%                        if kk==1
%                        xyz=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1 kk*ones(size(z,1),1)];
%                        else
%                              temp=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1 kk*ones(size(z,1),1)];
%                             xyz=vertcat(xyz,temp);
%                        end
%                end
%               
%                       
%                       
%                           
%     str=['test1.chan'] ; 
%     save(str, 'xyz', '-ASCII')
%                       msgbox('good!')
%               for kk=1:25%length(box_cell_ind_Label)
%                     Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;  
% %                     save Vercat_cell_mesh Vercat_cell_mesh
% %                     pause
%                       z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) ;
%                        line( z(:,2)+Y1(kk)-1,z(:,1)+X1(kk)-1 ,'LineStyle','none','Marker','.'  ,'Color','b', 'MarkerSize',3)%Hitt  ; 
%                       
%                        
%                      temp=  [z(:,2)+Y1(kk)-1 z(:,1)+X1(kk)-1 kk*ones(size(z,1),1)];
%                        
%                       pause
%                        
%                   end
%                       for kk=26:50%length(box_cell_ind_Label)
%                     Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(kk).cdata  ;  
%                       z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) ;
%                        line( z(:,2)+Y1(kk)-1,z(:,1)+X1(kk)-1 ,'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',3)%Hitt  ;
%                       end
                      
                      
%                        
%                        
%              if Box==4  || Box==5
%                  
%                  
%                  
%                  for kk=1:length(box_cell_ind_Label)
%                     Vercat_cell_mesh=handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(n).cdata(box_cell_ind_Label(kk)).cdata  ; 
%                      z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]) 
%                      line( z(:,2)+Y1(box_cell_ind_Label(kk))-1,z(:,1)+X1(box_cell_ind_Label(kk))-1 ,'LineStyle','none','Marker','.'  ,'Color','c', 'MarkerSize',3)%Hitt  ;
%                  end
%                  
%                  
%                  
%              else
%                   z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]); 
%                  line( z(:,2),z(:,1) ,'LineStyle','none','Marker','.'  ,'Color','b', 'MarkerSize',4)%Hitt  ;
%                  z =vertcat([Vercat_cell_mesh(:,1) Vercat_cell_mesh(:,2)],[Vercat_cell_mesh(:,3)  Vercat_cell_mesh(:,4)]); 
%                  line( z(:,2),z(:,1) ,'LineStyle','none','Marker','.'  ,'Color','r', 'MarkerSize',4)%Hitt  ;
%                   
%                  
%              end
      
      end 
  end
    
  
    if handles.flags.Intersection==1 
        try
        intersection_z_centerline=handles.data_file(4).cdata.L(track_what).cdata.Intersection_z_centerline(n).cdata;
        try
            intersection_z_centerline(:,1)=intersection_z_centerline(:,1)+X1 -1;
            intersection_z_centerline(:,2)=intersection_z_centerline(:,2)+Y1 -1    ;
        catch
            intersection_z_centerline(:,1)=intersection_z_centerline(:,1)+X1'-1;
            intersection_z_centerline(:,2)=intersection_z_centerline(:,2)+Y1'-1    ;
        end
        line(intersection_z_centerline(:,2)  ,intersection_z_centerline( :,1 ) ,'LineStyle','none','Marker','square'  ,'Color','c', 'MarkerSize',6)  ;
        % Create the Patches
        sides=3;
        np=size(intersection_z_centerline,1) ;
        h_patch = zeros(1,np); % patch handles
        x_patch =  cell(1,np); % shape x-values
        y_patch =  cell(1,np); % shape y-values
        psi = 2*pi*(0.5 + (0:sides-1)/sides);
        x_patch  = 1*cos(psi); % shape XData
        y_patch  = 1*sin(psi); % shape YData
        clr = [0.9 1 0.2]; % shape Color
        for kk = 1:np
            h_patch(kk) = patch(y_patch+intersection_z_centerline(kk,2) ,x_patch++intersection_z_centerline(kk,1) ,clr);
            set(h_patch(kk),'UserData',kk,'ButtonDownFcn', @move_poles_ButtonDown );
        end
        patch_clicked = 0;
        this_patch = h_patch(1);
    end
    end
 
  
    if handles.flags.Center>=1
        try
            track_what =get(handles.track_what2,'Value');
            Centroid=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata ;
         
            line(Centroid(:,1)  ,Centroid( :,2) ,'LineStyle','none','Marker','diamond'  ,'Color','m', 'MarkerSize',7)  ;
            
        end
    end
    
    
    
    
     if handles.flags.Center==2
         
    Data=get(handles.show_tracks,'userdata' );
    vec_temp2=Data.vec_temp2 ;
    vec_temp1=Data.vec_temp1;
    N=Data.N  ;
    M=Data.M ;
    vec_temp3= n:N:N*M;
    [vec_temp4,vec_temp5]=intersect(vec_temp2,vec_temp3);
    Y=   vec_temp1(vec_temp5(1:2:end))   ;
    X=   vec_temp1(vec_temp5(2:2:end))  ;
    N_total_index= vec_temp4(1:2:end)    ;
    Cell_list=(N_total_index-n )./(2*N)  +1 ;
    text(Y,X,cellstr(num2str(Cell_list)),'fontsize',handles.Size_Mark1*0.5 ,'VerticalAlignment','top','color',handles.Colors_Line2)
     end
     


 
 if  Box==1 
     try
        BoundingBox= handles.data_file(4).cdata.L(track_what).cdata.BoundingBox(n).cdata    ;
        BoundingBox(:,3)=  BoundingBox(:,1)+  BoundingBox(:,3);
        BoundingBox(:,4)=  BoundingBox(:,2)+  BoundingBox(:,4);
        line([BoundingBox(:,1) BoundingBox(:,3)]',[BoundingBox(:,2) BoundingBox(:,2)]','Color',handles.Colors_Line1)
        line([BoundingBox(:,1) BoundingBox(:,3)]',[BoundingBox(:,4) BoundingBox(:,4)]','Color',handles.Colors_Line1)
        line([BoundingBox(:,1) BoundingBox(:,1)]',[BoundingBox(:,2) BoundingBox(:,4)]','Color',handles.Colors_Line1)
        line([BoundingBox(:,3) BoundingBox(:,3)]',[BoundingBox(:,2) BoundingBox(:,4)]','color',handles.Colors_Line1)
    end
end

 
if  Box>1
    try
        xy_matrix=handles.xy_matrix ;
        Ind= xy_matrix(:,5)==n;
        xy=  xy_matrix(Ind,1:4);
        rectangle('Position',xy,'LineWidth',1,'LineStyle','--','EdgeColor','r');
    end 
end

if Box==2 || Box==4 || Box==5 
    try 
           if ~isempty(box_cell_ind_Label) 
               if  ~isempty(bw) 
        [X,Y]=find(bwperim(bw));
       line( Y,X ,'LineStyle','none','Marker','.'  ,'Color',handles.Colors_Line2, 'MarkerSize',handles.Width_Line2)
               end
           end
    end
end
 

if handles.flags.Box==3
    try
        if ~isempty(box_cell_ind_Label) 
            if   ~isempty(bw) 
        [X,Y]=find(bw);
         line( Y,X ,'LineStyle','none','Marker','.'  ,'Color',handles.Colors_Line2, 'MarkerSize',handles.Width_Line2)
            end
        end
    end 
end
 switch  handles.flags.Arrows
      case 1 
              
            major_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p1(n).cdata;
            major_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p2(n).cdata  ; 
            
            if Box==4  || Box==5
                major_axis_p1=major_axis_p1(box_cell_ind_Label,:);
                major_axis_p2=major_axis_p2(box_cell_ind_Label,:);
            end
            
            line([major_axis_p2(:,1)  major_axis_p1(:,1)]',[major_axis_p2(:,2)  major_axis_p1(:,2)]'  ,'LineWidth',handles.Width_Line1)%Hitt
      case 2 
            minor_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p1(n).cdata;
            minor_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p2(n).cdata  ; 
            
             if Box==4  || Box==5
                minor_axis_p1=minor_axis_p1(box_cell_ind_Label,:);
                minor_axis_p2=minor_axis_p2(box_cell_ind_Label,:);
             end
            
             
               line([minor_axis_p2(:,1)  minor_axis_p1(:,1)]',[minor_axis_p2(:,2)  minor_axis_p1(:,2)]'  ,'LineWidth',handles.Width_Line1)%Hitt
          
      case 3 %major and minor
           minor_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p1(n).cdata;
            minor_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p2(n).cdata  ; 
            major_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p1(n).cdata;
            major_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p2(n).cdata  ; 
            
              if Box==4  || Box==5
                major_axis_p1=major_axis_p1(box_cell_ind_Label,:);
                major_axis_p2=major_axis_p2(box_cell_ind_Label,:);
                minor_axis_p1=minor_axis_p1(box_cell_ind_Label,:);
                minor_axis_p2=minor_axis_p2(box_cell_ind_Label,:);
            end
            
            
            line([minor_axis_p2(:,1)  minor_axis_p1(:,1)]',[minor_axis_p2(:,2)  minor_axis_p1(:,2)]'  ,'LineWidth',handles.Width_Line1)%Hitt
            line([major_axis_p2(:,1)  major_axis_p1(:,1)]',[major_axis_p2(:,2)  major_axis_p1(:,2)]'  ,'LineWidth',handles.Width_Line1)%Hitt
            
      case 4 % proportional to displacment
           track_what=get(handles.track_what2,'Value') ;
            Data=get(handles.show_tracks,'userdata' );
             
            vec_temp2=Data.vec_temp2 ;
            vec_temp1=Data.vec_temp1;
            N=Data.N  ;
            M=Data.M ;
            vec_temp3(vec_temp2)=vec_temp1;
            vec_temp3 (end+1:  M*N)=0;
            MATRIX = reshape(vec_temp3',N,M); 
          
         
           %define the start and the end point of the displacment:
                   
             length_Before=str2num(get(handles.track_length_before,'String'));
             length_After=str2num(get(handles.track_length_after,'String'));
            
            
            
            if length_Before+length_After==0
                length_Before=1;
                msgbox('Assigning length_Before to value 1 because length_After is uqual to 0')
            end
           
            
            Before=n-length_Before ;
            After=n+length_After ;
            
            Before(Before<1) =1; 
            After(After>N_frames) =N_frames;
         
           
            X=MATRIX(Before,1:2:end);vecN_Before=find(X>0)  ;
            X=MATRIX(After,1:2:end );vecN_After=find(X>0)  ;
            
            
            Cell_ind=intersect(vecN_Before,vecN_After);
            
            
            if Box==4  || Box==5 %this is abit more tricky. we need to find the centroids of box_cell_ind_Label then to choose this cells (if exist) from Cell_ind:
                
                
                
                box_cell_ind_Label_X=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(box_cell_ind_Label,1);
                box_cell_ind_Label_Y=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(box_cell_ind_Label,2);
                
                v=MATRIX(n,:);
                v(v==0)=nan;
                v2=[];
                v2(:,1)=v(1:2:length(v));
                v2(:,2)=v(2:2:length(v));
                
                box_cell_ind_Label_X=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(box_cell_ind_Label,1);
                box_cell_ind_Label_Y=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(box_cell_ind_Label,2);
                
                Counter=1;
                for jj=1:size(box_cell_ind_Label_X,1)
                    temp_ind= find(v2(:,1)==box_cell_ind_Label_X(jj) &  v2(:,2)==box_cell_ind_Label_Y(jj));
                    if ~isempty(temp_ind)
                        ind_vec(Counter)=temp_ind;Counter=Counter+1;
                    end
                end
                Cell_ind=intersect(ind_vec,Cell_ind);
            end
    
            
            
            p1(:,1)=MATRIX(Before,Cell_ind*2-1);
            p1(:,2)=MATRIX(Before,Cell_ind*2 );
            
            p2(:,1)=MATRIX(After,Cell_ind*2-1);
            p2(:,2)=MATRIX(After,Cell_ind*2 );
            
            
            
            x1= p1(:,1);
            x2= p2(:,1);
            y1= p1(:,2);
            y2= p2(:,2);
            theta=(atan2(x2-x1,y2-y1))*(180/pi);


%              for ii=1:length(Cell_ind) 
%                  Corder(ii)=find(ismember(handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(:,6),Cell_ind(ii)));
%              end
            
[~,Corder]=ismember(Cell_ind,handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(:,6));% order of cells in label

% if Box==4  || Box==5
%     
% else
%    
% end  







Scale=sqrt((x2-x1).^2+(y2-y1).^2) ;
% Cuttoff=0.8 *mean(Scale)  ;
% Scale(Scale>Cuttoff)=Cuttoff ;

% Scale=Scale/Cuttoff  ;
 Scale=handles.Scale_Line1*Scale ;
Scale(Scale>30)=30;
   
   
switch  Color_parameters
    case {1 , 2}
             arrows_BACWrapper(p1(:,1),p1(:,2),Scale,theta ,'EdgeColor',matrixColormap,'FaceColor',matrixColormap)           
    otherwise     
        maxi=size(matrixColormap,1)
        Corder(Corder>maxi)=1;
C=matrixColormap(Corder,:);
C=shiftdim(C,-1); 
[v1,v2]= arrows_BACWrapper2(p1(:,1),p1(:,2),Scale,theta);
patch(v1,v2 ,C,'EdgeColor','none','FaceColor','flat','FaceAlpha',1);  
end       
      case 5   
major_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p1(n).cdata;
major_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p2(n).cdata  ;
x1=major_axis_p1(:,1);
x2=major_axis_p2(:,1);
y1=major_axis_p1(:,2);
y2=major_axis_p2(:,2);
theta=(atan2(x2-x1,y2-y1))*(180/pi); 
Scale=sqrt((x2-x1).^2+(y2-y1).^2);  
switch  Color_parameters
    case {1,2}  
        arrows_BACWrapper(major_axis_p1(:,1),major_axis_p1(:,2),Scale,theta,'EdgeColor',matrixColormap,'FaceColor',matrixColormap) 
    otherwise 
[v1,v2]= arrows_BACWrapper2(major_axis_p1(:,1),major_axis_p1(:,2),Scale,theta);    
C=shiftdim(matrixColormap,-1);
patch(v1,v2 ,C,'EdgeColor','none','FaceColor','flat','FaceAlpha',1);  
end 
      case 6 
      spots_channel =get(handles.spots_channel,'Value') 
      switch spots_channel
         case 1 
           Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch00(n).cdata ;  
        Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch00(n).cdata;
         Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch00(n).cdata ; 
          case 2       
              Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch01(n).cdata ;
                        Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch01(n).cdata;
                         Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch01(n).cdata ; 
          case 3      
              Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch02(n).cdata ;
                         Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch02(n).cdata;
                          Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch02(n).cdata ; 
          case 4   
              Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch03(n).cdata ; 
                         Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch03(n).cdata;
                          Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch03(n).cdata ; 
      end
      
      line(Polar_near_spot(:,1),Polar_near_spot(:,2),'LineStyle','none','Marker',handles.Type_Mark1  ,'Color','g', 'MarkerSize',handles.Size_Mark1)%Hitt  ;
%           
        
        Centroid=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata ;
        try %if X1 and Y1 exist, then Centroid is local and needs to be converted to global coordinates
            Centroid(:,1)=Centroid(:,1)+X1'-1 ;
            Centroid(:,2)=Centroid(:,2)+Y1'-1  ; 
        end
        
         zeros_ind=find(Polar_near_spot(:,1)==0);
          Centroid(zeros_ind,:)=[];
          Polar_near_spot(zeros_ind,:)=[];
            Polar_spots_angle(zeros_ind,:)=[];    
     
          x1=Centroid(:,1);
          x2=Polar_near_spot(:,1);
          y1=Centroid(:,2);
          y2=Polar_near_spot(:,2);
          theta=(atan2(x2-x1,y2-y1))*(180/pi) ;
          Scale=sqrt((x2-x1).^2+(y2-y1).^2) ;
          
          
          if Color_parameters==18
              
              C=jet(45);
              matrixColormap=zeros(length(Polar_spots_angle),3) ;
              for jj=1:length(Polar_spots_angle)
                  try
                      matrixColormap(jj,:)=C(ceil(Polar_spots_angle(jj)),:);
                      
                  end
              end
          end
    
    
switch  Color_parameters
    case {1,2}
       
       
        arrows_BACWrapper(Centroid(:,1),Centroid(:,2),Scale,theta,'EdgeColor',matrixColormap,'FaceColor',matrixColormap)
 
    otherwise
       

[v1,v2]= arrows_BACWrapper2(Centroid(:,1),Centroid(:,2),Scale,theta);    
C=shiftdim(matrixColormap,-1) ;
patch(v1,v2 ,C,'EdgeColor','none','FaceColor','flat','FaceAlpha',1); 
end
 
  end
axis manual;

% ---------------------------------------------------------------


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Show_Arrows.
function Show_Arrows_ButtonDownFcn(hObject, eventdata, handles)
 Flag=handles.flags.Arrows;
 if Flag<0
     flag_mode=-1;
 else
       flag_mode=1;
 end
 Flag=abs(Flag)+1; 
  if   Flag > 6 %for each icon different nunber of options. i.e: 2 for Arrows (smooth line or dots)
        Flag=1;
  end
 
    str=char(strcat('Arrows',num2str(Flag),'.png')) 
    if flag_mode==1 
           Img = imread(str); % icon file name (.png) has to be equal to icon name 
    end
      if flag_mode==-1 
           Img =Img_imread(str);
      end
    set(handles.Show_Arrows,'cdata',Img) 
    handles.flags.Arrows=flag_mode*Flag;
    guidata(hObject, handles); 
    n=get(handles.Raw_listbox,'value')   ;
    show_frame( handles,n,'axes')  
 figure1_WindowButtonMotionFcn([], [], handles)
% --- Executes during object creation, after setting all properties.
function Show_Arrows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Show_Arrows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Color_parameters.
function Color_parameters_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Color_parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 

function Untitled_308_Callback(hObject, eventdata, handles)
    data_file=handles.data_file;
global MATRIX_data_direction

track_what=1;
Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

% MATRIX =  data_file(5).cdata.Tracks(track_what).cdata;
MATRIX_data_velocity=nan(size(MATRIX,1) ,size(MATRIX,2)/2 );
MATRIX_data_direction=MATRIX_data_velocity;
MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating direction and velocity data....');

for ii=1:size(MATRIX,2)/2 %for each cell
    timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
    temp_vec_X=MATRIX(:,2*ii-1); Vx= nandiff(temp_vec_X'); %or try without ' (only temp_vec)
    temp_vec_Y=MATRIX(:,2*ii); Vy= nandiff(temp_vec_Y'); %or try without ' (only temp_vec)'
    MATRIX_data_velocity(:, ii)= sqrt(Vx.^2+Vy.^2);
    for jj=1:length(Vx)
        MATRIX_data_direction(jj, ii)=VxVy2angle(Vx(jj),Vy(jj));
    end
end


max_Velocity1=5;
max_Velocity2=max_Velocity1*1.02;



for ii=1:size(MATRIX,2)/2 %for each cell
    timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
    MATRIX_data_velocity(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_velocity(:, ii),10);
    MATRIX_data_direction(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_direction(:, ii),10);
end
close(h)
h=timebar_BACWrapper('creating direction data....');
for ii=1:size(MATRIX,1)  %on the base of frame
    timebar_BACWrapper(h,ii/size(MATRIX,1))
    Ind= data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6);
    Direction_vec= MATRIX_data_direction(ii,Ind);
    Velocity_vec=MATRIX_data_velocity(ii,Ind);Velocity_vec(Velocity_vec>max_Velocity1)=max_Velocity1;
    eval(char(strcat('global  Direction_matrixColormap_',num2str(ii))))
    matrixColormap = phasecolor_BACWrapper(Direction_vec , Velocity_vec/max_Velocity2 )  ;
    matrixColormap=round(matrixColormap*10)/10;
    eval(char(strcat('Direction_matrixColormap_',num2str(ii),'=matrixColormap;')));
end
close(h)


 


% --------------------------------------------------------------------
function Untitled_314_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_314 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CC
C=jet(100); 
CC=change_LUT2(C);
% --------------------------------------------------------------------
function Untitled_313_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_313 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CC
 CC = jet(180); CC2= flipdim(CC ,1);CC(181:360,:)=CC2;  
CC=change_LUT2(CC);
 
% --------------------------------------------------------------------
function Untitled_312_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_312 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 
global CC
CC = jet(90); CC2= flipdim(CC ,1);CC(91:180,:)=CC2; 
CC=change_LUT2(CC);
% --------------------------------------------------------------------
function Untitled_311_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_311 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CC
C=jet(100); 
CC=change_LUT2(C);
% --------------------------------------------------------------------
function Untitled_310_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_310 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
C=jet(100);
global CC
CC=change_LUT2(C);



function MA_range_Callback(hObject, eventdata, handles)
% hObject    handle to MA_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MA_range as text
%        str2double(get(hObject,'String')) returns contents of MA_range as a double


% --- Executes during object creation, after setting all properties.
function MA_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MA_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_315_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_315 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_316_Callback(hObject, eventdata, handles)
    
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value');  
Cutoff= inputdlg('Please input maximum value for interpulated length or leave automatic as default','Input',1,{'60'}); 
Cutoff=str2num(char(Cutoff));

  
%  create_MATRIX_interpulated_length_function(handles.data_file(4).cdata ,Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option)  
%  create_MATRIX_poles_function(handles.data_file(4).cdata ,Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 
 create_MATRIX_spot_function(handles.data_file(4).cdata ,Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

 return
 
 
 
 % Untitled_170_Callback(hObject, eventdata, handles)
%     data_file=handles.data_file;
% global MATRIX_data_direction MATRIX_data 
%
%
%
%
%
% track_what=1;
% Data=get(handles.show_tracks,'userdata' );
% vec_temp2=Data.vec_temp2 ;
% vec_temp1=Data.vec_temp1;
% N=Data.N  ;
% M=Data.M ;
% vec_temp3(vec_temp2)=vec_temp1;
% vec_temp3 (end+1:  M*N)=0;
% MATRIX = reshape(vec_temp3',N,M);
%
% MATRIX_data_direction= nan(size(MATRIX,1),size(MATRIX,2)/2);
% MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
% h=timebar_BACWrapper('creating direction and velocity data....');
% for ii=1:size(MATRIX,2)/2 %for each cell
%        timebar_BACWrapper(h,ii/(size(MATRIX,2)/2))
%     temp_vec_X=MATRIX(:,2*ii-1); Vx= nandiff(temp_vec_X'); %or try without ' (only temp_vec)
%     temp_vec_Y=MATRIX(:,2*ii); Vy= nandiff(temp_vec_Y'); %or try without ' (only temp_vec)'
%     for jj=1:length(Vx)
%         MATRIX_data_direction(jj, ii)=VxVy2angle(Vx(jj),Vy(jj));
%     end
% end
%
%    close(h)
%
% length_before=str2num(get(handles.track_length_before,'String'));
% length_after=str2num(get(handles.track_length_after,'String'));
%
% if  length_before+length_after~=0
%     h=timebar_BACWrapper('creating MA....');
%     for ii=1:size(MATRIX,2)/2 %for each cell
%         timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
%         MATRIX_data_direction(:, ii)=   movavg(MATRIX_data_direction(:, ii),length_before,length_after)  ;
%     end
%     close(h)
% end

%need to show histogram to help the user to decide:
% max_direction = 360;
% MATRIX_data_direction(MATRIX_data_direction>max_direction)=max_direction;
% MATRIX_data=MATRIX_data_direction;
%
% MATRIX_data_direction1=MATRIX_data_direction;
% save MATRIX_data_direction1 MATRIX_data_direction1

load   MATRIX_data_labeled_Spotx_movie1
load   MATRIX_data_labeled_Spoty_movie1 
MATRIX_data_labeled_Spotx_movie=MATRIX_data_labeled_Spotx_movie1;
MATRIX_data_labeled_Spoty_movie=MATRIX_data_labeled_Spoty_movie1;

track_what2=3;
MATRIX_data_SpotI=nan(size(MATRIX_data_labeled_Spotx_movie));
global N_frames box_Raw
for ii=1:N_frames
    filename_Segmentation=box_Raw(ii) ;
    pathname_Segmentation2=handles.data_file(2).cdata(track_what2,2)  ;  
    full_filename_Segmentation2= strcat(pathname_Segmentation2,filename_Segmentation,'_ch0',num2str(track_what2-1),'_Filtered.tif') ;                 
    full_filename_Segmentation2=char(full_filename_Segmentation2) ;                 
    matrix=imread_cross( full_filename_Segmentation2);  
   
    vecx=MATRIX_data_labeled_Spotx_movie(ii,:);
    vecy=MATRIX_data_labeled_Spoty_movie(ii,:);
  
    
    for jj=1:length(vecx)
     if vecx(jj)~=0 & ~isnan(vecx(jj))
         matrix(vecy(jj),vecx(jj))
         MATRIX_data_SpotI(ii, jj)= matrix(vecy(jj),vecx(jj));
    end
    end
end

  MATRIX_data_SpotI1=MATRIX_data_SpotI;
  save MATRIX_data_SpotI1 MATRIX_data_SpotI1
  
% --------------------------------------------------------------------
function Untitled_317_Callback(hObject, eventdata, handles)
global CC
C=jet(100); 
CC=change_LUT2(C);
% --------------------------------------------------------------------
function Untitled_318_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'Interpulated_Length',track_what) 
function MA_before_Callback(hObject, eventdata, handles)
% hObject    handle to MA_before (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MA_before as text
%        str2double(get(hObject,'String')) returns contents of MA_before as a double


% --- Executes during object creation, after setting all properties.
function MA_before_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MA_before (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MA_after_Callback(hObject, eventdata, handles)
% hObject    handle to MA_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MA_after as text
%        str2double(get(hObject,'String')) returns contents of MA_after as a double


% --- Executes during object creation, after setting all properties.
function MA_after_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MA_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_323_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_323 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_319_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_319 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_324_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_324 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_322_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_322 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_321_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_321 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_320_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_320 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_329_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value'); 
Cutoff= inputdlg('Please input maximum value for Circularity or leave automatic as default','Input',1,{'1'}); 
Cutoff=str2num(char(Cutoff));
create_MATRIX_Data_function(handles.data_file(4).cdata ,'Circularity',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

% --------------------------------------------------------------------
function Untitled_334_Callback(hObject, eventdata, handles) 
global CC
C=jet(100); 
CC=change_LUT2(C);
% --------------------------------------------------------------------
function Untitled_339_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'Circularity',track_what) 

% --------------------------------------------------------------------
function Untitled_328_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value'); 
Cutoff= inputdlg('Please input maximum value for Area or leave automatic as default','Input',1,{'1500'}); 
Cutoff=str2num(char(Cutoff));
create_MATRIX_Data_function(handles.data_file(4).cdata ,'Area',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 


% --------------------------------------------------------------------
function Untitled_333_Callback(hObject, eventdata, handles) 
global CC
C=jet(100); 
CC=change_LUT2(C);
 
function Untitled_338_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'Area',track_what) 
% --------------------------------------------------------------------
function Untitled_327_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value'); 
Cutoff= inputdlg('Please input maximum value for Curvature or leave automatic as default','Input',1,{'300'}); 
Cutoff=str2num(char(Cutoff));
create_MATRIX_Data_function(handles.data_file(4).cdata ,'Curvature',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

% --------------------------------------------------------------------
function Untitled_332_Callback(hObject, eventdata, handles) 
global CC
C=jet(100); 
CC=change_LUT2(C);
% --------------------------------------------------------------------
function Untitled_337_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'Curvature',track_what) 
% --------------------------------------------------------------------
function Untitled_326_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value'); 
Cutoff= inputdlg('Please input maximum value for Eccentricity or leave automatic as default','Input',1,{'1'}); 
Cutoff=str2num(char(Cutoff));
create_MATRIX_Data_function(handles.data_file(4).cdata ,'Eccentricity',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

% --------------------------------------------------------------------
function Untitled_331_Callback(hObject, eventdata, handles) 
global CC
C=jet(100); 
CC=change_LUT2(C);
% --------------------------------------------------------------------
function Untitled_336_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'Eccentricity',track_what) 

% --------------------------------------------------------------------
function Untitled_325_Callback(hObject, eventdata, handles)
length_before=str2num(get(handles.MA_before,'String'));
length_after=str2num(get(handles.MA_after,'String'));  
track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );
Diff_option=0;   MA_option=  get(handles.MA_option,'value'); 
Cutoff= inputdlg('Please input maximum value for MinorAxisLength or leave automatic as default','Input',1,{'50'}); 
Cutoff=str2num(char(Cutoff));
create_MATRIX_Data_function(handles.data_file(4).cdata ,'MinorAxisLength',Cutoff, length_before,length_after,track_what,Data,Diff_option,MA_option) 

% --------------------------------------------------------------------
function Untitled_330_Callback(hObject, eventdata, handles) 
global CC
C=jet(100); 
CC=change_LUT2(C); 
% --------------------------------------------------------------------
function Untitled_335_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'MinorAxisLength',track_what) 


% --------------------------------------------------------------------
function Untitled_340_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_340 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_341_Callback(hObject, eventdata, handles)
 

function edit65_Callback(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Width_Line1=str2num(str);
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)
 

function edit65_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function LineWidth1_Callback(hObject, eventdata, handles)
c = uisetcolor;
set(hObject,'ForeGroundColor',c)
handles.Colors_Line1=c;
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function edit65_ButtonDownFcn(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Width_Line1=str2num(str);
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function arrows_scale_Callback(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Scale_Line1=str2num(str);
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)

function arrows_scale_CreateFcn(hObject, eventdata, handles)
 


function arrows_scale_ButtonDownFcn(hObject, eventdata, handles)
    
    str=get(hObject,'String');
handles.Scale_Line1=str2num(str);
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function Show_Intersection_ButtonDownFcn(hObject, eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)
 

function underdevelopment2_Callback(hObject, eventdata, handles) 
function Show_Spots_Callback(hObject, eventdata, handles) 
 if get(hObject,'value')
        handles.flags.Spots=abs(handles.flags.Spots);
    else
        handles.flags.Spots=-abs(handles.flags.Spots);
    end
    guidata(hObject, handles);
    switch handles.flags.Spots
        case 1
            Img = imread('Spots.png'); % icon file name (.png) has to be equal to icon name 
        case -1
            Img = Img_imread('Spots.png'); % icon file name (.png) has to be equal to icon name 
    end
    set(handles.Show_Spots,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)

function underdevelopment1_Callback(hObject, eventdata, handles)
'under development'


function pushbutton101_Callback(hObject, eventdata, handles)
c = uisetcolor;
set(hObject,'ForeGroundColor',c)
handles.Colors_Mark1=c;
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function edit69_Callback(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Type_Mark1= str ;
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)

function edit69_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit70_Callback(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Size_Mark1= str2num(char(str)) ;
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)

function edit70_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit70_ButtonDownFcn(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Size_Mark1=str2num(char(str));
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function edit69_ButtonDownFcn(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Type_Mark1= str ;
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function spots_channel_Callback(hObject, eventdata, handles)
Raw_listbox_Callback([], [], handles)

function spots_channel_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Arrows_channel_Callback(hObject, eventdata, handles)


function Arrows_channel_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function LineWidth2_Callback(hObject, eventdata, handles) 
c = uisetcolor;
set(hObject,'ForeGroundColor',c)
handles.Colors_Line2=c;
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)
function edit71_Callback(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Width_Line2=str2num(str);
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)

function edit71_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit71_ButtonDownFcn(hObject, eventdata, handles)
str=get(hObject,'String');
handles.Width_Line2=str2num(str);
guidata(hObject, handles);
Raw_listbox_Callback([], [], handles)


function Untitled_342_Callback(hObject, eventdata, handles)


function Untitled_343_Callback(hObject, eventdata, handles)

track_what=get(handles.track_what2,'Value') ;
Data=get(handles.show_tracks,'userdata' );

vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);

global N_frames  MATRIX_data_leading_polar_direction_angle
MATRIX_data_leading_polar_direction_angle=nan(size(MATRIX,1),size(MATRIX,2)/2);
%define the start and the end point of the displacment:

length_Before=str2num(get(handles.track_length_before,'String'));
length_After=str2num(get(handles.track_length_after,'String'));



if length_Before+length_After==0
    length_Before=1;
    msgbox('Assigning length_Before to value 1 because length_After is uqual to 0')
end 


CH = inputdlg('Please input which channel are the spots or leave CH02 as default','Input',1,{'CH02'});
CH=regexprep(CH,'CH','')
spots_channel=str2num(char(CH))+1; 


str='creating angle between leading polar point, centroid in frame (n), and displacement in frame (n+length(displacement))';
h=timebar_BACWrapper(str);

for n=1:size(MATRIX,1)  %for each frame
    try
    timebar_BACWrapper(h,n/(size(MATRIX,1)))
    
    Before=n-length_Before ;
    After=n+length_After ;
    
    Before(Before<1) =1;
    After(After>N_frames) =N_frames;
    
    
    X=MATRIX(Before,1:2:end);vecN_Before=find(X>0)  ;
    X=MATRIX(After,1:2:end );vecN_After=find(X>0)  ; 
    
    Cell_ind=intersect(vecN_Before,vecN_After); 
    
    
    switch spots_channel
        case 1
            %            Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch00(n).cdata ;
            Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch00(n).cdata;
            %          Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch00(n).cdata ;
        case 2
            %               Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch01(n).cdata ;
            Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch01(n).cdata;
            %                          Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch01(n).cdata ;
        case 3
            %               Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch02(n).cdata ;
            Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch02(n).cdata;
            %                           Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch02(n).cdata ;
        case 4
            %               Centroid_Detect_spots=handles.data_file(4).cdata.L(track_what).cdata.Centroid_Detect_spots_ch03(n).cdata ;
            Polar_near_spot=handles.data_file(4).cdata.L(track_what).cdata.Polar_near_spots_ch03(n).cdata;
            %                           Polar_spots_angle=handles.data_file(4).cdata.L(track_what).cdata.Polar_spots_angle_ch03(n).cdata ;
    end
      
     
    Ind= handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata(:,6) ;
    
    for ii=1:length(Cell_ind)
        
        temp_Cell_ind=Cell_ind(ii);
        
        
        x2=MATRIX(Before,temp_Cell_ind*2-1);
        y2=MATRIX(Before,temp_Cell_ind*2 );
        
        x3=MATRIX(After,temp_Cell_ind*2-1);
        y3=MATRIX(After,temp_Cell_ind*2 );
        
      
        Ind2=find(ismember(Ind,temp_Cell_ind)); 
        x1=Polar_near_spot(Ind2,1);
        y1=Polar_near_spot(Ind2,2);   
        
        if x1~=0 & x2~=0 & x3~=0 & y1~=0 & y2~=0 & y3~=0
            try % in some cells we dont have any spot
            temp_angle=angle_deg_2d_BACWrapper( [x1 y1],[x2 y2],[x3 y3]); 
            end
%               if temp_angle>180
%                  temp_angle=360-temp_angle;
%              end
            MATRIX_data_leading_polar_direction_angle(n,temp_Cell_ind)  = temp_angle;
        end
    end
    catch
        disp(['could not process frame:  ' num2str(n)])
    end
end
global MATRIX_data_labeled
MATRIX_data_labeled=MATRIX_data_leading_polar_direction_angle;



global MATRIX_data_labeled_Spoty



close(h)
function Untitled_344_Callback(hObject, eventdata, handles)
% global CC
% CC = jet(180); CC2= flipdim(CC ,1);CC(181:360,:)=CC2; 
% CC=change_LUT2(CC);

function Untitled_345_Callback(hObject, eventdata, handles)
 track_what=get(handles.track_what2,'Value') ;
str_Parameter='leading_polar_direction_angle'; 
data_file_4=handles.data_file(4).cdata;
global MATRIX_data_leading_polar_direction_angle  
 MATRIX_data_labeled=MATRIX_data_leading_polar_direction_angle;
h=timebar_BACWrapper(char(['create ' str_Parameter ' Colormaps....'])); 
 for ii=1:size(MATRIX_data_labeled,1)  %on the base of frame
      
    timebar_BACWrapper(h,ii/size(MATRIX_data_labeled,1)) 
    eval(char(['Ind=data_file_4.L(' num2str(track_what) ').cdata.Centroid('  num2str(ii) ').cdata(:,6);'])) 
    
    Vec=nan(length(Ind),1);
    for kk=1:length(Ind)
        if ~isnan(Ind(kk))
            Vec(kk)=MATRIX_data_labeled(ii,Ind(kk));
        end
    end
     
    matrixColormap=[];
    for jj=1:length(Vec)
        if ~isnan(Vec(jj)) 
            
            if Vec(jj)<60 | Vec(jj)>300
                matrixColormap(jj,:)=[0 0 1];
            end
            
               if Vec(jj)<240 & Vec(jj)>120
                    matrixColormap(jj,:)=[1 0 0];
               end
            
               
               
            
        else
            matrixColormap(jj,:)=[nan nan nan];
        end
        
        eval(char(['global ' str_Parameter '_matrixColormap_',num2str(ii)]))
        eval(char([str_Parameter '_matrixColormap_' num2str(ii) '=matrixColormap;']));
   
    end
end
close(h)
global MATRIX_data_labeled2

MATRIX_data_labeled2=nan(size(MATRIX_data_labeled));
for ii=1:size(MATRIX_data_labeled,1)  %on the base of frame
    for jj=1:size(MATRIX_data_labeled,2)  %on the base of frame
        try
            temp=MATRIX_data_labeled(ii,jj);
            if ~isnan(temp)
                if temp<60 | temp>300
                    MATRIX_data_labeled2(ii,jj)=1;
                end
                if temp<240 & temp>120
                    MATRIX_data_labeled2(ii,jj)=2;
                end
            end
        end
    end
 end


% --------------------------------------------------------------------
function Untitled_346_Callback(hObject, eventdata, handles)
%% hObject    handle to Untitled_170 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MATRIX_data_labeled



Data=get(handles.show_tracks,'userdata' );
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
MATRIX2=MATRIX(:,1:2:end);

MATRIX_data_labeled=nan(size(MATRIX2));
MATRIX(MATRIX==0)=nan;
MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating displacement and displacement data....');


for ii=1:size(MATRIX2,2)  %for each cell
    timebar_BACWrapper(h,ii/(size(MATRIX2,2)))
    vec=MATRIX2(:,ii);
    MATRIX_data_labeled(:,ii)=sum(vec>0);
end
close(h) 
MATRIX_data_labeled(isnan(MATRIX2))=nan; 
% --------------------------------------------------------------------
function Untitled_347_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_347 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_348_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_348 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CC
CC = jet(100); 
CC=change_LUT2(CC);

% --------------------------------------------------------------------
function Untitled_349_Callback(hObject, eventdata, handles)
track_what=get(handles.track_what2,'Value') ;
colormap_MATRIX_data_labeled_function(handles.data_file(4).cdata,'TracksLength',track_what) 


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
 


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Show_Center.
function Show_Center_ButtonDownFcn(hObject, eventdata, handles)
    
    Flag=handles.flags.Center;
    if Flag<0
        flag_mode=-1;
    else
        flag_mode=1;
    end
    Flag=abs(Flag)+1;
    if   Flag > 2 %for each icon different nunber of options. i.e: 2 for Center (smooth line or dots)
        Flag=1;
    end
    
    str=char(strcat('Center',num2str(Flag),'.png'))
    
    if flag_mode==1
        Img = imread(str); % icon file name (.png) has to be equal to icon name
    end
    if flag_mode==-1
        Img =Img_imread(str);
    end
    set(handles.Show_Center,'cdata',Img)
    handles.flags.Center=flag_mode*Flag;
    guidata(hObject, handles);
    n=get(handles.Raw_listbox,'value')   ;
    show_frame( handles,n,'axes')
    figure1_WindowButtonMotionFcn([], [], handles)



function Show_Events_ButtonDownFcn(hObject, eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)
function Show_Spots_ButtonDownFcn(hObject, eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)
function Show_Polar_Points_ButtonDownFcn(hObject, eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)
function Show_Centerline_ButtonDownFcn(hObject, eventdata, handles)
figure1_WindowButtonMotionFcn([], [], handles)


 
  


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over underdevelopment1.
function underdevelopment1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to underdevelopment1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function Show_Mesh_Callback(hObject, eventdata, handles) 
if get(hObject,'value')
        handles.flags.Mesh=abs(handles.flags.Mesh);
    else
        handles.flags.Mesh=-abs(handles.flags.Mesh);
    end
    guidata(hObject, handles);
    switch handles.flags.Mesh
        case 1
            Img = imread('Mesh_ribons_and_dots.png'); % icon file name (.png) has to be equal to icon name
        case 2
            Img = imread('Mesh_only_dots.png'); % icon file name
             case 3
            Img = imread('Mesh_with_poles.png'); % icon file name
            
            
        case -1
            Img = Img_imread('Mesh_ribons_and_dots.png'); % icon file name (.png) has to be equal to icon name
        case -2
            Img = Img_imread('Mesh_only_dots.png'); % icon file name
            case -3
            Img = Img_imread('Mesh_with_poles.png'); % icon file name 
    end
    set(handles.Show_Mesh,'cdata',Img)
    Raw_listbox_Callback([], eventdata, handles) 
    figure1_WindowButtonMotionFcn([], [], handles)


  

function Untitled_351_Callback(hObject, eventdata, handles)

 % function is not computationally efficient  
global N_frames  
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  

 
prompt = {'jumps coeff: ','Number of breaks: ','spans 1: ','Iteration: ','spans 2: ','Enter frame to start :','Enter frame to end:' };




dlg_title = 'Input';
num_lines = 1;
def = {num2str(5),num2str(10),num2str(50),num2str(0),num2str(50),num2str(n),num2str(N_frames) };
answer = inputdlg(prompt,dlg_title,num_lines,def);  


 


jumps_coeff=str2double(char(answer(1)));
Nbreaks=str2double(char(answer(2)));
Span1=str2double(char(answer(3)));
Iteration=str2double(char(answer(4)));
Span2=str2double(char(answer(5)));
start_track =str2num(char(answer(6)));
end_track =str2num(char(answer(7))) ;
if end_track> N_frames
    end_track= N_frames;
end
if start_track< 1
    start_track= 1;
end 
%  
% pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper('Generate mesh. Please wait....');
set(h,'color','w');
  
  Cell_centerline_stack= handles.data_file(4).cdata.L(track_what).cdata.Cell_centerline;
Dist_cell_centerline_stack=handles.data_file(4).cdata.L(track_what).cdata.Dist_cell_centerline;



 
 
set(handles.detect_z_ring_and_centerline_junction,'Enable','on') 
handles.data_file(14).cdata.flags.detect_z_ring_and_centerline_junction=1;
for ii=start_track:end_track %  
 
    Cell_centerline= Cell_centerline_stack(ii).cdata;
    Dist_cell_centerline=Dist_cell_centerline_stack(ii).cdata;
    
    X1=handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata;
    Y1=handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata;
    
    temp_Centroid=[];
    
    
    Position=get(h,'Position');
    Position(2)=Position(2)+100;
    h2=timebar_BACWrapper('Please wait....');
    set(h2,'color','w');
    set(h2,'Position',Position)
    
    for jj=1:size(Cell_centerline,2)
      timebar_BACWrapper(h2,jj/(size(Cell_centerline,2)))
        
        cell_centerline=Cell_centerline(jj).cdata;
        dist_cell_centerline=Dist_cell_centerline(jj).cdata;
        
        
  try
        
       [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour(cell_centerline,dist_cell_centerline,jumps_coeff,Nbreaks,Span1) ; 
        for iii=1:Iteration 
            cell_mesh(:,1)=smooth(cell_mesh(:,1), Span2,'rlowess' )  ;
            cell_mesh(:,2)=smooth(cell_mesh(:,2), Span2,'rlowess' )  ;
            cell_mesh(:,3)=smooth(cell_mesh(:,3), Span2,'rlowess' )  ;
            cell_mesh(:,4)=smooth(cell_mesh(:,4), Span2,'rlowess' )  ; 
            dist_cell_centerline=sqrt((cell_mesh(:,3)-cell_mesh(:,1)).^2+(cell_mesh(:,4)-cell_mesh(:,2)).^2)  
            [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour( [(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2],dist_cell_centerline, 1,Nbreaks,Span1);
        end
  catch
 try 
             cell_centerline(:,1)=smooth(cell_centerline(:,1), 100,'rlowess' )  ;
             cell_centerline(:,2)=smooth(cell_centerline(:,2), 100,'rlowess' )  ;
             
             dist_cell_centerline =10*ones(size(dist_cell_centerline)); 
             [cell_mesh,cell_centerline,dist_cell_centerline]=interpolate_contour(cell_centerline,dist_cell_centerline,jumps_coeff*2,Nbreaks,Span1) ; 
 catch
 
 end
        
  end
       
             
             
             
             
        
            Cell_centerline(jj).cdata=cell_centerline;
%         Dist_cell_centerline(jj).cdata=dist_cell_centerline; 
        
         cell_centerline(:,1)=cell_centerline(:,1)+X1(jj)-1;
         cell_centerline(:,2)=cell_centerline(:,2)+Y1(jj)-1;
        if jj==1
            Vercat_Cell_centerline= cell_centerline;
        else 
            Vercat_Cell_centerline= vertcat(Vercat_Cell_centerline, cell_centerline) ;         
        end
 

 
 
        
        cell_centerline=[(cell_mesh(:,1)+cell_mesh(:,3))/2 (cell_mesh(:,2)+cell_mesh(:,4))/2]; 
        d=diff(cell_centerline,1,1);
        l=cumsum([0;sqrt((d.*d)*[1 ;1])]);
        [~,middle_ind]=min(abs(l-max(l)/2)); 
        temp_Centroid(jj,:)=[cell_centerline(middle_ind,2) cell_centerline(middle_ind,1) ];
        
        
       
         
        Cell_mesh(jj).cdata=cell_mesh;%on cell base, ROI coordinates
        
        
         cell_mesh(:,[1 3])=  cell_mesh(:,[1 3])+X1(jj)-1;
         cell_mesh(:,[2 4])=  cell_mesh(:,[2 4])+Y1(jj)-1;
        
        
        
        if jj==1
            Vercat_Cell_mesh= cell_mesh;
        else 
            Vercat_Cell_mesh= vertcat(Vercat_Cell_mesh, cell_mesh) ;         
        end
        
       
       
    
    end
    
    close(h2)
    
    handles.data_file(4).cdata.L(track_what).cdata.Cell_mesh(ii).cdata=Cell_mesh;
    handles.data_file(4).cdata.L(track_what).cdata.Vercat_Cell_mesh(ii).cdata=Vercat_Cell_mesh;
    
    
    handles.data_file(4).cdata.L(track_what).cdata.ML(ii).cdata=Cell_centerline;
    handles.data_file(4).cdata.L(track_what).cdata.Vercat_ML(ii).cdata=Vercat_Cell_centerline;
    
    
    temp_Centroid=  round(temp_Centroid*100)/100;
    temp_Centroid(:,3)=ii;
    temp_Centroid(:,2)=temp_Centroid(:,2)+X1'-1 ;
    temp_Centroid(:,1)=temp_Centroid(:,1)+Y1'-1 ; 
    handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata = temp_Centroid  ;
    
    
    guidata(hObject, handles);
    
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
    
    
    
end

 
 
close(h) 
show_frame( handles,n,'axes')  ; 
    
 
     
    

function Untitled_352_Callback(hObject, eventdata, handles)

        
    
    
    
    
global N_frames  
n=get(handles.Raw_listbox,'Value') ;
track_what=get(handles.track_what2,'Value') ;  

 
prompt = {'Enter frame to start :','Enter frame to end:' };




dlg_title = 'Input';
num_lines = 1;
def = {num2str(n),num2str(N_frames) };
answer = inputdlg(prompt,dlg_title,num_lines,def);  


  
start_track =str2num(char(answer(1)));
end_track =str2num(char(answer(2))) ;
if end_track> N_frames
    end_track= N_frames;
end
if start_track< 1
    start_track= 1;
end 
%  
% pathname_Segmentation=handles.data_file(2).cdata(track_what,3);
h=timebar_BACWrapper('Generate mesh. Please wait....');
set(h,'color','w');
  
 for ii=start_track:end_track
     
    timebar_BACWrapper(h,ii/(end_track-start_track+1))
    
    
    
   Cell_centerline=handles.data_file(4).cdata.L(track_what).cdata.ML(ii).cdata;
%    Cell_centerline(:,1)=Cell_centerline(:,1)+handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata-1;
%    Cell_centerline(:,2)=Cell_centerline(:,2)+handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata-1;
%    
 
        Pole1_x=[]; Pole1_y=[]; Pole2_x=[]; Pole2_y=[];
    
    for jj=1:size(Cell_centerline,2)
    
        
        
        centerline=Cell_centerline(jj).cdata;
        
        Pole1_x(jj)=centerline(1,1);
        Pole1_y(jj)=centerline(1,2);
        Pole2_x(jj)=centerline(end,1);
        Pole2_y(jj)=centerline(end,2);
     
    end
    
    handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(ii).cdata=Pole1_x;
    handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(ii).cdata=Pole1_y;
    handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(ii).cdata=Pole2_x;
    handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(ii).cdata=Pole2_y;

    
end

    guidata(hObject, handles);
    close(h)


function Untitled_353_Callback(hObject, eventdata, handles) 
matrix=get(handles.axes1,'userdata') ;
segmentation_type=get(handles.segmentation_type1,'Value')  ;
n=round(get(handles.Raw_listbox,'Value')) ;
if  isempty(matrix)==1 
    track_what=get(handles.track_what2,'Value') ;
    matrix = read_image( n,segmentation_type, track_what);   
end
str = inputdlg('Please input bwnorph type','Input',1,{'thin'});
str=char(strcat('''',str,'''')) 
eval(strcat('matrix= bwmorph(matrix ,',str,',inf);'))
set(handles.axes1,'userdata',  matrix)
show_frame(handles,n,'axes','get_image_from_axes')


% --------------------------------------------------------------------
function Untitled_355_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_355 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_354_Callback(hObject, eventdata, handles)

global CD
CD
if isempty(CD)
    CD=cd;
end
full_filename=char([CD '\File\Open Samples\Pseudomonas_aeruginosa_phase_contrast_explosive\BacFormatics_EXP_Pseudomonas_aeruginosa_phase_contrast_explosive.dat'])
full_filename=regexprep(full_filename, '\', filesep) ;
ind=findstr(full_filename,filesep);ind=ind(end);
pathname=full_filename(1:ind);
Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname) 


% --------------------------------------------------------------------
function Untitled_357_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_357 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_358_Callback(hObject, eventdata, handles)
   CH = inputdlg('Please input which channel are the cells segments or leave CH00 as default','Input',1,{'CH00'});
    CH=regexprep(CH,'CH',''); 
     ch=str2num(char(CH))+1; 
 
 
 
 global box_Raw N_frames
    
  
    for jj=1:N_frames
        filename=char(box_Raw(jj)) ;
        bw1= read_image2(jj,3,'Imean', filename, ch)   ;
        L=bwlabel(bw1);
        matrix(jj ,1)=max(L(:)); 
    end
    
 BAC_NAME=get(handles.figure1,'Name');
Current_Exp= BAC_NAME(findstr(BAC_NAME,'>')+1:end);
Current_Exp=regexprep(Current_Exp, 'BacFormatics_EXP_','') ;
Current_Exp=regexprep(Current_Exp, '.dat','') ;   
    
FileName = box_Raw;
Ncells=  matrix(:,1);  
T = table(Ncells,'RowNames',FileName)

 

str=char(strcat(Current_Exp,'_ch0',num2str(ch-1),'_Cell_Counts.txt'));

[filename,pathname] = uiputfile(str,'Save images list');

full_filename=char(strcat(pathname,filename))

writetable(T,full_filename,'WriteRowNames',true)


% --------------------------------------------------------------------
function Untitled_359_Callback(hObject, eventdata, handles) 
% hObject    handle to Untitled_359 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% str=uigetdir;
% Directory=dir(str)
% matrix=[];
% filname_vec=[]
% counter=0;
%    CH = inputdlg('Please input which channel are the cells segments or leave CH00 as default','Input',1,{'CH00'});
%     CH=regexprep(CH,'CH',''); 
%      ch=str2num(char(CH))+1; 
%  
%  
% 
% h=waitbar(0,'Counting cells. please wait...');
% N=max(size(Directory));
% for ii=1:N
%     waitbar(ii/N )    
%     filname=Directory(ii).name;
%     if isempty(strfind(filname,'.'))
%         counter=counter+1;
%      
%         full_filename=char([str '\'   filname    '\BacFormatics_EXP_New.dat']);
%         try
%             Data=importdata(full_filename);
%         catch
%             msgbox('Error. Plese confirm that all experiment files have the name BacFormatics_EXP_New.dat')
%             return
%         end
%         
%         
%         filname_vec{counter*2}= filname;
%         filname_vec{counter*2-1}=filname;
%         
%         filname_vec2{counter*2-1}= 'total cells';
%         filname_vec2{counter*2}='exploding';
%          
%         
%         
%         
%         
%         listbox=Data(1).cdata;
%         
%         
%         
%         for jj=1:size(listbox,1)
%             
%             str2=listbox(jj);
%             
%             
%             full_filename_ch00=char([str '\'   filname    '\ch00_Segmented\' char(str2) '_ch00_Segmented.tif'])
%             
%             matrix_raw=imread(full_filename_ch00);
%             L=bwlabel(matrix_raw);
%             
%             matrix(jj ,counter*2-1)=max(L(:));
%             
%             try
%             full_filename_ch02=char([str '\'   filname    '\ch02_Segmented\' char(str2) '_ch02_Segmented.tif']) 
%             matrix_raw=imread(full_filename_ch02);
%             catch
%              full_filename_ch02=char([str '\'   filname    '\ch01_Segmented\' char(str2) '_ch01_Segmented.tif']) 
%             matrix_raw=imread(full_filename_ch02);
%             end
%             L=bwlabel(matrix_raw);
%             
%             matrix(jj ,counter*2)=max(L(:));
%             
%             
%         end
%     end
%     
% end
% 
% % xlswrite('listbox.xls',filname_vec  )
% [filename,pathname] = uiputfile('folders_list.xls','Save folder list');
% full_filename=char(strcat(pathname,filename));
% xlswrite(full_filename,filname_vec)
% 
% 
% [filename,pathname] = uiputfile('tag.xls','Save tag');
% full_filename=char(strcat(pathname,filename));
% xlswrite(full_filename,filname_vec2)
% 
% 
% [filename,pathname] = uiputfile('data_vector.xls','Save cell counts');
% full_filename=char(strcat(pathname,filename));
% xlswrite(full_filename,matrix)
% 
%   
% 

% --------------------------------------------------------------------
function Untitled_360_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_360 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  

   CH = inputdlg('Please input which channel are the cells segments or leave CH00 as default','Input',1,{'CH00'});
    CH=regexprep(CH,'CH',''); 
     ch=str2num(char(CH))+1; 
 
 
       
 prompt={'Please input pixel size (in microns)'};
name = 'pixel size';
defaultans = {'1'}; 
inputval = inputdlg(prompt,name,[1 40],defaultans);
 pixel_size=str2num(char(inputval));
 
 
 
 
     global box_Raw N_frames
     
    
    for jj=1:N_frames
        filename=char(box_Raw(jj)) ;
        bw= read_image2(jj,3,'Imean', filename, ch)   ;
        L=bwlabel(bw);
        s=regionprops(L,'Area','MajorAxisLength','Orientation');
        stack_Area(jj).cdata=cat(1,s.Area);
        stack_MajorAxisLength(jj).cdata= cat(1,s.MajorAxisLength);
        stack_Orientation(jj).cdata= cat(1,s.Orientation)+90;  
    end
    
    [filename,pathname] = uiputfile('images_list.xls','Save images list');
    full_filename=char(strcat(pathname,filename));
    xlswrite(full_filename,box_Raw')
    
    
    
    
    
    maxi=0;
    for jj=1:N_frames
        if maxi<length(stack_Area(jj).cdata)
            maxi=length(stack_Area(jj).cdata);
        end
    end
    matrix_Area=nan(maxi,N_frames);  
    matrix_MajorAxisLength=nan(maxi,N_frames); 
    matrix_Orientation=nan(maxi,N_frames); 
    
   
    
    
    for jj=1:N_frames
        matrix_Area(1:length(stack_Area(jj).cdata),jj)=stack_Area(jj).cdata;
        matrix_MajorAxisLength(1:length(stack_MajorAxisLength(jj).cdata),jj)=stack_MajorAxisLength(jj).cdata;
        matrix_Orientation(1:length(stack_Orientation(jj).cdata),jj)=stack_Orientation(jj).cdata;
    end
    
   
     
    [filename,pathname] = uiputfile('matrix_Area.xls','Save Area data');
    full_filename=char(strcat(pathname,filename));
    xlswrite(full_filename,matrix_Area*(pixel_size)^2); 
    
    
    [filename,pathname] = uiputfile('matrix_MajorAxisLength.xls','Save MajorAxisLength data');
    full_filename=char(strcat(pathname,filename));
    xlswrite(full_filename,matrix_MajorAxisLength*(pixel_size)); 
    
    
    [filename,pathname] = uiputfile('matrix_Orientation.xls','Save Orientation data');
    full_filename=char(strcat(pathname,filename));
    xlswrite(full_filename,matrix_Orientation)
    
  


% --------------------------------------------------------------------
function Untitled_361_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_361 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
global MATRIX_data_labeled
xlswrite('Orientation.xls',MATRIX_data_labeled)
