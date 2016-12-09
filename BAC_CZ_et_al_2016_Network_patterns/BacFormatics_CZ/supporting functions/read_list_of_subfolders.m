function [filename_str]=read_list_of_subfolders(pathname)   
jj=1;
[list_of_folders]=read_list_of_folders(pathname) ;

N=max(size(list_of_folders));
for ii=1:N 
    str=char(list_of_folders(ii))  ; 
    filename_str{jj}= str;
    jj=jj+1; 
    [temp_list_of_folders]=read_list_of_folders(str); 
    
    while isempty(temp_list_of_folders)~=1
        
        str2=char(temp_list_of_folders(1));
        filename_str{jj}=  str2;
        temp_list_of_folders(1)=[];
        jj=jj+1;
        
        
        [temp_list_of_folders2]=read_list_of_folders(str2);
        
        
        while isempty(temp_list_of_folders2)~=1
            
            str3=char(temp_list_of_folders2(1));
            filename_str{jj}=  str3;
            temp_list_of_folders2(1)=[];
            jj=jj+1; 
            
            [temp_list_of_folders3]=read_list_of_folders(str3); 
            
            while isempty(temp_list_of_folders3)~=1
                
                str4=char(temp_list_of_folders3(1));
                filename_str{jj}=  str4 ;
                temp_list_of_folders3(1)=[]   ;
                jj=jj+1;
                
            end
        end
    end
end

 