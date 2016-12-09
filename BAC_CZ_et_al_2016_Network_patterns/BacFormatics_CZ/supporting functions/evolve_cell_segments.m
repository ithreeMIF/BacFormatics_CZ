function [xx,yy,zz] = evolve_cell_segments(p1,p2,R) 

 p3=(p1+p2)/2;
 p3(:,3)=R; 
 p1(:,3)=0;p2(:,3)=0; 
%        plot3(p1(:,1),p1(:,2),p1(:,3),'ro'); 
%        hold on;
%        plot3(p2(:,1),p2(:,2),p2(:,3),'go');
%        plot3(p3(:,1),p3(:,2),p3(:,3),'bo'); 
 
 [center,rad,v1,v2] = circlefit3d(p1,p2,p3);
xx=[];
yy=[];
zz=[];
Counter=1;
jjj=[0 60 120 180 240 300]


      for iiii=1:6 % 2 is resolution parameter that was set manually by R.S
          
          a = (jjj(iiii))/180*pi; 
          x = center(:,1)+sin(a)*rad.*v1(:,1)+cos(a)*rad.*v2(:,1);
          y = center(:,2)+sin(a)*rad.*v1(:,2)+cos(a)*rad.*v2(:,2);
          z = center(:,3)+sin(a)*rad.*v1(:,3)+cos(a)*rad.*v2(:,3); 
          xx(Counter,:)=x;
          yy(Counter,:)=y;
          zz(Counter,:)=z;
          Counter=Counter+1;
      end
   
      

    

          