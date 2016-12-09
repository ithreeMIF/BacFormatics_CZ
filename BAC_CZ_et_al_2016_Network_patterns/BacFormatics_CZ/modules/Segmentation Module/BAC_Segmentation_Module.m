%% ________________BacFormatics Code starts here:________________  
function varargout = BAC_Segmentation_Module(varargin)                  
% BAC_Segmentation_Module M-file for BAC_Segmentation_Module.fig                  
%      BAC_Segmentation_Module, by itself, creates a new BAC_Segmentation_Module or raises the existing                  
%      singleton*.                  
%      H = BAC_Segmentation_Module returns the handle to a new BAC_Segmentation_Module or the handle to                  
%      the existing singleton*.                  
%                  
%      BAC_Segmentation_Module('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in BAC_Segmentation_Module.M with the given input arguments.                  
%                  
%      BAC_Segmentation_Module('Property','Value',...) creates a new BAC_Segmentation_Module or raises the                  
%      existing singleton*.  Starting from the left, property value pairs                  
%      are                  
%      applied to the GUI before BAC_Segmentation_Module_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to BAC_Segmentation_Module_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to filter_help BAC_Segmentation_Module                  
% Last Modified by GUIDE v2.5 19-Jun-2016 11:00:14
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @BAC_Segmentation_Module_OpeningFcn, ...                  
'gui_OutputFcn',  @BAC_Segmentation_Module_OutputFcn, ...                  
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
% --- Executes just before BAC_Segmentation_Module is made visible.                  
function BAC_Segmentation_Module_OpeningFcn(hObject, eventdata, handles, varargin)    
 tic
    
    
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
A=segmentation_file;                  
for iii=2:6                  
eval(strcat('set(handles.T_popup_',num2str(iii),',''String'',   A) '));                  
end                  
B=Filter_file;                  
for iii=1:5                  
eval(strcat('set(handles.F_popup_',num2str(iii),',''String'',   B) '));                  
end                  
handles.flag.axis1=-1;                  
handles.flag.axis2=-1;                  
handles.flag.tif=-1                  
handles.flag.bwlabel=0;    
 handles.flags.Contour=1;
handles.c=jet;                  
if nargin ==3                  
handles.nargin_num=3;                  
handles.output = hObject;                  
handles.data_file=[];                  
guidata(hObject, handles);                  
                 
elseif nargin==4                  
handles.data_file=varargin{1};                  
handles.output = hObject;                  
guidata(hObject, handles);                  
if isempty( handles.data_file)==1                  
handles.nargin_num=3;                  
guidata(hObject, handles);                  
return                  
end                  
set(handles.Current_Exp,'String',handles.data_file(10).cdata);                  
handles.nargin_num=4;                  
handles.output = hObject;                  
set(handles.showcurrentframe,'String',1);                  
str=handles.data_file(1).cdata;                  
set(handles.Raw_listbox,'String', str(:,1))                  
track_what1=get(handles.track_what1,'Value') ;                  
track_what2=get(handles.track_what2,'Value') ;                  
track_what3=get(handles.track_what3,'Value') ;                  
str=handles.data_file(3).cdata( track_what1,1);                  
if char(str)=='1'                  
handles.c=handles.c1;                  
elseif char(str)=='2'                  
handles.c=handles.c2;                  
elseif char(str)=='3'                  
handles.c=handles.c3;                  
elseif char(str)=='4'                  
handles.c=handles.c4 ;                  
elseif char(str)=='5'                  
handles.c=handles.c5 ;                  
elseif char(str)=='6'                  
handles.c=handles.c6 ;                  
end                  
guidata(hObject, handles);                  
set(gcf,'colormap',handles.c);                  
track_what1_Callback(hObject, eventdata, handles)                  
track_what2_Callback(hObject, eventdata, handles)                  
track_what3_Callback(hObject, eventdata, handles)                  
set(handles.Raw_panel,'Visible','on');   
guidata(hObject, handles);  
 
elseif nargin==5                  
handles.data_file=varargin{1};        
n = varargin{2};  
handles.output = hObject;                  
guidata(hObject, handles);                  
if isempty( handles.data_file)==1                  
handles.nargin_num=3;                  
guidata(hObject, handles);                  
return                  
end                  
set(handles.Current_Exp,'String',handles.data_file(10).cdata);                  
handles.nargin_num=5;                  
handles.output = hObject;                  
set(handles.showcurrentframe,'String',num2str(n));                  
str=handles.data_file(1).cdata;    
try
set(handles.Raw_listbox,'String', str(:,1))                  
track_what1=get(handles.track_what1,'Value') ;                  
track_what2=get(handles.track_what2,'Value') ;                  
track_what3=get(handles.track_what3,'Value') ;                  
str=handles.data_file(3).cdata( track_what1,1);                  
if char(str)=='1'                  
handles.c=handles.c1;                  
elseif char(str)=='2'                  
handles.c=handles.c2;                  
elseif char(str)=='3'                  
handles.c=handles.c3;                  
elseif char(str)=='4'                  
handles.c=handles.c4 ;                  
elseif char(str)=='5'                  
handles.c=handles.c5 ;                  
elseif char(str)=='6'                  
handles.c=handles.c6 ;                  
end                  
guidata(hObject, handles);                  
set(gcf,'colormap',handles.c);                  
%  track_what1_Callback(hObject, eventdata, handles)                  
%   track_what2_Callback(hObject, eventdata, handles)                  
%  track_what3_Callback(hObject, eventdata, handles)    

create_Filtered_listbox(handles)
create_Segmentation_listbox(handles)


set(handles.Raw_panel,'Visible','on');   
guidata(hObject, handles);  
set(handles.Raw_listbox,'value', n) 
set(handles.showcurrentframe,'String',num2str(n));   
 Raw_listbox_Callback(hObject, eventdata, handles)  
 axes(handles.axes1);axis tight;
        axes(handles.axes2);axis tight;
            axes(handles.axes3);axis tight;

            
end           

elseif nargin==8                  
handles.data_file=varargin{1};                  
handles.output = hObject;                  
guidata(hObject, handles);                  
if isempty( handles.data_file)==1                  
handles.nargin_num=3;                  
guidata(hObject, handles);                  
return                  
end                  
set(handles.Current_Exp,'String',handles.data_file(10).cdata);                  
handles.nargin_num=8;                  
handles.output = hObject;                  
set(handles.showcurrentframe,'String',1);                  
str=handles.data_file(1).cdata;                  
set(handles.Raw_listbox,'String', str(:,1))                  
track_what1=get(handles.track_what1,'Value') ;                  
track_what2=get(handles.track_what2,'Value') ;                  
track_what3=get(handles.track_what3,'Value') ;                  
str=handles.data_file(3).cdata( track_what1,1);                  
if char(str)=='1'                  
handles.c=handles.c1;                  
elseif char(str)=='2'                  
handles.c=handles.c2;                  
elseif char(str)=='3'                  
handles.c=handles.c3;                  
elseif char(str)=='4'                  
handles.c=handles.c4 ;                  
elseif char(str)=='5'                  
handles.c=handles.c5 ;                  
elseif char(str)=='6'                  
handles.c=handles.c6 ;                  
end                  
guidata(hObject, handles);                  
set(gcf,'colormap',handles.c);                  
track_what1_Callback(hObject, eventdata, handles)                  
set(handles.Raw_panel,'Visible','on');                  
%          numFiles = size(handles.data_file(1).cdata(:,1),1);                  
%    set(handles.slider1, 'Value',1, 'Max ',numFiles, 'Min ',1);                  
%    try                  
%        handles.slider1.setEnabled(true);  % Java JSlider                  
%    catch                  
%        set(handles.slider1, 'Enable','on', 'SliderStep',[1/numFiles, 0.1]);  % Matlab scrollbar                  
%    end     

  numFiles = size(handles.data_file(1).cdata(:,1),1); 
set(handles.slider1, 'Value',1, 'Max',numFiles, 'Min',1); 
 set(handles.slider1, 'Enable','on', 'SliderStep',[1/numFiles, 0.1]);  % Matlab scrollbar






guidata(hObject, handles);                  
handles.data_file=varargin{1};      

global box_Raw  
box_Raw= handles.data_file(1).cdata(:,1) ;


data_file=varargin{1};                  
full_filename=varargin{2};    
pathname=full_filename(1:findstr(full_filename,'BacFormatics_EXP')-1);

pathname=regexprep(pathname, '\', filesep) ;
pathname=regexprep(pathname, '/', filesep) ;

handles.data_file(2).cdata{1,1}= [pathname];
handles.data_file(2).cdata{1,2}= [pathname  'ch00_Filtered' filesep];
handles.data_file(2).cdata{1,3}= [pathname  'ch00_Segmented' filesep]  ;

handles.data_file(2).cdata{2,1}= [pathname];
handles.data_file(2).cdata{2,2}= [pathname   'ch01_Filtered' filesep];
handles.data_file(2).cdata{2,3}= [pathname   'ch01_Segmented' filesep]  ;


handles.data_file(2).cdata{3,1}= [pathname];
handles.data_file(2).cdata{3,2}= [pathname   'ch02_Filtered' filesep];
handles.data_file(2).cdata{3,3}= [pathname   'ch02_Segmented' filesep]  ;

Raw_listbox=data_file(1).cdata(:,1);     




track_what=varargin{3};                  
if max(size(track_what))==2
track_what1=track_what(1);                  
track_what2=track_what(2);                  
track_what3=track_what(2); 
end
if max(size(track_what))==3
track_what1=track_what(1);                  
track_what2=track_what(2);                  
track_what3=track_what(3); 
end


set(handles.track_what1,'value',track_what1)                  
set(handles.track_what2,'value',track_what2)                  
set(handles.track_what3,'value',track_what3)                  
             
DATA=importdata(varargin{4} )  ; 

set_DATA(handles,DATA);                  
Projected_by_Value= varargin{5}   ;                  
Projected_by_Str=get(handles.Projected_by,'String')  ; %may cause a problem to use handles here- might be better to input manually string                  
if isempty( data_file)==1                  
handles.output = hObject;                  
guidata(hObject, handles);                  
return                  
end                  
handles.output = hObject;                  
curent_index=[];                  
box_Raw=data_file(1).cdata(:,1);                  
set(handles.Raw_listbox,'String', box_Raw)                  
if iscell(box_Raw)==0                  
               
h = errordlg('No files in Raw Frame listbox','Error');                  
return                  
end                  
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
pathname_Raw= data_file(2).cdata(track_what1,1) ;                  
pathname_Filtered= data_file(2).cdata(track_what2,2) ;                  
pathname_Segmented= data_file(2).cdata(track_what3,3) ;                  
guidata(hObject, handles);                  


segmentation_type2_Callback(hObject, eventdata, handles)  ;  set(handles.Raw_listbox,'value', 1)  ;
 



handles.nargin_num=5;                  
guidata(hObject, handles);       

if  get(handles.Robust_Filtering_on,'value') ==1    
   if size(  box_Raw ,1)==1
       set(handles.select_mode_filtered,'value',2)    
   else 
set(handles.select_mode_filtered,'value',3)    
   end
select_mode_filtered_Callback(hObject, eventdata, handles)                  
apply_filters_function(hObject, eventdata, handles,'Batch')  
   
end

segmentation_type3_Callback(hObject, eventdata, handles)  ;  set(handles.Filtered_listbox,'value', 1)  ;



if  get(handles.Robust_Segmenting_on,'value') ==1    
    
   if size(  box_Raw ,1)==1
       set(handles.select_mode_segmentation,'value',2)    
   else 
set(handles.select_mode_segmentation,'value',3)    
   end  
    
    
                
select_mode_segmentation_Callback(hObject, eventdata, handles)                  
apply_segmentation_function(hObject, eventdata, handles,'Batch')                  
end                  
save(char(varargin{2}) ,  'data_file')                  
%         -----------------                  
elseif nargin==9                  
handles.nargin_num=4;                  
handles.data_file=varargin{1};                  
data_file=varargin{1};                  
full_filename=varargin{2};                  
track_what=varargin{3};                  
Raw_listbox=data_file(1).cdata(:,1);                  
track_what1=track_what(1);                  
track_what2=track_what(2);                  
track_what3=track_what(2);                  
set(handles.track_what1,'value',track_what1)                  
set(handles.track_what2,'value',track_what2)                  
set(handles.track_what3,'value',track_what3)                  
varargin{4}                  
DATA=importdata(varargin{4} )  ;                  
set_DATA(handles,DATA);                  
Projected_by_Value= varargin{5}   ;                  
Projected_by_Str=get(handles.Projected_by,'String')  ; %may cause a problem to use handles here- might be better to input manually string                  
O_vec = varargin{6}   ;                  
if isempty( data_file)==1                  
handles.output = hObject;                  
guidata(hObject, handles);                  
return                  
end                  
handles.output = hObject;                  
curent_index=[];                  
box_Raw=data_file(1).cdata(:,1);                  
set(handles.Raw_listbox,'String', box_Raw)                  
if iscell(box_Raw)==0                  
                  
h = errordlg('No files in Raw Frame listbox','Error');                  
return                  
end                  
start_filter_at=1;                  
end_filter_at=  size(box_Raw,1)  ;                  
v=2 ;                  
n=floor((end_filter_at-start_filter_at)/v) ;                  
if v==1                  
n=1;                  
end                  
if n<1                  
h = msgbox('Minimal files for Batch is v','Aborted');                  
return                  
end                  
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
pathname_Raw= data_file(2).cdata(track_what1,1) ;                  
pathname_Filtered= data_file(2).cdata(track_what2,2) ;                  
pathname_Segmented= data_file(2).cdata(track_what3,3) ;                  
str=handles.data_file(1).cdata;                  
if char(str)=='1'                  
handles.c=handles.c1;                  
elseif char(str)=='2'                  
handles.c=handles.c2;                  
elseif char(str)=='3'                  
handles.c=handles.c3;                  
elseif char(str)=='4'                  
handles.c=handles.c4 ;                  
elseif char(str)=='5'                  
handles.c=handles.c5 ;                  
elseif char(str)=='6'                  
handles.c=handles.c6 ;                  
end                  
guidata(hObject, handles);                  
curent_index=[];                  
%        for ii=start_filter_at:end_filter_at                  
%             data_file(8).cdata(track_what1).Frame(ii).DATA=DATA;                  
%       end                  
handles.nargin_num=5;                  
guidata(hObject, handles);    




if  get(handles.Robust_Filtering_on,'value') ==1      
     track_what1_Callback(hObject, eventdata, handles)  
set(handles.select_mode_filtered,'value',3)
apply_filters_function(hObject, eventdata, handles,'Batch_Robust')  
end
figure
if  get(handles.Robust_Segmenting_on,'value') ==1      
    track_what2_Callback(hObject, eventdata, handles)  
set(handles.select_mode_segmentation,'value',3)
select_mode_segmentation(hObject, eventdata, handles)  
        apply_segmentation_function(hObject, eventdata, handles,'Batch_Robust')         
end                  
         
end                                   
handles.output = hObject;                  
guidata(hObject, handles);                  
%        guidata(hFig, handles);  % update handles struct                  
                 
 handles.sliderListener = addlistener(handles.slider1,'ContinuousValueChange',@(hFigure,eventdata) slider1ContValCallback(hObject,eventdata));
 handles.sliderListener = addlistener(handles.slider2,'ContinuousValueChange',@(hFigure,eventdata) slider2ContValCallback(hObject,eventdata));
 
                 
           
guidata(hObject, handles);                  
tic;                  
clc                  
% --------------------------------------------------------------------                  
function varargout = BAC_Segmentation_Module_OutputFcn(hObject, eventdata, handles)                  
%   setWindowState(hObject,'maximize','icon.gif');  % Undocumented feature!                  
pause(0.05); drawnow;                  
if handles.nargin_num==3 ||   handles.nargin_num==4   ||   handles.nargin_num==5 ||   handles.nargin_num==6                   
                 
varargout{1}=  handles.output;                  
end                  
if handles.nargin_num==7                  
wait_pause=waitbar(0,'exit....');                  
for cc=1:5                  
waitbar(cc/5)                  
pause(1)                  
end                  
close( wait_pause)                  
close(BAC_Segmentation_Module)                  
clc                  
end                  
% --------------------------------------------------------------------                  
                 
%   SECTION 1 - LOADING,DELETING,SHOWING MOVIE AND ACCESSING THE DATA                  
%   SUBSECTION 1-A - LOADING                  
%   SUBSECTION 1-B - DELETING                  
%   SUBSECTION 1-C - MOVIE                  
%   SUBSECTION 1-D - ACCESSING DATA- ANDLING DATA FROM AXES TO THE                  
%_________________________________________________________________________                  
% START SECTION 1 - LOADING,DELETING,SHOWING MOVIE AND ACCESSING THE DATA                  
% START SUBSECTION 1-A - LOADING                  
% --------------------------------------------------------------------                  
%Tip Use dos to delete and seperate the DIC from the fluorosence images                  
%--------------------------------------------------------------------------                  
% END SUBSECTION 1-A - LOADING                  
% START SUBSECTION 1-B - DELETING                  
%--------------------------------------------------------------------------                  
function delete_Raw_Frame_Callback(hObject, eventdata, handles)                  
n=get(handles.Raw_listbox,'Value') ;                  
listbox=get(handles.Raw_listbox,'string')  ;                  
track_what1=get(handles.track_what1,'Value') ;                  
pathname_Raw=handles.data_file(2).cdata(track_what1,1) ;                  
if (n==1 && n==size(listbox,1))                  
new_listbox=[];                  
set(handles.Raw_listbox,'string',new_listbox);                  
return                  
end                  
if (n==1 &&  size(listbox,1)>1)                  
for ii=1:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
filename=new_listbox(1);                  
filename= strcat(pathname_Raw,filename);                  
filename=char(filename);                  
set(handles.Raw_listbox,'string',new_listbox);                  
return                  
end                  
if (n>1 &&  size(listbox,1)>1 && size(listbox,1)>n)                  
for ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
for ii=n:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
filename=new_listbox(n);                  
filename= strcat(pathname_Raw,filename);                  
filename=char(filename);                  
set(handles.Raw_listbox,'string',new_listbox);                  
return                  
end                  
if   (n==size(listbox,1) && n>1)                  
for  ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
set(handles.Raw_listbox,'Value',n-1);                  
set(handles.Raw_listbox,'string',new_listbox);                  
return                  
end                  
%--------------------------------------------------------------------------                  
function delete_Filtered_Frame_Callback(hObject, eventdata, handles)                  
n=get(handles.Filtered_listbox,'Value') ;                  
listbox=get(handles.Filtered_listbox,'string')  ;                  
track_what2=get(handles.track_what2,'Value') ;                  
pathname_Filtered=handles.data_file(2).cdata(track_what2,2) ;                  
if (n==1 && n==size(listbox,1))                  
new_listbox=[];                  
set(handles.Filtered_listbox,'string',new_listbox);                  
return                  
end                  
if (n==1 &&  size(listbox,1)>1)                  
for ii=1:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
filename=new_listbox(1);                  
filename= strcat(pathname_Filtered,filename);                  
filename=char(filename);                  
set(handles.Filtered_listbox,'string',new_listbox);                  
return                  
end                  
if (n>1 &&  size(listbox,1)>1 && size(listbox,1)>n)                  
for ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
for ii=n:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
filename=new_listbox(n);                  
filename= strcat(pathname_Filtered,filename);                  
filename=char(filename);                  
set(handles.Filtered_listbox,'string',new_listbox);                  
return                  
end                  
if (n==size(listbox,1) && n>1)                  
for  ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
set(handles.Filtered_listbox,'Value',n-1);                  
set(handles.Filtered_listbox,'string',new_listbox);                  
return                  
end                  
%--------------------------------------------------------------------------                  
function delete_Segmented_Frame_Callback(hObject, eventdata, handles)                  
n=get(handles.Segmentation_listbox,'Value') ;                  
listbox=get(handles.Segmentation_listbox,'string')  ;                  
track_what3=get(handles.track_what3,'Value') ;                  
pathname_Segmented=handles.data_file(3).cdata(track_what3,1) ;                  
if (n==1 && n==size(listbox,1))                  
new_listbox=[];                  
set(handles.Segmentation_listbox,'string',new_listbox);                  
return                  
end                  
if (n==1 &&  size(listbox,1)>1)                  
for ii=1:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
filename=new_listbox(1);                  
filename= strcat(pathname_Segmented,filename);                  
filename=char(filename);                  
set(handles.temp_dir_Raw,'String',pathname);                  
set(handles.Segmentation_listbox,'string',new_listbox);                  
return                  
end                  
if (n>1 &&  size(listbox,1)>1 && size(listbox,1)>n)                  
for ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
for ii=n:(size(listbox,1)-1)                  
new_listbox(ii)=listbox(ii+1);                  
end                  
filename=new_listbox(n);                  
filename= strcat(pathname_Segmented,filename);                  
filename=char(filename);                  
set(handles.temp_dir_Raw,'String',pathname);                  
set(handles.Segmentation_listbox,'string',new_listbox);                  
return                  
end                  
if (n==size(listbox,1) && n>1)                  
for  ii=1:(n-1)                  
new_listbox(ii)=listbox(ii);                  
end                  
set(handles.Segmentation_listbox,'Value',n-1);                  
set(handles.Segmentation_listbox,'string',new_listbox);                  
return                  
end                  
%-------------------------------------------------------------------------                  
function delete_Raw_Frame_listbox_Callback(hObject, eventdata, handles)                  
set(handles.Raw_listbox,'Value',1)                  
set(handles.Raw_listbox,'string','Raw Frame');                  
axes(handles.axes1)                  
cla                  
%-------------------------------------------------------------------------                  
function delete_Filtered_Frame_listbox_Callback(hObject, eventdata, handles)                  
set(handles.Filtered_listbox,'Value',1)                  
set(handles.Filtered_listbox,'string','Filtered Frame');                  
axes(handles.axes2)                  
cla                  
%--------------------------------------------------------------------------                  
function delete_Segmented_Frame_listbox_Callback(hObject, eventdata, handles)                  
set(handles.Segmentation_listbox,'Value',1)                  
set(handles.Segmentation_listbox,'string','Segmented Frame');                  
axes(handles.axes3)                  
cla                  
%-------------------------------------------------------------------------                  
%START SUBSECTION 1-C - SHOW MOVIE                  
function Choose_the_axes_Callback(hObject, eventdata, handles)                  
box_Raw=get(handles.Raw_listbox,'string') ;                  
box_Filtered=get(handles.Filtered_listbox,'string') ;                  
box_Segmented=get(handles.Segmentation_listbox,'string') ;                  
popup_Choose_the_axes=get(handles.Choose_the_axes,'Value') ;                  
switch popup_Choose_the_axes                  
case 1                  
set(handles.start_export,'Visible','off')                  
set(handles.end_export,'Visible','off')                  
case 2 %AXES 1                  
set(handles.start_export,'Visible','on')                  
set(handles.end_export,'Visible','on')                  
n=get(handles.Raw_listbox,'Value') ;                  
if isempty(n)==1                  
n=1;                  
end                  
if isempty(box_Raw)==1                  
box_Raw=1;                  
end                  
set(handles.start_export,'String',num2str(n));                  
set(handles.end_export,'String',num2str(size(box_Raw,1)));                  
if iscell(box_Raw)==0                  
                
h = errordlg('No files in Raw listbox','Error');                  
                 
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Raw_listbox,'Value') ;                  
set(handles.slider1, 'Minimum',1, 'Maximum',size(box_Raw,1), 'Value',n);                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
case 3 %AXES 2                  
set(handles.start_export,'Visible','on');                  
set(handles.end_export,'Visible','on')   ;                  
n=get(handles.Filtered_listbox,'Value') ;                  
if isempty(n)==1                  
n=1;                  
end                  
if isempty(box_Filtered)==1                  
box_Filtered=1;                  
end                  
set(handles.start_export,'String',num2str(n));                  
set(handles.end_export,'String',num2str(size(box_Filtered,1)));                  
if iscell(box_Filtered)==0                  
                
h = errordlg('No files in Filtered listbox','Error');                  
               
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Filtered_listbox,'Value') ;                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
case  4 %AXES 3                  
set(handles.start_export,'Visible','on')                  
set(handles.end_export,'Visible','on')                  
n=get(handles.Segmentation_listbox,'Value') ;                  
if isempty(n)==1                  
n=1;                  
end                  
if isempty(box_Segmented)==1                  
box_Segmented=1;                  
end                  
set(handles.start_export,'String',num2str(n));                  
set(handles.end_export,'String',num2str(size(box_Segmented,1)));                  
if iscell(box_Segmented)==0                  
                   
