%% ________________BacFormatics Code starts here:________________
% =================================================================== --                  
function [XY_data]= Find_L(handles,track_what,box_Raw,start_track,end_track,str_parameter) 
 





str_parameter2=str_parameter;
 str_parameter2=regexprep(str_parameter2,'''Polar_Points''','');str_parameter2=regexprep(str_parameter2,',,','');
 str_parameter2=regexprep(str_parameter2,', ,','');
  str_parameter2=regexprep(str_parameter2,'''Border''','');str_parameter2=regexprep(str_parameter2,',,','');
  str_parameter2=regexprep(str_parameter2,', ,','');
  str_parameter2=regexprep(str_parameter2,'''Circularty''','');str_parameter2=regexprep(str_parameter2,',,','');
 str_parameter2=regexprep(str_parameter2,', ,','');
  if str_parameter2(end)==','
      str_parameter2(end)=[];
  end
   
%  example:
%  centy1=handles.data_file(4).cdata.L(track_what).cdata.Centroid(ii).cdata;
 try
XY_data= handles.data_file(4).cdata.L(track_what).cdata;  
 end
                  
%       
% pathname_Raw=handles.data_file(2).cdata(track_what,1)                  
pathname_Segmentation=handles.data_file(2).cdata(track_what,3)                  
h=timebar_BACWrapper('Label cells. Please wait....');                  
set(h,'color','w');       
 
 
for ii=start_track:end_track %2 Procced only if the complimantory Segmented file was found                  
timebar_BACWrapper(h,ii/(end_track-start_track+1))        

