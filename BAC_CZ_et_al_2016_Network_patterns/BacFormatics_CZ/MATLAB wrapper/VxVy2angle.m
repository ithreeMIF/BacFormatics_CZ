function [theta]= VxVy2angle(Vx,Vy)

if Vx==0 && Vy==0
    theta=0 ;
end


if Vx==0 && Vy>0
      theta=90 ;
end

if Vx==0 && Vy<0
      theta=270 ;
end

if Vy==0 && Vx>0
      theta=0 ;
end

if Vy==0 && Vx<0
      theta=180 ;
end
 
if Vx~=0 &&   Vy~=0
     p1=[Vx Vy];p2=[0 0];  p3= [1 0] ;
theta =angle_deg_2d_BACWrapper(p1, p2,p3)   ;
end