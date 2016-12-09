for ii=1:301
    
    b(ii).cdata=a{ii*2};
    figure(1)
    imagesc(b(ii).cdata)
    
    ch00=b(ii).cdata; inputval=120;temp_martix=double(ch00); temp_martix= temp_martix./mean(mean(temp_martix));  ch00= uint8(inputval*temp_martix);
figure(1);imagesc(ch00) 
if ii<10
    1
        str=char(['c:\c\test_t00' num2str(ii) '_ch02.tif'])
elseif ii>9 && ii<100
    2
        str=char(['c:\c\test_t0' num2str(ii) '_ch02.tif'])
elseif   ii>99
   3
       str=char(['c:\c\test_t' num2str(ii) '_ch02.tif']) 
end
     
    imwrite(ch00,str)
    
    
    
    
    
    
%        aa(ii).cdata=a{ii*2-1};
       b(ii).cdata=a{ii*2-1};
    figure(1)
    imagesc(b(ii).cdata)
    
    ch00=b(ii).cdata; inputval=120;temp_martix=double(ch00); temp_martix= temp_martix./mean(mean(temp_martix));  ch00= uint8(inputval*temp_martix);
figure(1);imagesc(ch00) 
if ii<10
    1
        str=char(['c:\c\test_t00' num2str(ii) '_ch00.tif'])
elseif ii>9 && ii<100
    2
        str=char(['c:\c\test_t0' num2str(ii) '_ch00.tif'])
elseif   ii>99
   3
       str=char(['c:\c\test_t' num2str(ii) '_ch00.tif']) 
end
     
    imwrite(ch00,str)
       
       
       
       
       
       
       
       
end