set(handles.mode_text,'String',[num2str(ii) '\' num2str(end_track-start_track+1)],'Visible','on') 

  
     
filename_Segmentation=box_Raw(ii) ;                  
full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;                  
full_filename_Segmentation=char(full_filename_Segmentation) ;                  
temp_Segmentation=imread_cross( full_filename_Segmentation);    
 
 
L=bwlabel(temp_Segmentation ,4);     
 
if nargin==5   
XYdata= regionprops(L,'Area','BoundingBox','Centroid','PixelList','Orientation','Eccentricity','Perimeter','Extent','Solidity','Majoraxislength','Minoraxislength','EquivDiameter');                  

 
 XY_data.Area(ii).cdata= cat(1,XYdata.Area);
 
 
temp_Centroid= cat(1,XYdata.Centroid); 
 temp_Centroid=  round(temp_Centroid*100)/100;
 temp_Centroid(:,3)=ii;
  XY_data.Centroid(ii).cdata = temp_Centroid; 
 

 
 XY_data.BoundingBox(ii).cdata= cat(1,XYdata.BoundingBox);
 
  
 XY_data.MajorAxisLength(ii).cdata= cat(1,XYdata.MajorAxisLength); 
 
 
 XY_data.MinorAxisLength(ii).cdata= cat(1,XYdata.MinorAxisLength);
 
 XY_data.Orientation(ii).cdata= cat(1,XYdata.Orientation);
  
 XY_data.PixelList(ii).cdata= cat(1,XYdata.PixelList);
 
 
 XY_data.Eccentricity(ii).cdata= cat(1,XYdata.Eccentricity);
  
 XY_data.Perimeter(ii).cdata= cat(1,XYdata.Perimeter);
 
 
 XY_data.Extent(ii).cdata= cat(1,XYdata.Extent);
 
 XY_data.Solidity(ii).cdata= cat(1,XYdata.Solidity);
 
 XY_data.EquivDiameter(ii).cdata= cat(1,XYdata.EquivDiameter);
 
end  





 
if nargin==6
    eval(char(strcat('XYdata=regionprops(L,', str_parameter2,');')))    
 
    
if  isempty(findstr(char(str_parameter),'Area'))==0
 XY_data.Area(ii).cdata= cat(1,XYdata.Area) ;
end 
if  isempty(findstr(char(str_parameter),'Centroid'))==0
temp_Centroid= cat(1,XYdata.Centroid); 
 temp_Centroid=  round(temp_Centroid*100)/100;
 temp_Centroid(:,3)=ii;
  XY_data.Centroid(ii).cdata = temp_Centroid; 
end


if  isempty(findstr(char(str_parameter),'BoundingBox'))==0
 XY_data.BoundingBox(ii).cdata= cat(1,XYdata.BoundingBox);
end
 
 
if  isempty(findstr(char(str_parameter),'Majoraxislength'))==0  
 XY_data.MajorAxisLength(ii).cdata= cat(1,XYdata.MajorAxisLength); 
end

if  isempty(findstr(char(str_parameter),'Minoraxislength'))==0  
 XY_data.MinorAxisLength(ii).cdata= cat(1,XYdata.MinorAxisLength);
end
 

if  isempty(findstr(char(str_parameter),'Orientation'))==0  
 XY_data.Orientation(ii).cdata= cat(1,XYdata.Orientation)+90;
end

if  isempty(findstr(char(str_parameter),'PixelList'))==0
%  XY_data.PixelList(ii).cdata= cat(1,XYdata.PixelList);
   XY_data.PixelList(ii).cdata=  XYdata.PixelList ;
end

if  isempty(findstr(char(str_parameter),'Eccentricity'))==0
 XY_data.Eccentricity(ii).cdata= cat(1,XYdata.Eccentricity);
end
if  isempty(findstr(char(str_parameter),'Perimeter'))==0
 XY_data.Perimeter(ii).cdata= cat(1,XYdata.Perimeter);
end
if  isempty(findstr(char(str_parameter),'Extent'))==0
 XY_data.Extent(ii).cdata= cat(1,XYdata.Extent);
end

if  isempty(findstr(char(str_parameter),'Solidity'))==0
 XY_data.Solidity(ii).cdata= cat(1,XYdata.Solidity);
end
if  isempty(findstr(char(str_parameter),'EquivDiameter'))==0
 XY_data.EquivDiameter(ii).cdata= cat(1,XYdata.EquivDiameter);
end
 
if  isempty(findstr(char(str_parameter),'ConvexHull'))==0
    
    
%  XY_data.ConvexHull(ii).cdata=  XYdata.ConvexHull ;
%  
%  
%  
%   PixelList=data_file(4).cdata.L(track_what).cdata.PixelList(ii);
 
    ConvexHull_matrix=[]; border_index_vector=[];
    for iii=1:size(XYdata,1)
        temp_ConvexHull= XYdata(iii).ConvexHull; 
       if iii==1
           ConvexHull_matrix=temp_ConvexHull;
           border_index_vector=ones(size( temp_ConvexHull,1),1);
       else%ext=nd
           ConvexHull_matrix(end+1:end+size(temp_ConvexHull,1),:)=temp_ConvexHull;  
           border_index_vector(end+1:end+size(temp_ConvexHull,1),:)=iii;  
       end
%        figure(1)
%        imagesc(border_index_vector)
     
    end 
    
    XY_data.ConvexHull(ii).cdata=ConvexHull_matrix;
    XY_data.border_index_vector(ii).cdata=border_index_vector; 
end
 


if  isempty(findstr(char(str_parameter),'Circularity'))==0
 XY_data.Circularity(ii).cdata=4*pi*XY_data.Area(ii).cdata./(XY_data.Perimeter(ii).cdata.^2);
end
  


if  isempty(findstr(char(str_parameter),'Polar_Points'))==0  
    try
        XY_data.MajorAxisLength(ii).cdata= cat(1,XYdata.MajorAxisLength);
    catch
        msgbox('MajorAxisLength is missing for Polar_Points')
    end
    
    try
        XY_data.MinorAxisLength(ii).cdata= cat(1,XYdata.MinorAxisLength);
    catch
                 msgbox('MinorAxisLength is missing for Polar_Points')
    end
    
    try
        XY_data.Orientation(ii).cdata= cat(1,XYdata.Orientation)+90;
    catch
                 msgbox('Orientation is missing for Polar_Points')
    end
 
 try
            r=0.4*XY_data.MajorAxisLength(ii).cdata ;
%              r= 0.35*XY_data.MajorAxisLength(ii).cdata ; 
            rr=0.5*XY_data.MinorAxisLength(ii).cdata ;
%             r=r-2*rr 
%             pause
            
           
     
            theta=XY_data.Orientation(ii).cdata; 
            
            theta=theta-90;
             Ind1=find(theta>=0 &  theta<=90);
             
                theta(Ind1)=     -  theta(Ind1)   +180;
                
           Ind2=find(theta<0 &  theta>=-90);
              theta(Ind2)=     -  theta(Ind2)   +180;
         
            
 catch
    msgbox('please choose MajorAxis, MinorAxis, and Orientation')  
 end
            
            
            
          
            
             x=XY_data.Centroid(ii).cdata(:,1);     y=XY_data.Centroid(ii).cdata(:,2);
            
            
            xx1 =  x  + r .* cosd( theta)    ;
            yy1 = y  + r .* sind( theta)   ;
            
            xx2 =  x  + r .* cosd( theta+180)  ;
            yy2 =  y  + r .* sind( theta+180)   ;
            
            
            
            xxx1 =  x  + rr .* cosd( theta+90)    ;
            yyy1 = y  + rr .* sind( theta+90)   ;
            
            xxx2 =  x  + rr .* cosd( theta+270)  ;
            yyy2 =  y  + rr .* sind( theta+270)   ;
            
            minor_axis_p1=[];minor_axis_p2=[];major_axis_p1=[];major_axis_p2=[];
            
            minor_axis_p1(:,1)=xx1;   minor_axis_p1(:,2)=yy1; %%%%%%%%%%%%%%
            minor_axis_p2(:,1)=xx2;   minor_axis_p2(:,2)=yy2; %%%%%%%%%%%%%%
            
            major_axis_p1(:,1)=xxx1;   major_axis_p1(:,2)=yyy1; %%%%%%%%%%%%%%
            major_axis_p2(:,1)=xxx2;   major_axis_p2(:,2)=yyy2; %%%%%%%%%%%%%%



XY_data.minor_axis_p1(ii).cdata= minor_axis_p1; 
XY_data.minor_axis_p2(ii).cdata= minor_axis_p2;
XY_data.major_axis_p1(ii).cdata= major_axis_p1; 
XY_data.major_axis_p2(ii).cdata= major_axis_p2;



end


  
end  
end

% pause(0.01);  %let the computer time to cool itself                  
    set(handles.mode_text,'Visible','off')               
                
close(h)                  
               
           
 