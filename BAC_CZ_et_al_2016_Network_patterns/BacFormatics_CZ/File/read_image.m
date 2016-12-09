% -------------------------------------------------
function  [matrix_out, full_filename] = read_image(n,segmentation_type,trackwhat)
 

if nargin==2 
 global track_what 
  trackwhat= track_what  ;
end

global Projected_by
global box_Raw 
filename=char(box_Raw(n)) ;

 
 
 [matrix_out, full_filename] = read_image2(n,segmentation_type,Projected_by, filename,trackwhat) ;
           
 
