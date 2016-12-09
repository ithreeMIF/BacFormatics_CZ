function  matrix =  imread_cross(full_filename) 
full_filename=regexprep(full_filename, '\', filesep) 
full_filename=regexprep(full_filename, '/', filesep) ;
 matrix =  imread(full_filename) ;

end

