%% ________________BacFormatics Code starts here:________________
% =================================================================== --                  
function [XY_data]= Find_L(handles,track_what,box_Raw,start_track,end_track,str_parameter) 
 
str_parameter2=str_parameter;

str_parameter2=regexprep(str_parameter2,'''Polar_Points''','');
str_parameter2=regexprep(str_parameter2,',,','');
str_parameter2=regexprep(str_parameter2,', ,',',');

str_parameter2=regexprep(str_parameter2,'''Border''','');str_parameter2=regexprep(str_parameter2,',,',',');
str_parameter2=regexprep(str_parameter2,',,','');
str_parameter2=regexprep(str_parameter2,', ,','');


str_parameter2=regexprep(str_parameter2,'''Circularity''','');str_parameter2=regexprep(str_parameter2,',,',',');
str_parameter2=regexprep(str_parameter2,',,','');
str_parameter2=regexprep(str_parameter2,', ,','');
 
 
str_parameter2=regexprep(str_parameter2,'''Detect_spots''','');str_parameter2=regexprep(str_parameter2,',,',',');
str_parameter2=regexprep(str_parameter2,',,','');
str_parameter2=regexprep(str_parameter2,', ,',''); 
  
str_parameter2=regexprep(str_parameter2,'''Polar_near_spots''','');str_parameter2=regexprep(str_parameter2,',,',',');
str_parameter2=regexprep(str_parameter2,',,','');
str_parameter2=regexprep(str_parameter2,', ,',''); 

str_parameter2=regexprep(str_parameter2,'''Polar_spots_angle''','');str_parameter2=regexprep(str_parameter2,',,',',');
str_parameter2=regexprep(str_parameter2,',,','');
str_parameter2=regexprep(str_parameter2,', ,',''); 
 
 if  isempty(findstr(char(str_parameter),'Detect_spots'))==0   
     CH = inputdlg('Please input which channel are the spots or leave CH02 as default','Input',1,{'CH02'});
     CH=regexprep(CH,'CH','') 
     track_what2=str2num(char(CH))+1; 
 end 
  
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
pathname_Segmentation=handles.data_file(2).cdata(track_what,3)  ;                
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

if  isempty(findstr(char(str_parameter),'Detect_spots'))==0    
    pathname_Segmentation2=handles.data_file(2).cdata(track_what2,2)  ;   
    full_filename_Segmentation2= strcat(pathname_Segmentation2,filename_Segmentation,'_ch0',num2str(track_what2-1),'_Filtered.tif') ;                  
    full_filename_Segmentation2=char(full_filename_Segmentation2) ;                  
    temp_Segmentation2=imread_cross( full_filename_Segmentation2);   
    temp_Segmentation3=temp_Segmentation2>0;
    
end

 
if nargin == 6
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
 
 if nargin == 6
     eval(char(strcat('XYdata=regionprops(L,', str_parameter2,');')))    
 if  isempty(findstr(char(str_parameter),'Area')) == 0
  XY_data.Area(ii).cdata= cat(1,XYdata.Area) ;
 end 



 
  temp_Centroid = XY_data.Centroid(ii).cdata;
    temp_Centroid(:,3)=ii;
     XY_data.Centroid(ii).cdata=temp_Centroid;
    
    

% if  isempty(findstr(char(str_parameter),'Centroid'))==0
%     temp_Centroid= cat(1,XYdata.Centroid);
%     temp_Centroid=  round(temp_Centroid*100)/100;
%     temp_Centroid(:,3)=ii;
%     XY_data.Centroid(ii).cdata = temp_Centroid;
% else
%   temp_Centroid=XY_data.Centroid(ii).cdata; 
% end


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
            
            
            major_axis_p1(:,1)=xx1;   major_axis_p1(:,2)=yy1; %%%%%%%%%%%%%%
            major_axis_p2(:,1)=xx2;   major_axis_p2(:,2)=yy2; %%%%%%%%%%%%%%
            
            minor_axis_p1(:,1)=xxx1;   minor_axis_p1(:,2)=yyy1; %%%%%%%%%%%%%%
            minor_axis_p2(:,1)=xxx2;   minor_axis_p2(:,2)=yyy2; %%%%%%%%%%%%%%



XY_data.minor_axis_p1(ii).cdata= minor_axis_p1; 
XY_data.minor_axis_p2(ii).cdata= minor_axis_p2;
XY_data.major_axis_p1(ii).cdata= major_axis_p1; 
XY_data.major_axis_p2(ii).cdata= major_axis_p2; 
end




if  isempty(findstr(char(str_parameter),'Detect_spots'))==0 
    L_spots=bwlabel(temp_Segmentation3);
    s_pots =regionprops( L_spots,'Centroid');
    Centroid_spots=cat(1,s_pots.Centroid); 
    
    Centroid_Detect_spots=zeros(max(L(:)),2);
    for jj=1:max(L(:))
%     disp(['search for spot in cell: ' num2str(jj) ' in frame: '  num2str(ii)])
     bw=L==jj;
     bw2=double(bw).*double(temp_Segmentation2); 
     
    p1Y=handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata(jj)-1;
    p1X=handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata(jj)-1;
    p2Y=handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata(jj)-1;
    p2X=handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata(jj)-1;
    
    
    
     
         [sy2,sx2]=find(ismember(bw2,max(max(bw2))));
          s2=[sx2(1) sy2(1)] ;
         
         Dist=sqrt((s2(1)-p1X).^2+(s2(2)-p1Y).^2)   ;
               if Dist<10  &   max(bw2(:))>0
                   
                   