h = errordlg('No files in Segmented listbox','Error');                  
                   
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Segmentation_listbox,'Value') ;                  
set(handles.slider1,'Max',size(box_Segmented,1));                  
set(handles.slider1,'Min',1);                  
set(handles.slider1,'value',n);                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
case 5  %AXES 1+2                  
set(handles.start_export,'Visible','off')                  
set(handles.end_export,'Visible','off')                  
if (iscell(box_Raw)==0) || (iscell(box_Filtered)==0)                  
                 
h = errordlg('Should be files in both Raw and Filtered listboxes','Error');                  
                  
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Raw_listbox,'Value') ;                  
set(handles.slider1,'Max',size(box_Raw,1));                  
set(handles.slider1,'value',n);                  
set(handles.slider1,'Min',1);                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
case 6  %AXES 1+3                  
set(handles.start_export,'Visible','off')                  
set(handles.end_export,'Visible','off')                  
if (iscell(box_Raw)==0) || (iscell(box_Segmented)==0)                  
                 
h = errordlg('Should be files in both Raw and Segmented listboxes','Error');                  
                
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Raw_listbox,'Value') ;                  
set(handles.slider1,'Max',size(box_Raw,1));                  
set(handles.slider1,'value',n);                  
set(handles.slider1,'Min',1);                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
case 7  %AXES 2+3                  
set(handles.start_export,'Visible','off')                  
set(handles.end_export,'Visible','off')                  
if ((iscell(box_Segmented)==0) || (iscell(box_Filtered)==0))                  
                   
h = errordlg('Should be files in Filtered and Segmented listboxes','Error');                  
                  
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Segmentation_listbox,'Value') ;                  
set(handles.slider1,'Max',size(box_Segmented,1));                  
set(handles.slider1,'value',n);                  
set(handles.slider1,'Min',1);                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
case 8  %AXES 1+2+3                  
set(handles.start_export,'Visible','off')                  
set(handles.end_export,'Visible','off')                  
if   ((iscell(box_Raw)==0) || (iscell(box_Filtered)==0) || (iscell(box_Segmented)==0))                  
                  
h = errordlg('Should be files in Raw, Filtered, and Segmented','Error');                  
                  
set(handles.Choose_the_axes,'Value',1)                  
else                  
n=get(handles.Segmentation_listbox,'Value') ;                  
set(handles.slider1,'Max',size(box_Segmented,1));                  
set(handles.slider1,'value',n);                  
set(handles.slider1,'Min',1);                  
set(handles.showcurrentframe,'String',num2str(n));                  
return ;                  
end                  
end                  
guidata(hObject,handles);                  
%-------------------------------------------------------------------------                  
            
%-------------------------------------------------------------------------                  
%START SUBSECTION 1-D - ACCESSING DATA- HANDLING DATA FROM AXES TO THE FIGURES                  
%--------------------------------------------------------------------------                  
% START SECTION 2 - 	LIST BOXES                  
%_________________________________________________________________________                  
function Raw_listbox_Callback(hObject, eventdata, handles)       
        lock_on=get(handles.lock_on,'value');
        n=get(handles.Raw_listbox,'Value') ;
switch get(handles.Vis_option,'value') 
    case 1
        
        Raw_listbox= get(handles.Raw_listbox,'string');
        track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;
        segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');
        try
            temp= read_image(handles,n,segmentation_type1,track_what1,  Raw_listbox )  ;%segmentation_type=Raw (1)
            axes(handles.axes1);cla
            imagesc(temp);  %axis   tight
        end
    case 2
        show_frame_colocalize(handles,n)
    case 3
        %         ??
end







 

if lock_on==1
    Raw_listbox= get(handles.Raw_listbox,'string');
    track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;
    segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');
    
    filename_Raw=char(Raw_listbox(n)) ;
    Filtered_listbox=get(handles.Filtered_listbox,'string')   ;
    Segmentation_listbox=get(handles.Segmentation_listbox,'string')   ;
    filename_Raw=char(Raw_listbox(n)) ;
    iii=find(ismember(Filtered_listbox,filename_Raw)) ;
    jjj=find(ismember(Segmentation_listbox,filename_Raw)) ;
%     
%     filename_Raw=char(Raw_listbox(n))   
%     Ind_t=strfind(filename_Raw,'_t')
%     Ind_t=Ind_t(end)
%     filename_Raw_ind=filename_Raw(Ind_t+2:end)
%     
%     
%     
%     
%     for iii=1:size( Filtered_listbox,1)
%         filename_Filtered=char(Filtered_listbox(iii)) ;
%         Ind_t=strfind(filename_Filtered,'_t');Ind_t=Ind_t(end); filename_Filtered_ind=filename_Filtered(Ind_t+2:end)
%         if  strcmp(filename_Filtered_ind,filename_Raw_ind) ==1
%             break
%         end
%     end
%     
%     
%     for jjj=1:size( Segmentation_listbox,1)
%         filename_Segmentation=char(Segmentation_listbox(jjj))
%         Ind_t=strfind(filename_Segmentation,'_t');Ind_t=Ind_t(end); filename_Segmentation_ind=filename_Segmentation(Ind_t+2:end)
%         if  strcmp(filename_Segmentation_ind,filename_Raw_ind) ==1
%             break
%         end
%     end
    
    
    
    
    
    
%     if iii<(size(Filtered_listbox,1)+1)  &&  size(Filtered_listbox,1)>2
if isempty(iii)~=1
    if max(size(iii))==1
        temp= read_image(handles,iii,segmentation_type2,track_what2,get(handles.Filtered_listbox,'string') )  ;
        axes(handles.axes2);cla
        imagesc(temp);
        set(handles.Filtered_listbox,'value',iii);
    end
end
%     if jjj<(size(Segmentation_listbox,1)+1)   &&  size(Segmentation_listbox,1)>2
if isempty(jjj)~=1
    if max(size(jjj))==1
        temp= read_image(handles,jjj,segmentation_type3  ,track_what3,get(handles.Segmentation_listbox,'string') )   ;
        axes(handles.axes3); cla
        if get(handles.segmentation_type3,'value')==3
            
            if handles.flag.bwlabel==1
                temp=bwlabel(temp);
                r=rand(1,max(max(temp)));
                [r1,r2]=sort(r);
                temp0=zeros(size(temp));
                for ii=1:max(max(temp))
                    temp0(temp==ii)=r2(ii);
                end
                imagesc(temp0);
            else
                imagesc(temp);
            end
            
        else
            imagesc(temp)
            
        end
        set(handles.Segmentation_listbox,'value',jjj);
    end
end
end

try
    if get(handles.Show_contour,'value')==1 | get(handles.show_segment,'value')==1
        axes(handles.axes1)
        hold on  
        if get(handles.show_segment,'value')==1
            [b2,b1]=find(temp);
            global h_paint
            h_paint =line( b1,b2 ,'LineStyle','none','Marker','+'  ,  'Hittest','Off')  ;
        end 
        if get(handles.Show_contour,'value')==1 
            temp=bwdist(~temp); 
            if handles.flags.Contour==0
                [Y,X]=find(temp==1);
                line( X,Y ,'LineStyle','none','Marker','.'  ,'Color','y', 'MarkerSize',6, 'Hittest','Off')  ;
            else
                contour( temp,[0 0],'y','Hittest','Off')
            end
        end
    end
end

 

% -------------------------------------------------------------------------                  
function Filtered_listbox_Callback(hObject, eventdata, handles)                  
segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');                  
track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;                  
Raw_listbox=get(handles.Raw_listbox,'string') ;
Filtered_listbox=get(handles.Filtered_listbox,'string') ;  
Segmentation_listbox=get(handles.Segmentation_listbox,'string')   ;   


n=get(handles.Filtered_listbox,'Value')  ;                  
temp= read_image(handles,n,segmentation_type2 ,track_what2,Filtered_listbox)  ;

 
%segmentation_type=Raw (1)                  
%    str2=handles.data_file(3).cdata( track_what2,1);                  
% save temp temp                  
% save str2 str2                  
% matrix_out = zeros(512,512,3);                  
%                  
%      if char(str2)~='0'  && char(str2)~='1' %    'first channel is active, and not DIC'                  
%                  
%                       if char(str2)=='2'                  
%                                 'Blue'      ;                  
%                                 matrix_out(:,:,1)= temp;                  
%                             elseif char(str2)=='3'                  
%                                     'Green'                  
%                                       matrix_out(:,:,2)= temp;                  
%                                 elseif char(str2)=='4'                  
%                                         'Green'                  
%                                           matrix_out(:,:,2)= temp;                  
%                                     elseif char(str2)=='5'                  
%                                               'Red'                  
%                                                 matrix_out(:,:,3)= temp;                  
%                                           elseif char(str2)=='6'                  
%                                                         'Red'                  
%                                                           matrix_out(:,:,3)= temp;                  
%                       end                  
%      end                  
axes(handles.axes2);    cla        

if segmentation_type2==3
    if handles.flag.bwlabel==0
        imagesc( temp );
    end
    if handles.flag.bwlabel==1
        temp=bwlabel(temp,4);
        
        r=rand(1,max(max(temp)));
        [r1,r2]=sort(r);
        temp0=zeros(size(temp));
        for ii=1:max(max(temp))
            temp0(temp==ii)=r2(ii);
        end
        imagesc( temp0 );
    end
    if handles.flag.bwlabel==2
        temp0=bwlabel(temp);
        imagesc( temp0 );
    end
else
    imagesc(temp);
end


lock_on=get(handles.lock_on,'value');                  
if lock_on==1 
    
filename_Filtered=char(Filtered_listbox(n))  ;  
     
  iii=find(ismember(Raw_listbox,filename_Filtered)) ;
  jjj=find(ismember(Segmentation_listbox,filename_Filtered)) ;
   
% filename_Filtered=char(Filtered_listbox(n))  ;  
% Ind_t=strfind(filename_Filtered,'_t');Ind_t=Ind_t(end); filename_Filtered_ind=filename_Filtered(Ind_t+2:end); 
% 

% 
% for iii=1:size( Raw_listbox,1)                  
% filename_Raw=char(Raw_listbox(iii)) ;  
%  Ind_t=strfind(filename_Raw,'_t');Ind_t=Ind_t(end); filename_Raw_ind=filename_Raw(Ind_t+2:end)  
% if  strcmp(filename_Raw_ind,filename_Filtered_ind) ==1                  
% break                  
% end                  
% end        
% 
% 
% for jjj=1:size( Segmentation_listbox,1)                  
% filename_Segmentation=char(Segmentation_listbox(jjj))    
%  Ind_t=strfind(filename_Segmentation,'_t');Ind_t=Ind_t(end); filename_Segmentation_ind=filename_Segmentation(Ind_t+2:end)  
% if  strcmp(filename_Segmentation_ind,filename_Filtered_ind) ==1                  
% break                  
% end                  
% end  
%      
% if iii<(size(Raw_listbox,1)+1)     
    if isempty(iii)~=1
        if max(size(iii))==1
temp= read_image(handles,iii,segmentation_type1,track_what1,get(handles.Raw_listbox,'string') )  ;%segmentation_type=Raw (1)                  
axes(handles.axes1);cla                  
imagesc(temp);                  
set(handles.Raw_listbox,'value',iii);                  
        end      
    end
% if jjj<(size(Segmentation_listbox,1)+1)  
    if isempty(jjj)~=1
        if max(size(jjj))==1
temp= read_image(handles,jjj,segmentation_type3  ,track_what3,get(handles.Segmentation_listbox,'string') )  ;                  
axes(handles.axes3);                  
cla 



 

if segmentation_type3==3
    if handles.flag.bwlabel==0
        imagesc( temp );
    end
    if handles.flag.bwlabel==1
        temp=bwlabel(temp,4);
        
        r=rand(1,max(max(temp)));
        [r1,r2]=sort(r);
        temp0=zeros(size(temp));
        for ii=1:max(max(temp))
            temp0(temp==ii)=r2(ii);
        end
        imagesc( temp0 );
    end
    if handles.flag.bwlabel==2
        temp0=bwlabel(temp);
        imagesc( temp0 );
    end
else
    imagesc(temp);
end



set(handles.Segmentation_listbox,'value',jjj);                  
end                  
    end    
end
% axis   tight                  
%-------------------------------------------------------------------------                  
function Segmentation_listbox_Callback(hObject, eventdata, handles)             
    
n=get(handles.Segmentation_listbox,'Value') ;                  
track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;                  
Segmentation_listbox=get(handles.Segmentation_listbox,'string')  ;                  
segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');                  
Segmentation_listbox=get(handles.Segmentation_listbox,'string')  ;                  
temp= read_image(handles,n,segmentation_type3,track_what3,Segmentation_listbox) ;  %segmentation_type=Raw (1)          
 
  lock_on=get(handles.lock_on,'value');                  
axes(handles.axes3);    cla              
  if segmentation_type3==3                  
 if handles.flag.bwlabel==0  
  imagesc( temp );                  
 end                  
  if handles.flag.bwlabel==1                  
        temp=bwlabel(temp,4);

        r=rand(1,max(max(temp)));                  
        [r1,r2]=sort(r);                  
        temp0=zeros(size(temp));                  
        for ii=1:max(max(temp))                  
        temp0(temp==ii)=r2(ii);                  
        end                  
        imagesc( temp0 );                  
  end                  
if handles.flag.bwlabel==2                  
temp0=bwlabel(temp);                  
imagesc( temp0 );                  
end                  
  else
     imagesc(temp);         
  end
 
%  axis   tight  ;                  
if lock_on==1                  
Raw_listbox=get(handles.Raw_listbox,'string')   ;                  
Filtered_listbox=get(handles.Filtered_listbox,'string')   ;                  
filename_Segmented=char(Segmentation_listbox(n))  ;                  
track_what1=get(handles.track_what1,'Value') ;                  
track_what2=get(handles.track_what2,'Value') ;                  
segmentation_type1=get(handles.segmentation_type1,'Value')  ;                  
segmentation_type2=get(handles.segmentation_type2,'Value')  ;  


filename_Segmentation=char(Filtered_listbox(n))  ;  
% Ind_t=strfind(filename_Segmentation,'_t');Ind_t=Ind_t(end); filename_Segmentation_ind=filename_Segmentation(Ind_t+2:end); 
% 
 
  iii=find(ismember(Raw_listbox,filename_Segmentation)) ;
  jjj=find(ismember(Filtered_listbox,filename_Segmentation)) ;
    
% 
% for iii=1:size( Raw_listbox,1)                  
% filename_Raw=char(Raw_listbox(iii)) ;  
%  Ind_t=strfind(filename_Raw,'_t');Ind_t=Ind_t(end); filename_Raw_ind=filename_Raw(Ind_t+2:end)  
% if  strcmp(filename_Raw_ind,filename_Segmentation_ind) ==1                  
% break                  
% end                  
% end        
% 
% 
% for jjj=1:size( Filtered_listbox,1)                  
% filename_Filtered=char(Filtered_listbox(jjj))    
%  Ind_t=strfind(filename_Filtered,'_t');Ind_t=Ind_t(end); filename_Filtered_ind=filename_Filtered(Ind_t+2:end)  
% if  strcmp(filename_Filtered_ind,filename_Segmentation_ind) ==1                  
% break                  
% end                  
% end 

  




% 
    if isempty(iii)~=1% if iii<(size(Raw_listbox,1)+1)  
        if max(size(iii))==1
temp2= read_image(handles,iii,segmentation_type1,track_what1,get(handles.Raw_listbox,'string') )  ;%segmentation_type=Raw (1)                  
axes(handles.axes1);cla                  
imagesc(temp2);                  
set(handles.Raw_listbox,'value',iii);   

try
    if get(handles.Show_contour,'value')==1 | get(handles.show_segment,'value')==1
        axes(handles.axes1)
        hold on  
        if get(handles.show_segment,'value')==1
            [b2,b1]=find(temp);
            global h_paint
            h_paint =line( b1,b2 ,'LineStyle','none','Marker','+'  ,  'Hittest','Off')  ;
        end 
        if get(handles.Show_contour,'value')==1 
            temp=bwdist(~temp); 
            if handles.flags.Contour==0
                [Y,X]=find(temp==1);
                line( X,Y ,'LineStyle','none','Marker','.'  ,'Color','y', 'MarkerSize',6, 'Hittest','Off')  ;
            else
                contour( temp,[0 0],'y','Hittest','Off')
            end
        end
    end
end
        end
    end    
    
    if isempty(jjj)~=1
        if max(size(jjj))==1
% if jjj<(size(Filtered_listbox,1)+1)                  
temp3= read_image(handles,jjj,segmentation_type2,track_what2,get(handles.Filtered_listbox,'string') )  ;%segmentation_type=Raw (1)                  
axes(handles.axes2);cla                  
 imagesc(temp3);                  
set(handles.Filtered_listbox,'value',jjj);                  
end                  
    end    
end
% axis   tight                  
%-------------------------------------------------------------------------                  
% END SECTION 2 - 	LIST BOXES                  
% START SECTION 3 - FILTERING                  
%_________________________________________________________________________                  
function apply_filters_Callback(hObject, eventdata, handles)                  
apply_filters_function(hObject, eventdata, handles,'Batch')                  
% -------------------------------------------------------------------------                  
% -------------------------                  
function apply_filters_function(hObject, eventdata, handles,Batch)                  
curent_index=[];                  
Projected_by_Value=get(handles.Projected_by,'Value')  ;                  
Projected_by_Str=get(handles.Projected_by,'String') ;                  
track_what1=get(handles.track_what1,'Value')  ;                  
track_what2=get(handles.track_what2,'Value')  ;                  
track_what3=get(handles.track_what3,'Value')  ;                  
n_Raw=round(get(handles.Raw_listbox,'value'));                  
n_Filtered=round(get(handles.Filtered_listbox,'value'));                  
box_Raw= get(handles.Raw_listbox,'String') ;                  
box_Filtered= get(handles.Filtered_listbox,'String') ;                  
pathname_Raw=handles.data_file(2).cdata(track_what1,1) ;                  
pathname_Filtered=handles.data_file(2).cdata(track_what2,2) ;                  
if iscell(box_Raw)==0                  
                  
h = errordlg('No files in Raw Frame listbox','Error');                  
return                  
end                  
set(handles.Segmenttion_panel,'Visible','on');                  
popup_apply_filters=get(handles.select_mode_filtered,'Value') ;                  
switch popup_apply_filters                  
case 1                  
h=waitbar(0.5,'Processing.... Please wait.');                  
set(h,'color','w');   

 
matrix(:,:,1)= read_image(handles,n_Raw,1,track_what1) ;   
try                  
matrix(:,:,2)= read_image(handles,n_Raw,2,2) ;                  
end       
try
 matrix(:,:,3)= read_image(handles,n_Raw,1,track_what1)    ;
end
 
 

matrix=filter_Frame(matrix,handles,pathname_Raw,box_Raw(n_Raw),track_what1);                  
if get(handles.Bits,'value')==1                 
matrix=uint8(matrix(:,:,1));                  
elseif get(handles.Bits,'value')==2               
matrix=uint16(matrix(:,:,1));                  
elseif get(handles.Bits,'value')==3                  
matrix=uint32(matrix(:,:,1));                  
end    

 



if get(handles.mask_option_on,'value')==1                  
mask_matrix= poly2mask(handles.data_file(11).cdata(:,1),handles.data_file(11).cdata(:,2),handles.data_file(6).cdata(4),handles.data_file(6).cdata(3))  ;                  
matrix(mask_matrix~=1)=min(min(matrix(:,:,1)));                  
end                  
%              matrix=matrix.*flipdim(matrix2,1);                  
axes(handles.axes2);cla                  
imagesc(matrix);                  
axis   tight  ;                  
close(h)                  
case 2                  
h=waitbar(0.5,'Filtering current Frame....')                  
set(h,'color','w');                  
matrix(:,:,1)= read_image(handles,n_Raw,1,track_what1) ;   
try                  
matrix(:,:,2)= read_image(handles,n_Raw,2,2) ;                  
end       
try
 matrix(:,:,3)= read_image(handles,n_Raw,1,track_what1) ;   
