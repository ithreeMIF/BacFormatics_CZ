for n=1:1000
    n
    
           eval(char(['global  matrixColormap_' num2str(n) ' matrixX_' num2str(n) ' matrixY_' num2str(n) ' vecN_' num2str(n) ' vecX_' num2str(n) ' vecY_',num2str(n)]))
%            matrixColormap_',num2str(n),')'])) 
%             eval(char(['line(matrixX_' num2str(n) ',matrixY_' num2str(n) ',''Hittest'',''Off'',''Marker'',''.'',''MarkerSize'',6)']))
%              try
              
%              end 




 vecX=eval(char(['vecX_' num2str(n)])) ;
 
 vecY=eval(char(['vecY_' num2str(n)]));
 
 vecN=eval(char(['vecN_' num2str(n)]));
 
 
  vecN= vecN';
  
 
     str=['c:\3_7\orientation\vecN_' num2str(n) '.chan'] ;
     save(str, 'vecN', '-ASCII')
     vecXY=[];
     vecXY(:,1)=vecX;   vecXY(:,2)=vecY;
     
     Nan_ind=find(isnan(vecXY));     vecXY(Nan_ind)=0;
     
     
     
     str=['c:\3_7\orientation\vecXY_data_' num2str(n) '.chan'] ;
     save(str, 'vecXY', '-ASCII')
     
    
% figure 
% cla
% imagesc(zeros(1000,1400));
% hold on
%   text(vecX,vecY,{vecN},'Color','k','FontSize',10)
% 
%  
% pause
end