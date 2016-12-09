    function [net] = PA_net(mat)
    
          SE = strel('disk', 1);
          mat = imerode(mat, SE);
 
%          SE1 = [1, 1, 1, 1];
%          SE2 = SE1';
%          SE3 = diag(SE1);
%          SE4 = flipud(SE3);
%          
%          m1 = imtophat(mat, SE1);
%          
%          m2 = imtophat(mat, SE2);
%          
%          m3 = imtophat(mat, SE3);
%           
%          m4 = imtophat(mat, SE4);
         
         
         SE5 = [[0, 1, 0, 0, 0, 0];...
                [0, 0, 1, 0, 0, 0];...
                [0, 0, 1, 0, 0, 0];...
                [0, 0, 0, 1, 0, 0];...
                [0, 0, 0, 1, 0, 0];...
                [0, 0, 0, 0, 1, 0]];
            
         SE6 = fliplr(SE5);
         
         SE7 = SE5';
            
         SE8 = fliplr(SE7);
         
         SE9 = [[0, 0, 0, 0, 0, 0];...
                [0, 0, 0, 0, 0, 0];...
                [1, 1, 1, 0, 0, 0];...
                [0, 0, 0, 1, 1, 1];...
                [0, 0, 0, 0, 0, 0];...
                [0, 0, 0, 0, 0, 0]];
            
         SE10 = fliplr(SE9);
         SE11 = SE9';
         SE12 = fliplr(SE11);
         
         m5 = imtophat(mat, SE5);
         m6 = imtophat(mat, SE6);
         m7 = imtophat(mat, SE7);
         m8 = imtophat(mat, SE8);
         m9 = imtophat(mat, SE9);
         m10 = imtophat(mat, SE10);
         m11 = imtophat(mat, SE11);
         m12 = imtophat(mat, SE12);
         
         
         
         mat =  m5 + m6 + m7 + m8 + m9 + m10 + m11 + m12;
         
         
        net = mat;
         

    end