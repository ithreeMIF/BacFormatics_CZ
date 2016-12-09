function [ centy1] = O_unassociate_n_selective(centy1 ,max_distance ,n,vector_associated)


 


        if n<max(vector_associated)
            vector_associated2=vector_associated;
            vector_associated2(end+1)=n;
            vector_associated2=unique(vector_associated2);
            vector_associated2=  sort(vector_associated2);
            np1= find(ismember(vector_associated2,n))+1;
            np1=vector_associated2(np1) 
            
        end
         if  n>min(vector_associated)
            vector_associated2=vector_associated;
            vector_associated2(end+1)=n;
            vector_associated2=unique(vector_associated2);
            vector_associated2=  sort(vector_associated2);
            nm1= find(ismember(vector_associated2,n))-1;
            nm1=vector_associated2( nm1) 
        
         end
        
         
              try
                centy1(np1).cdata(:,4)=hungarianlinker_TACWrapper(centy1(np1).cdata(:,1:2),centy1(nm1).cdata(:,1:2),max_distance);
                centy1(np1).cdata(:,5)=nm1;
                 centy1(n).cdata(:,4:5)=[];
                'linked np1 to nm1'
              end
         
     