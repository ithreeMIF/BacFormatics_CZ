%% ________________BacFormatics Code starts here:________________  
function save_segmentaion_setup(data_file,EXP_filename,track_what,SET_filename)                  
box_Raw=data_file(1).cdata(:,1);                  
end_filter_at=  size(box_Raw,1)  ;                  
imfo= data_file(9).cdata;                  
DATA=importdata(SET_filename)  ;                  
for ii=1:end_filter_at                  
data_file(8).cdata(track_what).Frame(ii).DATA=  DATA   ;                  
end                  
%                  
%                  
%                  
pause(3)                  
%IF AUTOMATED THRESHOLD IS ON:                  
for ii=1:end_filter_at                  
filename=  char(box_Raw(ii));                  
full_filename = char(strcat( data_file(2).cdata(track_what,2),filename,'_ch0',num2str(track_what-1),'_Filtered.tif')) ;                  
matrix_out=imread(full_filename ,1) ;                  
if  data_file(9).cdata==8                  
matrix_outd(1)=255 ;                  
matrix_outd=uint8(matrix_out);                  
elseif  data_file(9).cdata==16                  
if max(max(matrix_out))<256                  
matrix_out(1)=  255;                  
matrix_out=uint8(matrix_out);                  
end                  
elseif  data_file(9).cdata==32                  
'think about a new solution here!!!!'                  
matrix_out=uint32(matrix_out);                  
return                  
end                  
thresh_level = graythresh(matrix_out);                  
thresh_level =thresh_level * 0.5 ;  %                  
data_file(8).cdata(track_what).Frame(ii).DATA(1).vector(16)=thresh_level  ;                  
data_file(8).cdata(track_what).Frame(ii).DATA(2).vector(6)=thresh_level   ;                  
ii                  
end                  
save(char(EXP_filename) ,  'data_file')                  
clc                  
