


function create_MATRIX_poles_function(data_file_4, Cutoff,length_before,length_after,track_what,Data,Diff_option,MA_option)
Centy=data_file_4(1).L(track_what).cdata.Centroid;

vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);


h=timebar_BACWrapper(char(['create poles_MATRIX_Data....']));





global MATRIX_data_labeled_P1x
global MATRIX_data_labeled_P1y
global MATRIX_data_labeled_P2x
global MATRIX_data_labeled_P2y




MATRIX_data_labeled_P1x=nan(size(MATRIX,1),size(MATRIX,2)/2);
MATRIX_data_labeled_P1y=nan(size(MATRIX,1),size(MATRIX,2)/2);
MATRIX_data_labeled_P2x=nan(size(MATRIX,1),size(MATRIX,2)/2);
MATRIX_data_labeled_P2y=nan(size(MATRIX,1),size(MATRIX,2)/2);


for ii=1:N  %on the base of frame
    timebar_BACWrapper(h,ii/N)
    
    Parameter_P1x=[];
    Parameter_P2x=[];
    Parameter_P1y=[];
    Parameter_P2y=[];
      for jj=1:size(Centy(ii).cdata,1)
        Parameter_P1x(jj)=data_file_4(1).L(track_what).cdata.Pole1_x(ii).cdata(jj)+data_file_4(1).L(track_what).cdata.X1(ii).cdata(jj)-1  ;
        Parameter_P1y(jj)=data_file_4(1).L(track_what).cdata.Pole1_y(ii).cdata(jj)+data_file_4(1).L(track_what).cdata.Y1(ii).cdata(jj)-1  ;
        Parameter_P2x(jj)=data_file_4(1).L(track_what).cdata.Pole2_x(ii).cdata(jj)+data_file_4(1).L(track_what).cdata.X1(ii).cdata(jj)-1  ;
        Parameter_P2y(jj)=data_file_4(1).L(track_what).cdata.Pole2_y(ii).cdata(jj)+data_file_4(1).L(track_what).cdata.Y1(ii).cdata(jj)-1  ;
    end
    
    Ind= Centy(ii).cdata(:,6)  ;
    temp_vec= find(MATRIX(ii,:)>0); temp_vec(1:2:length( temp_vec))=[];temp_vec=temp_vec/2;
    
    for jj=1:length(temp_vec)
        JJ=temp_vec(jj);
        Ind2= ismember(Ind,JJ);
         
        
        MATRIX_data_labeled_P1x(ii,JJ)=Parameter_P1x(Ind2);
        MATRIX_data_labeled_P1y(ii,JJ)=Parameter_P1y(Ind2);
        MATRIX_data_labeled_P2x(ii,JJ)=Parameter_P2x(Ind2);
        MATRIX_data_labeled_P2y(ii,JJ)=Parameter_P2y(Ind2); 
        
    end
end
close(h)





