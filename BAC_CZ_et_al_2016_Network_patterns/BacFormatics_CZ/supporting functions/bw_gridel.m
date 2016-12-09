 function [matrix] = bw_gridel(matrix,X,Y) 
 


try
    matrix(X-1,Y-1)=0;
end

try
    matrix(X,Y-1)=0;
end

try
    matrix(X+1,Y-1)=0;
end

try
    matrix(X-1,Y)=0;
end

try
    matrix(X,Y)=0;
end

try
    matrix(X+1,Y)=0;
end

try
    matrix(X-1,Y+1)=0;
end

try
    matrix(X,Y+1)=0;
end

try
    matrix(X+1,Y+1)=0;
end