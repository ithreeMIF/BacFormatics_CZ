clear all

load all
 
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


 
 

h=timebar_BACWrapper('creating orientation data....');  
MATRIX_data_velocity(MATRIX_data_velocity>max_velocity)=max_velocity;   
MATRIX_data_velocity=round(100*MATRIX_data_velocity/max_velocity);
MATRIX_data_velocity(MATRIX_data_velocity==0)=1; 
 
MATRIX_data_Vx(MATRIX_data_Vx>max_Vx)=max_Vx;   
MATRIX_data_Vx=round(100*MATRIX_data_Vx/max_Vx);
MATRIX_data_Vx(MATRIX_data_Vx==0)=1; 

MATRIX_data_Vy(MATRIX_data_Vy>max_Vy)=max_Vy;   
MATRIX_data_Vy=round(100*MATRIX_data_Vy/max_Vy);
MATRIX_data_Vy(MATRIX_data_Vy==0)=1; 


for ii=1:size(MATRIX,1)  %on the base of frame
    
    rad=[];
    P=[];
    timebar_BACWrapper(h,ii/size(MATRIX,1))
    Ind= data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata(:,6); 
    Velocity_vec=MATRIX_data_velocity(ii,Ind);
 
Velocity_vec= repmat(Velocity_vec,2);Velocity_vec=Velocity_vec(1:length(Velocity_vec));
 Velocity_vec=Velocity_vec';
 
 str=['c:\4_7\\parameter_vec' num2str(ii) '.chan'] ;
 save(str, 'Velocity_vec', '-ASCII')
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Major_Minor_id=1:size(MATRIX,1) ;
 Major_Minor_id= repmat(Major_Minor_id,2);Major_Minor_id=Major_Minor_id(1:length(Major_Minor_id));
 Major_Minor_id=Major_Minor_id';
 
 str=['c:\4_7\\Major_Minor_id' num2str(ii) '.chan'] ;
 save(str, 'Major_Minor_id', '-ASCII')
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                major_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p1(ii).cdata;    
                major_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.major_axis_p2(ii).cdata  ; 
          
                  minor_axis_p1= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p1(ii).cdata;    
                minor_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p2(ii).cdata  ; 
          
                
               
 
 
 for jj=1:size(minor_axis_p1,1) 
 
     
     P(jj*2-1,1) = minor_axis_p1(jj,1);
     P(jj*2-1,2) = minor_axis_p1(jj,2);
     P(jj*2,1)=   minor_axis_p2(jj,1);
     P(jj*2,2)=    minor_axis_p2(jj,2);
 end
     
 
 str=['c:\4_7\\Major_data' num2str(ii) '.chan'] ;
 save(str, 'P', '-ASCII')
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    minor_axis_p2= handles.data_file(4).cdata.L(track_what).cdata.minor_axis_p2(ii).cdata  ; 
          
                
               
 
 
 for jj=1:size(minor_axis_p1,1)  
     rad(jj) = sqrt((minor_axis_p2(jj,1)-minor_axis_p1(jj,1)).^2+(minor_axis_p2(jj,2)-minor_axis_p1(jj,2)).^2) ;
 end
     
  
 str=['c:\4_7\\rad_vec' num2str(ii) '.chan'] ;
 save(str, 'rad', '-ASCII')
 
 
 
end
close(h)


 


% 
% 
% 
% 
% data_file= handles.data_file
% uisave('data_file','data_file.mat')

