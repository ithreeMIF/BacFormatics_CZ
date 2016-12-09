function [matrix_out, full_filename]=read_image2(n,segmentation_type,Projected_by,filename,trackwhat,trackwhat2)

Projected_by2=str2double(regexprep(Projected_by, 'z', '')) ;

if nargin==5
    eval(char(['global ' 'track_what2']))
    trackwhat2=track_what2;
end
if nargin==4
    eval(char(['global ' 'track_what']))
    eval(char(['global ' 'track_what2']))
    trackwhat =track_what;
    trackwhat2=track_what2;
end


global imread_mode data_file_2
switch imread_mode 
    case 1
         
        matrix_out=[];
        
        if ~isempty(Projected_by2) && ~isnan(Projected_by2)
            switch segmentation_type
                case 1
                    full_filename = [char(data_file_2(trackwhat,1)),'z',filesep,filename,'_z0',num2str(Projected_by2),'_ch0',num2str(trackwhat-1),'.tif'];
                    a=dir(full_filename );
                    if size(a,1)~=0
                        matrix_out=imread_cross(full_filename);
                    end
                case 2
                    full_filename = [char(data_file_2(trackwhat,2)),'z',filesep,filename,'_z0',num2str(Projected_by2),'_ch0',num2str(trackwhat-1),'_Filtered.tif'];
                    a=dir(full_filename );
                    if size(a,1)~=0
                        matrix_out=imread_cross(full_filename);
                    end
                case 3
                    full_filename = [char(data_file_2(trackwhat,3)),'z',filesep,filename,'_z0',num2str(Projected_by2),'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    a=dir(full_filename );
                    if size(a,1)~=0
                        matrix_out=imread_cross(full_filename);
                    end
                case 4
                    full_filename_Filtered = [char(data_file_2(trackwhat,2)),'z',filesep,filename,'_z0',num2str(Projected_by2),'_ch0',num2str(trackwhat-1),'_Filtered.tif'];
                    a=dir(full_filename_Filtered);
                    if size(a,1)~=0
                        temp_Filtered=imread_cross(full_filename_Filtered);
                        temp_Filtered=double(temp_Filtered);
                    end
                    full_filename_Segmentation = [char(data_file_2(trackwhat,3)),'z',filesep,filename,'_z0',num2str(Projected_by2),'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    b=dir(full_filename_Segmentation);
                    if size(a,1)~=0 && size(b,1)~=0
                        temp_Segmentation=imread_cross(full_filename_Segmentation);
                        temp_Segmentation=double(temp_Segmentation);
                        matrix_out=temp_Filtered.* temp_Segmentation;
                    end
                case 5
                    full_filename_Raw = [char(data_file_2(trackwhat,1)),'z',filesep,filename,'_ch0',num2str(trackwhat-1),'.tif'] ;
                    a=dir(full_filename_Raw);
                    if size(a,1)~=0
                        temp_Raw=imread_cross(full_filename_Raw);
                        temp_Raw=double(temp_Raw);
                    end
                    full_filename_Segmentation = [char(data_file_2(trackwhat,3)),'z',filesep,filename,'_z0',num2str(Projected_by2),'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    b=dir(full_filename_Segmentation);
                    if size(a,1)~=0 && size(b,1)~=0
                        temp_Segmentation=imread_cross(full_filename_Segmentation);
                        temp_Segmentation=double(temp_Segmentation);
                        matrix_out=temp_Raw.* temp_Segmentation;
                    end
            end
        end
        if findstr('Imean',Projected_by)
            switch segmentation_type
                case 1
                    full_filename = [data_file_2{trackwhat,1},filename,'_ch0',num2str(trackwhat-1),'.tif']  
                    try
                        matrix_out=imread_cross(full_filename) ;
                    end
                case 2
                    full_filename = [data_file_2{trackwhat,2},filename,'_ch0',num2str(trackwhat-1),'_Filtered.tif'];
                    try
                        matrix_out = imread_cross(full_filename);
                    end
                case 3
                    
                    full_filename = [data_file_2{trackwhat,3},filename,'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    try
                        matrix_out =  imread_cross(full_filename) ;  
                    end
                case 4
                    full_filename = [data_file_2{trackwhat,2},filename,'_ch0',num2str(trackwhat-1),'_Filtered.tif'];
                    try
                        temp_Filtered = double(imread_cross(full_filename));
                    end
                    full_filename = [data_file_2{trackwhat,3},filename,'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    try
                        temp_Segmentation = double( imread_cross(full_filename) );
                        matrix_out = temp_Filtered.* temp_Segmentation;
                    end
                case 5
                    full_filename = [data_file_2{trackwhat,1},filename,'_ch0',num2str(trackwhat-1),'.tif'];
                    try
                        temp_Raw = double(imread_cross(full_filename));
                    end
                    full_filename = [data_file_2{trackwhat,3},filename,'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    try
                        temp_Segmentation = double( imread_cross(full_filename) );
                        matrix_out = temp_Raw.* temp_Segmentation;
                    end
                    
                    
                    
                  case 6
                       full_filename = [data_file_2{trackwhat,3},filename,'_ch0',num2str(trackwhat-1),'_Segmented.tif'];
                    try
                        matrix_out =  imread_cross(full_filename)  ;
                    end
                    
                      
                     matrix_out =bwlabel(matrix_out,4);
                                    case 7
                                        full_filename = [data_file_2{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'];
                                        matrix_out = imread_cross(full_filename);
                                        
                                        L =bwlabel(matrix_out,4);
                                        
                                        
                                        Data=get(handles.show_tracks,'userdata' );
                                        vec_temp2=Data.vec_temp2 ;
                                        vec_temp1=Data.vec_temp1;
                                        N=Data.N  ;
                                        M=Data.M ;
                                        vec_temp3(vec_temp2)=vec_temp1;
                                        vec_temp3 (end+1:  M*N)=0;
                                        MATRIX = reshape(vec_temp3',N,M);
                                        
                                        Centy=handles.data_file(4).cdata.L(track_what).cdata.Centroid(n).cdata;
                                        
                                        
                                        for ii=1:max(L(:))
                                            L(L==ii)= Centy(ii,6);
                                        end
                                        matrix_out=L;
                                        
                                  
                    
                    
            end
        end
        
    case 2
         eval(strcat('matrix_out=handles.Ch0',num2str(trackwhat-1),'_stack(',num2str(n),').cdata;'))
    case 3
        str=char(handles.data_file(1).cdata(n));
        
        ind1=findstr(str,filesep);
        ind1=ind1(end);
        pathname_raw=str(1:ind1); Filename =str(ind1+1:end);
        filename_raw=char(strcat(Filename ,'_ch00.tif'));
        pathname_Segmented=char(strcat(pathname_raw,'ch00_Segmented\'));
        filename_Segmented=char(strcat(Filename ,'_ch00_Segmented.tif'));
        full_filename=char(strcat(pathname_Segmented,filename_Segmented));
        matrix_out= imread_cross( full_filename) ;
end
 