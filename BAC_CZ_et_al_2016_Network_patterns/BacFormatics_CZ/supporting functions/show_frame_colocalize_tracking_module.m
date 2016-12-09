function matrix_out=show_frame_colocalize_tracking_module(handles,n)    
pathname=handles.data_file(2).cdata;
Nbits=handles.data_file(9).cdata;
xdim=handles.data_file(6).cdata(4) ;                  
ydim=handles.data_file(6).cdata(3) ; 

global  box_Raw
   
Projected_by_Value=get(handles.Projected_by,'Value');
Projected_by_Str=get(handles.Projected_by,'String');
Projected_by=char(Projected_by_Str(Projected_by_Value)); 
filename=char(box_Raw(n)); 
 
      
track_what_1=get(handles.track_what_22,'value')  ; 
track_what_2=get(handles.track_what_33,'value')  ;
track_what_3=get(handles.track_what_44,'value')  ;
track_what_4=get(handles.track_what1,'value')  ;
     
segmentation_type_1=get(handles.segmentation_type_22,'value')  ;
segmentation_type_2=get(handles.segmentation_type_33,'value')  ;
segmentation_type_3=get(handles.segmentation_type_44,'value')  ;
segmentation_type_4=get(handles.segmentation_type1,'value')  ;

Color_type_1=get(handles.segmentation_type_22,'ForegroundColor')  ;
Color_type_2=get(handles.segmentation_type_33,'ForegroundColor')  ;
Color_type_3=get(handles.segmentation_type_44,'ForegroundColor')  ; 
        






 Blue_factor=get(handles.Blue_factor,'value') ;
 Green_factor=get(handles.Green_factor,'value');
 Red_factor=get(handles.Red_factor,'value');
  
 DIC_temp=[]; 
 Red=double(zeros(xdim,ydim,1)); 
 Green=double(zeros(xdim,ydim,1)); 
 Blue=double(zeros(xdim,ydim,1)); 
  
  
       

 if Nbits==8  
   Red=uint8(zeros(xdim,ydim,1)); 
 Green=uint8(zeros(xdim,ydim,1)); 
 Blue=uint8(zeros(xdim,ydim,1)); 
  end
  if Nbits==16  
   Red=uint16(zeros(xdim,ydim,1)); 
 Green=uint16(zeros(xdim,ydim,1)); 
 Blue=uint16(zeros(xdim,ydim,1)); 
  end
   if Nbits==32  
   Red=uint32(zeros(xdim,ydim,1)); 
 Green=uint32(zeros(xdim,ydim,1)); 
 Blue=uint32(zeros(xdim,ydim,1)); 
   end 
   
     
   if track_what_1~=5   
       if   Color_type_1(1)==1 & Color_type_1(2)==0 & Color_type_1(3)==0
           Red=read_images_loc(pathname,n,segmentation_type_1,track_what_1,filename,Projected_by,Nbits,Red_factor)   ;  
       elseif   Color_type_1(1)==0 & Color_type_1(2)==1 & Color_type_1(3)==0
          Green=read_images_loc(pathname,n,segmentation_type_1,track_what_1,filename,Projected_by,Nbits,Green_factor)   ; 
       else
          Blue=read_images_loc(pathname,n,segmentation_type_1,track_what_1,filename,Projected_by,Nbits,Blue_factor)   ; 
       end
   end
   if track_what_2~=5
       if   Color_type_2(1)==1 & Color_type_2(2)==0 & Color_type_2(3)==0
           Red=read_images_loc(pathname,n,segmentation_type_2,track_what_2,filename,Projected_by,Nbits,Red_factor)   ;  
       elseif   Color_type_2(1)==0 & Color_type_2(2)==1 & Color_type_2(3)==0
          Green=read_images_loc(pathname,n,segmentation_type_2,track_what_2,filename,Projected_by,Nbits,Green_factor)   ; 
       else
          Blue=read_images_loc(pathname,n,segmentation_type_2,track_what_2,filename,Projected_by,Nbits,Blue_factor)   ; 
       end
   end
   
      if track_what_3~=5   
       if   Color_type_3(1)==1 & Color_type_3(2)==0 & Color_type_3(3)==0
           Red=read_images_loc(pathname,n,segmentation_type_3,track_what_3,filename,Projected_by,Nbits,Red_factor)   ;  
       elseif   Color_type_3(1)==0 & Color_type_3(2)==1 & Color_type_3(3)==0
          Green=read_images_loc(pathname,n,segmentation_type_3,track_what_3,filename,Projected_by,Nbits,Green_factor)   ; 
       else
          Blue=read_images_loc(pathname,n,segmentation_type_3,track_what_3,filename,Projected_by,Nbits,Blue_factor)   ; 
       end
      end
 
     
 index_ones_1 =find(~ Red); 
 index_ones_2 =find(~ Green);
 index_ones_3 =find(~ (Blue)); 
 index_ones= intersect( index_ones_1, index_ones_2);
 index_ones= intersect(  index_ones, index_ones_3) ; 
 
 
 matrix_temp=read_images_loc(pathname,n,segmentation_type_4,track_what_4,filename,Projected_by,Nbits);
 
     
   
     
  if isempty(index_ones)~=1 
  Red(index_ones)=matrix_temp(index_ones);
  Green(index_ones)=matrix_temp(index_ones);
  Blue(index_ones)=matrix_temp(index_ones);
  end 
 
