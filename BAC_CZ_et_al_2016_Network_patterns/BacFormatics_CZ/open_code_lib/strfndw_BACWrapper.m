function [idx] = strfndw_BACWrapper(array, expStr)
%DO NOT EDIT_________________________________________________________________ 
% This file is located in BacFormatics open code library.
% All rights reserved to its original authors.
% Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
% Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
% Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer 
% in the documentation and/or other materials provided with the distribution.  
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
% THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
% INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
% OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
% THE POSSIBILITY OF SUCH DAMAGE. 
% Important: This file may include some code editing to enable incorporation with BacFormatics Toolbox
% ___________________________________________________________________________ 
%% STRFNDW
%   Wild card selection from cell array of strings. It allows the use of 
%   wildcards '*' and '?' and returns only the matching element indexes of the cell 
%   array.
%
%   The '*' wildcard stands for any number (including zero) of characters.
%   The '?' wildcard stands for a single character.
%
%   Usage:
%       IDX = STRCMPW(ARRAY, EXPSTR) returns the index array, IDX,
%       containing the index number to the elements of ARRAY satisfying the
%       search criteria in EXPSTR
%
%   Example:
%       A = {'Hello world!'; 'Goodbye world!'; 'Goodbye everyone'};
%       idx = strfndw_TACWrapper(A, '*world!');
%
%    ans = [1;2]
%
%   Adapted for command line use from the WILDSEL GUI developed by
%   Richard Stephens (ristephens@theiet.org) v1.2 2007/03/01
%
% Revision History
%   1.00.[EO]2009.06.24 Converted to non-gui function from WILDSEL

regStr = ['^',strrep(strrep(expStr,'?','.'),'*','.{0,}'),'$'];
starts = regexpi(array, regStr);
iMatch = ~cellfun(@isempty, starts);
idx = find(iMatch);

