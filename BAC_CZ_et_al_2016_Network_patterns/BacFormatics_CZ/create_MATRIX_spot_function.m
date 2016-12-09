


function create_MATRIX_spot_function(data_file_4, Cutoff,length_before,length_after,track_what,Data,Diff_option,MA_option)


 
Centy=data_file_4(1).L(track_what).cdata.Centroid;

vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N ;
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);


h=timebar_BACWrapper(char(['create spot_MATRIX_Data....']));





global MATRIX_data_labeled_Spotx
global MATRIX_data_labeled_Spoty
 



MATRIX_data_labeled_Spotx=nan(size(MATRIX,1),size(MATRIX,2)/2);
MATRIX_data_labeled_Spoty=nan(size(MATRIX,1),size(MATRIX,2)/2);
 

for ii=1:N  %on the base of frame
    timebar_BACWrapper(h,ii/N)
    
    Parameter_Spotx=[];
    Parameter_Spoty=[];
 
    for jj=1:size(Centy(ii).cdata,1)
        Parameter_Spotx(jj)=data_file_4(1).L(track_what).cdata.Centroid_Detect_spots_ch02(ii).cdata(jj,1)  ;
        Parameter_Spoty(jj)=data_file_4(1).L(track_what).cdata.Centroid_Detect_spots_ch02(ii).cdata(jj,2)  ;
                                         
    end
    
    Ind= Centy(ii).cdata(:,6)  ;
    temp_vec= find(MATRIX(ii,:)>0); temp_vec(1:2:length( temp_vec))=[];temp_vec=temp_vec/2;
    
    for jj=1:length(temp_vec)
        JJ=temp_vec(jj);
        Ind2= ismember(Ind,JJ);
         
        
        MATRIX_data_labeled_Spotx(ii,JJ)=Parameter_Spotx(Ind2);
        MATRIX_data_labeled_Spoty(ii,JJ)=Parameter_Spoty(Ind2);
   
    end
end
close(h)





 