%Importent- if the original image is 12 bit, a factor or 2^4 (16) must be
%donde fpr each matrix at this stage! 
matrix_out = cat(3, Red , Green , Blue );   
% ----------------------------------------------------------------------
               
function [matrix_out]= read_images_loc(pathname,n,segmentation_type,track_what,filename,Projected_by,Nbits,T)         
  
 
 
try
    eval(strcat('matrix_out=handles.Ch0',num2str(track_what-1),'_stack(',num2str(n),').cdata;'))
catch
    try
        Projected_by2=str2double(regexprep(Projected_by, 'z', '')) ;
        matrix_out=[];
        if ~isempty(Projected_by2) && ~isnan(Projected_by2)
            switch segmentation_type
                case 1
                    full_filename = [char(pathname(track_what,1)),'z\',filename,'_z0',num2str(Projected_by2),'_ch0',num2str(track_what-1),'.tif'] ;
                    matrix_out=imread(full_filename ,1);
                case 2
                    full_filename = [char(pathname(track_what,2)),'z\',filename,'_z0',num2str(Projected_by2),'_ch0',num2str(track_what-1),'_Filtered.tif'];
                    matrix_out=imread(full_filename ,1);
                case 3
                    full_filename = [char(pathname(track_what,3)),'z\',filename,'_z0',num2str(Projected_by2),'_ch0',num2str(track_what-1),'_Segmented.tif'];
                    temp=imread(full_filename ,1); 
                case 4
                    full_filename_Filtered = [char(pathname(track_what,2)),'z\',filename,'_z0',num2str(Projected_by2),'_ch0',num2str(track_what-1),'_Filtered.tif'];
                    temp_Filtered=imread(full_filename_Filtered ,1);
                    temp_Filtered=double(temp_Filtered);
                    full_filename_Segmentation = [char(pathname(track_what,3)),'z\',filename,'_z0',num2str(Projected_by2),'_ch0',num2str(track_what-1),'_Segmented.tif'];
                    temp_Segmentation=imread(full_filename_Segmentation ,1);
            
                    temp_Segmentation=double(temp_Segmentation);
                    matrix_out=temp_Filtered.* temp_Segmentation;
                case 5
                    full_filename_Raw = [char(pathname(track_what,1)),'z\',filename,'_ch0',num2str(track_what-1),'.tif'] ;
                    temp_Raw=imread(full_filename_Raw ,1);
                    temp_Raw=double(temp_Raw);
                    full_filename_Segmentation = [char(pathname(track_what,3)),'z\',filename,'_z0',num2str(Projected_by2),'_ch0',num2str(track_what-1),'_Segmented.tif'];
                    temp_Segmentation=imread(full_filename_Segmentation ,1);
                  
                    temp_Segmentation=double(temp_Segmentation);
                    matrix_out=temp_Raw.* temp_Segmentation;
            end
        end
        if findstr('Imean',Projected_by) || findstr('I',Projected_by)
            switch segmentation_type
                case 1
                    full_filename = [pathname{track_what,1},filename,'_ch0',num2str(track_what-1),'.tif']   ;
                    matrix_out=imread(full_filename) ; 
                case 2
                    full_filename = [pathname{track_what,2},filename,'_ch0',num2str(track_what-1),'_Filtered.tif'];
                    matrix_out = imread(full_filename,'tif',1);
                case 3
                    full_filename = [pathname{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif']
                    matrix_out =  imread(full_filename,'tif',1) ;
                case 4
                    full_filename = [pathname{track_what,2},filename,'_ch0',num2str(track_what-1),'_Filtered.tif'];
                    temp_Filtered = double(imread(full_filename,'tif',1));
                    full_filename = [pathname{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'];
                    temp_Segmentation = double( imread(full_filename,'tif',1) );
                    matrix_out = temp_Filtered.* temp_Segmentation;
                case 5
                    full_filename = [pathname{track_what,1},filename,'_ch0',num2str(track_what-1),'.tif'];
                    temp_Raw = double(imread(full_filename,'tif',1));
                    full_filename = [pathname{track_what,3},filename,'_ch0',num2str(track_what-1),'_Segmented.tif'];
                    temp_Segmentation = double( imread(full_filename,'tif',1) );
                    matrix_out = temp_Raw.* temp_Segmentation;
            end
        end 
    end
end
 
 if Nbits==8
    matrix_out=double(matrix_out);
    matrix_out=(matrix_out./(max(max(matrix_out))))*255;
    matrix_out=uint8(matrix_out);
      if nargin==8
          matrix_out(matrix_out<T*255)=0;
      end
 end
  
 if Nbits==16  
         matrix_out=double(matrix_out);
    matrix_out=(matrix_out./(max(max(matrix_out))))*65535;
    matrix_out=uint16(matrix_out); 
         if nargin==8
          matrix_out(matrix_out<T*65535)=0;
      end
 end
  if Nbits==32  
      matrix_out=double(matrix_out);
    matrix_out=(matrix_out./(max(max(matrix_out))))*2^32;
    matrix_out=uint32(matrix_out); 
        if nargin==8
          matrix_out(matrix_out<T*(2^32))=0;
      end
  end
  
  
     