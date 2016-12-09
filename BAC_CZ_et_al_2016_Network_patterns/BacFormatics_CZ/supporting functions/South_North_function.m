
  function [matrix_out] = South_North_function(matrix_in) 
  
  
 matrix_out=matrix_in;
  L=bwlabel_max(matrix_in);
  s=regionprops(L,'Orientation');
  
  theta=s.Orientation;
  
  matrix_in=imrotate(matrix_in, -theta ,'crop'     );
  
        N= matrix_in;      S=matrix_in;
         
        matrix_in2=matrix_in;
        matrix_in2(isnan(matrix_in2))=0;
        
        
        
        
           Cumsum=cumsum(matrix_in2(:)); 
        max_Cumsum= max(Cumsum) ;
        
        if ((max_Cumsum/2)-floor(max_Cumsum/2))==0
            'round number'
        Cumsum=cumsum(matrix_in2(:));
        Half_Cumsum= max(Cumsum/2);
        Index=find(ismember(Cumsum,Half_Cumsum));
        Index=Index(1);
        
        S(1:Index)=0;
        N(Index+1:end)=0;
        else
        'uneven number'
        Cumsum=cumsum(matrix_in2(:));
        Half_Cumsum=round(max(Cumsum)/2);
        Index=find(ismember(Cumsum,Half_Cumsum));
        Index=Index(1);
        
        S(1:Index)=0;
        N(Index:end)=0;
        end
        
          
        IND=bwperim(S); S(IND) =0;
        IND=bwperim(N); N(IND) =0;
        
    
        
        matrix= S+N ;
         matrix=imrotate(matrix,  theta, 'crop'     );

         
         
         
       erodedBW  =matrix;
         
               
mask_em = bwlabel_max(erodedBW,2);  % select 2 largest segments                  
hy = fspecial('sobel');                  
hx = hy';                  
Iy = imfilter(double(mask_em), hy, 'replicate');                  
Ix = imfilter(double(mask_em), hx, 'replicate');                  
gradmag = sqrt(Ix.^2 + Iy.^2);                  
gradmag2 = imimposemin(gradmag,   mask_em);                  
L = watershed(gradmag2);     
 
% 
  matrix_out(L==0)=0;
 matrix_out=bwlabel_max(matrix_out ,2);
      matrix_out=logical(matrix_out);   
      
%        
    matrix_out=bwmorph( matrix_out,'spur' );
%   
    
% %       matrix_out=bwmorph( matrix_out,'clean' );
%  
   matrix_out =bwareaopen(  matrix_out,40,4); 
%      
      
      
      
      
      
      
      