function Adding_path 
 
global CD
CD=cd;            
eval(strcat('addpath(','''',CD,'''',')'))     
  [list_of_folders]=read_list_of_subfolders(CD ) ;
  h =waitbar(0,'Loading BacFormatics. Please wait....');
set(h ,'color','w');
N=max(size(list_of_folders))   ; 
for ii=1:N
    waitbar(ii/N)
 str=char(strcat('addpath(','''',list_of_folders{ii},'''',')'));
 eval(str)
end
close(h)
 

a(1)=  exist('hungarianlinker_BACWrapper') ;            
a(2)=  exist('kmeans_BACWrapper') ;            
a(3)=  exist('Munkres_BACWrapper') ;            
a(4)=  exist('ANGLE_DEG_2D_BACWrapper') ;            
a(5)=  exist('vol3d_BACWrapper') ;            
 a(6)= 2;           
a(7)=  exist('timebar_BACWrapper') ;             
a(8)=  exist('speaker_BACWrapper') ;            
a(9)=  exist('noisecomp_BACWrapper') ;            
a(10)=  exist('canny_BACWrapper') ;            
a(11)=  exist('nhist_BACWrapper') ;            
a(12)=  exist('magnify_BACWrapper') ;            
a(13)=  2 ;            
a(14)=  exist('smoothn_BACWrapper') ;            
a(15)=  exist('IDCTN_BACWrapper') ;            
a(16)=  exist('DCTN_BACWrapper') ;            
a(17)=  exist('houghcircles_BACWrapper') ;            
a(18)=  exist('getjframe_BACWrapper') ;            
a(19)=  exist('bresenham_BACWrapper') ;            
a(20)=  exist('distinguishable_colors_BACWrapper');             
a(21)=  exist('imrotate2_BACWrapper');             
a(22)=  exist('dscatter_BACWrapper');              
a(23)=  exist('drlse_edge_BACWrapper');   

if mean(a)~=2            
msgbox('Third-party functions are missing')            
end





% if we remove that function it will need to be in the main BAC folder  
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

 
        
% if we remove that function it will need to be in the main BAC folder        
function [list_of_folders]=read_list_of_folders(folder_name)                  
folder_name2= folder_name  ;                  
find_ind=findstr(folder_name2, [filesep filesep]) ;                  
if isempty(find_ind)~=1                  
folder_name2 (find_ind)=[]  ;                  
end                   
list_of_folders=cellstr({});                  
dir_folder_name=dir(folder_name); jj=1;                  
for ii=1:size(dir_folder_name,1) %loop 1                  
if  dir_folder_name(ii).isdir==1                  
if length(dir_folder_name(ii).name)>2                  
list_of_folders(jj)=cellstr(strcat(folder_name2,filesep,dir_folder_name(ii).name));                  
temp_str = char(list_of_folders(jj)) ;                  
find_ind=findstr(temp_str, [filesep filesep]) ;                  
if isempty(find_ind)~=1                  
temp_str (find_ind)=[] ;                  
list_of_folders(jj)=  {temp_str}  ;                  
end                   
jj=jj+1;                  
end                  
end                  
end     
