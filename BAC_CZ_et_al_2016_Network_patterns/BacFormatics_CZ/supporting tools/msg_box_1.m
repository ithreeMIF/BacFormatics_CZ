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
function varargout = msg_box_1(varargin)                  
% MSG_BOX_1 M-file for msg_box_1.fig                  
%      MSG_BOX_1, by itself, creates a new MSG_BOX_1 or raises the existing                  
%      singleton*.                  
%                  
%      H = MSG_BOX_1 returns the handle to a new MSG_BOX_1 or the handle to                  
%      the existing singleton*.                  
%                  
%      MSG_BOX_1('CALLBACK',hObject,eventData,handles,...) calls the local                  
%      function named CALLBACK in MSG_BOX_1.M with the given input arguments.                  
%                  
%      MSG_BOX_1('Property','Value',...) creates a new MSG_BOX_1 or raises the                  
%      existing singleton*.  Starting from the left, property value pairs are                  
%      applied to the GUI before msg_box_1_OpeningFcn gets called.  An                  
%      unrecognized property name or invalid value makes property application                  
%      stop.  All inputs are passed to msg_box_1_OpeningFcn via varargin.                  
%                  
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one                  
%      instance to run (singleton)".                  
%                  
% See also: GUIDE, GUIDATA, GUIHANDLES                  
% Edit the above text to modify the response to help msg_box_1                  
% Last Modified by GUIDE v2.5 01-Nov-2009 12:47:51                  
% Begin initialization code - DO NOT EDIT                  
gui_Singleton = 1;                  
gui_State = struct('gui_Name',       mfilename, ...                  
'gui_Singleton',  gui_Singleton, ...                  
'gui_OpeningFcn', @msg_box_1_OpeningFcn, ...                  
'gui_OutputFcn',  @msg_box_1_OutputFcn, ...                  
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
% ============================================                  
function msg_box_1_OpeningFcn(hObject, eventdata, handles, varargin)                  
handles.output = hObject;                  
guidata(hObject, handles);                  
function varargout = msg_box_1_OutputFcn(hObject, eventdata, handles)                  
varargout{1} = handles.output;                  
function pushbutton2_Callback(hObject, eventdata, handles)                  
% uiresume(handles.figure1);                  
close(msg_box_1)                  
