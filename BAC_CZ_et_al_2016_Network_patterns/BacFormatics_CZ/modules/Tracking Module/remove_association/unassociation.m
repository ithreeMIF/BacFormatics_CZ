function [centy1]=unassociation( vector_associated,centy1,track_what,edit_relabel_range,selective_operator, max_distance,n)
try
if  selective_operator  == 1
    if edit_relabel_range==0
        centy1= O_unassociate_n_no_selective(centy1 , max_distance, n) ;
    elseif edit_relabel_range==1
        centy1= O_unassociate_n_no_selective_three(centy1 , max_distance, n) ;
    else
        start_track =n-edit_relabel_range;
        end_track =n+edit_relabel_range;
        if end_track> size(centy1,2)
            end_track= size(centy1,2);
        end
        if start_track< 1
            start_track= 1;
        end
        h=waitbar(0,'Hungarian algorithm in action')
        for ii=start_track:end_track -2
            waitbar(ii/(end_track+1-start_track))
            try
                centy1(ii+1).cdata(:,4:5)=[]
            end  
        end
                    
        try
            
              
                centy1(ii+2).cdata(:,4)=-1;
                centy1(ii+2).cdata(:,5)=ii+1;
                
        end
        close(h)
    end
end

if   selective_operator  ~= 1
    if edit_relabel_range==0
        centy1=  O_unassociate_n_selective(centy1 , max_distance ,n,vector_associated);
    elseif edit_relabel_range==1
        centy1=S_unassociate_r1_r2(centy1 ,n-1:n+1, max_distance ,n-1,n+1,vector_associated);
    else  
        start_track =n-edit_relabel_range;
        end_track =n+edit_relabel_range;
        if end_track> size(centy1,2)
            end_track= size(centy1,2);
        end
        if start_track< 1
            start_track= 1;
        end
        centy1=S_unassociate_r1_r2(centy1 ,start_track:end_track, max_distance ,start_track,end_track,vector_associated);
    end
end

end
