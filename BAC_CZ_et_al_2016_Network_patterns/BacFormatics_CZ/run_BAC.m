%% ________________BacFormatics Code starts here:________________
function run_BAC(str_gui,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10)
clc
str_tac='BacFormatics_v1.0';
% warning off MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame
if nargin==0
    Adding_path
end

if nargin==0
    h=BacFormatics;
elseif nargin==1
    eval(char(strcat('h=',str_gui)));
elseif  nargin==2
    eval(char(strcat('h=',str_gui,'(','data1',')')));
elseif  nargin==3
    eval(char(strcat('h=',str_gui,'(','data1,data2',')')));
elseif  nargin==4
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3',')')));
elseif  nargin==5
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4',')')));
elseif  nargin==6
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4,data5',')')));
elseif  nargin==7
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4,data5,data6',')')));
elseif  nargin==8
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4,data5,data6,data7',')')));
elseif  nargin==9
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4,data5,data6,data7,data8',')')));
elseif  nargin==10
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4,data5,data6,data7,data8,data9',')')));
elseif  nargin==11
    eval(char(strcat('h=',str_gui,'(','data1,data2,data3,data4,data5,data6,data7,data8,data9,data10',')')));
end


if nargin~=0
%     set(getjframe_BACWrapper,'Maximized',1);%maximizes the window, 0 to minimize
    set(getjframe_BACWrapper,'Maximized',2);%maximizes the window, 0 to minimize
end
% set(getjframe_BACWrapper,'AlwaysOnTop',0);%places window on top, 0 to disable
set(h,'Name',str_tac);%places window on top, 0 to disable
drawnow;




