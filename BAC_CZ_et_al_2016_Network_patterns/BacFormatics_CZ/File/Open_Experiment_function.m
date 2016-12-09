% ---------------------------------------------------
function Open_Experiment_function(hObject, eventdata, handles,full_filename,pathname)

h=waitbar(0,'Loading experiment file, please wait');  
 
BAC_NAME=get(handles.figure1,'Name');
NAME= BAC_NAME(1:findstr(BAC_NAME,'>')) ;
full_filename=regexprep(full_filename, '\', filesep) ;
full_filename=regexprep(full_filename, '/', filesep) ;
handles.data_file=importdata(full_filename);


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
set(handles.track_what1,'Value',1);      set(handles.track_what2,'Value',1);
str=[];
str=handles.data_file(3).cdata(track_what,1);
if str2double(str)<1
    set(handles.track_what1,'Value',1);   set(handles.track_what2,'Value',1);
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
            handles.C=distinguishable_colors_BACWrapper(64,'k');  set(handles.track_what2,'userdata',handles.C)
        end
        
        
    end
    guidata(hObject,handles)
    
end

update_labelmatrix(handles)

global Ch00_stack_Segmented
Ch00_stack_Segmented=[];

global Ch00_stack_Raw
Ch00_stack_Raw=[];

read_global_stack(handles,box_Raw,[1 0 1])
 
close(h)

% jFrame=get(handle(handles.figure1), 'javaframe') 
%  jFrame.setMaximized(true);   % to maximize the figure
 
 Pos=get(gcf,'Position')
 if  Pos(3)<0.51 & Pos(4)<0.01 
     set(gcf,'Position',[0.1 0.07 0.8 0.9])
 end
 axis tight
