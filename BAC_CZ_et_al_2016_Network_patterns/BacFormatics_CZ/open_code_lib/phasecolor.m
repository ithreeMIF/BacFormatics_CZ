%  Code is taken from phasecolor.m Copyrights of Tzu Yen Wong
% % wongt AT csse DOT uwa DOT edu DOT au
% % Department of Computer Science & Software Engineering
% % The University of Western Australia 
% % Oct 2003
   
clear all

    
    r = 100 ;
    hsvCircle = ones(2*r+1,2*r+1,3);
    xCoord = ones(2*r+1,1)*[1:2*r+1] - (r+1);    
    yCoord = flipud([1:2*r+1]'*ones(1,2*r+1)- (r+1));
    circle = xCoord.^2+yCoord.^2 < (r)^2;
    circle(:,:,2)=circle;
    circle(:,:,3)=circle(:,:,1);
    
   
    hsvCircle(:,:,1)=atan(yCoord./xCoord)*180/pi; 
    % make angle into range [0,360] instead of [-180,180]
    hsvCircle(:,1:r,1) = hsvCircle(:,1:r,1) + 180;      % 2nd, 3rd Quadrant
    hsvCircle(r+1:end,r+1:end,1) = hsvCircle(r+1:end,r+1:end,1) + 360; % 4th Quadrant
    
    % make angle into range [0,1] for hsv color
    hsvCircle(:,:,1) = hsvCircle(:,:,1)/360;
    
   
        
    rgbCircle=hsv2rgb(hsvCircle);
    rgbCircle=rgbCircle.*circle;
    rgbCircle=uint8(rgbCircle*255);
 figure
    imagesc(rgbCircle)
  hold on
  angle= 2250; percentage=0.5;
    
    angleRad=angle*pi/180;                      % sin and cosine work in Rad
        x =r+r*percentage*cos(angleRad);    y =r+percentage*r*sin(angleRad);
 
        x=round(x);y=round(y);
plot(x ,y ,'+m')
[rgbCircle(x,y,1) rgbCircle(x,y,2) rgbCircle(x,y,3)]
 
    