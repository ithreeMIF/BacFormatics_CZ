    function [net] = PA_net_2(mat)
    o = mat;
           SE = strel('disk', 1);
           mat = imerode(mat, SE);
 
         SE1 = [1, 1, 1];
         SE2 = SE1';
         SE3 = diag(SE1);
         SE4 = flipud(SE3);
         
         m1 = imtophat(mat, SE1);
         
         m2 = imtophat(mat, SE2);
         
         m3 = imtophat(mat, SE3);
          
         m4 = imtophat(mat, SE4);
         

         mat = m1 + m2 + m3 + m4;
         
        net = mat;
         

    end