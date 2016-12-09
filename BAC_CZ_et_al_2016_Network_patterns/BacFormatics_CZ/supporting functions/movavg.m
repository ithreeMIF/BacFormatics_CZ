%% ________________BacFormatics Code starts here:________________
function y=movavg(x,length_Before,length_After)
% Moving average function
p=length(x);y=nan(size(x));

% [1 2 3 4 nan 6 7 8 9 10]

    
    for ii=1:p
        Before=ii-length_Before ;
        After=ii+length_After ; 
        
        if Before<1
            Before=1;
        end
        
        if After> p
            After=p;
        end 
        
         y(ii)=nanmean(x(Before:After));
    end

  