end
filename=box_Raw(n_Raw) ;  
matrix=filter_Frame(matrix,handles,pathname_Raw,filename,track_what1);  


 

 
if get(handles.mask_option_on,'value')==1                  
mask_matrix= poly2mask(handles.data_file(11).cdata(:,1),handles.data_file(11).cdata(:,2),handles.data_file(6).cdata(4),handles.data_file(6).cdata(3))  ;                  
matrix(mask_matrix~=1)=min(min( matrix(:,:,1)));                  
end                  
%filter the temp image as defined by filer_Frame function                  
%segmentation_type=Raw (1)                  
if get(handles.Bits,'value')==1          
temp=uint8(matrix(:,:,1));                  
elseif get(handles.Bits,'value')==2                 
temp =uint16(matrix(:,:,1));                  
elseif get(handles.Bits,'value')==3                
temp=uint32(matrix(:,:,1));                  
end     


 

                 
[full_filename,filename]=set_new_filename( filename,Projected_by_Str,Projected_by_Value,track_what2,track_what3,2, pathname_Filtered )                  
if get(handles.Bits,'value')==1                   
temp=uint8(temp);                  
elseif get(handles.Bits,'value')==2                 
temp=uint16(temp);                  
elseif get(handles.Bits,'value')==3                  
temp=uint32(temp);                  
end     

 



imwrite(temp, full_filename  );  %save file to hard drive      

 %%%%%%%%%%%%%%%          
% search for the tifs:
if ~strcmp(pathname_Filtered,'')%
    track_what2_Callback(hObject, eventdata, handles)
else
    box_Filtered= get(handles.Filtered_listbox,'String')
    box_Filtered=cellstr( box_Filtered) 
    if size(box_Filtered,1)==1
        if strcmp(char(box_Filtered{1}),'Filtered Frame')
            box_Filtered{1}=filename;
        else
            box_Filtered{end+1}=filename;
        end
    else
        box_Filtered{end+1}=filename;
    end
    set(handles.Filtered_listbox,'String', box_Filtered ) 
end
     %%%%%%%%%%%%%%%          
axes(handles.axes2); cla                  
imagesc(temp);     axis   tight  ;                  
a1=get(handles.F_popup_1,'Value');                  
a2=get(handles.F_popup_2,'Value');                  
a3=get(handles.F_popup_3,'Value');                  
a4=get(handles.F_popup_4,'Value');                  
a5=get(handles.F_popup_5,'Value');                  
a6=get(handles.F_Slider_1,'Value');                  
a7=get(handles.F_Slider_2,'Value');                  
a8=get(handles.F_Slider_3,'Value');                  
a9=get(handles.F_Slider_4,'Value');                  
a10=get(handles.F_Slider_5,'Value');                  
a11=get(handles.strel_type,'Value');                  
a12=get(handles.fspecial_type,'Value');                  
a13=str2double(get(handles.F_edit_1,'String'));                  
a14=str2double(get(handles.F_edit_2,'String'));                  
a15=str2double(get(handles.F_edit_3,'String'));                  
a16=str2double(get(handles.F_edit_4,'String'));                  
a17=str2double(get(handles.F_edit_5,'String'));                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(1)=a1 ;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(2)=a2;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(3)=a3;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(4)=a4;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(5)=a5;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(6)=a6;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(7)=a7;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(8)=a8;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(9)=a9;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(10)=a10;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(22)=a11;                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(1).vector(23)=a12;                  
if isnan(a13)~=1                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(2).vector(1)=a13; end                  
if isnan(a14)~=1                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(2).vector(2)=a14; end                  
if isnan(a15)~=1                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(2).vector(3)=a15; end                  
if isnan(a16)~=1                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(2).vector(4)=a16; end                  
if isnan(a17)~=1                  
handles.data_file(8).cdata(track_what2).Frame(n_Raw).DATA(2).vector(5)=a17; end                  
guidata(hObject,handles);                  
close(h)                  
case 3                  
box_Filtered= cellstr('1');                  
if strcmp(Batch,'Batch')==1  || strcmp(Batch,'Batch_robust')==1                 
h=waitbar(0,'Filtering all Frames....');                  
set(h,'color','w');                  
start_filter_at=str2double(get(handles.start_filter_at,'String'));                  
end_filter_at=str2double(get(handles.end_filter_at,'String'));                  
set(handles.Raw_listbox,'value', start_filter_at);                  
if floor((end_filter_at-start_filter_at)/2) <1                  
h = msgbox('Minimal files for Batch is 2','Aborted');                  
return                  
end 


for ii=1:floor((end_filter_at-start_filter_at)/2) ;  %e,.x 80/2=8                  
for jj=1:2                  
curent_index=(ii-1)*2+jj + start_filter_at-1 ;                  
temp_stack1(jj).cdata=read_image(handles,curent_index,1,track_what1) ; %segmentation_type=Raw (1)                  
temp_stack2(jj).cdata=read_image(handles,curent_index,2,2) ; %segmentation_type=Raw (1)          


end                  
for jj=1:2                  
waitbar((curent_index/(floor((end_filter_at-start_filter_at)/2)))/2)                  
curent_index=(ii-1)*2+jj+start_filter_at -1 ;                  
set(handles.Raw_listbox,'value', curent_index);                  
filename=box_Raw(curent_index)  ;                  
     


               


matrix(:,:,1)=temp_stack1(jj).cdata;       
try                  
matrix(:,:,2)=temp_stack2(jj).cdata;                  
end       
try
 matrix(:,:,3)=temp_stack1(jj).cdata;       
end     

temp_matrix =filter_Frame(matrix,handles,pathname_Raw,filename,track_what1); %filter the temp image as defined by filer_Frame function                  
if get(handles.mask_option_on,'value')==1                  
mask_matrix= poly2mask(handles.data_file(11).cdata(:,1),handles.data_file(11).cdata(:,2),handles.data_file(6).cdata(4),handles.data_file(6).cdata(3))  ;                  
temp_matrix(mask_matrix~=1)=min(min(temp_matrix(:,:,1)));                  
end                  
if get(handles.Bits,'value')==1               
temp_matrix=uint8( temp_matrix(:,:,1));                  
elseif get(handles.Bits,'value')==2                  
temp_matrix=uint16( temp_matrix(:,:,1));                  
elseif get(handles.Bits,'value')==3                  
temp_matrix=uint32( temp_matrix(:,:,1));                  
end                  
filename=box_Raw(curent_index) ;                  
[full_filename,filename]=set_new_filename( filename,Projected_by_Str,Projected_by_Value,track_what2,track_what3,2, pathname_Filtered )                  
box_Filtered((ii-1)*2+jj)=cellstr(char(filename)) ;                  
imwrite( temp_matrix, full_filename);  %save file to hard drive                  
pause(0.1) %give the computer time to cool itself a bit                  
end                  
end                  
%                  
curent_index= curent_index+1;                  
while  end_filter_at-curent_index+1~=0    
    
matrix(:,:,1)=read_image(handles,curent_index,1,track_what1) ;   
try
matrix(:,:,2)=read_image(handles,curent_index,2,2) ;  
end       
matrix(:,:,3)= matrix(:,:,1);   
filename=box_Raw(curent_index) ;     
matrix=filter_Frame( matrix ,handles,pathname_Raw,filename,track_what1);                  
  

      

if get(handles.mask_option_on,'value')==1                  
mask_matrix= poly2mask(handles.data_file(11).cdata(:,1),handles.data_file(11).cdata(:,2),handles.data_file(6).cdata(4),handles.data_file(6).cdata(3))  ;                  
matrix(mask_matrix~=1)=min(min(matrix(:,:,1)));                  
end                  
if get(handles.Bits,'value')==1                    
temp_matrix=uint8(  matrix(:,:,1));                  
elseif get(handles.Bits,'value')==2                   
temp_matrix=uint16( matrix(:,:,1));                  
elseif get(handles.Bits,'value')==3                    
temp_matrix=uint32(  matrix(:,:,1));                  
end                  
              
[full_filename,filename]=set_new_filename( filename,Projected_by_Str,Projected_by_Value,track_what2,track_what3,2, pathname_Filtered );                  
waitbar((curent_index/floor((end_filter_at-start_filter_at)/2))/2)                  
box_Filtered(end+1)=cellstr(filename) ;                  
imwrite( temp_matrix, full_filename);  %save file to hard drive                  
set(handles.Raw_listbox,'value', curent_index);                  
curent_index=curent_index+1 ;                  
pause(0.1)                  
end                  
close(h)    

 if strcmp(Batch,'Batch')==1 


h=timebar_BACWrapper('Calculating....');                  
set(h,'color','w');                  
a1=get(handles.F_popup_1,'Value');                  
a2=get(handles.F_popup_2,'Value');                  
a3=get(handles.F_popup_3,'Value');                  
a4=get(handles.F_popup_4,'Value');                  
a5=get(handles.F_popup_5,'Value');                  
a6=get(handles.F_Slider_1,'Value');                  
a7=get(handles.F_Slider_2,'Value');                  
a8=get(handles.F_Slider_3,'Value');                  
a9=get(handles.F_Slider_4,'Value');                  
a10=get(handles.F_Slider_5,'Value');                  
a11=get(handles.strel_type,'Value');                  
a12=get(handles.fspecial_type,'Value');                  
a13=str2double(get(handles.F_edit_1,'String'));                  
a14=str2double(get(handles.F_edit_2,'String'));                  
a15=str2double(get(handles.F_edit_3,'String'));                  
a16=str2double(get(handles.F_edit_4,'String'));                  
a17=str2double(get(handles.F_edit_5,'String'));                  
for ii=start_filter_at:end_filter_at                  
timebar_BACWrapper(h,start_filter_at/end_filter_at)                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(1)=a1 ;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(2)=a2;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(3)=a3;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(4)=a4;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(5)=a5;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(6)=a6;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(7)=a7;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(8)=a8;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(9)=a9;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(10)=a10;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(22)=a11;                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(1).vector(23)=a12;                  
if isnan(a13)~=1                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(2).vector(1)=a13; end                  
if isnan(a14)~=1                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(2).vector(2)=a14; end                  
if isnan(a15)~=1                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(2).vector(3)=a15; end                  
if isnan(a16)~=1                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(2).vector(4)=a16; end                  
if isnan(a17)~=1                  
handles.data_file(8).cdata(track_what2).Frame(ii).DATA(2).vector(5)=a17; end                  
end                  
guidata(hObject,handles);                  
close(h) 
 end
end                  
track_what2_Callback(hObject, eventdata, handles)                  
end                  
% --------------------------------------------------------------------                  
% END SECTION 3 - FILTERING                  
% START SECTION 4 - segmenting                  
%_________________________________________________________________________                  
function apply_segmentation_Callback(hObject, eventdata, handles)                  
apply_segmentation_function(hObject, eventdata, handles,'Batch')                  
% -------------------------------------------------------------------------                  
function apply_segmentation_function(hObject, eventdata, handles,Batch)    
    
   segmentation_type1=get(handles.segmentation_type1,'Value');
    
    curent_index=[];
    Projected_by_Value=get(handles.Projected_by,'Value') ;
    Projected_by_Str=get(handles.Projected_by,'String')  ;
    track_what1=get(handles.track_what1,'Value')  ;
    track_what2=get(handles.track_what2,'Value')  ;
    track_what3=get(handles.track_what3,'Value')  ;
    popup_select_mode_segmentation=get(handles.select_mode_segmentation,'Value') ;
    set(handles.Segmentation_panel,'Visible','on');
    % n_Raw=round(get(handles.Raw_listbox,'value'));
    n_Filtered=round(get(handles.Filtered_listbox,'value'));
    % n_Segmented=round(get(handles.Segmentation_listbox,'value'));
    box_Raw= get(handles.Raw_listbox,'String') ;
    box_Filtered= get(handles.Filtered_listbox,'String') ;
    box_Segmented= get(handles.Segmentation_listbox,'String') ;
    if iscell(box_Segmented)~=1
        box_Segmented=cell(1,1);
    end
    pathname_Raw=handles.data_file(2).cdata(track_what1,1) ;
    pathname_Filtered=handles.data_file(2).cdata(track_what2,2) ;
    pathname_Segmented=handles.data_file(2).cdata(track_what3,3) ;
    switch popup_select_mode_segmentation
        case 1
            if iscell(box_Filtered)==0
       
                h = errordlg('No files in Filtered Frame listbox','Error');
                return
            end
            h=waitbar(0.5,'Segmenting current Frame....');
            set(h,'color','w');
            str_takeoff= char(strcat('_ch0',num2str(track_what2-1),'_Filtered.tif'))  ;
            Raw_filename= regexprep(char(box_Filtered(n_Filtered))  ,str_takeoff, '')
            temp_Filtered= read_image(handles,n_Filtered,2,track_what2)  ;
            if get(handles.Auto_thresh_on,'value')==1
                thresh_level = graythresh(temp_Filtered);
                thresh_level =thresh_level -thresh_level* 0.5 ; %
                set(handles.T_Slider_1,'value', thresh_level );
                set(handles.T_edit_1 ,'string', num2str(thresh_level ));
                temp_Segmented=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp_Filtered,handles, thresh_level); %Segmented the temp image as defined by filer_Frame function
            else
                temp_Segmented=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp_Filtered,handles ); %Segmented the temp image as defined by filer_Frame function
            end
             
            close(h)
            axes(handles.axes3); cla
            if handles.flag.bwlabel==0
                imagesc (temp_Segmented );
            end
            if handles.flag.bwlabel==1
                temp_Segmented2=bwlabel(temp_Segmented);
                r=rand(1,max(max(temp_Segmented2)));
                [r1,r2]=sort(r);
                temp_Segmented0=zeros(size(temp_Segmented));
                for ii=1:max(max(temp_Segmented2))
                    temp_Segmented0(temp_Segmented==ii)=r2(ii);
                end
                imagesc (temp_Segmented0 );
            end
            if handles.flag.bwlabel==2
                temp_Segmented0=bwlabel(temp_Segmented);
                imagesc( temp_Segmented0) ;
            end
            % axis   tight
            


%     
% try
    if get(handles.Show_contour,'value')==1 | get(handles.show_segment,'value')==1
                    Raw_listbox=get(handles.Raw_listbox,'string') ;
            iii=find(ismember(Raw_listbox,Raw_filename)) ;
            if isempty(iii)~=1
                temp_raw= read_image(handles,iii,segmentation_type1,track_what1,get(handles.Raw_listbox,'string') )  ;%segmentation_type=Raw (1)
                axes(handles.axes1);cla
                imagesc(temp_raw);
                set(handles.Raw_listbox,'value',iii);
            end
            
 
        hold on  
        if get(handles.show_segment,'value')==1
            [b2,b1]=find(temp_Segmented);
            global h_paint
            h_paint =line( b1,b2 ,'LineStyle','none','Marker','+'  ,  'Hittest','Off')  ;
        end 
        if get(handles.Show_contour,'value')==1 
            temp_Segmented=bwdist(~temp_Segmented); 
            if handles.flags.Contour==0
                [Y,X]=find(temp_Segmented==1);
                line( X,Y ,'LineStyle','none','Marker','.'  ,'Color','y', 'MarkerSize',6, 'Hittest','Off')  ;
            else
                contour( temp_Segmented,[0 0],'y','Hittest','Off')
            end
        end
    end
% end
            
            
            
            
            
            
        case 2
            if iscell(box_Filtered)==0
                
                h = errordlg('No files in Filtered Frame listbox','Error');
                return
            end
            h=waitbar(0,'segmenting all Frames....');
            set(h,'color','w');
            temp_Filtered= read_image(handles,n_Filtered,2,track_what2) ;  %segmentation_type=Raw (1)
            str_takeoff= char(strcat('_ch0',num2str(track_what2-1),'_Filtered.tif'))  ;
            Raw_filename= regexprep(char(box_Filtered(n_Filtered))  ,str_takeoff, '')
            if get(handles.Auto_thresh_on,'value')==1
                thresh_level = graythresh(temp_Filtered);
                thresh_level =thresh_level -thresh_level* 0.5 ; %
                set(handles.T_Slider_1,'value', thresh_level );
                set(handles.T_edit_1 ,'string', num2str(thresh_level ));
                a6=thresh_level;
                a13=thresh_level;
                temp_Segmented=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp_Filtered,handles, thresh_level); %Segmented the temp image as defined by filer_Frame function
            else
                temp_Segmented=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp_Filtered,handles ); %Segmented the temp image as defined by filer_Frame function
                a6=get(handles.T_Slider_1,'Value');
                a13=str2double(get(handles.T_edit_1,'String')) ;
            end
            %         value 1 helps for segmentation inthe range, then remove it
            % temp_Segmented(1)=0;
            
            % figure(1)
            % imagesc(temp_Segmented)
            %
            % pause
            % temp_Segmented(temp_Segmented==1)=255;
            a1=get(handles.T_popup_2,'Value') ;
            a2=get(handles.T_popup_3,'Value') ;
            a3=get(handles.T_popup_4,'Value')  ;
            a4=get(handles.T_popup_5,'Value') ;
            a5=get(handles.T_popup_6,'Value');
            %   a6=get(handles.T_Slider_1,'Value');
            a7=get(handles.T_Slider_2,'Value');
            a8=get(handles.T_Slider_3,'Value');
            a9=get(handles.T_Slider_4,'Value');
            a10=get(handles.T_Slider_5,'Value');
            a11=get(handles.T_Slider_6,'Value');
            a12=get(handles.bwmorph_type,'Value');
            %    a13=str2double(get(handles.T_edit_1,'String')) ;
            a14=str2double(get(handles.T_edit_2,'String'));
            a15=str2double(get(handles.T_edit_3,'String'));
            a16=str2double(get(handles.T_edit_4,'String'));
            a17=str2double(get(handles.T_edit_5,'String'));
            a18=str2double(get(handles.T_edit_6,'String'))
            %               temp_Segmented=flipdim(temp_Segmented,1);
            close(h)
            axes(handles.axes3);
            cla
            
            
            if handles.flag.bwlabel==0
                imagesc(temp_Segmented);
            end
            if handles.flag.bwlabel==1
                temp_Segmented=bwlabel(temp_Segmented);
                r=rand(1,max(max(temp_Segmented)));
                [r1,r2]=sort(r);
                temp_Segmented0=zeros(size(temp_Segmented));
                for ii=1:max(max(temp_Segmented))
                    temp_Segmented0(temp_Segmented==ii)=r2(ii);
                end
                imagesc( temp_Segmented0 );
            end
            if handles.flag.bwlabel==2
                temp_Segmented0=bwlabel(temp_Segmented);
                imagesc( temp_Segmented0 );
            end
            
            
            
            
            % axis   tight  ;
            filename_Filtered=box_Filtered(n_Filtered) ;
            [full_filename_Segmented,filename_Segmented]=set_new_filename(  filename_Filtered,Projected_by_Str,Projected_by_Value,track_what2,track_what3,3, pathname_Segmented );
            
            imwrite(logical(temp_Segmented), full_filename_Segmented);  %save file to hard drive
            for iii=1:size( box_Raw,1)
                filename_Raw=box_Raw(iii);
                if  isempty(strfind(char(filename_Segmented),char(filename_Raw)))~=1
                    break
                end
            end
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(11)=a1  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(12)=a2  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(13)=a3  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(14)=a4  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(15)=a5  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(16)=a6  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(17)=a7  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(18)=a8  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(19)=a9  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(20)=a10  ;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(21)=a11;
            handles.data_file(8).cdata(track_what3).Frame(iii).DATA(1).vector(24)=a12  ;
            if isnan(a13)~=1
                handles.data_file(8).cdata(track_what3).Frame(iii).DATA(2).vector(6)=a13  ;  end
            if isnan(a14)~=1
                handles.data_file(8).cdata(track_what3).Frame(iii).DATA(2).vector(7)=a14  ;  end
            if isnan(a15)~=1
                handles.data_file(8).cdata(track_what3).Frame(iii).DATA(2).vector(8)=a15  ;  end
            if isnan(a16)~=1
                handles.data_file(8).cdata(track_what3).Frame(iii).DATA(2).vector(9)=a16  ;  end
            if isnan(a17)~=1
                handles.data_file(8).cdata(track_what3).Frame(iii).DATA(2).vector(10)=a17  ;  end
            if isnan(a18)~=1
                handles.data_file(8).cdata(track_what3).Frame(iii).DATA(2).vector(11)=a18   ; end
            guidata(hObject,handles);
            %%%%%%%%%%%%%%%          
% search for the tifs:
if ~strcmp(pathname_Filtered,'')%
     create_Segmentation_listbox(handles)
else
    box_Segmented= get(handles.Segmentation_listbox,'String')
    box_Segmented=cellstr( box_Segmented) 
    if size(box_Segmented,1)==1
        if strcmp(char(box_Segmented{1}),'Segmented Frame')
            box_Segmented{1}=filename_Segmented;
        else
            box_Segmented{end+1}=filename_Segmented;
        end
    else
        box_Segmented{end+1}=filename_Segmented;
    end
    set(handles.Segmentation_listbox,'String', box_Segmented) 
end
     %%%%%%%%%%%%%%%
    
            
        case 3
            
            start_segmentation_at=str2double(get(handles.start_segmentation_at,'String'));
            end_segmentation=str2double(get(handles.end_segmentation_at,'String'));
            set(handles.Filtered_listbox,'value', start_segmentation_at);
            h=waitbar(0,'segmenting all Frames....');
            set(h,'color','w');
            %      guidata(hObject,handles);
            for ii=1:start_segmentation_at:end_segmentation
                
                
                
                Raw_filename=char(box_Raw(ii))
                waitbar(ii/end_segmentation)
                set(handles.Filtered_listbox,'value', ii);
                temp_Filtered = read_image(handles,ii,2,track_what2)  ; %segmentation_type=Raw (1)
                
                
                
                if get(handles.Auto_thresh_on,'value')==1
                    thresh_level = graythresh(temp_Filtered); 
                    set(handles.T_Slider_1,'value', thresh_level );
                    set(handles.T_edit_1 ,'string', num2str(thresh_level ));
                    temp_matrix=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp_Filtered,handles, thresh_level); %Segmented the temp image as defined by filer_Frame function
                else
                    temp_matrix=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp_Filtered,handles ); %Segmented the temp image as defined by filer_Frame function
                end
                
               
                
                
                filename_Filtered=box_Filtered( ii) ;
                [full_filename_Segmented,~]=set_new_filename(  filename_Filtered,Projected_by_Str,Projected_by_Value,track_what2,track_what3,3, pathname_Segmented );
                imwrite(logical(temp_matrix), full_filename_Segmented);  %save file to hard drive
            end
            close(h)
            
             
            track_what3_Callback(hObject, eventdata, handles)
           
            Segmentation_listbox_Callback(hObject, eventdata, handles)
            guidata(hObject,handles); 
            

    end
 
