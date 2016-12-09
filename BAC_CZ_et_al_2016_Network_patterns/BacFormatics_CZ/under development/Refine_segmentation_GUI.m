function varargout = Refine_segmentation_GUI(varargin)
% REFINE_SEGMENTATION_GUI MATLAB code for Refine_segmentation_GUI.fig
%      REFINE_SEGMENTATION_GUI, by itself, creates a new REFINE_SEGMENTATION_GUI or raises the existing
%      singleton*.
%
%      H = REFINE_SEGMENTATION_GUI returns the handle to a new REFINE_SEGMENTATION_GUI or the handle to
%      the existing singleton*.
%
%      REFINE_SEGMENTATION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REFINE_SEGMENTATION_GUI.M with the given input arguments.
%
%      REFINE_SEGMENTATION_GUI('Property','Value',...) creates a new REFINE_SEGMENTATION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Refine_segmentation_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Refine_segmentation_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Refine_segmentation_GUI

% Last Modified by GUIDE v2.5 05-Jul-2015 14:03:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Refine_segmentation_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Refine_segmentation_GUI_OutputFcn, ...
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


% --- Executes just before Refine_segmentation_GUI is made visible.
function Refine_segmentation_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Refine_segmentation_GUI (see VARARGIN)

% Choose default command line output for Refine_segmentation_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Refine_segmentation_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Refine_segmentation_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
global   refine_matrix mode_8 

mode_8 =1


sizey=size(refine_matrix,1);
set(handles.text4,'string',num2str(sizey))
set(handles.edit1,'string','1')
show_frame( handles,1)
colormap('gray')
function show_frame( handles,Cell ) 
track_what=1;
global box_Raw data_file_2  refine_matrix
n=refine_matrix(Cell,2);


filename=char(box_Raw(n));


% case 1

full_filename = [data_file_2{track_what,1},filename,'_ch0',num2str(track_what-1),'.tif']
matrix_raw=imread(full_filename);