%          use the brighest pixel:
         
     Centroid_Detect_spots(jj,:)=round(s2*100)/100;  
     
      
     else %could not find spot within a cell segment. Search within distance of 5 pixels from the polar points:
         
    
 
  
    
%         find(Centroid_spots(:,1)-major_axis_p1(1) 
        Distance1=sqrt((Centroid_spots(:,1)-p1X).^2+(Centroid_spots(:,2)-p1Y).^2);
        Distance2=sqrt((Centroid_spots(:,1)-p2X).^2+(Centroid_spots(:,2)-p2Y).^2);
        
        
        
         
         [min_val1,min_ind1]=min(Distance1);
           [min_val2,min_ind2]=min(Distance2);
         
         if min_val1<=min_val2 & min_val1<9 
               [sy2,sx2]=find(bw);
               Dist=sqrt((sx2-Centroid_spots(min_ind1,1)).^2+(sy2-Centroid_spots(min_ind1,2)).^2)   ;
               [~,min_ind]=min(Dist);min_ind=min_ind(1) ;
               sxy=[sx2(min_ind) sy2(min_ind)];  
               
               
               Dist=sqrt((sxy(1)-p1X).^2+(sxy(2)-p1Y).^2)   ;
               if Dist<6
               Centroid_Detect_spots(jj,:)=round(sxy*100)/100; 
               end
         end
          if min_val2<min_val1 & min_val2<9
              [sy2,sx2]=find(bw);
               Dist=sqrt((sx2-Centroid_spots(min_ind2,1)).^2+(sy2-Centroid_spots(min_ind2,2)).^2)   ;
               [~,min_ind]=min(Dist);min_ind=min_ind(1) ;
               sxy=[sx2(min_ind) sy2(min_ind)];  
               
               
               Dist=sqrt((sxy(1)-p2X).^2+(sxy(2)-p2Y).^2)   ;
               if Dist<6
               Centroid_Detect_spots(jj,:)=round(sxy*100)/100; 
               end 
               
          end 
    end
     end
    
    switch track_what2
        case 1
             XY_data.Centroid_Detect_spots_ch00(ii).cdata = Centroid_Detect_spots;
        case 2
              XY_data.Centroid_Detect_spots_ch01(ii).cdata = Centroid_Detect_spots;
        case 3
              XY_data.Centroid_Detect_spots_ch02(ii).cdata = Centroid_Detect_spots;
        case 4
             XY_data.Centroid_Detect_spots_ch03(ii).cdata = Centroid_Detect_spots;
        otherwise
   msgbox('need to extend that feature. Please contact R.S.')
    end
end
    




if  isempty(findstr(char(str_parameter),'Polar_near_spots'))==0   
Centroid_Detect_spots(Centroid_Detect_spots==0)=nan;
Distance=[];
   Distance(:,1)=sqrt((Centroid_Detect_spots(:,1)-major_axis_p1(:,1)).^2+(Centroid_Detect_spots(:,2)-major_axis_p1(:,2)).^2);
   Distance(:,2)=sqrt((Centroid_Detect_spots(:,1)-major_axis_p2(:,1)).^2+(Centroid_Detect_spots(:,2)-major_axis_p2(:,2)).^2);
   
   
   
    [a,b]=nanmin(Distance') ;
     aa=find(isnan(a));
      b(aa)=nan;
      
      
      
      Polar_near_spots=zeros(max(L(:)),2);
      for jj=1:length(b)
          if ~isnan(b(jj))
              if b(jj)==1
             Polar_near_spots(jj,:) = major_axis_p1(jj,:);
              elseif b(jj)==2
                Polar_near_spots(jj,:) =  major_axis_p2(jj,:);
      
              end
          end
      end
      
     switch track_what2  
     case 1
             XY_data.Polar_near_spots_ch00(ii).cdata =  Polar_near_spots;
        case 2
              XY_data.Polar_near_spots_ch01(ii).cdata = Polar_near_spots;
        case 3
              XY_data.Polar_near_spots_ch02(ii).cdata = Polar_near_spots;
        case 4
             XY_data.Polar_near_spots_ch03(ii).cdata =  Polar_near_spots;
        otherwise
   msgbox('need to extend that feature. Please contact R.S.')
     end
end




if  isempty(findstr(char(str_parameter),'Polar_spots_angle'))==0 
   x3=Centroid_Detect_spots(:,1);
    x2=temp_Centroid(:,1);
   x1=Polar_near_spots(:,1);
   
    y3=Centroid_Detect_spots(:,2);
   y2=temp_Centroid(:,2);
   y1=Polar_near_spots(:,2);
    Polar_spots_angle=zeros(size(x1));
   for jj=1:length(x1)
       try
      temp_angle=angle_deg_2d_BACWrapper( [x1(jj) y1(jj)],[x2(jj) y2(jj)],[x3(jj) y3(jj)]);
      if temp_angle>180
          temp_angle=360-temp_angle;
      end
      Polar_spots_angle(jj)=temp_angle;
       end 
   end
   
   
   switch track_what2
       case 1
           XY_data.Polar_spots_angle_ch00(ii).cdata= Polar_spots_angle;
       case 2
           XY_data.Polar_spots_angle_ch01(ii).cdata= Polar_spots_angle;
       case 3
           XY_data.Polar_spots_angle_ch02(ii).cdata= Polar_spots_angle;
       case 4
           XY_data.Polar_spots_angle_ch03(ii).cdata= Polar_spots_angle; 
   end


end
end  
end

% pause(0.01);  %let the computer time to cool itself                  
    set(handles.mode_text,'Visible','off')               
                
close(h)                  
               
           
 