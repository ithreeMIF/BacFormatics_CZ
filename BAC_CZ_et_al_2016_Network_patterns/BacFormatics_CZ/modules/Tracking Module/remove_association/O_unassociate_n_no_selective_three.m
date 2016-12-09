function [ centy1] = O_unassociate_n_no_selective_three(centy1 , max_distance, n)



try %remove n-1
    centy1(n-1).cdata(:,4:5)=[];
end

try %remove n
    centy1(n).cdata(:,4:5)=[];
end


try %relabel n+1 as new cells
        centy1(n+1).cdata(:,4)=-1;
        centy1(n+1).cdata(:,5)=n;      
    end








