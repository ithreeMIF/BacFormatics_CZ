function matrix =icons_positions_function(handles)



matrix(1,:)=get(handles.mode_1,  'Position');
matrix(2,:)=get(handles.mode_2,  'Position');
matrix(3,:)=get(handles.mode_3,  'Position');
matrix(4,:)=get(handles.mode_4,  'Position');
matrix(5,:)=get(handles.mode_5,  'Position');
matrix(6,:)=get(handles.mode_6,  'Position');
matrix(7,:)=get(handles.mode_7,  'Position');
matrix(8,:)=get(handles.mode_8,  'Position');


matrix(9,:)=get(handles.icon_1,  'Position');
matrix(10,:)=get(handles.icon_2,  'Position');
matrix(11,:)=get(handles.icon_3,  'Position');
matrix(12,:)=get(handles.icon_4,  'Position');
matrix(13,:)=get(handles.icon_5,  'Position');
matrix(14,:)=get(handles.icon_6,  'Position');
matrix(15,:)=get(handles.icon_7,  'Position');
matrix(16,:)=get(handles.icon_8,  'Position');
matrix(17,:)=get(handles.icon_9,  'Position');
matrix(18,:)=get(handles.icon_10,  'Position');


vec=  0:0.032:0.064*6;
vec=0.965-vec ;

matrix(19,:)=[ vec(1)  0.27      0.032   0.064] ;
matrix(20,:)= [ vec(2)     0.27   0.032    0.064];
matrix(21,:)= [ vec(3)     0.27   0.032   0.064];
matrix(22,:)=  [ vec(4) 0.27       0.032   0.064];
matrix(23,:)=  [ vec(5)   0.27    0.032    0.064];
matrix(24,:)=   [ vec(6)   0.27    0.032    0.064];

matrix(25,:)=[ vec(1)  0.27+0.064      0.032   0.064];
matrix(26,:)=[ vec(2)       0.27+0.064   0.032   0.064];
matrix(27,:)=[ vec(3)           0.27+0.064  0.032  0.064];
matrix(28,:)=[ vec(4)     0.27+0.064   0.032   0.064];
matrix(29,:)=[ vec(5)   0.27+0.064     0.032    0.064];
matrix(30,:)= [ vec(6)   0.27+0.064     0.032    0.064];


 