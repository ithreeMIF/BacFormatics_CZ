function [ centy1] = S_unassociate_r1_r2(centy1 ,vec, max_distance ,r1,r2,vector_associated)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  h=waitbar(0,'2. Hungarian algorithm in action. Skipping non-selected frames between r1 and r2 ')
  
  
  
 vec(1)=r1 
vec(end)=r2 
%   1:4:8:16.......4700




 
  
  
for jj=1:length(vec) - 1
    waitbar(jj/length(vec))
    ii=vec(jj)         ;
    iip1=vec(jj+1)    ;
    
    try
     
         centy1(iip1).cdata(:,4:5)=[];
    end
    
end

close(h)

if r2<max(vector_associated)
    vector_associated2=vector_associated;
    vector_associated2(end+1)=r2;
    vector_associated2=unique(vector_associated2);
    vector_associated2=  sort(vector_associated2);
    r2p1= find(ismember(vector_associated2,r2))+1;
    r2p1=vector_associated2(r2p1)
    end

               
        
if  r1>min(vector_associated)
    vector_associated2=vector_associated;
    vector_associated2(end+1)=r1
    vector_associated2=unique(vector_associated2);
    vector_associated2=  sort(vector_associated2)
    
    r1m1= find(ismember(vector_associated2,r1))-1
    r1m1=vector_associated2( r1m1)
    
end
try
         
        centy1(r2p1).cdata(:,4)=hungarianlinker_TACWrapper(centy1(r2p1).cdata(:,1:2),centy1(r1m1).cdata(:,1:2),max_distance);
        centy1(r2p1).cdata(:,5)=r1m1;
        'linked r2p1 to r1m1'
    end