%---------------------------------------------------------                  
%---------------------------------------------------------                  
function segment_Frame_Callback(hObject, eventdata, handles)                  
track_what1=get(handles.track_what1,'Value') ;                  
track_what2=get(handles.track_what2,'Value') ;                  
pathname_Filtered=handles.data_file(2).cdata(track_what2,2) ;                  
box_Filtered=get(handles.Filtered_listbox,'string') ;                  
if iscell(box_Filtered)==0                  
                 
h = errordlg('No files in Filtered Frame listbox','Error');                  
return                  
end                  
n_Filtered=round(get(handles.Filtered_listbox,'value'));                  
filename=box_Filtered(n_Filtered) ;                  
filename= char(strcat(pathname_Filtered,filename)) ;                  
temp=imread_cross(filename);                  
temp=segment_Frame(pathname_Raw,Raw_filename,track_what1,temp,handles ); %Segmented the temp image as defined by segment_Frame function                  
axes(handles.axes3);                  
imagesc(temp)                  
axis   tight  ;                  
%   ---------------------------------------------------------------------                  
% END SECTION 4 - segmenting                  
% START SECTION 5 - callback FUNCTIONS                  
%_________________________________________________________________________                  
function select_mode_filtered_Callback(hObject, eventdata, handles)                  
select_mode_filtered=get(handles.select_mode_filtered,'Value');                  
switch select_mode_filtered                  
case 1                  
set(handles.start_filter_at,'Visible','off')                  
set(handles.end_filter_at,'Visible','off')                  
case 2                  
set(handles.start_filter_at,'Visible','off')                  
set(handles.end_filter_at,'Visible','off')                  
case 3                  
listbox=get(handles.Raw_listbox,'string')  ;                  
n=get(handles.Raw_listbox,'Value') ;                  
if isempty(n)==1                  
n=1;                  
end                  
if isempty(listbox)==1                  
box=1;                  
end                  
set(handles.start_filter_at,'String',num2str(n));                  
set(handles.end_filter_at,'String',num2str(size(listbox,1)));                  
set(handles.start_filter_at,'Visible','on');                  
set(handles.end_filter_at,'Visible','on');                  
end                  
%     -----------------------------------------------------------------------------------                  
function select_mode_segmentation_Callback(hObject, eventdata, handles)                  
select_mode_segmentation=get(handles.select_mode_segmentation,'Value');                  
if select_mode_segmentation==3                  
listbox=get(handles.Filtered_listbox,'string')  ;                  
n=get(handles.Filtered_listbox,'Value') ;                  
if isempty(n)==1                  
n=1;                  
end                  
if isempty(  listbox)==1                  
box=1;                  
end                  
set(handles.start_segmentation_at,'String',num2str(n));                  
set(handles.end_segmentation_at,'String',num2str(size(listbox,1)));                  
set(handles.start_segmentation_at,'Visible','on');                  
set(handles.end_segmentation_at,'Visible','on');                  
else                  
set(handles.start_segmentation_at,'Visible','off')                  
set(handles.end_segmentation_at,'Visible','off')                  
end                  
%     ---------------------------------------------------------------------                  
function temp_dir_Raw_CreateFcn(hObject, eventdata, handles)                  
function showcurrentframe_Callback(hObject, eventdata, handles)                  
function showcurrentframe_CreateFcn(hObject, eventdata, handles)                  
function Choose_the_axes_CreateFcn(hObject, eventdata, handles)                  
function pushbutton5_Callback(hObject, eventdata, handles)                  
function pushbutton6_Callback(hObject, eventdata, handles)                  
function pushbutton7_Callback(hObject, eventdata, handles)                  
function pushbutton8_Callback(hObject, eventdata, handles)                  
function pushbutton9_Callback(hObject, eventdata, handles)                  
function pushbutton10_Callback(hObject, eventdata, handles)                  
function pushbutton11_Callback(hObject, eventdata, handles)                  
function pushbutton12_Callback(hObject, eventdata, handles)                  
function pushbutton13_Callback(hObject, eventdata, handles)                  
function pushbutton15_Callback(hObject, eventdata, handles)                  
function pushbutton16_Callback(hObject, eventdata, handles)                  
function pushbutton17_Callback(hObject, eventdata, handles)                  
function pushbutton18_Callback(hObject, eventdata, handles)                  
function pushbutton19_Callback(hObject, eventdata, handles)                  
function size_wiener_CreateFcn(hObject, eventdata, handles)                  
function size_top_hat_Callback(hObject, eventdata, handles)                  
function size_top_hat_CreateFcn(hObject, eventdata, handles)                  
function pushbutton3_Callback(hObject, eventdata, handles)                  
function pushbutton4_Callback(hObject, eventdata, handles)                  
function strel_type_CreateFcn(hObject, eventdata, handles)                  
function select_mode_filtered_CreateFcn(hObject, eventdata, handles)                  
function slider1_Callback(hObject, eventdata, handles)                  
function pushbutton1_Callback(hObject, eventdata, handles)                  
function size_to_exclude_Callback(hObject, eventdata, handles)                  
function size_to_exclude_CreateFcn(hObject, eventdata, handles)                  
function Filtered_listbox_CreateFcn(hObject, eventdata, handles)                  
function Raw_listbox_CreateFcn(hObject, eventdata, handles)                  
function Segmentation_listbox_CreateFcn(hObject, eventdata, handles)                  
function edit_axes1_CreateFcn(hObject, eventdata, handles)                  
function edit_axes2_CreateFcn(hObject, eventdata, handles)                  
function edit_axes3_CreateFcn(hObject, eventdata, handles)                  
function wiener_on_Callback(hObject, eventdata, handles)                  
function top_hat_on_Callback(hObject, eventdata, handles)                  
function select_mode_segmentation_CreateFcn(hObject, eventdata, handles)                  
function segment_Frame_CreateFcn(hObject, eventdata, handles)                  
function edge_enhancement_on_Callback(hObject, eventdata, handles)                  
function imclearborder_on_Callback(hObject, eventdata, handles)                  
function imdilate_imrode_on_Callback(hObject, eventdata, handles)                  
function bwareaopen_on_Callback(hObject, eventdata, handles)                  
function imclose_on_Callback(hObject, eventdata, handles)                  
function size_imdilate_imrode_Callback(hObject, eventdata, handles)                  
function size_imdilate_imrode_CreateFcn(hObject, eventdata, handles)                  
function Untitled_1_Callback(hObject, eventdata, handles)  
    
%        z=get(handles.Filtered_listbox,'string')
%     save z z
%         z=get(handles.Filtered_listbox,'max')
%           z=get(handles.Filtered_listbox,'value')
%           
%           
%     xlim =[  796.9188  925.5251]
% ylim =[  687.9461  784.4008]
%   
%      set(handles.axes1,'xlim',xlim)
%     set(handles.axes1,'ylim',ylim)
%     set(handles.axes2,'xlim',xlim)
%     set(handles.axes2,'ylim',ylim)
%        set(handles.axes3,'xlim',xlim)
%     set(handles.axes3,'ylim',ylim)
%     
    
%     close(BAC_Segmentation_Module)
function segmentation_fluoro_CreateFcn(hObject, eventdata, handles)                  
function track_what1_CreateFcn(hObject, eventdata, handles)                  
function axes3_CreateFcn(hObject, eventdata, handles)                  
function axes3_ButtonDownFcn(hObject, eventdata, handles)                  
function fspecial_type_Callback(hObject, eventdata, handles)                  
function fspecial_type_CreateFcn(hObject, eventdata, handles)                  
function apply_segmentation_CreateFcn(hObject, eventdata, handles)                  
function bwmorph_type_CreateFcn(hObject, eventdata, handles)                  
function axes1_CreateFcn(hObject, eventdata, handles)                  
function axes2_CreateFcn(hObject, eventdata, handles)                  
function strel_type_Callback(hObject, eventdata, handles)                  
function F_popup_1_CreateFcn(hObject, eventdata, handles)                  
function F_popup_2_CreateFcn(hObject, eventdata, handles)                  
function F_popup_3_CreateFcn(hObject, eventdata, handles)                  
function F_popup_4_CreateFcn(hObject, eventdata, handles)                  
function F_popup_5_CreateFcn(hObject, eventdata, handles)                  
function F_Slider_1_CreateFcn(hObject, eventdata, handles)                  
function F_Slider_2_CreateFcn(hObject, eventdata, handles)                  
function F_Slider_3_CreateFcn(hObject, eventdata, handles)                  
function F_Slider_4_CreateFcn(hObject, eventdata, handles)                  
function F_Slider_5_CreateFcn(hObject, eventdata, handles)                  
function T_popup_1_CreateFcn(hObject, eventdata, handles)                  
function T_popup_2_CreateFcn(hObject, eventdata, handles)                  
function T_popup_3_CreateFcn(hObject, eventdata, handles)                  
function T_popup_4_CreateFcn(hObject, eventdata, handles)                  
function T_popup_5_CreateFcn(hObject, eventdata, handles)                  
function T_popup_6_CreateFcn(hObject, eventdata, handles)                  
function T_Slider_1_CreateFcn(hObject, eventdata, handles)                  
function T_Slider_2_CreateFcn(hObject, eventdata, handles)                  
function T_Slider_3_CreateFcn(hObject, eventdata, handles)                  
function T_Slider_4_CreateFcn(hObject, eventdata, handles)                  
function T_Slider_5_CreateFcn(hObject, eventdata, handles)                  
function T_Slider_6_CreateFcn(hObject, eventdata, handles)                  
function F_edit_1_CreateFcn(hObject, eventdata, handles)                  
function F_edit_2_CreateFcn(hObject, eventdata, handles)                  
function F_edit_3_CreateFcn(hObject, eventdata, handles)                  
function F_edit_4_CreateFcn(hObject, eventdata, handles)                  
function F_edit_5_CreateFcn(hObject, eventdata, handles)                  
function T_edit_1_CreateFcn(hObject, eventdata, handles)                  
function T_edit_2_CreateFcn(hObject, eventdata, handles)                  
function T_edit_3_CreateFcn(hObject, eventdata, handles)                  
function T_edit_4_CreateFcn(hObject, eventdata, handles)                  
function T_edit_5_CreateFcn(hObject, eventdata, handles)                  
function T_edit_6_CreateFcn(hObject, eventdata, handles)                  
function bwmorph_type_Callback(hObject, eventdata, handles)                  
function start_filter_at_CreateFcn(hObject, eventdata, handles)                  
function end_filter_at_CreateFcn(hObject, eventdata, handles)                  
function start_segmentation_at_CreateFcn(hObject, eventdata, handles)                  
function end_filter_at_ButtonDownFcn(hObject, eventdata, handles)                  
function end_filter_at_KeyPressFcn(hObject, eventdata, handles)                  
function end_segmentation_at_CreateFcn(hObject, eventdata, handles)                  
function start_export_Callback(hObject, eventdata, handles)                  
function start_export_CreateFcn(hObject, eventdata, handles)                  
function end_export_Callback(hObject, eventdata, handles)                  
function end_export_CreateFcn(hObject, eventdata, handles)                  
function Projected_by_CreateFcn(hObject, eventdata, handles)                  
function lock_on_Callback(hObject, eventdata, handles)       
    
    axes(handles.axes1);axis tight;
        axes(handles.axes2);axis tight;
            axes(handles.axes3);axis tight;
    if get(handles.lock_on,'value')==1                  
set(handles.lock_on,'string','UnLock listboxes')                  
else                  
set(handles.lock_on,'string','Lock listboxes')                  
end                  
function Auto_thresh_on_Callback(hObject, eventdata, handles)                  
function edit60_CreateFcn(hObject, eventdata, handles)                  
function T_edit_1_Callback(hObject, eventdata, handles)                  
function T_edit_2_Callback(hObject, eventdata, handles)                  
function T_edit_3_Callback(hObject, eventdata, handles)                  
function T_edit_4_Callback(hObject, eventdata, handles)                  
function T_edit_5_Callback(hObject, eventdata, handles)                  
function T_edit_6_Callback(hObject, eventdata, handles)                  
function F_edit_1_Callback(hObject, eventdata, handles)                  
function F_edit_2_Callback(hObject, eventdata, handles)                  
function F_edit_3_Callback(hObject, eventdata, handles)                  
function F_edit_4_Callback(hObject, eventdata, handles)                  
function F_edit_5_Callback(hObject, eventdata, handles)                  
function track_what2_CreateFcn(hObject, eventdata, handles)                  
function alpha_slider_CreateFcn(hObject, eventdata, handles)                  
function alpha_Callback(hObject, eventdata, handles)                  
function alpha_CreateFcn(hObject, eventdata, handles)                  
function beta_slider_CreateFcn(hObject, eventdata, handles)                  
function beta_Callback(hObject, eventdata, handles)                  
function beta_CreateFcn(hObject, eventdata, handles)                  
function track_what3_CreateFcn(hObject, eventdata, handles)                  
function figure1_ResizeFcn(hObject, eventdata, handles)                  
% -------------------------------------------------------------------------                  
function F_popup_1_Callback(hObject, eventdata, handles)                  
F_popup_function(1,handles);                  
function F_popup_2_Callback(hObject, eventdata, handles)                  
F_popup_function(2,handles);                  
function F_popup_3_Callback(hObject, eventdata, handles)                  
F_popup_function(3,handles);                  
function F_popup_4_Callback(hObject, eventdata, handles)                  
F_popup_function(4,handles);                  
function F_popup_5_Callback(hObject, eventdata, handles)                  
F_popup_function(5,handles);                  
function T_popup_1_Callback(hObject, eventdata, handles)                  
T_popup_function(1,handles);                  
function T_popup_2_Callback(hObject, eventdata, handles)                  
T_popup_function(2,handles);                  
function T_popup_3_Callback(hObject, eventdata, handles)                  
T_popup_function(3,handles);                  
function T_popup_4_Callback(hObject, eventdata, handles)                  
T_popup_function(4,handles);                  
function T_popup_5_Callback(hObject, eventdata, handles)                  
T_popup_function(5,handles);                  
function T_popup_6_Callback(hObject, eventdata, handles)                  
T_popup_function(6,handles);                  
% END SECTION 5 - MAIN FUNCTIONS                  
% ________________________________________________________________________                  
% START SECTION 6 - In House Functions                  
function[status]=flag_control(handles)                  
if handles.flags.imagey==0                  
               
h = errordlg('You need to read the Tif file','Error');                  
status=1;                  
                   
else                  
status=0;                  
end                  
%----------------------------------------------------------------                  
function[status]=flag_file(handles)                  
Frame_box=get(handles.Filtered_listbox,'string'); %Get tif file list                  
if isempty(Frame_box)==1                  
               
h = errordlg('No file to read. You have to load *.Tif file ','Error');                  
status=1;                  
                  
else                  
status=0;                  
end                  
%----------------------------------------------------------------                  
function [status]=flag_roi(handles)                  
if    handles.flags.roi==0                  
              
h = errordlg('You have to choose the ROI','Error');                  
status=1;                  
                   
else                  
status=0;                  
end                  
%----------------------------------------------------------------                  
function[status]=flag_ma(handles)                  
if    handles.flags.ma==0                  
                
h = errordlg('You have to run Moving Average','Error');                  
status=1;                  
                   
else                  
status=0;                  
end                  
%---------------------------------------------------------------                  
function [status]=flag_tif_list(handles)                  
if    handles.flags.tif_list==0                  
                 
h = errordlg('You have to load tif files list first','Error');                  
status=1;                  
 ;                  
else                  
status=0;                  
end                  
%---------------------------------------------------------------                  
function [status]=flag_imagey(handles)                  
if    handles.flags.imagey==0                  
                  
h = errordlg('Read tif file first ','Error');                  
status=1;                  
                  
else                  
status=0;                  
end                  
%_______________________________________________________________________                  
% END SECTION 6 - In House Function                  
                
                 
% --------------------------------------------------------------------                  
function Untitled_6_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function Untitled_7_Callback(hObject, eventdata, handles)                  
handles.data_file=Experiment_Generator;                  
% --------------------------------------------------------------------                  
function Save_Experiment_Callback(hObject, eventdata, handles)                  
Current_Exp=get(handles.Current_Exp,'String')                   
if isempty(Current_Exp)==1
[filename, pathname, filterindex] = uiputfile({'BacFormatics_EXP_*.dat','Dat-files (*.dat)';}, 'save  session to a data file');               
else  
[filename, pathname, filterindex] = uiputfile({'BacFormatics_EXP_*.dat','Dat-files (*.dat)';}, 'save  session to a data file',Current_Exp); 
end
 
                  
if isequal(filename,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
filename=regexprep(filename, 'BacFormatics_EXP_','');                  
full_filename= strcat(pathname,'BacFormatics_EXP_',filename) ;                  
full_filename=char(full_filename);                  
set(handles.Current_Exp,'String',full_filename);                  
Raw_listbox=get(handles.Raw_listbox,'String')                  
if iscell(Raw_listbox)~=0                  
handles.data_file(1).cdata=cell(length(Raw_listbox),1) ;                  
handles.data_file(1).cdata(:,1)=Raw_listbox;                  
end                  
handles.data_file(10).cdata=full_filename ;                  
guidata(hObject, handles);                  
temp=handles.data_file;                  
save(full_filename ,  'temp')        
msgbox('File was saved')
% --------------------------------------------------------------------                  
function Load_Experiment_Callback(hObject, eventdata, handles)                  
    
Current_Exp=get(handles.Current_Exp,'String')                   
if isempty(Current_Exp)==1
  [filename, pathname, filterindex] = uigetfile({'BacFormatics_EXP_*.dat','dat-files (*.dat)';}, 'Please Choose experiment DATA file')% handles.directory_name); %pick files to combine                  
else   
[filename, pathname, filterindex] = uigetfile({'BacFormatics_EXP_*.dat','dat-files (*.dat)';}, 'Please Choose experiment DATA file',Current_Exp)% handles.directory_name); %pick files to combine                  
end

if isequal(filename,0)  %$#1
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
track_what1=get(handles.track_what1,'Value') ;                  
full_filename= strcat(pathname,filename);                  
full_filename=char(full_filename);                  
set(handles.Current_Exp,'String',full_filename);                  
handles.data_file=importdata(full_filename)  ;    


choice = questdlg(['Do you want to associate the experiment to: ' pathname '?'],'Hello User','Yes','No','Yes');
set(handles.edit_axes1,'string','Open_Experiment. Please wait...','ForegroundColor','r') 
switch choice
    case 'Yes'  
