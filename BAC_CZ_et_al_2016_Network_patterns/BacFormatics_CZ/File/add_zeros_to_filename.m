
 function add_zeros_to_filename(pathname,filename_str) 
 
% step 1 : allocate the maximum time label value:

for ii=1:size(filename_str,1)
    file_name=filename_str{ii};
    ind1=findstr(file_name,'_t');
    if isempty(ind1)
        'no _t label in the name string. using _ instead';
        ind1=findstr(file_name,'_');
        t_flag=0; %use _
    else
        t_flag=1; %use _t 
    end 
    ind1=ind1(end);
    
    
    ind2=findstr(file_name,'.tif');ind2=ind2(end);
    
    
    if t_flag==1
        if   isempty(str2num(file_name(ind1+2:ind2-1)))
            msgbox('please remove externsion such as _ch00, or _ch01');
            return
        end
        numvec(ii)=str2num(file_name(ind1+2:ind2-1));
    else
        if   isempty(str2num(file_name(ind1+1:ind2-1)))
            msgbox('please remove externsion such as _ch00, or _ch01');
            return
        end
        numvec(ii)=str2num(file_name(ind1+1:ind2-1));
    end
end

N=max(numvec);
% step 2: decide the number of zeros to add:
if N<10
    Nzeros=0;
elseif  N>9 && N<100
    Nzeros=1;
elseif   N>99 && N<1000
    Nzeros=2;
elseif   N>999 && N<10000
    Nzeros=3;
elseif N>10000
    msgbox('limit is 9999 frames. need to expand program feature!')
end 

h=waitbar(0,'please wait ....');
for ii=1:size(filename_str,1)
    waitbar(ii/size(filename_str,1))
    
    file_name=filename_str{ii};
    
    full_file_name= char(strcat(pathname,file_name)); 
    
    %%%%%%%%%% allocating the time label string:
    
    ind1=findstr(file_name,'_t');
    if isempty(ind1)
        'no _t label in the name string. using _ instead';
        ind1=findstr(file_name,'_');
    end
    ind1=ind1(end)  ;
    ind2=findstr(file_name,'.tif');ind2=ind2(end);
     
    if t_flag==1
        str=file_name(ind1+2:ind2-1);
    else
        str=file_name(ind1+1:ind2-1);
    end 
    
    Nstr= str2num(str); 
    if Nzeros==0;
        str=str ;
    end
    if Nzeros==1;
        if  Nstr<10
            str=char(['0'  str]);
        elseif  Nstr>9 && Nstr<100
            str=str ;
        end
    end
    
    if Nzeros==2;
        if Nstr<10
            str=char(['00'  str]);
        elseif Nstr>9 && Nstr<100
            str=char(['0'  str]);
        elseif   Nstr>99 && Nstr<1000
            str=str ;
        end
    end
    
    if Nzeros==3;
        if Nstr<10
            str=char(['000'  str]);
        elseif Nstr>9 && Nstr<100
            str=char(['00'  str]);
        elseif   Nstr>99 && Nstr<1000
            str=char(['0'  str]);
        elseif   Nstr>999
            str=str ;
        end
    end 
    part1=file_name(1:ind1);
    part2=file_name(ind2:end); 
    if t_flag==1
        msgbox('raz to fix that')
        
    else
        new_full_file_name=char(strcat(pathname,part1,str,part2))
    end
    
    try % to avoid Cannot copy or move a file or directory onto itself.
        movefile(full_file_name,new_full_file_name)
    end
end
close(h)


