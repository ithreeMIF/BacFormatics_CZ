function centy1= reassociation(centy1, track_what, vec,n, max_distance )

 
 
  
 
  
  Ind=find(ismember(vec,n));
  
  if  Ind~=1
      n0=vec(Ind-1); 
      centy1=reassociation2(  centy1,n0,n ,track_what,  max_distance );
  else
       centy1(vec(1)).cdata(:,4)=-1;
       centy1(vec(1)).cdata(:,5)=0  ;
      
      
  end
  %
   
  %
  if  Ind~=length(vec)
      n1=vec(Ind+1); 
     centy1= reassociation2(  centy1,n ,n1,track_what,  max_distance );
  end
      
     
 
 
   

    
        
      function  centy1=reassociation2(  centy1,n0,n1,track_what,  max_distance )
        
        
      global data_file_1 data_file_2
      
       try
            
            full_filename = [ data_file_2{track_what,3}, data_file_1{n0},'_ch0',num2str(track_what-1),'_Segmented.tif'];
            matrix0 =  imread(full_filename,'tif',1)   ;
            matrix0 ( matrix0 > 0)=1;
            
            full_filename = [ data_file_2{track_what,3}, data_file_1{n1},'_ch0',num2str(track_what-1),'_Segmented.tif'];
            matrix1 =  imread(full_filename,'tif',1)   ;
            matrix1 ( matrix1 > 0)=1;
            
            L0=bwlabel(matrix0,4);
            
%             stats0=regionprops(L0,'PixelList');
            L1=bwlabel(matrix1,4);
            stats1=regionprops(L1,'PixelList');
            
            
% %             target_indices=[];
            N0=max(max(L0));
            N1=max(max(L1));
            D=zeros(N1,N0);
            
            
            for nn=1:N1
                PixelList=sub2ind(size(matrix1),stats1(nn).PixelList(:,2),stats1(nn).PixelList(:,1));
                PixelList=L0(PixelList);
                sizey=size(PixelList,1);
                PixelList(PixelList==0)=[];
                if isempty(PixelList)~=1
                    VC=[];
                    for mm=1: N0
                        VC(mm)=size(find(PixelList==mm),1);
                    end
                    D(nn,:)=(VC)/ sizey ;
                end
            end
            D=1-D;
            
            D ( D > max_distance) = Inf;
            
            % Find the optimal assignment is simple as calling Yi Cao excellent FEX
            % submission.
            
            
            target_indices = munkres_BACWrapper(D);
            % Set unmatched sources to -1
            target_indices ( target_indices  == 0 ) = -1;
            
            
           centy1(n1).cdata(:,4)=target_indices;
             centy1(n1).cdata(:,5)=n0  ;
            
       catch
           try
             centy1(n1).cdata(:,4)=-1;
             centy1(n1).cdata(:,5)=n0  ;
           end
            
       end
    
 


 
 
 