pathname=regexprep(pathname, '\', filesep) ;
pathname=regexprep(pathname, '/', filesep) ;

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






global box_Raw  
box_Raw= handles.data_file(1).cdata(:,1) ;
               
switch track_what1                  
case 1                  
filename_Filtered_dir= char(handles.data_file(2).cdata(1,2)) ;                  
Filtered_dir= dir(fullfile( filename_Filtered_dir,  '*ch00_Filtered.tif'));                  
filename_Segmented_dir= char(handles.data_file(2).cdata(1,3)) ;                  
Segmented_dir= dir(fullfile( filename_Segmented_dir,  '*ch00_Segmented.tif')) ;                  
case 2                  
filename_Filtered_dir= char(handles.data_file(2).cdata(2,2)) ;                  
Filtered_dir= dir(fullfile( filename_Filtered_dir,  '*ch03_Filtered.tif'));                  
filename_Segmented_dir= char(handles.data_file(2).cdata(2,3)) ;                  
Segmented_dir= dir(fullfile( filename_Segmented_dir,  '*ch03_Segmented.tif')) ;                  
case 3                  
filename_Filtered_dir= char(handles.data_file(2).cdata(3,2)) ;                  
Filtered_dir= dir(fullfile( filename_Filtered_dir,  '*ch02_Filtered.tif'));                  
filename_Segmented_dir= char(handles.data_file(2).cdata(3,3)) ;                  
Segmented_dir= dir(fullfile( filename_Segmented_dir,  '*ch02_Segmented.tif')) ;                  
end                  
set(handles.Raw_panel,'Visible','on');                  
cla(handles.axes1)                  
cla(handles.axes2)                  
cla(handles.axes3)                  
set(handles.Filtered_listbox,'Value',1) ;                  
set(handles.Segmentation_listbox,'Value',1) ;  

 

if size(Filtered_dir,1)>1                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
Filtered_box(ii)= cellstr(Filtered_dir(ii).name) ;                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
else                  
set(handles.Filtered_listbox,'String', {'Filtered Frame'}) ;  set(handles.Filtered_listbox,'max',1) ;                
end

if size(Segmented_dir,1)>1                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
Segmented_box(ii)= cellstr(Segmented_dir(ii).name) ;                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
else                  
set(handles.Segmentation_listbox,'String', {'Segmented Frame'}) ;  set(handles.Segmentation_listbox,'max',1) ;                
end 


set(handles.showcurrentframe,'String',1);                  
str=handles.data_file(1).cdata  ;                  
set(handles.Raw_listbox,'Value',1)                  
set(handles.Raw_listbox,'String', str(:,1))  
str=handles.data_file(3).cdata( track_what1,1);    

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
 
if char(str)=='1'                  
handles.c=handles.c1;                  
elseif char(str)=='2'                  
handles.c=handles.c2;                  
elseif char(str)=='3'                  
handles.c=handles.c3;                  
elseif char(str)=='4'                  
handles.c=handles.c4 ;                  
elseif char(str)=='5'                  
handles.c=handles.c5 ;                  
elseif char(str)=='6'                  
handles.c=handles.c6 ;                  
end                  
set(gcf,'colormap',handles.c);      
guidata(hObject, handles); 



Raw_listbox_Callback(hObject, eventdata, handles)                  
if size(Filtered_dir,1)>1 
   create_Filtered_listbox(handles)  
   try
       Filtered_listbox_Callback(hObject, eventdata, handles)
   end 
end
if size(Segmented_dir,1)>1
       create_Segmentation_listbox(handles)  
   try
       Segmentation_listbox_Callback(hObject, eventdata, handles)
   end  
end
numFiles = size(handles.data_file(1).cdata(:,1),1);set(handles.end_export,'string',num2str(numFiles));
set(handles.slider1, 'Value',1, 'Max',numFiles, 'Min',1); 
 set(handles.slider1, 'Enable','on', 'SliderStep',[1/numFiles, 0.1]);  % Matlab scrollbar

handles.output = hObject;
guidata(hObject, handles); 
% -------------------------------------------------------------------------                  
function size_wiener_Callback(hObject, eventdata, handles)                  
function track_what1_Callback(hObject, eventdata, handles)                  
track_what1=get(handles.track_what1,'Value') ;
 
% try                  
% str=handles.data_file(3).cdata(track_what1,1)   ;                  
% if str2double(str)<1                  
% set(handles.track_what1,'Value',1)                  
% return                  
% end                  
% end

 str=handles.data_file(3).cdata( 2,1)   
 

if char(str)=='1'                  
handles.c=handles.c1;                  
1                  
elseif char(str)=='2'                  
2                  
handles.c=handles.c2;                  
elseif char(str)=='3'                  
3;                  
handles.c=handles.c3;                  
elseif char(str)=='4'                  
4                  
handles.c=handles.c4;                  
elseif char(str)=='5'                  
5                  
handles.c=handles.c5;                  
elseif char(str)=='6'                  
6                  
handles.c=handles.c6;                  
end                  
set(gcf,'colormap',handles.c);                  
guidata(hObject,handles)  
 



 
segmentation_type1=get(handles.segmentation_type1,'Value') ;                  
Projected_by_Value=get(handles.Projected_by,'Value')  ;                  
Projected_by_Str=get(handles.Projected_by,'String') ;                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
Projected_by=regexprep(Projected_by, 'z', '') ;                  
Projected_by=str2double(Projected_by)  ;                  
if isempty(Projected_by)~=1&& isnan(Projected_by)~=1                  
switch   segmentation_type1                  
case 1                  
string=char(strcat(handles.data_file(2).cdata(track_what1,1),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what1-1),'.tif'))  ;                  
Raw_dir= dir(string)  ;                  
if size(Raw_dir,1)>0                  
Raw_box =cell(size(Raw_dir));                  
for ii=1:size(Raw_dir,1)                  
a= Raw_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-9:end);   Raw_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Raw_listbox,'String', Raw_box) ;                  
set(handles.Raw_panel,'Visible','on');                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Raw_listbox,'String', 'Raw Frame') ;    set(handles.Raw_listbox,'Value', 1) ;                  
end                  
case 2                  
string=char(strcat(handles.data_file(2).cdata(track_what1,2),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what1-1),'_Filtered.tif')) ; Raw_dir= dir(string);                  
if size(Raw_dir,1)>0                  
Raw_box =cell(size(Raw_dir));                  
for ii=1:size(Raw_dir,1)                  
a= Raw_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-18:end);   Raw_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Raw_listbox,'String', Raw_box) ;                  
set(handles.Raw_panel,'Visible','on');                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Raw_listbox,'String', 'Raw Frame') ;    set(handles.Raw_listbox,'Value', 1) ;                  
end                  
case 3                  
string=char(strcat(handles.data_file(2).cdata(track_what1,3),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what1-1),'_Segmented.tif'));  Raw_dir= dir(string);                  
if size(Raw_dir,1)>0                  
Raw_box =cell(size(Raw_dir));                  
for ii=1:size(Raw_dir,1)                  
a= Raw_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-19:end);   Raw_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Raw_listbox,'String', Raw_box) ;                  
set(handles.Raw_panel,'Visible','on');                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Raw_listbox,'String', 'Raw Frame') ;    set(handles.Raw_listbox,'Value', 1) ;                  
end                  
end                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
if findstr('By mean',Projected_by)                  
switch   segmentation_type1                  
case 1                  
string=char(strcat(handles.data_file(2).cdata(track_what1,1),  '*ch0',num2str(track_what1-1),'.tif'))                  
Raw_dir= dir(string)  ;                  
if size(Raw_dir,1)>0                  
Raw_box =cell(size(Raw_dir));                  
for ii=1:size(Raw_dir,1)                  
a= Raw_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-5:end);   Raw_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Raw_listbox,'String', Raw_box) ;                  
set(handles.Raw_panel,'Visible','on');                  
try                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
end                  
else                  
set(handles.Raw_listbox,'String', 'Raw Frame') ;    set(handles.Raw_listbox,'Value', 1) ;                  
end                  
case 2                  
string=char(strcat(handles.data_file(2).cdata(track_what1,2),  '*ch0',num2str(track_what1-1),'_Filtered.tif'))     ;  Raw_dir= dir(string)  ;                  
if size(Raw_dir,1)>0                  
Raw_box =cell(size(Raw_dir));                  
for ii=1:size(Raw_dir,1)                  
a= Raw_dir(ii).name                  
Reduce=a(findstr(a,'.tif')-14:end)                  
Raw_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Raw_listbox,'String', Raw_box) ;                  
set(handles.Raw_panel,'Visible','on');                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Raw_listbox,'String', 'Raw Frame') ;    set(handles.Raw_listbox,'Value', 1) ;                  
end                  
case 3                  
string=char(strcat(handles.data_file(2).cdata(track_what1,3),  '*ch0',num2str(track_what1-1),'_Segmented.tif'))  ;                  
Raw_dir= dir(string) ;                  
if size(Raw_dir,1)>0                  
Raw_box =cell(size(Raw_dir));                  
for ii=1:size(Raw_dir,1)                  
a= Raw_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-15:end);   Raw_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Raw_listbox,'String', Raw_box) ;                  
set(handles.Raw_panel,'Visible','on');                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Raw_listbox,'String', 'Raw Frame') ;     set(handles.Raw_listbox,'Value', 1) ;                  
end                  
end                  
end                  
% --------------------------------------------------------------------                  
function[matrix]=filter_Frame(matrix,handles,pathname_Raw,Raw_filename,track_what)    %seperated filters for Frame and DIC, option for future changes     

 
matrix= double(matrix);  % Ensure double  
 

matrix=Filter_function(matrix,1,handles,pathname_Raw,Raw_filename,track_what);                  
matrix=Filter_function(matrix,2,handles,pathname_Raw,Raw_filename,track_what);                  
matrix=Filter_function(matrix,3,handles,pathname_Raw,Raw_filename,track_what);                  
matrix=Filter_function(matrix,4,handles,pathname_Raw,Raw_filename,track_what);                  
matrix=Filter_function(matrix,5,handles,pathname_Raw,Raw_filename,track_what);                  
% --------------------------------------------------------------------                  
function[matrix]=segment_Frame(pathname_Raw,Raw_filename,track_what,matrix_intensity,handles,thresh_level)   %seperated filters for Frame and DIC, option for future changes                  

 
    if nargin<7                  
thresh_level=str2double(get(handles.T_edit_1,'String'))  ;                  
end                  
switch get(handles.segmentation_method,'value')                  
case 1                  
    if get(handles.Bits,'value')==1
        matrix_intensity(1)=255 ;
        matrix_intensity=uint8(matrix_intensity);
    elseif get(handles.Bits,'value')==2
        if max(max(matrix_intensity))<256
            matrix_intensity(1)=  255;
            matrix_intensity=uint8(matrix_intensity);
        end
    elseif  handles.data_file(9).cdata==32
        'think about a new solution here!!!!'
        return
    end
    
   
    
matrix=im2bw(matrix_intensity,thresh_level);    

  
% L=bwlabel(matrix );                  
% z=hist(L(:),max(max(L))) ;                  
% zz=sort(z,'descend') ;                  
% if isempty(zz)~=0                  
% while zz(2)>1000                  
% thresh_level=thresh_level+ thresh_level*1.1   ;                  
% matrix =im2bw(matrix_intensity,thresh_level);                  
% L=bwlabel(matrix );                  
% z=hist(L(:),max(max(L)));                  
% zz=sort(z,'descend');                  
% end                  
% end                  
case 2                  
[~, matrix ]=kmeans_BACWrapper(matrix_intensity,2) ;                  
matrix=im2bw(matrix,1);                  
case 3                  
matrix = imextendedmax(matrix_intensity,round(thresh_level));    
end   



matrix=logical(matrix);
 


matrix=Segmentation_function(pathname_Raw,Raw_filename,track_what,matrix,2,handles);                  
matrix=Segmentation_function(pathname_Raw,Raw_filename,track_what,matrix,3,handles);                  
matrix=Segmentation_function(pathname_Raw,Raw_filename,track_what,matrix,4,handles);                  
matrix=Segmentation_function(pathname_Raw,Raw_filename,track_what,matrix,5,handles);                  
matrix=Segmentation_function(pathname_Raw,Raw_filename,track_what,matrix,6,handles);   

% % figure(1)
% % imagesc(matrix)
% % return



