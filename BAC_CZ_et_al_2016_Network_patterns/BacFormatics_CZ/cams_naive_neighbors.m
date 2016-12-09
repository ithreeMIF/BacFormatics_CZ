%Cam's nieve neighbors 
function [match_mat] = cams_naive_neighbors(D_mat, max_D)

%row indices are source points, column indices are target points

tic

match_mat = zeros(size(D_mat));

D_min = min(min(D_mat));

while D_min < max_D
    
    [min_row, min_col] = find(D_mat == D_min);
    
    if numel([min_row, min_col]) > 2
        min_row = min_row(1);
        min_col = min_col(1);
    end
    
    match_mat(min_row, min_col) = 1;
    
    D_mat(min_row, :) = Inf;
    D_mat(:, min_col) = Inf;
    
    D_min = min(min(D_mat));
        
    
end

toc

end