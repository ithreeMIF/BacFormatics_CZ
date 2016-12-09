function Save_Experiment_function(hObject, eventdata, handles)  %#ok<*INUSL>
Data=get(handles.show_tracks,'userdata' ) ;
track_what=get(handles.track_what2,'Value') ;
try
    vec_temp2=Data.vec_temp2 ;
    vec_temp1=Data.vec_temp1;
    N=Data.N  ;
    M=Data.M ;
    vec_temp3(vec_temp2)=vec_temp1;
    vec_temp3 (end+1:  M*N)=0;
    MATRIX = reshape(vec_temp3',N,M);
    handles.data_file(5).cdata.Tracks(track_what).cdata  =MATRIX;
    guidata(hObject,handles);
end
BAC_NAME=get(handles.figure1,'Name');
Current_Exp= BAC_NAME(findstr(BAC_NAME,'>')+1:end) ;

[filename, pathname, filterindex] = uiputfile({  '*.dat','Dat-files (*.dat)';}, 'save  session to a data file',Current_Exp);
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
filename=regexprep(filename, 'BacFormatics_EXP_','');
full_filename= strcat(pathname,'BacFormatics_EXP_',filename) ;
full_filename=char(full_filename);
Raw_listbox=get(handles.Raw_listbox,'String') ;
if iscell(Raw_listbox)~=0
    handles.data_file(1).cdata=cell(length(Raw_listbox),1) ;
    handles.data_file(1).cdata(:,1)=Raw_listbox;
end
handles.data_file(10).cdata=full_filename;
guidata(hObject, handles);
temp=handles.data_file;
save(full_filename ,  'temp','-v7.3')
pause(1)
msgbox('Experiment file was saved. Press OK to continue','Saved')
% ---------------------------------------------------