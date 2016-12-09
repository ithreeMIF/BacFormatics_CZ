    function [M] = close_net(mat, s)
    
         mat(isnan(mat)) = 0;
         
         SE1 = ones(1, s);
         SE2 = SE1';
         SE3 = diag(SE1);
         SE4 = flipud(SE3);
         
         m1 = imopen(mat, SE1);
         
         m2 = imopen(mat, SE2);
         
         m3 = imopen(mat, SE3);
          
         m4 = imopen(mat, SE4);
  
         
         M = m1.*m2.*m3.*m4;
         
         M(isnan(M)) = 0;

    end