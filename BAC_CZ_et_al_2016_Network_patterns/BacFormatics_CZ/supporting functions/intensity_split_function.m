%% ________________BacFormatics Code starts here:________________  
function [matrix,iii,jjj,kk]=intensity_split_function(x,y,matrix,temp)                  
steep = (abs(y(2)-y(1)) > abs(x(2)-x(1)));                  
if steep, [x,y] = swap(x,y); end                  
if x(1)>x(2),                  
[x(1),x(2)] = swap(x(1),x(2));                  
[y(1),y(2)] = swap(y(1),y(2));                  
end                  
% if matrix(x(1))~0                  
delx = x(2)-x(1);                  
dely = abs(y(2)-y(1));                  
error = 0;                  
x_n = x(1);                  
y_n = y(1);                  
if y(1) < y(2), ystep = 1; else ystep = -1; end                  
for n = 1:delx+1                  
if steep,                  
myline(n) = matrix(x_n,y_n);                  
X(n) = x_n;                  
Y(n) = y_n;                  
else                  
myline(n) = matrix(y_n,x_n);                  
X(n) = y_n;                  
Y(n) = x_n;                  
end                  
x_n = x_n + 1;                  
error = error + dely ;                  
try                  
if bitshift(error,1) >= delx, % same as -> if 2*error >= delx,                  
y_n = y_n + ystep;                  
error = error - delx;                  
end                  
end                  
end                  
%%%%                  
Index=find(myline);                  
jj=X(min(Index));ii=Y(min(Index));% ii,jj %is the start point                  
matrix(jj,ii)=0; %start with 0, and make the rest of the path 0                  
if isempty(jj)==1 %could not split                  
end                  
if isempty(ii)==1  %could not split                  
end                  
kk=1; split_lineX(kk)=ii; split_lineY(kk)=jj;                  
jjj=X(max(Index));iii=Y(max(Index));                  
while   abs(ii-iii)+abs(jj-jjj)~=0                  
if ii<iii && jj>jjj                  
NeibX=[ii ii+1 ii+1];  NeibY=[jj-1 jj-1 jj];                  
end                  
if ii==iii && jj>jjj                  
NeibX=[ii-1 ii ii+1];  NeibY=[jj-1 jj-1 jj-1];                  
end                  
if ii>iii && jj>jjj                  
NeibX=[ii-1 ii ii-1];  NeibY=[jj-1 jj-1 jj];                  
end                  
if ii<iii && jj<jjj                  
NeibX=[ii+1 ii+1 ii ];  NeibY=[jj  jj+1 jj+1];                  
end                  
if ii==iii && jj<jjj                  
NeibX=[ii-1 ii  ii+1] ; NeibY=[jj+1 jj+1 jj+1] ;                  
end                  
if ii>iii && jj<jjj                  
NeibX=[ii-1 ii-1 ii];  NeibY=[jj jj+1 jj+1];                  
end                  
if ii<iii && jj==jjj                  
NeibX=[ii+1 ii+1 ii+1];  NeibY=[jj-1 jj  jj+1];                  
end                  
if ii>iii && jj==jjj                  
NeibX=[ii-1 ii-1 ii-1];  NeibY=[jj-1 jj  jj+1];                  
end                  
NeibVec=[temp(NeibY(1),NeibX(1))  temp(NeibY(2),NeibX(2)) temp(NeibY(3),NeibX(3))]  ;                  
[~,b]=min(NeibVec);                  
ii= NeibX(b);jj= NeibY(b);                  
split_lineX(kk)=ii; split_lineY(kk)=jj; kk=kk+1;                  
matrix(jj,ii)=0; temp(jj,ii)=temp(jj,ii)+temp(jj,ii)*10;                  
if kk>100% could not split even after 100 repeats                  
matrix=[];trmp=[]; ii=0;iii=0; jj=0; jjj=0;                  
end                  
end                  
