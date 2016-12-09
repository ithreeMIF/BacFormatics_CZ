function scatplot(varargin)

if mod(nargin,3)~=0
    
    N=(nargin-1)/3;
    
else 
    
    N=nargin/3;
    
end

sect_width=2*pi/N;    
offset_angle=0:sect_width:2*pi-sect_width;

R=0;
m=1;

for n=1:N
    
    x=varargin{m};
    y=varargin{m+1};
    
    phi1=offset_angle(n);
    phi2=sect_width;
    theta1=atan2(y,x)+pi;
    theta2=phi1+phi2*theta1/(2*pi);
    
    r=sqrt(x.^2+y.^2);
    z=r.*exp(j*theta2);
    x=real(z); 
    y=imag(z);
    
    if max(r)>R
        
        R=max(r);
        
    end
    
    plot(x,y,varargin{m+2})
    hold on;
    
    m=m+3;
    
end

if mod(nargin,3)==0
    
    drawline(R,offset_angle)
    drawcircle(R)
    
else
    
    switch varargin{end}
        
        case 'none'
            
        case 'l'
            
            drawline(R,offset_angle)
            
        case 'c'
            
            drawcircle(R)
            
        case {'lc','cl'}
            
            drawline(R,offset_angle)
            drawcircle(R)
            
    end
    
end

hold off; axis equal
%------------------------------------------------------------------%


%------------------------------------------------------------------%
function drawline(R,offset_angle)

for n=1:length(offset_angle)
    
    plot(real([0 R]*exp(j*offset_angle(n))),imag([0 R]*exp(j*offset_angle(n))),'k-')
    
end
%------------------------------------------------------------------%


%------------------------------------------------------------------%
function drawcircle(R)

r=linspace(0,R,5);
w=0:.01:2*pi;

for n=2:length(r)
    
    plot(real(r(n)*exp(j*w)),imag(r(n)*exp(j*w)),'k--')
    
end
%------------------------------------------------------------------%