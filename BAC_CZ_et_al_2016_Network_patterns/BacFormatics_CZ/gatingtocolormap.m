% 1. convert matrix of trajectories to single (i.e. only the X)

%   track_what=get(handles.track_what2,'Value') ;
% Data=get(handles.show_tracks,'userdata' );
 Data=a;track_what=1

tic
vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N  ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);
toc
    
    
 
% MATRIX =  data_file(5).cdata.Tracks(track_what).cdata;
MATRIX_data=nan(size(MATRIX,1) ,size(MATRIX,2)/2 );
 
MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating direction and velocity data....');
 

for ii=1:size(MATRIX,2)/2 %for each cell
    timebar_BACWrapper(h,ii/size(MATRIX,2)/2) 
    MATRIX_data(:, ii)= MATRIX(:,2*ii-1); 
end