function [ output_args ] = label_1( temp_str,unique_exp_unique )
 





 
for ii=1:size(unique_exp_unique,2)
    if ~isempty(strfind(temp_str,unique_exp_unique{ii}))
        output_args=ii; 
        break
    end
end
    

 