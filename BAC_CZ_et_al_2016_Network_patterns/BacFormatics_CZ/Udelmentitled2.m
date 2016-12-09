          
             clear matrix 
             clear temp
             load temp
             load matrix
             Close 
             clc
                strel_type='disk'
                matrix=~matrix;
                matrix=bwmorph(matrix,'spur' );
                matrix=bwmorph(matrix,'clean' );
                matrix=~matrix;
                
                %  exclude cells based on length and area:
                
                
                L =bwlabel(matrix,4);  s=regionprops(L,'Boundingbox' ); matrix2=zeros(size(matrix));
                for ii=1:size(s,1)
                    
                    XY=s(ii).BoundingBox;
                    if (XY(1)+XY(3))>size(L,2)
                        XY(1)=floor(XY(1));
                    end
                    if (XY(2)+XY(4))>size(L,1)
                        XY(2)=floor(XY(2));
                    end
                    X1=round(XY(2)) ;
                    Y1=round(XY(1));
                    X2=round(XY(2)+XY(4));
                    Y2=round(XY(1)+XY(3));
                    
                    ROI_L=  L(X1:X2,Y1:Y2) ;
                    
                    
                    ROI_bw= ROI_L==ii; %Only the segment to be splitted
                    
                    if  ~isonecell(ROI_bw)
                        matrix2(X1:X2,Y1:Y2)=matrix2(X1:X2,Y1:Y2)  + ROI_bw;
                    else
                        
                        figure(1)
                        imagesc(ROI_bw)
                    
                        ROI_raw=temp(X1:X2,Y1:Y2);
                        ROI_raw=255*(ROI_raw./(max(max(ROI_raw))));
                        ROI_raw=255-ROI_raw;
                        
                        
                        
                        SE1 = strel(strel_type,1) ;
                        m1 = imerode(ROI_raw(:,:,1),SE1) ;
                        
                        SE2 = strel(strel_type,2) ;
                        m2 = imerode(ROI_raw(:,:,1),SE2) ;
                        
                        SE3 = strel(strel_type,3) ;
                        m3 = imerode(ROI_raw(:,:,1),SE3) ;
                        
                        SE4 = strel(strel_type,4) ;
                        m4 = imerode(ROI_raw(:,:,1),SE4) ;
                        
                        %
                        m1 =rot_imtophat(m1) ;
                        m2 =rot_imtophat(m2) ;
                        m3 =rot_imtophat(m3) ;
                        m4 =rot_imtophat(m4) ;
                        
                        
                        m1 =  noisecomp_BACWrapper(m1 ,19,4);
                        m2 =  noisecomp_BACWrapper(m2 ,19,4);
                        m3 =  noisecomp_BACWrapper(m3 ,19,4);
                        m4 =  noisecomp_BACWrapper(m4 ,19,4);
                        
                        
                        
                        m1234=(m1+m2+m3+m4)/4 ;
                        m1234=noisecomp_BACWrapper(m1234 ,19,4);
                        
                        
                        SE = strel(strel_type,1) ;
                        m1234=  imdilate(m1234,SE) ;
                        m1234=  imerode(m1234,SE) ;
                        
                        
                        m1234=double(m1234);
                        m1234=uint8(255*(m1234./max(m1234(:))));
                        
                        T=0.05; % T is a critical coefficient. If T is too low then to many small fragments are created. If T is too high then segemnts cells are connected to each  other
                        m1234=im2bw(m1234,T);
                        m1234=bwareaopen(m1234,40);
                        
                        
                        
                        m1234=noisecomp_BACWrapper(m1234 ,19,4);
                        
                        SE = strel(strel_type,1) ;
                        m1234=  imdilate(m1234,SE) ;
                        m1234=  imerode(m1234,SE) ;
                        
                        
                        
                        figure(2)
                        imagesc(m1234)
                        
                        matrix2(X1:X2,Y1:Y2)=matrix2(X1:X2,Y1:Y2)  + ROI_bw;
                        pause
                    end
                end
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  
                