%     case 2
%         full_filename = [data_file_2{track_what,2},filename,'_ch0',num2str(track_what-1),'_Filtered.tif'];
%         matrix_out = imread(full_filename,'tif',1);
%         case 3
% full_filename = [data_file_2{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'];
% matrix_bw = imread(full_filename,'tif',1);
%
%
% end

 


xy=refine_matrix(Cell,6:9) 

X1=round(xy(2))-20 ;
Y1=round(xy(1))-20;
X2=round(xy(2)+xy(4))+20;
Y2=round(xy(1)+xy(3))+20;

if X1<1
    X1=1
end
if Y1<1
    Y1=1
end
if X2>1375
    X2=1375
end
if Y2>1031
    Y2=1031
end

 
 try
ROI_raw=  matrix_raw(X1:X2,Y1:Y2) ;
 catch
  X1=round(xy(2))  ;
Y1=round(xy(1)) ;
X2=round(xy(2)+xy(4)) ;
Y2=round(xy(1)+xy(3)) ;

ROI_raw=  matrix_raw(X1:X2,Y1:Y2) ;
 end 
     
     
axes(handles.axes1);cla
imagesc(ROI_raw)
axis equal

 



  full_filename = [data_file_2{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'];
  full_filename=regexprep( full_filename, '\ch00_Segmented\', '\ch00_Segmented2\')  ;
  global  matrix_out
  matrix_out = imread(full_filename,'tif',1);
    
   
    
 L=bwlabel(matrix_out,4);    
Cxy=refine_matrix(Cell,4:5);
Cxy=round(Cxy) 
Cell_2=L(Cxy(2),Cxy(1)) 


matrix_out(L==Cell_2)=0;




    ROI=L(X1:X2,Y1:Y2) ;  
      global paint_matrix
    paint_matrix=ROI==Cell_2;
    ROI(ROI>0)=1;
     
   
    
        
    
     [b2,b1]=find(paint_matrix);
global h_paint
h_paint =line( b1,b2 ,'LineStyle','none','Marker','+'  ,  'Hittest','Off')  ;

  

[Y,X]=find(bwdist(~ROI)==1);
line( X,Y ,'LineStyle','none','Marker','.'  ,'Color','y', 'MarkerSize',6, 'Hittest','Off')  ;
 


 



        
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global   refine_matrix 
 
val=get(handles.edit1,'string');
val=str2num(val);
val=val+1;
set(handles.edit1,'string',num2str(val))
show_frame( handles,val)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global   refine_matrix 
 
val=get(handles.edit1,'string');
val=str2num(val);
val=val-1;
set(handles.edit1,'string',num2str(val))
show_frame( handles,val)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)

global Mode cx cy Draw mode_8 Axes
sel_typ = get(gcbf,'SelectionType') ;


if strcmp(sel_typ,'extend')==1
    Mode = 'pan' ;
    set(gcf,'Pointer','fleur')
    
    
    
    
    xy1 =get(handles.axes1, 'Position') ;  %loc =get([handles. coordinates,handles. coordinates2...], 'Position');
    point  = get(gcf,'CurrentPoint')  ;
    if xy1(1)>point(1,1) || xy1(2)>point(1,2) || point(1,1)>(xy1(1)+xy1(3))|| point(1,2)>(xy1(2)+xy1(4)) 
            return 
    end
    
    
    
    
    
    point_axes = get(handles.axes1, 'CurrentPoint') ;
    cx = point_axes(2,1)  ;
    cy = point_axes(2,2)  ;
    
    XLim = get(handles.axes1, 'xlim');
    YLim = get(handles.axes1, 'ylim');
    if  cx<XLim(1) || cx>XLim(2) || cy<YLim(1) || cy>YLim(2) 
            return 
    end
    
    
    
    set(handles.mode_text,'string','Pan','Visible','on')
end

if strcmp(sel_typ,'alt')==1
    if mode_8==1
        Draw = 1 ; 
        set(gcf,'Pointer','circle')
        set(handles.mode_text,'string','Painting:destructive','Visible','on')
    end
end
if strcmp(sel_typ,'normal')==1
    if mode_8==1
        set(handles.mode_text,'string','Painting:contrastive','Visible','on')
        Draw = -1 ;  set(gcf,'Pointer','circle')
    end
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
%handles.data_file(12).cdata.draw=0;guidata(hObject, handles);
% --- Executes on mouse motion over figure - except title and menu.


zoom(handles.axes1, 'off')
pan(handles.axes1, 'off')

global Mode Draw mode_8
Mode = '' ;Draw=0;
set(gcf,'Pointer','arrow')





%   if  mode_8==1
% track_what=get(handles.track_what2,'Value') ;
%
%
%
%
%  box_Raw=get(handles.Raw_listbox,'string') ;
%  n=get(handles.Raw_listbox,'value')
%  filename=char(box_Raw(n))  ;
% full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
%          global paint_matrix
%         if isempty(paint_matrix)~=1
%             paint_matrix=255*(uint8(paint_matrix));
%             full_filename_Segmentation= char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;
%
%             imwrite(paint_matrix, full_filename_Segmentation);  %save file to hard drive
%             pushbutton27_Callback(hObject, eventdata, handles,'show_wheel')
%         end
%   else
%       'not in painting mode!'
%   end


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
if  toc<0.05
    return
end
tic

global Mode Draw mode_8 cx cy

point_axes = get(handles.axes1, 'CurrentPoint') ;

 
x = point_axes(2,1)  ;
y = point_axes(2,2)  ;





if strcmp(Mode, 'pan')
    
    % calc change in position
       [x_rel, y_rel] = abs2relCoords(handles.axes1, x, y);
        [cx_rel, cy_rel] = abs2relCoords(handles.axes1, cx, cy);
   
    
    delta_x_rel = x_rel - cx_rel;
    delta_y_rel = y_rel - cy_rel;
    
    
        % set new limits
        [new_xlim(1) new_ylim(1)] = rel2absCoords(handles.axes1, -delta_x_rel, -delta_y_rel);
        [new_xlim(2) new_ylim(2)] = rel2absCoords(handles.axes1, 1-delta_x_rel, 1-delta_y_rel);
        setNewLimits(handles.axes1, new_xlim, new_ylim);
   
    
  
    return
end




if   mode_8==1
    
    global paint_matrix spot_size   h_paint
    
    
    if Draw==-1
        
        
        
        [m,n]=size( paint_matrix);
        cm=round(y);
        cn=round(x);
        
        paint_matrix(round(max(cm-spot_size,1)):round(min(cm+spot_size,m)),round(max(cn-spot_size,1)):round(min(cn+spot_size,n)))=1;
        
        
         
        %         show_frame( handles,n)
        
        %
        [b2,b1]=find(paint_matrix);
        try
            delete(h_paint)
        end
        
        h_paint =line( b1,b2 ,'LineStyle','none','Marker','+'  ,  'Hittest','Off')  ;
        
        return
    end
    if Draw== 1
        
        
        [m,n]=size( paint_matrix);
        cm=round(y);
        cn=round(x);
        try
            delete(h_paint)
        end
        paint_matrix(round(max(cm-spot_size,1)):round(min(cm+spot_size,m)),round(max(cn-spot_size,1)):round(min(cn+spot_size,n)))=0;
        
         
        %          show_frame( handles,n)
        [b2,b1]=find(paint_matrix);
        h_paint =line( b1,b2 ,'LineStyle','none','Marker','+'  ,  'Hittest','Off')  ;
        return
    end
    
end



XLim = get(handles.axes1, 'xlim');
YLim = get(handles.axes1, 'ylim');
 
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
function setNewLimits(ax, xlim, ylim)
validX = ~any(isnan(xlim)) && ~any(isinf(xlim)) && diff(xlim)>0;
if strcmp(get(ax,'XScale'),'log')
    validX = validX && ~isinf(xlim(2)/xlim(1));
end
if validX
    set(ax, 'Xlim', xlim);
else
    if strcmp(tX.Running, 'off')
        old_color = get(ax, 'YColor');
        set(ax,'YColor','r');
        tX.TimerFcn = @(x,y)set(ax,'YColor',old_color);
        start(tX);
    end
end

validY = ~any(isnan(ylim)) && ~any(isinf(ylim)) && diff(ylim)>0;
if strcmp(get(ax,'YScale'),'log')
    validY = validY && ~isinf(ylim(2)/ylim(1));
end
if validY
    set(ax, 'Ylim', ylim);
else
    if strcmp(tY.Running, 'off')
        old_color = get(ax, 'XColor');
        set(ax,'XColor','r');
        tY.TimerFcn = @(x,y)set(ax,'XColor',old_color);
        start(tY);
    end
end


% --- Executes on scroll wheel click while the figure is in focus.
function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
if  toc<0.01
    return
end
tic



xy1 =get(handles.axes1, 'Position') ;  %loc =get([handles. coordinates,handles. coordinates2...], 'Position');
point  = get(gcf,'CurrentPoint')  ;
if xy1(1)>point(1,1) || xy1(2)>point(1,2) || point(1,1)>(xy1(1)+xy1(3))|| point(1,2)>(xy1(2)+xy1(4))
   return
end

if  get(handles.slide_zoom_option,'value')==1
    point_axes = get(handles.axes1, 'CurrentPoint') ;
    x = point_axes(2,1)  ;
    y = point_axes(2,2)  ;
    
    XLim = get(handles.axes1, 'xlim');
    YLim = get(handles.axes1, 'ylim');
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
   
    
    zoomFactor = abs(sc)*(1+20/100)^sign(sc) ;
    
    new_xlim_rel = ([0,1] - x_rel) * zoomFactor + x_rel;
    new_ylim_rel = ([0,1] - y_rel) * zoomFactor + y_rel;
    
        [new_xlim(1) new_ylim(1)] = rel2absCoords(handles.axes1, new_xlim_rel(1), new_ylim_rel(1));
        [new_xlim(2) new_ylim(2)] = rel2absCoords(handles.axes1, new_xlim_rel(2), new_ylim_rel(2));
        setNewLimits(handles.axes1, new_xlim, new_ylim)
   
    
    return
end



box_list=get(handles.Raw_listbox,'string');
sizey=size(box_list,1);


n=str2num(get(handles.showcurrentframe,  'string'))     ;


if get(handles.selective_operator  ,'value')==3
    vec=get(handles.axes3,'userdata'  );
    
    [~,N_new]=min(abs(vec-n));
    
    N_new=N_new+eventdata.VerticalScrollCount ;
    N = vec(N_new);
    
    if N> sizey || N<1
        return
    end
    
    %         set(handles.sliderframes,  'Value',N ); otherwise will show image
    %         twice
    set(handles.Raw_listbox,'value',N  );
    set(handles.showcurrentframe,  'string',num2str(N))      ;
    
else
   
    N=n+eventdata.VerticalScrollCount    ;
    if N> sizey || N<1
        return
    end
    
   N
   n
    set(handles.Raw_listbox,'value',N); Raw_listbox_Callback([], eventdata, handles)
%     set(handles.sliderframes,  'Value',N );
%     set(handles.showcurrentframe,  'string',num2str(N))      ;
    
end
return
n=N;
  

if eventdata.VerticalScrollCount==1
    set(handles.forward_button,'Visible','on')
    set(handles.backward_button,'Visible','off')
elseif eventdata.VerticalScrollCount==-1
    set(handles.forward_button,'Visible','off')
    set(handles.backward_button,'Visible','on')
end

 
 


% --- Executes on button press in slide_zoom_option.
function slide_zoom_option_Callback(hObject, eventdata, handles)
if get(hObject,'value')==1
    set(hObject,'string','zoom')
    set(hObject,'ForeGroundColor',[1 1 0])
else
    set(hObject,'string','slide')
    set(hObject,'ForeGroundColor',[0 1 1])
end


% --- Executes on key release with focus on figure1 or any of its controls.
function figure1_WindowKeyReleaseFcn(hObject, eventdata, handles)

 global  mode_8 paint_matrix    matrix_out   box_Raw data_file_2  refine_matrix 

 if strfind(eventdata.Key ,'rightarrow') 
 pushbutton2_Callback(hObject, eventdata, handles)
 end
  if strfind(eventdata.Key ,'leftarrow') 
 pushbutton3_Callback(hObject, eventdata, handles)
 end
if strfind(eventdata.Key ,'uparrow') 
    if  mode_8==1
        val=get(handles.edit1,'string');
        val=str2num(val); 
        
         Cell=val;
track_what=1;
 
n=refine_matrix(Cell,2); 
filename=char(box_Raw(n)); 
 


xy=refine_matrix(Cell,6:9);

X1=round(xy(2))-20 ;
Y1=round(xy(1))-20;
X2=round(xy(2)+xy(4))+20;
Y2=round(xy(1)+xy(3))+20;
 
if X1<1
    X1=1
end
if Y1<1
    Y1=1
end
if X2>1375
    X2=1375
end
if Y2>1031
    Y2=1031
end


  full_filename = [data_file_2{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'];
  full_filename=regexprep( full_filename, '\ch00_Segmented\', '\ch00_Segmented2\')  ;
 matrix_out(X1:X2,Y1:Y2)=  matrix_out(X1:X2,Y1:Y2)+paint_matrix ;
  
  
        imwrite(matrix_out, full_filename);  %save file to hard drive 
        set(handles.mode_text,'string','saved painting','visible','on')
        
           
  show_frame( handles,Cell ) 


    end
end



function spot_size_Callback(hObject, eventdata, handles)
% hObject    handle to spot_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global spot_size
spot_size=get(handles.spot_size,'string');
spot_size=round(str2num(spot_size)) 
% Hints: get(hObject,'String') returns contents of spot_size as text
%        str2double(get(hObject,'String')) returns contents of spot_size as a double


% --- Executes during object creation, after setting all properties.
function spot_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spot_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
