clear all

load all
%
data_file=handles.data_file;
track_what=1
MATRIX =  data_file(5).cdata.Tracks(track_what).cdata;
MATRIX_data_velocity=nan(size(MATRIX,1) ,size(MATRIX,2)/2 );
MATRIX_data_direction=MATRIX_data_velocity;


MATRIX(MATRIX==0)=nan;MATRIX(MATRIX==-1)=nan;
h=timebar_BACWrapper('creating direction and velocity data....');
max_velocity =5;

for ii=1:size(MATRIX,2)/2 %for each cell
    timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
    temp_vec_X=MATRIX(:,2*ii-1); Vx= nandiff(temp_vec_X'); %or try without ' (only temp_vec)
    temp_vec_Y=MATRIX(:,2*ii); Vy= nandiff(temp_vec_Y'); %or try without ' (only temp_vec)'
    MATRIX_data_velocity(:, ii)= sqrt(Vx.^2+Vy.^2);
    MATRIX_data_Vx(:, ii)= Vx;
    MATRIX_data_Vy(:, ii)= Vy;
    
    for jj=1:length(Vx)
        MATRIX_data_direction(jj, ii)=VxVy2angle(Vx(jj),Vy(jj));
    end
    
    
end
for ii=1:size(MATRIX,2)/2 %for each cell
    timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
    MATRIX_data_velocity(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_velocity(:, ii),10);
    MATRIX_data_direction(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_direction(:, ii),10);
    MATRIX_data_Vx(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_Vx(:, ii),10);
    MATRIX_data_Vy(:, ii)=   nanmoving_average_BACWrapper(MATRIX_data_Vy(:, ii),10);
    
    
end

% llll
max_Vx=max_velocity
max_Vy=max_velocity
MATRIX_data_Vx=abs(MATRIX_data_Vx);
MATRIX_data_Vy=abs(MATRIX_data_Vy);




MATRIX_data_velocity(MATRIX_data_velocity>max_velocity)=max_velocity;
% MATRIX_data_velocity=round(100*MATRIX_data_velocity/max_velocity);
% MATRIX_data_velocity(MATRIX_data_velocity==0)=1;

MATRIX_data_Vx(MATRIX_data_Vx>max_Vx)=max_Vx;
% MATRIX_data_Vx=round(100*MATRIX_data_Vx/max_Vx);
% MATRIX_data_Vx(MATRIX_data_Vx==0)=1;

MATRIX_data_Vy(MATRIX_data_Vy>max_Vy)=max_Vy;
% MATRIX_data_Vy=round(100*MATRIX_data_Vy/max_Vy);
% MATRIX_data_Vy(MATRIX_data_Vy==0)=1;





h=timebar_BACWrapper('creating orientation data....');
for ii=2:10%size(MATRIX,1)  %on the base of frame
    
    
    %     timebar_BACWrapper(h,ii/size(MATRIX,1))
    Ind= data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Velocity_vec=MATRIX_data_velocity(ii,Ind);Velocity_vec=Velocity_vec';
    Nan_ind=find(isnan(Velocity_vec));     Velocity_vec(Nan_ind)=nanmean(Velocity_vec);
    
    
    
    str=['c:\18_6\velocity_vec_' num2str(ii) '.chan'] ;
    save(str, 'Velocity_vec', '-ASCII')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    direction_vec=MATRIX_data_direction(ii,Ind);direction_vec=direction_vec';
    
    
    
    nan_def=nanmean(Velocity_vec);
    Velocity_vec(isnan(Velocity_vec))=nan_def;
    Velocity_vec=Velocity_vec./max(max(Velocity_vec));
    
    matrixColormap = phasecolor_BACWrapper(direction_vec , Velocity_vec/1.02 )  ;
    direction_matrix=round(matrixColormap*10)/10;
    
    Nan_ind=find(isnan(direction_vec));    direction_vec(Nan_ind)=nanmean(direction_vec);
    
      Nan_ind=find(isnan(direction_matrix));    direction_matrix(Nan_ind)=0;
    
     
    
    
    
    str=['c:\18_6\direction_vec_' num2str(ii) '.chan'] ;
    save(str, 'direction_vec', '-ASCII')
    
    
    str=['c:\18_6\direction_matrix_' num2str(ii) '.chan'] ;
    save(str, 'direction_matrix', '-ASCII')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
   
    Vx_vec=MATRIX_data_Vx(ii,Ind); Vx_vec= Vx_vec';
    Vy_vec=MATRIX_data_Vy(ii,Ind); Vy_vec= Vy_vec';
    
    Vxy=[];
    Vxy(:,1)=Vx_vec; Vxy(:,2)=Vy_vec;
    
    
    str=['c:\18_6\Vxy_' num2str(ii) '.chan'] ;
    save(str, 'Vxy', '-ASCII')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    str=['c:\18_6\cell_id_' num2str(ii) '.chan'] ;
    save(str, 'Ind', '-ASCII')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Cxy= data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,1:2);
    str=['c:\18_6\Cxy_data_' num2str(ii) '.chan'] ;
    save(str, 'Cxy', '-ASCII')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     PixelList=data_file(4).cdata.L(track_what).cdata.PixelList(ii);
%  
%     PixelList_matrix=[]; border_index_vector=[];
%     for iii=1: size(PixelList,2)
%         temp_PixelList=PixelList(iii).cdata; 
%        if iii==1
%            PixelList_matrix=temp_PixelList;
%            border_index_vector=ones(size( temp_PixelList,1),1);
%        else%ext=nd
%            PixelList_matrix(end+1:end+size(temp_PixelList,1),:)=temp_PixelList;  
%            border_index_vector(end+1:end+size(temp_PixelList,1),:)=iii;  
%        end
%        figure(1)
%        imagesc(border_index_vector)
%        pause
%     end 
%     
    border_index_vector=data_file(4).cdata.L(track_what).cdata.border_index_vector(ii).cdata ; 
    str=['c:\18_6\border_index_vector_' num2str(ii) '.chan'] ;
    save(str, 'border_index_vector', '-ASCII') 
    
    
     ConvexHull_matrix=data_file(4).cdata.L(track_what).cdata.ConvexHull(ii).cdata;
    str=['c:\18_6\ConvexHull_matrix_' num2str(ii) '.chan'] ;
    save(str, 'ConvexHull_matrix', '-ASCII')
    
    
end
close(h)





%
%
%
%
% data_file= handles.data_file
% uisave('data_file','data_file.mat')

