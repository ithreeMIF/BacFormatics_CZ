function colormap_MATRIX_data_labeled_function(data_file_4,str_Parameter,track_what)  
global MATRIX_data_labeled CC   
MATRIX_data_labeled=round(100*MATRIX_data_labeled/(nanmax(MATRIX_data_labeled(:))));%converting range from 0 to 100 altough possible
MATRIX_data_labeled(MATRIX_data_labeled==0)=1;  %converting range from 1 to 100 altough possible 
h=timebar_BACWrapper(char(['create ' str_Parameter ' Colormaps....'])); 
 for ii=1:size(MATRIX_data_labeled,1)  %on the base of frame
    timebar_BACWrapper(h,ii/size(MATRIX_data_labeled,1)) 
    eval(char(['Ind=data_file_4.L(' num2str(track_what) ').cdata.Centroid('  num2str(ii) ').cdata(:,6);'])) 
    Vec=MATRIX_data_labeled(ii,Ind);
    matrixColormap=[];
    for jj=1:length(Vec)
        if isnan(Vec(jj))~=1
            matrixColormap(jj,:)=CC(Vec(jj),:);
        else
            matrixColormap(jj,:)=[nan nan nan];
        end
        matrixColormap=round(matrixColormap*10)/10;
        eval(char(['global ' str_Parameter '_matrixColormap_',num2str(ii)]))
        eval(char([str_Parameter '_matrixColormap_' num2str(ii) '=matrixColormap;']));
    end
end
close(h) 
 