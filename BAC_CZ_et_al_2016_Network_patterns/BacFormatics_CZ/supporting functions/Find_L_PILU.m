%% ________________BacFormatics Code starts here:________________
% =================================================================== --                  
function [XY_data]= Find_L(handles,track_what,box_Raw,start_track,end_track) 
 
XY_data= handles.data_file(4).cdata.L(track_what).cdata;  
track_what2=3;               
pathname_Segmentation=handles.data_file(2).cdata(track_what,3)  ;                
  h=timebar_BACWrapper('Label cells. Please wait....');                  
  set(h,'color','w');       
%  
 
for ii=1:301%start_track:end_track %2 Procced only if the complimantory Segmented file was found                  
  timebar_BACWrapper(h,ii/(end_track-start_track+1))        
 
set(handles.mode_text,'String',[num2str(ii) '\' num2str(end_track-start_track+1)],'Visible','on') 

  
     
filename_Segmentation=box_Raw(ii) ;                  
full_filename_Segmentation= strcat(pathname_Segmentation,filename_Segmentation,'_ch0',num2str(track_what-1),'_Segmented.tif') ;                  
full_filename_Segmentation=char(full_filename_Segmentation) ;                  
temp_Segmentation=imread_cross( full_filename_Segmentation);    
L=bwlabel(temp_Segmentation ,4);     
    
    pathname_Segmentation2=handles.data_file(2).cdata(track_what2,2)  ;   
    full_filename_Segmentation2= strcat(pathname_Segmentation2,filename_Segmentation,'_ch0',num2str(track_what2-1),'_Filtered.tif') ;                  
    full_filename_Segmentation2=char(full_filename_Segmentation2) ;                  
    temp_Segmentation2=imread_cross( full_filename_Segmentation2);   
    temp_Segmentation3=temp_Segmentation2>0;
     
    
    s=regionprops(L,'Centroid','BoundingBox','Majoraxislength','Minoraxislength','Orientation'); 
        
   for jj=1:max(L(:))
       
 BoundingBox=cat(1,s.BoundingBox); 
 MajorAxisLength= cat(1,s.MajorAxisLength); 
 MinorAxisLength= cat(1,s.MinorAxisLength);
 Centroid= cat(1,s.Centroid);
Orientation= cat(1,s.Orientation)+90;
  
 
r=0.4*MajorAxisLength  ;
rr=0.5*MinorAxisLength ;
theta=Orientation;

theta=theta-90;
Ind1=find(theta>=0 &  theta<=90);
theta(Ind1)=     -  theta(Ind1)   +180;
Ind2=find(theta<0 &  theta>=-90);
theta(Ind2)=     -  theta(Ind2)   +180;


  
 x=Centroid(:,1);     y=Centroid(:,2);
            
            
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

 
   end


 



 
  temp_Centroid= XY_data.Centroid(ii).cdata;
  temp_Centroid(:,3)=ii;
  XY_data.Centroid(ii).cdata=temp_Centroid;
%      figure(1)
%      imagesc(temp_Segmentationb)
%   hold on
% for jj=1:size(temp_Centroid,1)
%     
%     Cxy=temp_Centroid(jj,1:2);Cxy=round(Cxy) 
%     scatter(Cxy(1),Cxy(2)) 
%     pause
% end
   
for jj=1:size(temp_Centroid,1)
    
    Cxy=temp_Centroid(jj,1:2);Cxy=ceil(Cxy)  ;
    
    if Cxy(1)>size(L,1)
        Cxy(1)=size(L,1);
    end
    
    
    if Cxy(2)>size(L,2)
        Cxy(2)=size(L,2);
    end
    
    Val=L(Cxy(2),Cxy(1));
    
     
    if Val==0 % the interpulated center of the cell doesnt point on a cell. 
        Dist=((Cxy(1)-Centroid(:,1)).^2+(Cxy(2)-Centroid(:,2)).^2);
        [~,ind]=min(Dist);Val=ind(1); % use the nearest centroid to interpulated center of cell to find Val  
    end
      
     
     
    XY_data.BoundingBox(ii).cdata(jj,:)=BoundingBox(Val,:);
   XY_data.MajorAxisLength(ii).cdata(jj)=MajorAxisLength(Val);
   XY_data.MinorAxisLength(ii).cdata(jj)=MinorAxisLength(Val);
    XY_data.Orientation(ii).cdata(jj)=Orientation(Val);
     
    
  
    XY_data.major_axis_p1(ii).cdata(jj,:)=major_axis_p1(Val,:);
    XY_data.major_axis_p2(ii).cdata(jj,:)=major_axis_p2(Val,:);
    XY_data.minor_axis_p1(ii).cdata(jj,:)=minor_axis_p1(Val,:);
    XY_data.minor_axis_p2(ii).cdata(jj,:)=minor_axis_p2(Val,:); 
          
end

 



    
    
     
      L_spots=bwlabel(temp_Segmentation3);
     s_pots =regionprops( L_spots,'Centroid');
     Centroid_spots=cat(1,s_pots.Centroid);  
     
     
     Centroid_Detect_spots=zeros(size(temp_Centroid,1),2); 
      Polar_near_spots=nan(size(temp_Centroid,1),2);
for jj=1:size(temp_Centroid,1)
  
    
     Cxy=temp_Centroid(jj,1:2);Cxy=ceil(Cxy)  ;
    
    if Cxy(1)>size(L,1)
        Cxy(1)=size(L,1);
    end
    
    
    if Cxy(2)>size(L,2)
        Cxy(2)=size(L,2);
    end
    Val=L(Cxy(2),Cxy(1)); 
    
    if Val==0 % the interpulated center of the cell doesnt point on a cell. 
        Dist=((Cxy(1)-Centroid(:,1)).^2+(Cxy(2)-Centroid(:,2)).^2); 
        [~,ind]=min(Dist);Val=ind(1); % use the nearest centroid to interpulated center of cell to find Val  
    end
      
         bw=L==Val;
         bw2=double(bw).*double(temp_Segmentation2); 
%      
      p1Y=handles.data_file(4).cdata.L(track_what).cdata.Pole1_x(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata(jj)-1;
      p1X=handles.data_file(4).cdata.L(track_what).cdata.Pole1_y(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata(jj)-1;
      p2Y=handles.data_file(4).cdata.L(track_what).cdata.Pole2_x(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.X1(ii).cdata(jj)-1;
      p2X=handles.data_file(4).cdata.L(track_what).cdata.Pole2_y(ii).cdata(jj)+handles.data_file(4).cdata.L(track_what).cdata.Y1(ii).cdata(jj)-1;
%     
%     

 
   
%      
         [sy2,sx2]=find(ismember(bw2,max(max(bw2))));
          s2=[sx2(1) sy2(1)] ;
         
          Dist1=sqrt((s2(1)-p1X).^2+(s2(2)-p1Y).^2)   ;
          Dist2=sqrt((s2(1)-p2X).^2+(s2(2)-p2Y).^2)   ;
         
                 if     max(bw2(:))>0 & (Dist1<10  | Dist2<10 )
                   
                   
%          use the brighest pixel:
         
     Centroid_Detect_spots(jj,:)=round(s2*100)/100;  
                 end
      if   max(bw2(:))==0
%      else %could not find spot within a cell segment. Search within distance of 5 pixels from the polar points:
%          
%     
%  
%   
%     
% %         find(Centroid_spots(:,1)-major_axis_p1(1) 
        Distance1=sqrt((Centroid_spots(:,1)-p1X).^2+(Centroid_spots(:,2)-p1Y).^2);
        Distance2=sqrt((Centroid_spots(:,1)-p2X).^2+(Centroid_spots(:,2)-p2Y).^2);
%         
        
        
         
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
              
    
               
               
               
               


%%%%%%%%%%%

     
  
     Distance1=sqrt((Centroid_Detect_spots(:,1)-p1X).^2+(Centroid_Detect_spots(:,2)-p1Y).^2);
     Distance2=sqrt((Centroid_Detect_spots(:,1)-p2X).^2+(Centroid_Detect_spots(:,2)-p2Y).^2);
        
       if    ~isnan(Distance1) & ~isnan(Distance1) 
       
           
              if Distance1<Distance2
             Polar_near_spots(jj,:) = [p1X p1Y];
              else
                Polar_near_spots(jj,:) = [p2X p2Y];
              end
   end
      %%%%%%%%%%%


               
               
               
               
               
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
% 
% 
% end
% end  
 end

 pause(0.01);  %let the computer time to cool itself     
          set(handles.mode_text,'Visible','off')               
                
close(h)        
 