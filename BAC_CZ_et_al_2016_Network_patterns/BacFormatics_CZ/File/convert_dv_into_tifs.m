[filename, pathname, filterindex] = uigetfile({  '*.dv','DV-files (*.dv)';}, 'Please Choose dv file');
if isequal(filename,0)  %$#1
    h = msgbox('User selected Cancel','Aborted');
    return;
end
full_filename= char(strcat(pathname,filename)); 

msgbox(['Please wait. BacFormatics open file: ' full_filename ' using the Bio-Formats toolbox. See bfopen.m for more details.'])
 Z =bfopen(full_filename);
 try
 close(h)
 end
 Z2=Z{1};
str=Z2{1,2}; % Should be in bioformat i.e.: C:\c\dv\a.dv; plane 1/602; C=1/2; T=1/301
%assuming less than 10 channels: 
ind_C=findstr(str,'C=') ;
Nchannels=str2num(str(ind_C+4));


if Nchannels==2
prompt = {'Enter Channel 1 :','Enter Channel 2: ' };
dlg_title = 'Input';
num_lines = 1;
def = {'ch00' ,'ch02'};
vec_Channel = inputdlg(prompt,dlg_title,num_lines,def);   
end 

prompt = {'enter filename' };
dlg_title = 'Input';
num_lines = 1;
filename=regexprep(filename,'.dv','')
def = {filename};
new_filename = inputdlg(prompt,dlg_title,num_lines,def);  
new_filename = char(new_filename )
 


%assuming T is in the end:
ind_T=findstr(str,'/') ;
ind_T=ind_T(end);
N=str2num(str(ind_T+1:end));
 



choice = questdlg('Do you want to normalize image intensity and save as 8-bit?','Hello User','Yes','No','Yes');
if strcmp(choice,'Yes')
inputval = inputdlg('Please input new mean intensity (max 255)','Input',1,{'120'});
        inputval=str2num(char(inputval));
end     

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


   h =timebar_BACWrapper('convert dv to tifs. Please wait....');
        set(h,'color','w');
       
        
Counter=0;
 for ii=1:N  
     timebar_BACWrapper(h,ii/N) 
   for jj=1:Nchannels
       Channel=char(vec_Channel(jj));
      Counter=Counter+1; 
   temp_martix=Z2{Counter,1};
  if strcmp(choice,'Yes') %normalization was required by user
     temp_martix=double(temp_martix); temp_martix= temp_martix./mean(mean(temp_martix));  temp_martix= uint8(inputval*temp_martix);
  end
  
 if Nzeros==0;
 str=char([pathname  new_filename '_t'  num2str(ii)  '_' Channel '.tif'])
 end
 if Nzeros==1;
     if ii<10
         str=char([pathname  new_filename '_t0' num2str(ii) '_'  Channel '.tif'])
     elseif ii>9 && ii<100
         str=char([pathname  new_filename '_t' num2str(ii)  '_' Channel '.tif'])
     end
 end
 
  if Nzeros==2;
  if ii<10
          str=char([pathname  new_filename '_t00' num2str(ii)  '_' Channel '.tif'])
      elseif ii>9 && ii<100
          str=char([pathname  new_filename '_t0' num2str(ii)  '_' Channel '.tif'])
      elseif   ii>99 && ii<1000
          str=char([pathname  new_filename '_t' num2str(ii)  '_' Channel '.tif'])
  end
  end
 
   if Nzeros==3;
    if ii<10
          str=char([pathname  new_filename '_t000' num2str(ii)  '_' Channel '.tif'])
      elseif ii>9 && ii<100
          str=char([pathname  new_filename '_t00' num2str(ii)  '_' Channel '.tif'])
      elseif   ii>99 && ii<1000
          str=char([pathname  new_filename '_t0' num2str(ii)  '_' Channel '.tif'])
      elseif   ii>999
          str=char([pathname  new_filename '_t' num2str(ii)  '_' Channel '.tif'])
      end
   end
    imwrite( temp_martix,str) 
   end  
 end
 close(h)
 
  msgbox('ready!!')