%     ------------------------------------------------------------                  
function [matrix]=Filter_function(matrix,ii,handles,pathname_Raw,Raw_filename,track_what)                  
% to add new option don`t foret to add it also to F_popup_function!                  
X=  eval( strcat ('get(handles.F_popup_',num2str(ii), ',','''Value''', ')'))  ;                  
strel_value=eval(strcat ('get(handles.F_edit_',num2str(ii), ',','''String''', ')'));                  
strel_value=str2double(strel_value)       ;                  
strel_selected=get(handles.strel_type,'Value');                  
strel_type=get(handles.strel_type,'String');                  
strel_type=strel_type(strel_selected);                  
strel_type=char(strel_type);                  
fspecial_value=get(handles.fspecial_type,'value')                  
fspecial_type=get(handles.fspecial_type,'String');                  
fspecial_type=fspecial_type(fspecial_value);                  
fspecial_type=char(fspecial_type);                  
if X==16 %spectral unmixing                  
end                  
[matrix]=Filter_file(matrix,strel_value,strel_type, fspecial_value,fspecial_type,ii,X,pathname_Raw,Raw_filename,track_what)  ;                  
% -------------------------------------------------------------------------                  
function [matrix]=Segmentation_function(pathname_Raw,Raw_filename,track_what,matrix,ii,handles)                  
%     matrix=-matrix;                  
X=  eval( strcat ('get(handles.T_popup_',num2str(ii), ',','''Value''', ')'))  ;                  
strel_value=eval(strcat ('get(handles.T_edit_',num2str(ii), ',','''String''', ')'));                  
strel_value=str2double(strel_value)       ;                  
strel_selected=get(handles.strel_type,'Value');                  
strel_type=get(handles.strel_type,'String');                  
strel_type=strel_type(strel_selected);                  
strel_type=char(strel_type);                  
bwmorph_value=get(handles.bwmorph_type,'value')                  
bwmorph_type=get(handles.bwmorph_type,'String');                  
bwmorph_type=bwmorph_type(bwmorph_value);                  
bwmorph_type=char(bwmorph_type);                  
bwmorph_value=str2num(get(handles.edit60,'string'));    

 
try
[matrix]=segmentation_file(matrix,strel_value,strel_type, bwmorph_value ,bwmorph_type,ii,X,pathname_Raw,Raw_filename,track_what) ;   
  catch
    matrix=matrix*0;
end
matrix=abs(matrix);   



% ---------------------------------------------------------------------                  
function F_popup_function(ii,handles)                  
% Matlab user can easily  add more filter options upon demand. Instructions are as the following:                  
% Open Filter_file.m located in supporting functions library with Matlab editor.                  
%  Add indexed case. For instance, if there are 20 cases, add case 21.                  
% For this case add the next format:                  
% case 21                  
%  if nargin==0                  
%                  matrix(11)={  ‘user given name for the operation'}                  
%         else                  
%             matrix(:,:,1)=operation added by the user                  
%          end                  
% %Example:                  
% %case 11                  
%        %    if   nargin==0                  
%        %       matrix(11)={  'Canny edge detection'}                  
%        %   else                  
%        %        matrix(:,:,1)=Canny(matrix(:,:,1));                  
%        %   end                  
% Whereas nargin==0 is used to give the function name,                  
% matrix(:,:,1) is the returned output  (filtered image),                  
% 11 is the case index                  
% Canny is the function used on input matrix                  
% matrix can be in 3-D format                  
% 4. Save and exit the Filter_file.m .                  
% 5. Open BAC_Segmentation_Module.m with Matlab editor.                  
% 6. Add to the indexed case under  F_popup_function slider setting. This settings are depended on the  maximum  input value. i.e.:                  
%             eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
%             eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
%              eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
% 7. Save and exit BAC_Segmentation_Module.m .                  
X=eval( strcat ('get(handles.F_popup_',num2str(ii), ',','''Value''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',[])'));                  
switch X                  
case 2                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 3                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 4                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 5                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',8)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',4)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',4)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[1 1])'));                  
case 6                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 9                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 10                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 11                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',[])'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
case 12                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 16                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));                  
case 17                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));       




    case 20
        
                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));    

    case 22
        
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',255)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));    

    case 24
        
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',255)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));    

case 25       
   
msgbox('Raw FLUO channels (i.e. gfp,cherry) in should be in left box and raw DIC in right box.')                  
set(handles.segmentation_type1,'value',1);set(handles.track_what1,'value',1);                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));    

    case 29
                        
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));

    case 30
                        
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));

    case 31
                        
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Max''', ',200)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.F_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.1])'));







end                  
% =========================================================================                  
function T_popup_function(ii,handles)                   
%VMatlab user can easily  add more segmentation and binary operations options upon demand. Instructions are as the following:                  
% Open segmentation_file.m located in supporting functions library with Matlab editor.                  
%  Add indexed case. For instance, if there are 10 cases, add case 11.                  
% For this case add the next format:                  
% case 11                  
%  if nargin==0                  
%                  matrix(11)={  ‘user given name for the operation'}                  
%         else                  
%             matrix=operation added by the user                  
%          end                  
% %Example:                  
% %case 7                  
%         %    if nargin==0                  
%         %         matrix(7)={   'imfill holes'}                  
%         %    else                  
%         %             matrix=imfill(matrix,'holes');                  
%         %    end                  
%                  
% Whereas nargin==0 is used to give the function name,                  
% matrix is the input and returned output  image                  
% 7  is the case index                  
% imfill is the function used on input matrix                  
% matrix can be only in 2-D format                  
% 4. Save and exit the segmentation_file.m .                  
% 5. Open BAC_Segmentation_Module.m with Matlab editor.                  
% 6. Add to the indexed case under  T_popup_function slider setting. This settings are depended on the  maximum  input value. i.e.:                  
%             eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
%              eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));                  
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'))                  
% 7. Save and exit BAC_Segmentation_Module.m .                  
X=eval( strcat ('get(handles.T_popup_',num2str(ii), ',','''Value''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',[])'));                  
switch X                  
case 3                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',2000)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.01 0.1])'));                  
case 4                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',10000)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.01 0.1])'));                  
case 5                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',100)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.01 0.05])'));                  
case 6                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',8)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',4)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',4)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[1 1])'));                  
case 8                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'));                  
case 9                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'));                  
case 10                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'));                  
case 11                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',20)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.01 0.05])'));                  
case 12                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',20)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.01 0.05])'));   
                 
    case 35
        eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'));
end                  
% =========================================================================                  
% -------------------------------------------------------------------------                  
function F_Slider_1_Callback(hObject, eventdata, handles)                  
S=get(handles.F_Slider_1,'Value'); S=round(S);                  
set(handles.F_edit_1,'String', S);                  
apply_filters_function(hObject, eventdata, handles,'empty')    ;                  
% -------------------------------------------------------------------------                  
function F_Slider_2_Callback(hObject, eventdata, handles)                  
S=get(handles.F_Slider_2,'Value'); S=round(S);                  
set(handles.F_edit_2,'String', S);                  
apply_filters_function(hObject, eventdata, handles,'empty')    ;                  
% -------------------------------------------------------------------------                  
function F_Slider_3_Callback(hObject, eventdata, handles)                  
S=get(handles.F_Slider_3,'Value'); S=round(S);                  
set(handles.F_edit_3,'String', S);                  
apply_filters_function(hObject, eventdata, handles,'empty') ;                  
% -------------------------------------------------------------------------                  
function F_Slider_4_Callback(hObject, eventdata, handles)                  
S=get(handles.F_Slider_4,'Value'); S=round(S);                  
set(handles.F_edit_4,'String', S);                  
apply_filters_function(hObject, eventdata, handles,'empty')    ;                  
% -------------------------------------------------------------------------                  
function F_Slider_5_Callback(hObject, eventdata, handles)                  
S=get(handles.F_Slider_5,'Value'); S=round(S);                  
set(handles.F_edit_5,'String', S);                  
apply_filters_function(hObject, eventdata, handles,'empty')   ;                  
% =========================================================================                  
function T_Slider_1_Callback(hObject, eventdata, handles)                  
S=get(handles.T_Slider_1,'Value');                  
if S==0                  
S=0.00001;                  
end                  
set(handles.T_edit_1,'String', S);                  
apply_segmentation_function(hObject, eventdata, handles,'empty')    ;                  
% ---------------------------------------------------------------------                  
function T_Slider_2_Callback(hObject, eventdata, handles)                  
S=get(handles.T_Slider_2,'Value');                  
V=get(handles.T_popup_2,'Value');                  
if  V~=8 & V~=9 & V~=35                
S=round(S);                  
end                
set(handles.T_edit_2,'String', S);                  
apply_segmentation_function(hObject, eventdata, handles,'empty')    ;                  
% ---------------------------------------------------------------------                  
function T_Slider_3_Callback(hObject, eventdata, handles)                  
S=get(handles.T_Slider_3,'Value');                  
V=get(handles.T_popup_3,'Value');                  
if  V~=8 & V~=9 & V~=35                 
S=round(S);          
end                  
set(handles.T_edit_3,'String', S);                  
apply_segmentation_function(hObject, eventdata, handles,'empty')    ;                  
% ---------------------------------------------------------------------                  
function T_Slider_4_Callback(hObject, eventdata, handles)                  
S=get(handles.T_Slider_4,'Value');                  
V=get(handles.T_popup_4,'Value');                  
if  V~=8 & V~=9 & V~=35                
S=round(S);            
end                  
set(handles.T_edit_4,'String', S);                  
apply_segmentation_function(hObject, eventdata, handles,'empty')    ;                  
% ---------------------------------------------------------------------                  
function T_Slider_5_Callback(hObject, eventdata, handles)                  
S=get(handles.T_Slider_5,'Value') ;                  
V=get(handles.T_popup_5,'Value');                  
if  V~=8 & V~=9 & V~=35                   
S=round(S);            
end                  
set(handles.T_edit_5,'String', S);                  
apply_segmentation_function(hObject, eventdata, handles,'empty')    ;                  
% ---------------------------------------------------------------------                  
function T_Slider_6_Callback(hObject, eventdata, handles)                  
S=get(handles.T_Slider_6,'Value') ;                  
V=get(handles.T_popup_6,'Value');                  
if  V~=8 & V~=9 & V~=35                 
S=round(S);             
end                  
set(handles.T_edit_6,'String', S);                  
apply_segmentation_function(hObject, eventdata, handles,'empty')    ;                  
% ---------------------------------------------------------------------                  
function Filter_Help_Callback(hObject, eventdata, handles)                  
%  --------------------------------------------------------------------                  
function Help_About_Filter_Callback(hObject, eventdata, handles)                  
F_popup_1=get(handles.F_popup_1,'String')                  
str=listdlg('PromptString','Select Filter:',...                  
'SelectionMode','single',...                  
'ListString',F_popup_1)                  
switch str                  
case 2                  
h = msgbox('Performs morphological closing on the image. The morphological close operation is a dilation followed by an erosion, using the same structuring element (strel) for both operations.','imclose','replace','help') ;                  
case 3                  
h = msgbox('Performs morphological opening the image to remove the smaller objects. The morphological close operation is an erosion  followed by a dilation erosion, using the same structuring element (strel) for both operations.','imopen','replace','help') ;                  
case 4                  
h = msgbox('Enhance the contrast using top-hat filtering and bottom-hat filtering by using strel. The original image is added to the top-hat filtered image, and then subtracting the bottom-hat filtered image.','Hat filtering','replace','help') ;                  
case 5                  
h = msgbox('Suppresses structures that are lighter than their surroundings and that are connected to the image border. The connectivity can be 4 or 8 pixels.','imclearborder','replace','help') ;                  
case 6                  
h = msgbox('Each pixel from the output matrix contains the entropy value of the matrix around the corresponding pixel in the input image.','entropyfilt','replace','help') ;                  
case 7                  
h = msgbox('Each pixel from the output matrix contains the range value (maximum value - minimum value) of the matrix  around the corresponding pixel in the input image.','rangefil','replace','help') ;                  
case 8                  
h = msgbox('Each pixel from the output matrix contains the standard deviation of  matrix  around the corresponding pixel in the input image.','rangefil','replace','help') ;                  
case 9                  
h = msgbox(' lowpass-filters that has been degraded by constant power additive noise. wiener2 uses a pixelwise adaptive Wiener method based on statistics estimated from a local neighborhood of each pixel.','wiener2','replace','help') ;                  
case 10                  
h = msgbox('Filters the the input matrix with the filter matrix, which is depended in the fspecial type.','imfilter','replace','help') ;                  
case 11                  
h = msgbox('Used tp emphasizes horizontal and vertical edges. Using the smoothing effect by approximating a vertical and horizontal gradients is achived by combining the transposeand untranspose filter. Matrix is fixed to 3x3 pixels size.'.','Edge enc.','replace','help') ;                  
end                  
% --------------------------------------------------------------------                  
function Help_About_strel_Callback(hObject, eventdata, handles)                  
h = msgbox('Creates a structuring element of the type specified by shape (diamond,disk,line,etc.) and size.','strel','replace','help') ;                  
% --------------------------------------------------------------------                  
% --------------------------------------------------------------------                  
function Help_About_fspecial_Callback(hObject, eventdata, handles)                  
h = msgbox('fspecial creates a two-dimensional filter of the specified type, and returns the correlation kernel, which is the appropriate form to use with imfilter.','fspecial','replace','help') ;                  
waitfor(h)                  
fspecial_type=get(handles.fspecial_type,'String')                  
str=listdlg('PromptString','Select fspecial type:',...                  
'SelectionMode','single',...                  
'ListString',fspecial_type)                  
switch str                  
case 1                  
h = msgbox('Returns an averaging filter with a size of a squared matrix, where its size is an input by the user.','average','replace','help') ;                  
case 2                  
h = msgbox('Returns a circular averaging filter (pillbox) within the square matrix of side 2*radius+1, where its radius is an input by the user.','disk','replace','help') ;                  
case 3                  
h = msgbox('Returns a rotationally symmetric Gaussian lowpass filter with standard deviation sigma (positive). The default value for sigma is 0.5 and the size of the filter matrix  is an input by the user.','gaussian','replace','help') ;                  
case 4                  
h = msgbox('Returns a rotationally symmetric Laplacian of Gaussian filter with standard deviation sigma (positive). The default value for sigma is 0.5 and the size of the filter matrix  is an input by the user.','log','replace','help') ;                  
case 5                  
h = msgbox('Returns a filter to approximate, once convolved with an image, the linear motion of a camera by len pixels. vertical motions. The  len parameter corresponds to a horizontal motion in pixels., and is an input by the user.','motion','replace','help') ;                  
end                  
% --------------------------------------------------------------------                  
function Segmentation_Help_Callback(hObject, eventdata, handles)                  
% hObject    handle to Segmentation_Help (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --------------------------------------------------------------------                  
function Help_About_Segmentation_Callback(hObject, eventdata, handles)                  
T_popup_2=get(handles.T_popup_2,'String')                  
str=listdlg('PromptString','Select Segmented:',...                  
'SelectionMode','single',...                  
'ListString',T_popup_2)                  
switch str                  
case 2                  
h = msgbox('Morphological operations on binary images, , which is depended in the bwmorph type.','bwmorph','replace','help') ;                  
case 3                  
h = msgbox('Removes from a binary image all connected components (objects) that have fewer than P pixels.','bwareaopen-smallest object','replace','help') ;                  
case 4                  
h = msgbox('Removes from a binary image all connected components (objects) that have more than P pixels.','bwareaopen-largest object','replace','help') ;                  
case 5                  
h = msgbox('Performs morphological closing using the the structuring element defined by strel.','imclose','replace','help') ;                  
case 6                  
h = msgbox('Suppresses structures that are lighter than their surroundings and that are connected to the image border.  The connectivity parameter can be  4 or 8 pixels.','imclearborder','replace','help') ;                  
end                  
% --------------------------------------------------------------------                  
function Help_About_bwmorph_Callback(hObject, eventdata, handles)                  
h = msgbox('bwmorph applies a specific morphological operation to the binary image.','bwmorph','replace','help') ;                  
waitfor(h)                  
bwmorphl_type=get(handles.bwmorph_type,'String')                  
str=listdlg('PromptString','Select bwmorph type:',...                  
'SelectionMode','single',...                  
'ListString',bwmorph_type)                  
switch str                  
case 1                  
h = msgbox('Performs the morphological "bottom hat" operation, returning the image minus the morphological closing of the image .(dilation followed by erosion).','bothat','replace','help') ;                  
case 2                  
h = msgbox('Bridge unconnected pixels, that is, sets 0-valued pixels to 1 if they have two nonzero neighbors that are not connected.' ,' bridge','replace','help') ;                  
case 3                  
h = msgbox('Removes isolated pixels, such as the center pixel in this pattern.' ,'clean','replace','help') ;                  
case 4                  
h = msgbox('Performs morphological closing (dilation followed by erosion).' , 'close','replace','help') ;                  
case 5                  
h = msgbox('Uses diagonal fill to eliminate 8-connectivity of the background.' ,'diag ','replace','help') ;                  
case 6                  
h = msgbox('Performs dilation using the structuring element ones(3).' ,'dilate','replace','help') ;                  
case 7                  
h = msgbox('Performs erosion  using the structuring element ones(3).' ,'erode','replace','help') ;                  
case 8                  
h = msgbox('Fills isolated interior pixels, such as the center pixel in this pattern.' ,'fill','replace','help') ;                  
case 9                  
h = msgbox('Removes H-connected pixels.' ,' hbreak','replace','help') ;                  
case 10                  
h = msgbox('Sets a pixel to 1 if five or more pixels in its 3-by-3 neighborhood are 1s, otherwise, it sets the pixel to 0.' ,'majority','replace','help') ;                  
case 11                  
h = msgbox('Performs morphological opening (erosion followed by dilation).' ,'open','replace','help') ;                  
case 12                  
h = msgbox('Removes interior pixels. This option sets a pixel to 0 if all its 4-connected neighbors are 1, thus leaving only the boundary pixels on.' ,'remove','replace','help') ;                  
case 13                  
h = msgbox('With n = Inf, shrinks objects to points. It removes pixels so that objects without holes shrink to a point, and objects with holes shrink to a connected ring halfway between each hole and the outer boundary. This option preserves the Euler number.' ,'shrink','replace','help') ;                  
case 14                  
h = msgbox('With n = Inf, removes pixels on the boundaries of objects but does not allow objects to break apart. The pixels remaining make up the image skeleton. This option preserves the Euler number.' ,'skel','replace','help') ;                  
case 15                  
h = msgbox('With n = Inf, removes pixels on the boundaries of objects but does not allow objects to break apart. The pixels remaining make up the image skeleton. This option preserves the Euler number.' ,'spur','replace','help') ;                  
case 16                  
h = msgbox('With n = Inf, thickens objects by adding pixels to the exterior of objects until doing so would result in previously unconnected objects being 8-connected. This option preserves the Euler number.' ,' thicken','replace','help') ;                  
case 17                  
h = msgbox('With n = Inf, thins objects to lines. It removes pixels so that an object without holes shrinks to a minimally connected stroke, and an object with holes shrinks to a connected ring halfway between each hole and the outer boundary. This option preserves the Euler number.' ,'thin','replace','help') ;                  
case 18                  
h = msgbox('Performs morphological "top hat" operation, returning the image minus the morphological opening of the image (erosion followed by dilation).' ,'tophat','replace','help') ;                  
end                  
% --------------------------------------------------------------------                  
function Optimal_settings_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function Save_optimal_settings_Callback(hObject, eventdata, handles)                  
DATA(1).vector(1)=get(handles.F_popup_1,'Value');                  
DATA(1).vector(2)=get(handles.F_popup_2,'Value');                  
DATA(1).vector(3)=get(handles.F_popup_3,'Value');                  
DATA(1).vector(4)=get(handles.F_popup_4,'Value');                  
DATA(1).vector(5)=get(handles.F_popup_5,'Value');                  
DATA(1).vector(6)=get(handles.F_Slider_1,'Value');                  
DATA(1).vector(7)=get(handles.F_Slider_2,'Value');                  
DATA(1).vector(8)=get(handles.F_Slider_3,'Value');                  
DATA(1).vector(9)=get(handles.F_Slider_4,'Value');                  
DATA(1).vector(10)=get(handles.F_Slider_5,'Value');                  
DATA(1).vector(11)=get(handles.T_popup_2,'Value');                  
DATA(1).vector(12)=get(handles.T_popup_3,'Value');                  
DATA(1).vector(13)=get(handles.T_popup_4,'Value');                  
DATA(1).vector(14)=get(handles.T_popup_5,'Value');                  
DATA(1).vector(15)=get(handles.T_popup_6,'Value');                  
DATA(1).vector(16)=get(handles.T_Slider_1,'Value');                  
DATA(1).vector(17)=get(handles.T_Slider_2,'Value');                  
DATA(1).vector(18)=get(handles.T_Slider_3,'Value');                  
DATA(1).vector(19)=get(handles.T_Slider_4,'Value');                  
DATA(1).vector(20)=get(handles.T_Slider_5,'Value');                  
DATA(1).vector(21)=get(handles.T_Slider_6,'Value');                  
DATA(1).vector(22)=get(handles.strel_type,'Value');                  
DATA(1).vector(23)=get(handles.fspecial_type,'Value');                  
DATA(1).vector(24)=get(handles.bwmorph_type,'Value');                  
DATA(2).vector(1)=str2double(get(handles.F_edit_1,'String'));                  
DATA(2).vector(2)=str2double(get(handles.F_edit_2,'String'));                  
DATA(2).vector(3)=str2double(get(handles.F_edit_3,'String'));                  
DATA(2).vector(4)=str2double(get(handles.F_edit_4,'String'));                  
DATA(2).vector(5)=str2double(get(handles.F_edit_5,'String'));                  
DATA(2).vector(6)=str2double(get(handles.T_edit_1,'String'));                  
DATA(2).vector(7)=str2double(get(handles.T_edit_2,'String'));                  
DATA(2).vector(8)=str2double(get(handles.T_edit_3,'String'));                  
DATA(2).vector(9)=str2double(get(handles.T_edit_4,'String'));                  
DATA(2).vector(10)=str2double(get(handles.T_edit_5,'String'));                  
DATA(2).vector(11)=str2double(get(handles.T_edit_6,'String'));                  
DATA(3).vector(1)= get(handles.Robust_Filtering_on,'value');                  
DATA(3).vector(2)= get(handles.Robust_Segmenting_on,'value');                  
DATA(3).vector(3)= get(handles.Auto_thresh_on,'value');                  
DATA(3).vector(4)= get(handles.mask_option_on,'value');                  



Current_Exp=get(handles.Current_Exp,'String'); 
[filename, pathname, filterindex] = uiputfile({  'BacFormatics_SEG_*.dat','DAT-files (*.dat)';}, 'save  optimal settings');                       
           
if isequal(filename,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
filename=regexprep(filename, 'BacFormatics_SEG_','')                  
full_filename= strcat(pathname,'BacFormatics_SEG_',filename) ;                  
full_filename=char(full_filename);                  
save(full_filename, 'DATA') ;      
h=msgbox('Settings file was saved. Press ok to continue.')
% --------------------------------------------------------------------                  
function Load_optimal_settings_Callback(hObject, eventdata, handles)                  
    
 
 [filename, pathname, filterindex] = uigetfile({'BacFormatics_SEG_*.dat','dat-files (*.dat)';}, 'Please Choose optimal setting file')% handles.directory_name); %pick files to combine                  
 

if isequal(filename,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
track_what=get(handles.track_what1,'Value') ;                  
full_filename= strcat(pathname,filename);                  
full_filename=char(full_filename);                  
DATA=importdata(full_filename)  ;                  
set_DATA(handles,DATA);                  
%  -----------------------------------------------                  
function set_DATA(handles,DATA)                  
if DATA(1).vector(1)~=0                  
set(handles.F_popup_1,'Value',DATA(1).vector(1)) ;   end                  
if DATA(1).vector(2)~=0                  
set(handles.F_popup_2,'Value',DATA(1).vector(2));    end                  
if DATA(1).vector(3)~=0                  
set(handles.F_popup_3,'Value',DATA(1).vector(3));    end                  
if DATA(1).vector(4)~=0                  
set(handles.F_popup_4,'Value',DATA(1).vector(4));    end                  
if DATA(1).vector(5)~=0                  
set(handles.F_popup_5,'Value',DATA(1).vector(5));    end                  
for ii=1:5                  
F_popup_function(ii,handles);                  
end                  
set(handles.F_Slider_1,'Value',DATA(1).vector(6));                  
set(handles.F_Slider_2,'Value',DATA(1).vector(7));                  
set(handles.F_Slider_3,'Value',DATA(1).vector(8));                  
set(handles.F_Slider_4,'Value',DATA(1).vector(9));                  
set(handles.F_Slider_5,'Value',DATA(1).vector(10));                  
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
set(handles.T_Slider_1,'Value',DATA(1).vector(16));                  
set(handles.T_Slider_2,'Value',DATA(1).vector(17));                  
set(handles.T_Slider_3,'Value',DATA(1).vector(18));                  
set(handles.T_Slider_4,'Value',DATA(1).vector(19));                  
set(handles.T_Slider_5,'Value',DATA(1).vector(20));                  
set(handles.T_Slider_6,'Value',DATA(1).vector(21));                  
set(handles.strel_type,'Value',DATA(1).vector(22));                  
set(handles.fspecial_type,'Value',DATA(1).vector(23));                  
set(handles.bwmorph_type,'Value',DATA(1).vector(24));                  
set(handles.F_edit_1,'String',DATA(2).vector(1));                  
set(handles.F_edit_2,'String',DATA(2).vector(2));                  
set(handles.F_edit_3,'String',DATA(2).vector(3));                  
set(handles.F_edit_4,'String',DATA(2).vector(4));                  
set(handles.F_edit_5,'String',DATA(2).vector(5));                  
set(handles.T_edit_1,'String',DATA(2).vector(6));                  
set(handles.T_edit_2,'String',DATA(2).vector(7));                  
set(handles.T_edit_3,'String',DATA(2).vector(8));                  
set(handles.T_edit_4,'String',DATA(2).vector(9));                  
set(handles.T_edit_5,'String',DATA(2).vector(10));                  
set(handles.T_edit_6,'String',DATA(2).vector(11));                  
set(handles.Segmenttion_panel,'Visible','on');                  
set(handles.Segmentation_panel,'Visible','on');                  
set(handles.Robust_Filtering_on,'value',DATA(3).vector(1) );                  
set(handles.Robust_Segmenting_on,'value',DATA(3).vector(2) );                  
set(handles.Auto_thresh_on,'value',DATA(3).vector(3) );                  
try                  
set(handles.mask_option_on,'value',DATA(3).vector(4) );                  
end                  
function start_filter_at_Callback(hObject, eventdata, handles)                  
box_list=get(handles.Raw_listbox,'string')  ;                  
if isempty(box_list)==1                  
box_list=1 ;                  
end                  
start_filter_at=str2double(get(handles.start_filter_at,'String'));                  
if start_filter_at>size(box_list,1)                  
start_filter_at=size(box_list,1) ;                  
end                  
if start_filter_at<1                  
start_filter_at=1 ;                  
end                  
set(hObject,'String',num2str(start_filter_at));                  
% -------------------------------------------------------------------------                  
% --- Executes during object creation, after setting all properties.                  
function end_filter_at_Callback(hObject, eventdata, handles)                  
box=get(handles.Raw_listbox,'string')  ;                  
if isempty(box)==1                  
box=1 ;                  
end                  
end_filter_at=str2double(get(handles.end_filter_at,'String'));                  
if end_filter_at>size(box,1)                  
end_filter_at=size(box,1) ;                  
end                  
if end_filter_at<1                  
end_filter_at=1 ;                  
end                  
set(hObject,'String',num2str(end_filter_at));                  
% -------------------------------------------------------------------------                  
function start_segmentation_at_Callback(hObject, eventdata, handles)                  
box=get(handles.Filtered_listbox,'string')  ;                  
if isempty(box)==1                  
box=1 ;                  
end                  
start_filter_at=str2double(get(handles.start_segmentation_at,'String'));                  
if start_filter_at>size(box,1)                  
start_filter_at=size(box,1) ;                  
end                  
if start_filter_at<1                  
start_filter_at=1 ;                  
end                  
set(hObject,'String',num2str(start_filter_at));                  
function end_segmentation_at_Callback(hObject, eventdata, handles)                  
box=get(handles.Filtered_listbox,'string')  ;                  
if isempty(box)==1                  
box=1 ;                  
end                  
end_filter_at=str2double(get(handles.end_segmentation_at,'String'));                  
if end_filter_at>size(box,1)                  
end_filter_at=size(box,1) ;                  
end                  
if end_filter_at<1                  
end_filter_at=1 ;                  
end                  
set(hObject,'String',num2str(end_filter_at));                  
% --- If Enable == 'on', executes on mouse press in 5 pixel border.                  
% --- Otherwise, executes on mouse press in 5 pixel border or over end_filter_at.                  
% ------------------------------------------------------------------------                  
function pushbutton46_Callback(hObject, eventdata, handles)                  
n=str2double(get(handles.showcurrentframe,'String')) ;                  
popup_Choose_the_axes=get(handles.Choose_the_axes,'Value')  
track_what =get(handles.track_what1,'Value');
track_what1=get(handles.track_what1,'Value') ;track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;                  
if popup_Choose_the_axes==2                  
listbox=get(handles.Raw_listbox,'string') ;                  
pathname=handles.data_file(2).cdata(track_what1,1) ;                  
elseif popup_Choose_the_axes==3                  
listbox=get(handles.Filtered_listbox,'string') ;                  
pathname=handles.data_file(2).cdata(track_what2,2) ;                  
elseif  popup_Choose_the_axes==4                  
listbox=get(handles.Segmentation_listbox,'string') ;                  
pathname=handles.data_file(2).cdata(track_what3,3) ;                  
end                  
[filename2put, pathname2put, filterindex]=uiputfile('*.tif','name of multistack file');                  
h=timebar_BACWrapper('Calculating 2D Projection for population ....');                  
set(h,'color','w');                  
start_export=str2double(get(handles.start_export,'string')) ;                  
end_export=str2double(get(handles.end_export,'string')) ;                  
n=end_export-start_export                  
iii=1;                  
for ii=start_export:end_export                  
timebar_BACWrapper(h,iii/n)                  
filename=listbox(ii) ;                  
if popup_Choose_the_axes==2                  
full_filename= strcat(pathname,filename,'_ch0',num2str(track_what-1),'.tif') ;                  
elseif  popup_Choose_the_axes==4                    
full_filename= strcat(pathname,filename,'_ch00_Segmented.tif') ;                  
end                  
full_filename=char(full_filename);                  
temp=imread_cross(full_filename);                  
if popup_Choose_the_axes==4   
%     temp= flipdim(temp,1);   
end                  
% m(ii).cdata=temp; 
 
                     imwrite(temp,[pathname2put filename2put],'WriteMode','append');                  
iii=iii+1;                  
end                  
               
close(h)                  
% ------------------------------------------------------------------------                  
% --------------------------------------------------------------------                  
function Untitled_12_Callback(hObject, eventdata, handles)                  
track_what=get(handles.track_what1,'Value');                  
n_Raw=get(handles.Raw_listbox,'Value');    


 
DATA=handles.data_file(8).cdata(track_what).Frame(n_Raw).DATA  ;                  
if  DATA(1).vector(1)~=0                  
set(handles.F_popup_1,'Value',DATA(1).vector(1)); end                  
if  DATA(1).vector(2)~=0                  
set(handles.F_popup_2,'Value',DATA(1).vector(2)); end                  
if  DATA(1).vector(3)~=0                  
set(handles.F_popup_3,'Value',DATA(1).vector(3)); end                  
if  DATA(1).vector(4)~=0                  
set(handles.F_popup_4,'Value',DATA(1).vector(4)); end                  
if  DATA(1).vector(5)~=0                  
set(handles.F_popup_5,'Value',DATA(1).vector(5)); end                  
for ii=1:5                  
F_popup_function(ii,handles);                  
end                  
set(handles.F_Slider_1,'Value',DATA(1).vector(6));                  
set(handles.F_Slider_2,'Value',DATA(1).vector(7));                  
set(handles.F_Slider_3,'Value',DATA(1).vector(8));                  
set(handles.F_Slider_4,'Value',DATA(1).vector(9));                  
set(handles.F_Slider_5,'Value',DATA(1).vector(10));                  
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
set(handles.T_Slider_1,'Value',DATA(1).vector(16));                  
set(handles.T_Slider_2,'Value',DATA(1).vector(17));                  
set(handles.T_Slider_3,'Value',DATA(1).vector(18));                  
set(handles.T_Slider_4,'Value',DATA(1).vector(19));                  
set(handles.T_Slider_5,'Value',DATA(1).vector(20));                  
set(handles.T_Slider_6,'Value',DATA(1).vector(21));                  
if DATA(1).vector(22)==0                  
DATA(1).vector(22)= 1;                  
end                  
if DATA(1).vector(23)==0                  
DATA(1).vector(23)= 1;                  
end                  
if DATA(1).vector(24)==0                  
DATA(1).vector(24)= 1;                  
end                  
set(handles.strel_type,'Value',DATA(1).vector(22));                  
set(handles.fspecial_type,'Value',DATA(1).vector(23));                  
set(handles.bwmorph_type,'Value',DATA(1).vector(24));                  
if isnan(DATA(2).vector(1))~=1                  
set(handles.F_edit_1,'String',DATA(2).vector(1)); end                  
if isnan(DATA(2).vector(2))~=1                  
set(handles.F_edit_2,'String',DATA(2).vector(2)); end                  
if isnan(DATA(2).vector(3))~=1                  
set(handles.F_edit_3,'String',DATA(2).vector(3)); end                  
if isnan(DATA(2).vector(4))~=1                  
set(handles.F_edit_4,'String',DATA(2).vector(4)); end                  
if isnan(DATA(2).vector(5))~=1                  
set(handles.F_edit_5,'String',DATA(2).vector(5)); end                  
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
set(handles.Segmenttion_panel,'Visible','on');                  
set(handles.Segmentation_panel,'Visible','on');                  
try                  
set(handles.mask_option_on,'value',DATA(3).vector(4) );                  
end                  
% --------------------------------------------------------------------                  
% --- Executes on selection change in Projected_by.                  
function Projected_by_Callback(hObject, eventdata, handles)                  
% Raw_listbox_Callback(hObject, eventdata, handles)                  
try                  
track_what1_Callback(hObject, eventdata, handles)                  
end                  
try                  
track_what2_Callback(hObject, eventdata, handles)                  
end                  
try                  
track_what3_Callback(hObject, eventdata, handles)                  
end                  
% ------------------------------------                  
function [matrix_out]= read_image(handles,n,segmentation_type,track_what,box_list)      
    
    
 matrix_out=[];
 
 try
    
    
    
if nargin==4                  
if segmentation_type==1                  
box_list=get(handles.Raw_listbox,'string') ;                  
end                  
if segmentation_type==2                  
box_list=get(handles.Filtered_listbox,'string') ;                  
end                  
if segmentation_type==3                  
box_list=get(handles.Segmentation_listbox,'string') ;                  
end                  
end                  
Projected_by_Value=get(handles.Projected_by,'Value')  ;                  
Projected_by_Str=get(handles.Projected_by,'String') ;                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
Projected_by=regexprep(Projected_by, 'z', '') ;                  
Projected_by=str2double(Projected_by) ;                  
matrix_out=[];                  
if iscell(box_list)                  
filename=char(box_list(n));                  
end                  
%    if   findstr(char(handles.data_file(7).cdata(track_what,2)),'Y')==1                  
%          centy1 = handles.data_file(4).cdata.Centroids(track_what).cdata(n).cdata;                  
%    end                  
try                  
if isempty(strfind(filename,'.tif'))~=1                  
filename=filename(1:max(strfind(filename, '_ch')-1));                  
end                  
end                  
try                  
if isempty(strfind(filename,'_z'))~=1                  
filename=filename(1:max(strfind(filename, '_z')-1));                  
end                  
end                  
filename=regexprep(char(filename),'.TIF','')                  
if isempty(Projected_by)~=1&& isnan(Projected_by)~=1                  
switch segmentation_type                  
case 1                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'.tif')) ;                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread_cross(full_filename) ;                  
end                  
case 2                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Filtered.tif'))                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread_cross(full_filename);                  
end                  
case 3                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Segmented.tif'))                  
a=dir(full_filename );                  
if size(a,1)~=0                  
matrix_out=imread_cross(full_filename);                  
end                  
case 4                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Filtered.tif')) ;                  
a=dir(full_filename_Filtered);                  
if size(a,1)~=0                  
temp_Filtered=imread_cross(full_filename);                  
temp_Filtered=double(temp_Filtered);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
b=dir(full_filename_Segmented);                  
if size(a,1)~=0 && size(b,1)~=0                  
temp_Segmented=imread_cross(full_filename);                  
temp_Segmented= temp_Segmented ;                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Filtered.* temp_Segmented;                  
end                  
case 5                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'.tif')) ;                  
a=dir(full_filename_Raw);                  
if size(a,1)~=0                  
temp_Raw=imread_cross(full_filename);                  
temp_Raw=double(temp_Raw);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),'z\',filename,'_z0',num2str(Projected_by),'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
b=dir(full_filename );                  
if size(a,1)~=0 && size(b,1)~=0                  
temp_Segmented=imread_cross(full_filename);                  
temp_Segmented= temp_Segmented ;                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Raw.* temp_Segmented;                  
end                  
end                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value))  ;                  
if findstr('By mean',Projected_by)                  
switch segmentation_type                  
case 1               
     
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),filename,'_ch0',num2str(track_what-1),'.tif'))      ;             
try               
matrix_out=imread_cross(full_filename);                  
end                  
case 2    
   
    
    if strcmp(handles.data_file(2).cdata(track_what,2),'')% read file without path, and reconstruct it.Limitations:  currently doesnt support z sections. only ch00
    
    filename=char(filename)
 filename=regexprep(filename, '\', filesep) 
 filename=regexprep(filename, '/', filesep) ;

 ind=findstr(filename,filesep)
 ind=ind(end)
 
 filename2=filename(1:ind-1)
  filename3=filename(ind+1:end)
 
     full_filename=char(strcat(filename2,filesep,'ch00_Filtered',filesep, filename3,'_ch00_Filtered.tif'))
 
    else
    
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),filename,'_ch0',num2str(track_what-1),'_Filtered.tif'))    
    end
try                
matrix_out=imread_cross(full_filename);                  
end                  
case 3    
    
 
        if strcmp(handles.data_file(2).cdata(track_what,2),'')% read file without path, and reconstruct it.Limitations:  currently doesnt support z sections. only ch00
 
    filename=char(filename)
 filename=regexprep(filename, '\', filesep) 
 filename=regexprep(filename, '/', filesep) ;

 ind=findstr(filename,filesep)
 ind=ind(end)
 
 filename2=filename(1:ind-1)
  filename3=filename(ind+1:end)
  
     full_filename=char(strcat(filename2,filesep,'ch00_Segmented',filesep, filename3,'_ch00_Segmented.tif'))
 
    else
    
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif'))    
        end
    
     
     
         
try               
matrix_out=imread_cross(full_filename);                  
end                  
case 4                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,2),filename,'_ch0',num2str(track_what-1),'_Filtered.tif')) ;                  
try            
temp_Filtered=imread_cross(full_filename);                  
temp_Filtered=double(temp_Filtered);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
try              
temp_Segmented=imread_cross(full_filename);                  
temp_Segmented= temp_Segmented ;                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Filtered.* temp_Segmented;                  
end                  
case 5                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,1),filename,'_ch0',num2str(track_what-1),'.tif')) ;                  
try           
temp_Raw=imread_cross(full_filename);                  
temp_Raw=double(temp_Raw);                  
end                  
full_filename = char(strcat(handles.data_file(2).cdata(track_what,3),filename,'_ch0',num2str(track_what-1),'_Segmented.tif')) ;                  
try               
temp_Segmented=imread_cross(full_filename);                  
temp_Segmented= temp_Segmented ;                  
temp_Segmented=double(temp_Segmented);                  
matrix_out=temp_Raw.* temp_Segmented;                  
end                  
end                  
end                  
set(handles.edit_axes1,'String',full_filename);                  
% set(handles.slider1,'Max',size(box_list,1));                  
% set(handles.slider1,'Min',1);                  
% set(handles.slider1,'value',n);                  
set(handles.showcurrentframe,'String',num2str(n));                  
 end
%-------------------------------------------------------------------------                  
% --- Executes on button press in pushbutton41.                  
function pushbutton41_Callback(hObject, eventdata, handles)                  
apply_segmentation_function(hObject, eventdata, handles,'Batch')                  
function figResizeFcn(hFig,varargin)    %#ok                  
handles = guidata(hFig);                  
%                  
% --- Executes during object creation, after setting all properties.                  
function slider1_CreateFcn(hObject, eventdata, handles)                  
              
function handles = addPlabackControls(hObject, handles)                  
icons = load(fullfile(fileparts(mfilename), 'animatorIcons.mat'));                  
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
% --------------------------------------------------------------------                  
function uipushtool1_ClickedCallback(hObject, eventdata, handles)                  
Untitled_7_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function uipushtool2_ClickedCallback(hObject, eventdata, handles)                  
Load_Experiment_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function uipushtool3_ClickedCallback(hObject, eventdata, handles)                  
Save_Experiment_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function uipushtool8_ClickedCallback(hObject, eventdata, handles)                  
% hObject    handle to uipushtool8 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)    

        lock_on=get(handles.lock_on,'value');
        n=get(handles.Raw_listbox,'Value') ;
switch get(handles.Vis_option,'value') 
    case 1
        
       
segmentation_type1=get(handles.segmentation_type1,'Value')                  
Raw_box=get(handles.Raw_listbox,'string')   ;                  
n=get(handles.Raw_listbox,'value')   ;                  
filename=Raw_box(n)  ;                  
track_what1=get(handles.track_what1,'Value') ;                  
pathname_Raw=handles.data_file(2).cdata(track_what1,1) ;                  
full_filename= strcat(pathname_Raw,filename,'_ch0',num2str(track_what1-1),'.tif') ;                  
full_filename=char(full_filename)  ;                  
temp= read_image(handles,n,segmentation_type1,track_what1)  ;%segmentation_type=Raw (1)                  
scrsz = get(0,'ScreenSize')  ;                  
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;                  
scrsz(3)=scrsz(4) ;                  
h=figure('color','w','units','pixels','position', scrsz) ;                  
% temp=flipdim(temp,1);                  
imagesc(temp);                  
set(gcf,'colormap',handles.c);                  
set(gcf,'UserData',temp) ;                  
xlabel('X','FontSize',12,'Color',[0 0 0]);                  
ylabel('Y','FontSize',12,'Color',[0 0 0]);                  
set(gcf,'UserData',temp) ;                  
title(filename) ;                  
filename=char(filename)                  
set(gcf,'Name', filename);
     index=1
    YLim=get(handles.axes1,'YLim')
    set(get(gcf,'children'),'ylim',YLim);
    XLim=get(handles.axes1,'XLim')
    set(get(gcf,'children'),'xlim',XLim);      
    case 2
        show_frame_colocalize(handles,n,'figure')
    case 3
        %         ??
end

  

%                    
% --------------------------------------------------------------------                  
function uipushtool9_ClickedCallback(hObject, eventdata, handles)                  
% hObject    handle to uipushtool9 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');                  
track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;                  
Filtered_listbox=get(handles.Filtered_listbox,'string') ;                  
n=get(handles.Filtered_listbox,'Value')  ;                  
temp= read_image(handles,n,segmentation_type2 ,track_what2,Filtered_listbox) ;                  
filename=Filtered_listbox(n);                  
scrsz = get(0,'ScreenSize')  ;                  
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;                  
scrsz(3)=scrsz(4) ;                  
figure('color','w','units','pixels','position', scrsz) ;                  
h=imagesc(temp);                  
set(gcf,'colormap',handles.c);                  
set(gcf,'UserData',temp) ;                  
xlabel('X','FontSize',12,'Color',[0 0 0]);                  
ylabel('Y','FontSize',12,'Color',[0 0 0]);                  
set(gcf,'UserData',temp) ;                  
title(filename) ;                  
filename=char(filename)                  
set(gcf,'Name', filename);     
 
    YLim=get(handles.axes2,'YLim')
    set(get(gcf,'children'),'ylim',YLim);
    XLim=get(handles.axes2,'XLim')
    set(get(gcf,'children'),'xlim',XLim);
    
% --------------------------------------------------------------------                  
function uipushtool10_ClickedCallback(hObject, eventdata, handles)                  
% hObject    handle to uipushtool10 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
Segmented_box=get(handles.Segmentation_listbox,'string')   ;                  
n=get(handles.Segmentation_listbox,'value')   ;                  
filename=Segmented_box(n)  ;                  
track_what3=get(handles.track_what3,'Value') ;                  
pathname_Segmented=handles.data_file(2).cdata( track_what3,3) ;                  
full_filename= strcat(pathname_Segmented,filename) ;                  
segmentation_type3=get(handles.segmentation_type3,'Value')                  
full_filename=char(full_filename)  ;                  
temp= read_image(handles,n, segmentation_type3,track_what3);  %segmentation_type=Raw (1)                  
if handles.flag.bwlabel==1                  
temp=bwlabel(temp);                  
r=rand(1,max(max(temp)));                  
[r1,r2]=sort(r);                  
temp0=zeros(size(temp));                  
for ii=1:max(max(temp))                  
temp0(temp==ii)=r2(ii);                  
end                  
  temp =temp0 ;                  
                
end                  
scrsz = get(0,'ScreenSize')  ;                  
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;                  
scrsz(3)=scrsz(4) ;                  
figure('color','w','units','pixels','position', scrsz) ;                  
imagesc(temp);                  
set(gcf,'colormap',handles.c);                  
set(gcf,'UserData',temp) ;                  
xlabel('X','FontSize',12,'Color',[0 0 0]);                  
ylabel('Y','FontSize',12,'Color',[0 0 0]);                  
set(gcf,'UserData',temp) ;                  
title(filename) ;                  
filename=char(filename)                  
set(gcf,'Name', filename);  
    YLim=get(handles.axes3,'YLim')
    set(get(gcf,'children'),'ylim',YLim);
    XLim=get(handles.axes3,'XLim')
    set(get(gcf,'children'),'xlim',XLim);
% --- Executes on slider movement.                  
function slider2_Callback(hObject, eventdata, handles)                  
                 
% --- Executes during object creation, after setting all properties.                  
function slider2_CreateFcn(hObject, eventdata, handles)                  
                   
% --- Executes on selection change in track_what2.                  
function track_what2_Callback(hObject, eventdata, handles)                  
create_Filtered_listbox(handles)
    
% -------------                  
try                  
Filtered_listbox_Callback(hObject, eventdata, handles)                  
end 

 function create_Filtered_listbox(handles)
        
        
   segmentation_type2=get(handles.segmentation_type2,'Value') ;                  
track_what2=get(handles.track_what2,'Value') ;                  
Projected_by_Value=get(handles.Projected_by,'Value')  ;                  
Projected_by_Str=get(handles.Projected_by,'String') ;                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
Projected_by=regexprep(Projected_by, 'z', '') ;                  
Projected_by=str2double(Projected_by)  ;                  
if isempty(Projected_by)~=1&& isnan(Projected_by)~=1                  
switch   segmentation_type2                  
case 1                  
string=char(strcat(handles.data_file(2).cdata(track_what2,1),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what2-1),'.tif')) ; Filtered_dir= dir(string);                  
if size(Filtered_dir,1)>0                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
a= Filtered_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-9:end);   Filtered_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
%                                 Filtered_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Filtered_listbox,'String', 'Filtered Frame') ; set(handles.Filtered_listbox,'value', 1) ;                  
end                  
case 2                  
string=char(strcat(handles.data_file(2).cdata(track_what2,2),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what2-1),'_Filtered.tif')) ; Filtered_dir= dir(string);                  
if size(Filtered_dir,1)>0                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
a= Filtered_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-18:end);   Filtered_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
%                                 Filtered_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Filtered_listbox,'String', 'Filtered Frame') ; set(handles.Filtered_listbox,'value', 1) ;                  
end                  
case 3                  
string=char(strcat(handles.data_file(2).cdata(track_what2,3),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what2-1),'_Segmented.tif'));  Filtered_dir= dir(string);                  
if size(Filtered_dir,1)>0                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
a= Filtered_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-19:end);   Filtered_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
%                                    Filtered_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Filtered_listbox,'String', 'Filtered Frame') ; set(handles.Filtered_listbox,'value', 1) ;                  
end                  
end                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
if findstr('By mean',Projected_by)                  
switch   segmentation_type2                  
case 1                  
string=char(strcat(handles.data_file(2).cdata(track_what2,1),  '*ch0',num2str(track_what2-1),'.tif'))     ;  Filtered_dir= dir(string)  ;                  
if size(Filtered_dir,1)>0                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
a= Filtered_dir(ii).name                  
Reduce=a(findstr(a,'.tif')-5:end)                  
Filtered_box(ii)=  cellstr(char(regexprep(a, Reduce, ''))) ;                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
%                               Filtered_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Filtered_listbox,'String', 'Filtered Frame') ;  set(handles.Filtered_listbox,'value', 1) ;                  
end                  
case 2                  
string=char(strcat(handles.data_file(2).cdata(track_what2,2),  '*ch0',num2str(track_what2-1),'_Filtered.tif'))     ;  Filtered_dir= dir(string)  ;                  
if size(Filtered_dir,1)>0                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
a= Filtered_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-14:end);   Filtered_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
%                               Filtered_listbox_Callback(hObject, eventdata, handles)                  
else    
     
  set(handles.Filtered_listbox,'String', 'Filtered Frame') ;  set(handles.Filtered_listbox,'value', 1) ;  
end                  
case 3                  
string=char(strcat(handles.data_file(2).cdata(track_what2,3),  '*ch0',num2str(track_what2-1),'_Segmented.tif'))  ;    Filtered_dir= dir(string) ;                  
if size(Filtered_dir,1)>0                  
Filtered_box =cell(size(Filtered_dir));                  
for ii=1:size(Filtered_dir,1)                  
a= Filtered_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-15:end);   Filtered_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Filtered_listbox,'String', Filtered_box) ;                  
set(handles.Segmenttion_panel,'Visible','on');                  
%                                Filtered_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Filtered_listbox,'String', 'Filtered Frame') ; set(handles.Filtered_listbox,'value', 1) ;                  
end                  
end                  
end      
        
        
        
% --- Executes on selection change in track_what3.                  
function track_what3_Callback(hObject, eventdata, handles)     
    create_Segmentation_listbox(handles)
    try                  
Segmentation_listbox_Callback(hObject, eventdata, handles)                  
    end 
 
    function create_Segmentation_listbox(handles)
segmentation_type3=get(handles.segmentation_type3,'Value')  ;                  
track_what3=get(handles.track_what3,'Value') ;                  
Projected_by_Value=get(handles.Projected_by,'Value')  ;                  
Projected_by_Str=get(handles.Projected_by,'String') ;                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
Projected_by=regexprep(Projected_by, 'z', '') ;                  
Projected_by=str2double(Projected_by)  ;                  
if isempty(Projected_by)~=1&& isnan(Projected_by)~=1                  
switch   segmentation_type3                  
case 1                  
set(handles.Segmentation_listbox,'String', handles.data_file(1).cdata(:,1))                  
string=char(strcat(handles.data_file(2).cdata(track_what3,1),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what3-1),'.tif')) ;                  
Segmented_dir= dir(string)  ;                  
if size(Segmented_dir,1)>0                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
a= Segmented_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-9:end);   Segmented_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
%                              Segmentation_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Segmentation_listbox,'String', 'Segmented Frame') ;  set(handles.Segmentation_listbox,'value', 1 )                  
end                  
case 2                  
string=char(strcat(handles.data_file(2).cdata(track_what3,2),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what3-1),'_Filtered.tif')) ; Segmented_dir= dir(string);                  
if size(Segmented_dir,1)>0                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
a= Segmented_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-18:end);   Segmented_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
%                              Segmentation_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Segmentation_listbox,'String', 'Segmented Frame') ;  set(handles.Segmentation_listbox,'value', 1 )                  
end                  
case 3                  
string=char(strcat(handles.data_file(2).cdata(track_what3,3),  'z\*_z0',num2str(Projected_by),'_ch0',num2str(track_what3-1),'_Segmented.tif'));  Segmented_dir= dir(string);                  
if size(Segmented_dir,1)>0                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
a= Segmented_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-19:end);   Segmented_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
%               Segmentation_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Segmentation_listbox,'String', 'Segmented Frame') ;  set(handles.Segmentation_listbox,'value', 1 )                  
end                  
end                  
end                  
Projected_by=char(Projected_by_Str(Projected_by_Value));                  
if findstr('By mean',Projected_by)                  
switch   segmentation_type3                  
case 1                  
string=char(strcat(handles.data_file(2).cdata(track_what3,1),  '*ch0',num2str(track_what3-1),'.tif'))     ;  Segmented_dir= dir(string) ;                  
if size(Segmented_dir,1)>0                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
a= Segmented_dir(ii).name ;    Reduce=a(findstr(a,'.tif')- 5:end);   Segmented_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
%            Segmentation_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Segmentation_listbox,'String', 'Segmented Frame') ;  set(handles.Segmentation_listbox,'value', 1 )                  
end                  
case 2                  
string=char(strcat(handles.data_file(2).cdata(track_what3,2),  '*ch0',num2str(track_what3-1),'_Filtered.tif'))     ;  Segmented_dir= dir(string) ;                  
if size(Segmented_dir,1)>0                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
a= Segmented_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-14:end);   Segmented_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
%            Segmentation_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Segmentation_listbox,'String', 'Segmented Frame') ;  set(handles.Segmentation_listbox,'value', 1 )                  
end                  
case 3                  
string=char(strcat(handles.data_file(2).cdata(track_what3,3),  '*ch0',num2str(track_what3-1),'_Segmented.tif'))  ;                  
Segmented_dir= dir(string) ;                  
if size(Segmented_dir,1)>0                  
Segmented_box =cell(size(Segmented_dir));                  
for ii=1:size(Segmented_dir,1)                  
a= Segmented_dir(ii).name ;    Reduce=a(findstr(a,'.tif')-15:end);   Segmented_box(ii)=  cellstr(char(regexprep(a, Reduce, '')));                  
end                  
set(handles.Segmentation_listbox,'String', Segmented_box) ;                  
set(handles.Segmentation_panel,'Visible','on');                  
%               Segmentation_listbox_Callback(hObject, eventdata, handles)                  
else                  
set(handles.Segmentation_listbox,'String', 'Segmented Frame') ;  set(handles.Segmentation_listbox,'value', 1 )                  
end                  
end                  
end                  
                  
% --- Executes on selection change in segmentation_type1.                  
function segmentation_type1_Callback(hObject, eventdata, handles)                  
% hObject    handle to segmentation_type1 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
track_what1_Callback(hObject, eventdata, handles)                  
% Hints: contents = get(hObject,'String') returns segmentation_type1 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from segmentation_type1                  
% --- Executes during object creation, after setting all properties.                  
function segmentation_type1_CreateFcn(hObject, ~, handles)                  
    function segmentation_type2_CreateFcn(hObject, eventdata, handles)             
% --- Executes on selection change in segmentation_type2.                  
function segmentation_type2_Callback(hObject, eventdata, handles)
     if get(handles.segmentation_type2,'value')==1  || get(handles.segmentation_type2,'value')==2
        set(handles.Flip_Red,'value',0)
    end
      if get(handles.segmentation_type2,'value')==3
        set(handles.Flip_Red,'value',1)
      end 
track_what2_Callback(hObject, eventdata, handles)                  
% --- Executes during object creation, after setting all properties.                  
                 
                
% --- Executes on selection change in segmentation_type3.                  
function segmentation_type3_Callback(hObject, eventdata, handles)  
       if get(handles.segmentation_type3,'value')==1  || get(handles.segmentation_type3,'value')==2
        set(handles.Flip_Blue,'value',0)
    end
      if get(handles.segmentation_type3,'value')==3
        set(handles.Flip_Blue,'value',1)
      end  
  
track_what3_Callback(hObject, eventdata, handles)                  
% Hints: contents = get(hObject,'String') returns segmentation_type3 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from segmentation_type3                  
% --- Executes during object creation, after setting all properties.                  
function segmentation_type3_CreateFcn(hObject, eventdata, handles)                  
                 
% --------------------------------------------------------------------                  
function uipushtool17_ClickedCallback(hObject, eventdata, handles)                  
% hObject    handle to uipushtool17 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
set(handles.Segmentation_panel,'Visible','on');  set(handles.Segmenttion_panel,'Visible','on');                  
% --- Executes on button press in Robust_Filtering_on.                  
function Robust_Filtering_on_Callback(hObject, eventdata, handles)                  
               
function Robust_Segmenting_on_Callback(hObject, eventdata, handles)                  
% hObject    handle to Robust_Segmenting_on (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of Robust_Segmenting_on                  
% Hints: contents = cellstr(get(hObject,'String')) returns F_popup_3 contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from F_popup_3                  
% --------------------------------------------------------------------                  
function Untitled_13_Callback(hObject, eventdata, handles)                  
% hObject    handle to Untitled_13 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --------------------------------------------------------------------                  
function Untitled_15_Callback(hObject, eventdata, handles)                  
% hObject    handle to Untitled_15 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --- Executes on button press in mask_option_on.                  
function mask_option_on_Callback(hObject, eventdata, handles)                  
% hObject    handle to mask_option_on (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hint: get(hObject,'Value') returns toggle state of mask_option_on                  
% --- Executes on selection change in segmentation_method.                  
function segmentation_method_Callback(hObject, eventdata, handles)                  
ii=1                  
switch get(handles.segmentation_method,'value')                  
case 1                  
set(handles.Auto_thresh_on,'Visible','on');                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'));                  
case 2                  
set(handles.Auto_thresh_on,'Visible','off');    set(handles.Auto_thresh_on,'Value',0);                  
ii=1                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''off''', ')'));                  
case 3                  
set(handles.Auto_thresh_on,'Visible','off');    set(handles.Auto_thresh_on,'Value',0);                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));                  
if   get(handles.Bits,'value')==1                    
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',255)'));                  
elseif get(handles.Bits,'value')==2                   
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',65535)'));                  
end                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));                  
eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'));                  
end                  
% --- Executes during object creation, after setting all properties.                  
function segmentation_method_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to segmentation_method (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
%       See ISPC and COMPUTER.                  
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))                  
set(hObject,'BackgroundColor','white');                  
end                  
  
               
% --------------------------------------------------------------------                  
function Spectral_unmixing_Callback(hObject, eventdata, handles)                  
set(handles.track_what1,'value',1); set(handles.track_what3,'value',2);set(handles.segmentation_type3,'value',1)                  
track_what1_Callback(hObject, eventdata, handles)                  
track_what3_Callback(hObject, eventdata, handles)                  
Raw_listbox_Callback(hObject, eventdata, handles)                  
Segmentation_listbox_Callback(hObject, eventdata, handles)                  
set(handles.F_popup_1,'value',17);                  
F_popup_1_Callback(hObject, eventdata, handles)                  
msgbox('set coef value for unmix')                  
% --------------------------------------------------------------------                  
function run_Change_LUT_Callback(hObject, eventdata, handles)                  
handles.c=change_LUT ;                  
guidata(hObject,handles);                  
set(gcf,'colormap',handles.c);                  
function Untitled_14_Callback(hObject, eventdata, handles)                  
switch  handles.flag.bwlabel                  
case 0                  
handles.flag.bwlabel=1;                  
case 1                  
handles.flag.bwlabel=2;                  
case 2                  
handles.flag.bwlabel=0;                  
end                  
guidata(hObject,handles);                  
Segmentation_listbox_Callback(hObject, eventdata, handles)                  
function Untitled_20_Callback(hObject, eventdata, handles)                  
% --------------------------------------------------------------------                  
function Untitled_19_Callback(hObject, eventdata, handles)                  
if   handles.flag.axis1==-1                  
axes(handles.axes1)                  
colorbar                  
set(handles.axes1,'Xcolor','y'); set(handles.axes1,'Ycolor','y')                  
else                  
axes(handles.axes1)                  
colorbar('off')                  
set(handles.axes1,'Xcolor','k'); set(handles.axes1,'Ycolor','k')                  
end                  
handles.flag.axis1=handles.flag.axis2*(-1);                  
guidata(hObject, handles);                  
% --------------------------------------------------------------------                  
% hObject    handle to Untitled_20 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --------------------------------------------------------------------                  
function Untitled_21_Callback(hObject, eventdata, handles)                  
if   handles.flag.axis2==-1                  
axes(handles.axes2)                  
colorbar                  
set(handles.axes2,'Xcolor','y'); set(handles.axes2,'Ycolor','y')                  
else                  
axes(handles.axes2)                  
colorbar('off')                  
set(handles.axes2,'Xcolor','k'); set(handles.axes2,'Ycolor','k')                  
end                  
handles.flag.axis2=handles.flag.axis2*(-1);                  
guidata(hObject, handles);                  
% --------------------------------------------------------------------                  
function Untitled_22_Callback(hObject, eventdata, handles)                  
if   handles.flag.tif==-1                  
set(handles.tif_panel,'visible','on')                  
else                  
set(handles.tif_panel,'visible','off')                  
end                  
handles.flag.tif=handles.flag.tif*(-1);                  
guidata(hObject, handles);                  
% --------------------------------------------------------------------                  
function Untitled_23_Callback(hObject, eventdata, handles)                  
axes(handles.axes1)                  
start_row = 1478;                  
end_row = 2246;                  
answer = inputdlg('Please input pixel size (in um)');                  
answer=str2double(char(answer));                  
um_per_pixel = answer;                  
rows = [start_row um_per_pixel end_row];                  
start_col = 349;                  
end_col = 1117;                  
cols = [start_col um_per_pixel end_col];                  
hline = imdistline(gca,[50 00],[100 150]);                  
api = iptgetapi(hline);                  
api.setLabelTextFormatter('%02.0f um');                  
api = iptgetapi(hline);                  
wait(hline)  ;                  
api.delete()                  
% --------------------------------------------------------------------                  
function Untitled_24_Callback(hObject, eventdata, handles)                  
% hObject    handle to Untitled_24 (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% --------------------------------------------------------------------                  
function Untitled_25_Callback(hObject, eventdata, handles)                  
n=get(handles.Segmentation_listbox,'Value') ;                  
track_what3=get(handles.track_what3,'Value') ;                  
Segmentation_listbox=get(handles.Segmentation_listbox,'string')  ;                  
segmentation_type3=get(handles.segmentation_type3,'Value');                  
Segmentation_listbox=get(handles.Segmentation_listbox,'string')  ;                  
DATA= read_image(handles,n,segmentation_type3,track_what3,Segmentation_listbox) ;  %segmentation_type=Raw (1)                  
[filename, pathname, filterindex] = uiputfile({  '*.dat','DAT-files (*.dat)';}, 'save segmented image as .dat file for sub-sectional division');                  
if isequal(filename,0)  %$#1                  
h = msgbox('User selected Cancel','Aborted');                  
return;                  
end                  
filename=regexprep(filename, 'BacFormatics_subsection_','')                  
full_filename= char(strcat(pathname,'BacFormatics_subsection_',filename) );                  
save(full_filename, 'DATA') ;                  


% --- Executes on selection change in Bits.
function Bits_Callback(hObject, eventdata, handles)
% hObject    handle to Bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Bits contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Bits


% --- Executes during object creation, after setting all properties.
function Bits_CreateFcn(hObject, eventdata, handles)
 
 


% --- Executes on selection change in Vis_option.
function Vis_option_Callback(hObject, eventdata, handles)
 

% --- Executes during object creation, after setting all properties.
function Vis_option_CreateFcn(hObject, eventdata, handles)
 



function Blue_factor_edit_Callback(hObject, eventdata, handles)
 

% --- Executes during object creation, after setting all properties.
function Blue_factor_edit_CreateFcn(hObject, eventdata, handles)
 



function Green_factor_edit_Callback(hObject, eventdata, handles)
 

% --- Executes during object creation, after setting all properties.
function Green_factor_edit_CreateFcn(hObject, eventdata, handles)
 



function Red_factor_edit_Callback(hObject, eventdata, handles)
  
function Red_factor_edit_CreateFcn(hObject, eventdata, handles)
 


% --- Executes on slider movement.
function Blue_factor_Callback(hObject, eventdata, handles)
Blue_factor=get(handles.Blue_factor,'value');                  
set(handles.Blue_factor_edit,'string',num2str(Blue_factor))                  
Raw_listbox_Callback(hObject, eventdata, handles)  
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Blue_factor_CreateFcn(hObject, eventdata, handles)
 

% --- Executes on slider movement.
function Green_factor_Callback(hObject, eventdata, handles)
Green_factor=get(handles.Green_factor,'value');                  
set(handles.Green_factor_edit,'string',num2str(Green_factor))                  
Raw_listbox_Callback(hObject, eventdata, handles)  
% --- Executes during object creation, after setting all properties.
function Green_factor_CreateFcn(hObject, eventdata, handles)
 


% --- Executes on slider movement.
function Red_factor_Callback(hObject, eventdata, handles)
Red_factor=get(handles.Red_factor,'value');                  
set(handles.Red_factor_edit,'string',num2str(Red_factor))                  
Raw_listbox_Callback(hObject, eventdata, handles)  

% --- Executes during object creation, after setting all properties.
function Red_factor_CreateFcn(hObject, eventdata, handles)
 


%%%%%%%%%%%%%%%%%%%%%%5
function show_frame_colocalize(handles,n,MODE)                     
               
                   
         
                       
Nbits=[8 16 32];  Nbits2=get(handles.Bits,'value');  Nbits=Nbits(Nbits2);

Xdim=handles.data_file(6).cdata(4) ;                  
Ydim=handles.data_file(6).cdata(3) ;                  
                    
Blue_factor=get(handles.Blue_factor,'value') ;                  
Green_factor=get(handles.Green_factor,'value') ;                  
Red_factor=get(handles.Red_factor,'value')  ;                   
DIC_temp=[]  ; Red=[]; Green=[]; Blue=[];  


 Raw_listbox= get(handles.Raw_listbox,'string');
  track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;
 segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');
 
      
      
      
      
     Green = read_image(handles,n,segmentation_type1,track_what1,  Raw_listbox )  ; 
        Red =  read_image(handles,n,segmentation_type2,track_what2,  Raw_listbox )  ; 
        Blue =   read_image(handles,n,segmentation_type3,track_what3,  Raw_listbox )  ; 
        
        
        
   if get(handles.Flip_Red,'value')==1
     Red=flipdim(Red,1);
 end
  if get(handles.Flip_Blue,'value')==1 
       Blue=flipdim(Blue,1);  
 end
        
        
%      if  segmentation_type1==3
%          Red=flipdim(Red,1);
%      end
%        if  segmentation_type2==3
%          Green=flipdim(Green,1);
%        end
%        if  segmentation_type3==3
%          Blue=flipdim(Blue,1);
%        end
     
     
        
        
Red = double(Red) *Red_factor;   
Green = double(Green) *Green_factor; 
Blue = double(Blue) *Blue_factor;               
                   
                   
if Nbits==8
    if isempty(Red)
        Red=uint8(zeros(Xdim,Ydim,1));
    else
        Red=uint8((Red./(max(max(Red))))*255);
    end
    if isempty(Green)
        Green=uint8(zeros(Xdim,Ydim,1));
    else
        Green=uint8((Green./(max(max(Green))))*255) ;
    end
    if isempty(Blue)
        Blue=uint8(zeros(Xdim,Ydim,1));
    else
        Blue=uint8((Blue./(max(max(Blue))))*255);
    end
elseif  Nbits==16
    if isempty(Red)
        Red=uint16(zeros(Xdim,Ydim,1));
    else
        Red=uint16((Red./(max(max(Red))))*65535);
    end
    if isempty(Green)
        Green=uint16(zeros(Xdim,Ydim,1));
    else
        Green=uint16((Green./(max(max(Green))))*65535) ;
    end
    if isempty(Blue)
        Blue=uint16(zeros(Xdim,Ydim,1));
    else
        Blue=uint16((Blue./(max(max(Blue))))*65535);
    end
elseif  Nbits==32
    if isempty(Red)
        Red=uint32(zeros(Xdim,Ydim,1));
    else
        Red=uint32((Red./(max(max(Red))))*2^32);
    end
    if isempty(Green)
        Green=uint32(zeros(Xdim,Ydim,1));
    else
        Green=uint32((Green./(max(max(Green))))*2^32) ;
    end
    if isempty(Blue)
        Blue=uint32(zeros(Xdim,Ydim,1));
    else
        Blue=uint32((Blue./(max(max(Blue))))*2^32);
    end
end
        
% figure



% Close
%       Blue=Blue./255    ; Green=Green./255    ;
% Blue(Green==0)=1;
%                   matrix_out =Blue;%  double(Green)+double(Blue) ;
     matrix_out = cat(3, Red , Green , Blue );                    
            
if nargin==3                  
if strcmp(MODE,'figure')    
    
    
    
                    
Raw_box=get(handles.Raw_listbox,'string')   ;                  
n=get(handles.Raw_listbox,'value')   ;                  
filename=Raw_box(n)  ;                  
track_what1=get(handles.track_what1,'Value') ;                  
pathname_Raw=handles.data_file(2).cdata(track_what1,1) ;                  
full_filename= strcat(pathname_Raw,filename,'_ch0',num2str(track_what1-1),'.tif') ;                  
full_filename=char(full_filename)  ;                  
 
 

% 

scrsz = get(0,'ScreenSize')  ;                  
scrsz(1)=(scrsz(3)-scrsz(4))/2 ;                  
scrsz(3)=scrsz(4) ;                  
h=figure('color','w','units','pixels','position', scrsz) ;       



                   
imagesc(matrix_out ) ;  


% 
% temp=flipdim(temp,1);                  
% imagesc(temp);                  
set(gcf,'colormap',handles.c);                  
set(gcf,'UserData',matrix_out) ;                  
xlabel('X','FontSize',12,'Color',[0 0 0]);                  
ylabel('Y','FontSize',12,'Color',[0 0 0]);                  
                  
title(filename) ;                  
filename=char(filename)                  
set(gcf,'Name', filename);
     index=1
    YLim=get(handles.axes1,'YLim')
    set(get(gcf,'children'),'ylim',YLim);
    XLim=get(handles.axes1,'XLim')
    set(get(gcf,'children'),'xlim',XLim);   
    

 
% 
% 
% set(gca,'Ydir','reverse',  'units','normalize', 'Position',[0.05 0.05 1 1])                   
% xlabel('X','FontSize',12,'Color',[1 1 0]);                  
% ylabel('Y','FontSize',12,'Color',[1 1 0]);                   
% filename=char(filename);                  
% title(filename) ;                  
% imagesc(matrix_out, 'Hittest','Off') ;                    
% set(h,'userdata',matrix_out)                  
% index=1                  
% YLim=get(handles.axes1,'YLim')                   
% set(get(h,'children'),'ylim',YLim);                  
% XLim=get(handles.axes1,'XLim')                   
% set(get(h,'children'),'xlim',XLim);                  
end                  
else                   
axes(handles.axes1);                  
cla(handles.axes1);                    
imagesc(matrix_out, 'Hittest','Off') ;                    
end                  
%%%%%%%%%%%%%%%
save matrix_out matrix_out

% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

   

 pathname_Raw=handles.data_file(2).cdata( 2 ,3)            
segmentation_type2=3%get(handles.segmentation_type2,'Value') ;   %  segmentatiom             
track_what2=3%get(handles.track_what2,'Value') ;           %   ch2
Filtered_listbox=get(handles.Filtered_listbox,'string') ;  %
Raw_listbox=get(handles.Raw_listbox,'string') ;  %rawe
 for  ii=1:size(Filtered_listbox,1)
    if ii==1
        temp1= read_image(handles,ii,segmentation_type2 ,track_what2,Filtered_listbox) ;   
temp2= read_image(handles,ii+1,segmentation_type2 ,track_what2,Filtered_listbox) ;   
       
     
    end
%     if ii==2
%             temp1= read_image(handles,ii,segmentation_type2 ,track_what2,Filtered_listbox) ;   
% temp2= read_image(handles,ii+1,segmentation_type2 ,track_what2,Filtered_listbox) ;   
%       temp3= read_image(handles,ii-1,segmentation_type2 ,track_what2,Filtered_listbox) ;   
%  
%         
%     end
    if ii>1
temp1= read_image(handles,ii,segmentation_type2 ,track_what2,Filtered_listbox) ;   
temp2= read_image(handles,ii-1,segmentation_type2 ,track_what2,Filtered_listbox) ;   
    end
     
  temp=temp1+temp2; 
  filename=Raw_listbox(ii) ;
%     if track_what3==3
  full_filename=char(strcat( pathname_Raw , filename,'_ch03_Segmented.tif'))
%   end
%   if track_what3==4
%   full_filename=char(strcat( pathname_Segmented, filename,'_ch04_Segmented.tif'))
%   end
%     if track_what3==5
%   full_filename=char(strcat( pathname_Segmented, filename,'_ch05_Segmented.tif'))
%   end
%     if track_what3==6
%   full_filename=char(strcat( pathname_Segmented, filename,'_ch06_Segmented.tif'))
%     end
%   temp=rot90(rot90(rot90(temp )));
    imwrite(temp,  full_filename)
   
 end
  track_what3_Callback(hObject, eventdata, handles)                  


% --- Executes on button press in Flip_Red.
function Flip_Red_Callback(hObject, eventdata, handles)
 


% --- Executes on button press in Flip_Blue.
function Flip_Blue_Callback(hObject, eventdata, handles)
 
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
    
    
%     normal left
%     alt right
%   open double click
%   extend mouse wheel button
%   
  
    global Mode cx cy Draw mode_8
    sel_typ = get(gcbf,'SelectionType') ;
    
    
    if strcmp(sel_typ,'extend')==1
        Mode = 'pan' ;
        set(gcf,'Pointer','fleur')
        point_axes = get(handles.axes1, 'CurrentPoint') ;
        cx = point_axes(2,1);
        cy = point_axes(2,2) ;
       set(handles.mode_text,'string','Pan','Visible','on') 
    end
    
    if strcmp(sel_typ,'alt')==1
        if mode_8==1
            Draw = 1 ;  set(gcf,'Pointer','circle')
               set(handles.mode_text,'string','Painting:destructive','Visible','on') 
        end
    end
         if strcmp(sel_typ,'normal')==1
        if mode_8==1
            set(handles.mode_text,'string','Painting:contrastive','Visible','on') 
            Draw = -1 ;  set(gcf,'Pointer','circle')
        end
         end
    
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 zoom(handles.axes1, 'off')
 pan(handles.axes1, 'off')
 
  global Mode Draw mode_8
  Mode = '' ;Draw=0;
 set(gcf,'Pointer','arrow') 
  set(handles.mode_text ,'Visible','off') 

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 if  toc<0.05
    return
end
tic

    
    point_axes = get(handles.axes1, 'CurrentPoint') ; 
      x = point_axes(2,1)  ;
      y = point_axes(2,2)  ; 
  
     
     global Mode Draw mode_8 cx cy
   
    
 
if strcmp(Mode, 'pan')
    
    % calc change in position
    [x_rel, y_rel] = abs2relCoords(handles.axes1, x, y);
    [cx_rel, cy_rel] = abs2relCoords(handles.axes1, cx, cy);
    delta_x_rel = x_rel - cx_rel;
    delta_y_rel = y_rel - cy_rel;
    
    % set new limits
    [new_xlim(1) new_ylim(1)] = rel2absCoords(handles.axes1, -delta_x_rel, -delta_y_rel);
    [new_xlim(2) new_ylim(2)] = rel2absCoords(handles.axes1, 1-delta_x_rel, 1-delta_y_rel);
    
     if get(handles.lock_on,'value')==1
          setNewLimits(handles.axes1, new_xlim, new_ylim);  
           setNewLimits(handles.axes2, new_xlim, new_ylim);  
            setNewLimits(handles.axes3, new_xlim, new_ylim);  
     else
    setNewLimits(handles.axes1, new_xlim, new_ylim);  
     end
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on scroll wheel click while the figure is in focus.
function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
 
if  toc<0.01
    return
end
tic

global Mode 
  
  xy1 =get(handles.axes1, 'Position') ; 
  point  = get(gcf,'CurrentPoint')  ;
  if xy1(1)>point(1,1) || xy1(2)>point(1,2) || point(1,1)>(xy1(1)+xy1(3))|| point(1,2)>(xy1(2)+xy1(4)) 
      return
  end
 
 
if ~(strcmp(Mode, 'Sliding-frames'))
    
point_axes = get(handles.axes1, 'CurrentPoint') ; 
      x = point_axes(2,1)  ;
      y = point_axes(2,2)  ; 

      XLim = get(handles.axes1, 'xlim') 
    YLim = get(handles.axes1, 'ylim') 
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
      
      
      
        if get(handles.lock_on,'value')==1
            
                  setNewLimits(handles.axes1, new_xlim, new_ylim) 
                        setNewLimits(handles.axes2, new_xlim, new_ylim) 
                              setNewLimits(handles.axes3, new_xlim, new_ylim) 
        else
                setNewLimits(handles.axes1, new_xlim, new_ylim)   
        end
      
      
      
return 
end
  

 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
    
 
 


 


% --- Executes on button press in Show_contour.
function Show_contour_Callback(hObject, eventdata, handles)
% hObject    handle to Show_contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
if get(hObject,'value')
    set(hObject,'ForegroundColor','y')
else
    set(hObject,'ForegroundColor','w')
end
Raw_listbox_Callback(hObject, eventdata, handles) 
% --- Executes on button press in show_segment.
function show_segment_Callback(hObject, eventdata, handles)
    
if get(hObject,'value')
    set(hObject,'ForegroundColor','y')
else
    set(hObject,'ForegroundColor','w')
end
Raw_listbox_Callback(hObject, eventdata, handles) 
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Show_contour.
function Show_contour_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Show_contour (see GCBO)
if handles.flags.Contour==1
    handles.flags.Contour=0;
else
    handles.flags.Contour=1;
end
guidata(hObject, handles);
 
Raw_listbox_Callback(hObject, eventdata, handles) 


 function slider2ContValCallback(hFigure,eventdata, handles)
 % test it out - get the handles object and display the current value
 handles = guidata(hFigure) ;
n=get(handles.slider2,'Value')  
 n=round(n)   
   
    
    set(handles.Projected_by,'value',n)
    
    if (n~=1 && n<8)
        
        Raw_listbox_Callback([], [], handles)
    end
 
 
  function slider1ContValCallback(hFigure,eventdata)
     
    handles = guidata(hFigure) ; 
     
n = round(get(handles.slider1,'Value'))  
 
 
 
 
 if  toc<0.05                  
return                  
end                  
try                  
           
set(handles.Raw_listbox,'Value',n)                  
%   ---                  
Raw_listbox= get(handles.Raw_listbox,'string');                  
track_what1=get(handles.track_what1,'Value') ; track_what2=get(handles.track_what2,'Value') ; track_what3=get(handles.track_what3,'Value') ;                  
segmentation_type1=get(handles.segmentation_type1,'Value');segmentation_type2=get(handles.segmentation_type2,'Value');segmentation_type3=get(handles.segmentation_type3,'Value');                  
temp= read_image(handles,n,segmentation_type1,track_what1,  Raw_listbox )  ;%segmentation_type=Raw (1)                  
axes(handles.axes1); cla                  
imagesc(temp);                  
if get(handles.lock_on,'value')==1                  
filename_Raw=char(Raw_listbox(n)) ;                  
Filtered_listbox=get(handles.Filtered_listbox,'string')   ;                  
Segmentation_listbox=get(handles.Segmentation_listbox,'string')   ;                  
try                  
temp= read_image(handles,n,segmentation_type2,track_what2,get(handles.Filtered_listbox,'string') )  ;                  
axes(handles.axes2); cla                  
imagesc(temp);                  
set(handles.Filtered_listbox,'value',n);                  
end                  
%                  
%    end                  
%    if jjj<(size(Segmentation_listbox,1)+1)                  
try                  
temp= read_image(handles,n,segmentation_type3  ,track_what3,get(handles.Segmentation_listbox,'string') )  ;                  
axes(handles.axes3);  cla                  
if get(handles.segmentation_type3,'value')==3   
    
 if handles.flag.bwlabel==0  
     imagesc(temp); 
 end
if handles.flag.bwlabel==1                  
temp=bwlabel(temp);
r=rand(1,max(max(temp)));                  
[r1,r2]=sort(r);                  
temp0=zeros(size(temp));                  
for ii=1:max(max(temp))                  
temp0(temp==ii)=r2(ii);                  
end                  
imagesc(temp0);  
end                  
                   
if handles.flag.bwlabel==2                  
temp=bwlabel(temp);                  
r=rand(1,max(max(temp)));                  
[r1,r2]=sort(r);                  
temp0=zeros(size(temp));                  
for ii=1:max(max(temp))                  
temp0(temp==ii)=r2(ii);                  
end                  
imagesc(temp0);   
end

else
  imagesc( temp );  
end                  
set(handles.Segmentation_listbox,'value',n);                  
end                  
end                  
%   axis   tight                  
%   --                  
set(handles.showcurrentframe,'String',num2str(n));                  
tic;                  
catch                  
% never mind                  
a=1;  %debug point                  
end                  
setappdata(hObject,'inCallback',[]);      
 
 
 
 
 
 
  


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
