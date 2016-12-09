function create_MATRIX_data_labeled_function(data_file_4,str_Parameter,Cutoff,length_before,length_after,track_what,Data,Diff_option,MA_option) 
 
global  MATRIX_data_labeled

% data_file=handles.data_file;

Centy=data_file_4.L(track_what).cdata.Centroid;

 
 
 

vec_temp2=Data.vec_temp2 ;
vec_temp1=Data.vec_temp1;
N=Data.N ; 
M=Data.M ;
vec_temp3(vec_temp2)=vec_temp1;
vec_temp3 (end+1:  M*N)=0;
MATRIX = reshape(vec_temp3',N,M);  
 
 
 h=timebar_BACWrapper(char(['create ' str_Parameter ' MATRIX_Data....'])); 
MATRIX_data_labeled=nan(size(MATRIX,1),size(MATRIX,2)/2);
for ii=1:N  %on the base of frame
      timebar_BACWrapper(h,ii/(size(MATRIX,2)/2)) 
   eval(char(['Parameter=data_file_4.L(' num2str(track_what) ').cdata.' str_Parameter '('  num2str(ii) ').cdata;']))
  
      
    Ind= Centy(ii).cdata(:,6)  ;
    temp_vec= find(MATRIX(ii,:)>0); temp_vec(1:2:length( temp_vec))=[];temp_vec=temp_vec/2;
    for jj=1:length(temp_vec)
        JJ=temp_vec(jj);
        Ind2= ismember(Ind,JJ);
        MATRIX_data_labeled(ii,JJ)=Parameter(Ind2);
    end
    ii
end
close(h)


 
if  length_before+length_after~=0
    h=timebar_BACWrapper('creating MA....');
    for ii=1:size(MATRIX,2)/2 %for each cell
        timebar_BACWrapper(h,ii/size(MATRIX,2)/2)
      if  MA_option
           MATRIX_data_labeled(:, ii)=   movavg( MATRIX_data_labeled(:, ii),length_before,length_after)  ;
         end 
        
        if  Diff_option
       MATRIX_data_labeled(:, ii)=   abs(nandiff(( MATRIX_data_labeled(:, ii))))  ;
        end
    end
    close(h)
end




MATRIX_data_labeled(MATRIX_data_labeled>Cutoff)=Cutoff;
 
