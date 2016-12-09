% Created as part of TACTICS_v3.0'       
% TACTICS Toolbox has been written by Raz Shimoni as a sole and exclusive programmer.  
% TACTICS is a Matlab toolbox for High Content Analysis (HCA) of fluorescence tagged proteins organization within tracked cells. It designed to provide a platform for analysis of multi-Channel single-Cell Tracking and quantification of imaged lymphocytes.  
% TACTICS available, in executable form, free for academic research use distributed under BSD License.  
% IN ADDITION, SINCE TACTICS USE THIRD OPEN-CODE LIBRARY (I.E TRACKING ALGORITHEMS, FILTERS, GUI TOOLS, ETC) APPLICABLE ACKNOLEDMENTS HAVE TO BE SAVED TO ITS AUTHORS.  
% ----------------------------------------------------------------------------------------------------------  
% Copyright (c) 2010-2014, Raz Shimoni  
% All rights reserved.  
% Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:  
% Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.  
% Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.  
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.   
%IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
% ----------------------------------------------------------------------------------------------------------  
% NOTES-  
% Although TACTICS is free it does require Matlab commercial license.  
% We do not expect co-authorship for any use of TACTICS. However, we would appreciate if TACTICS would be mentioned in the acknowledgments when it used for publications and/or including the next citation: [enter our Bioinformatics]  
% We are looking for collaborations and wiling to setup new components customized by the requirements in exchange to co-authorship.  
%  Support and feedbacks  
% TACTICS is supported trough Matlab file exchange forums or contact us directly. Updates are expected regularly. We are happy to accept any suggestions to improve the automation capability and the quality of the analysis.  
% If other programmer modify or add new capabilities to TACTICS, only the new prospective code should credited to the corresponding programmer.  
% To sharp the points above, if a developer made X contribution to TACTICS (where X stands for a specific function, modification, new code, new module, new tool, etc), a statement such as the following shall be provided:  
% "Using TACTICS as a platform, I programmed/wrote/coded/etc X in order to…..."  
% Thus, the credit shall be towards the X contribution but not towards TACTICS.  
% For more information please read my thesis:  
% Centre for Micro-Photonics (CMP)  
% The Faculty of Engineering and Industrial Sciences (FEIS)  
% Swinburne University of Technology, Melbourne, Australia  
% URL: http://www.swinburne.edu.au/engineering/cmp/  
% or contact me through: raz.shimoni@gmail.com  
% Note for developers- Future versions will include better structure and documentation.   
%% ________________TACTICS Code starts here:________________  
function varargout = select_tag_gui(varargin)                  
% SELECT_TAG_GUI M-file for select_tag_gui.fig                  
%      SELECT_TAG_GUI, by itself, creates a new SELECT_TAG_GUI or raises the existing                  
%      singleton*.                  
%                  
%      H = SELECT_TAG_GUI returns the handle to a new SELECT_TAG_GUI or the handle to                  
%      the existing singleton*.                  
%                  
%      SELECT_TAG_GUI('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in SELECT_TAG_GUI.M with the given input arguments.                  
%                  
%      SELECT_TAG_GUI('Property','Value',...) creates a new SELECT_TAG_GUI or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before select_tag_gui_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to select_tag_gui_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help select_tag_gui                  
% Last Modified by GUIDE v2.5 07-May-2013 10:49:12                  
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @select_tag_gui_OpeningFcn, ...                  
'gui_OutputFcn',  @select_tag_gui_OutputFcn, ...                  
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
% --- Executes just before select_tag_gui is made visible.                  
function select_tag_gui_OpeningFcn(hObject, eventdata, handles, varargin)                  
try                  
handles.output = hObject;                  
guidata(hObject, handles);                  
Start=varargin{1};                  
End=varargin{2};                  
set(handles.edit1,'string',num2str(Start))                  
set(handles.edit2,'string',num2str(End))                  
end                  
uiwait                  
% --- Outputs from this function are returned to the command line.                  
function varargout = select_tag_gui_OutputFcn(hObject, eventdata, handles)                  
try                  
varargout{1}= str2num(get(handles.edit1,'string'));                  
varargout{2}= str2num(get(handles.edit2,'string'));                  
varargout{3}= str2num(get(handles.edit3,'string'));                  
guidata(hObject, handles);                  
close                  
end                  
% --- Executes on selection change in popupmenu1.                  
function popupmenu1_Callback(hObject, eventdata, handles)                  
function popupmenu1_CreateFcn(hObject, eventdata, handles)                  
% --- Executes on button press in pushbutton1.                  
function pushbutton1_Callback(hObject, eventdata, handles)                  
uiresume                  
% --- Executes on selection change in Vs.                  
function Vs_Callback(hObject, eventdata, handles)                  
% hObject    handle to Vs (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    structure with handles and user data (see GUIDATA)                  
% Hints: contents = get(hObject,'String') returns Vs contents as cell array                  
%        contents{get(hObject,'Value')} returns selected item from Vs                  
% --- Executes during object creation, after setting all properties.                  
function Vs_CreateFcn(hObject, eventdata, handles)                  
% hObject    handle to Vs (see GCBO)                  
% eventdata  reserved - to be defined in a future version of MATLAB                  
% handles    empty - handles not created until after all CreateFcns called                  
% Hint: popupmenu controls usually have a white background on Windows.                  
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
