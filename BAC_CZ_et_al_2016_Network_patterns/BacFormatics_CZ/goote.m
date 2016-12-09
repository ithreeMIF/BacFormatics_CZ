    if strcmp(sel_typ,'normal')==1
             
           xy_matrix(N_frames).cdata=[];
           
           
            choice = questdlg('How do you want to track the selected cell?', ...
                'Hello User', ...
                'Rewind','Forward','Forward');
            % Handle response
            pause(0.1)
            switch choice
                case 'Rewind'
                    Forward = 0;
                case 'Forward'
                    Forward = 1;
            end 

            answer = inputdlg('Please input number of frames to follow or leave automatic as default','Input',1,{'automatic'});
            
            pause(0.1)
            n_frames_to_track=str2double(char(answer)) ;
            
            if  Forward==1
            
            if isnan(n_frames_to_track)
%                 
%                 Val=handles.mode4_vec;  val_vec=[]; 
%                 h=waitbar(0,'please wait ....'); 
%                 Counter=1;
%                 val_vec(Counter)=Val;
%                 filename=char(box_list( n));
%                 temp_Segmentation= read_image2(handles, n ,3,Projected_by, filename,handles.data_file, track_what,track_what);
%                 L1=bwlabel(temp_Segmentation,4);
%                 matrix3=L1==Val;
%                 temp_Raw  = read_image2(handles,n  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
%                 s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
%                 xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=n;
%                 
%                 X1=round(xy(2)) ;
%                 Y1=round(xy(1));
%                 X2=round(xy(2)+xy(4));
%                 Y2=round(xy(1)+xy(3));
%                 Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
%                 Sum_vec(Counter)= sum(matrix3(:)) ;
%                 Counter=2;
%                 
%                 for ii=1:N_frames-n 
%                     waitbar(ii/(N_frames-n))
%                     
%                     filename0=char(box_list(ii+n-1));
%                     temp_Segmentation0 = read_image2(handles,ii+n ,3,Projected_by, filename0,handles.data_file, track_what,track_what);
%                     L0=bwlabel(temp_Segmentation0,4);
%                     
%                     filename1=char(box_list(ii+n));
%                     temp_Segmentation1  = read_image2(handles,ii+n-1 ,3,Projected_by, filename1,handles.data_file, track_what,track_what);
%                     temp_Raw  = read_image2(handles,ii+n-1 ,1,Projected_by, filename1,handles.data_file, track_what,track_what);
%                     L1=bwlabel(temp_Segmentation1,4);
%                     LL1=L1;
%                     
%                     L1(L0~=Val)=0;
%                     
%                     L1_VEC=L1;
%                     L1_VEC(L1_VEC==0)=[];
%                     Val= mode(L1_VEC);
%                     
%                     
%                     val_vec(Counter)=Val ;
%                     matrix3=LL1==Val;
%                     
%                     
%                     
%                     %
%                     %
%                     %                     filename=char(box_list(ii+n-1));
%                     %                     [temp_Segmentation ,~]= read_image2(handles,ii+n-1 ,3,Projected_by, filename,handles.data_file, track_what,track_what);
%                     %                     temp_Segmentation2=bwlabel(temp_Segmentation,4);
%                     %
%                     %                     filename=char(box_list(ii+n));
%                     %                     [temp_Segmentation ,~]= read_image2(handles,ii+n ,3,Projected_by, filename,handles.data_file, track_what,track_what);
%                     %
%                     %
%                     %
%                     %
%                     %                     L1=bwlabel(temp_Segmentation,4);
%                     %                     L1(temp_Segmentation2~=Val)=0;
%                     
%                     
%                     
%                     
%                     temp_Raw  = read_image2(handles,ii+n  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
%                     s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
%                     xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=ii+n;
%                     
%                     X1=round(xy(2)) ;
%                     Y1=round(xy(1));
%                     X2=round(xy(2)+xy(4));
%                     Y2=round(xy(1)+xy(3));
%                     Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
%                     %                     figure(1)
%                     %                     imagesc(matrix3)
%                     Sum_vec(Counter)= sum(matrix3(:)) ;
%                     
%                     
%                     if sum(matrix3(:))<200
%                         n_frames_to_track  =ii;
%                         break
%                     end
%                     Counter=Counter+1;
%                 end
                
                msgbox('under development')
            else
                  
            mode5_vec= handles.mode5_vec;
            handles.mode5_vec= [];    
            guidata(hObject,handles)
            kkk=length(mode5_vec); 
            for kk=1:kkk 
                Val=  mode5_vec(kk) 
                h=waitbar(0,['Preparing object: ' num2str(kk) ' please wait ....']);
                Counter=1;
                val_vec(n).cdata(Counter)=Val;
                
                
                
                
                
                
                filename=char(box_list( n));
                temp_Segmentation= read_image2(handles, n ,3,Projected_by, filename,handles.data_file, track_what,track_what);
                L1=bwlabel(temp_Segmentation,4);
                matrix3=L1==Val;
                temp_Raw  = read_image2(handles,n  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
                s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
                
                
                xy_matrix(kk).cdata(Counter)=xy;  
                
                X1=round(xy(2)) ;
                Y1=round(xy(1));
                X2=round(xy(2)+xy(4));
                Y2=round(xy(1)+xy(3));
                Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
                Sum_vec(Counter)= sum(matrix3(:)) ;
                Counter=2;
                
                for ii=1:n_frames_to_track-1
                    waitbar(ii/n_frames_to_track)
                    
                    filename0=char(box_list(ii+n-1));
                    temp_Segmentation0 = read_image2(handles,ii+n ,3,Projected_by, filename0,handles.data_file, track_what,track_what);
                    L0=bwlabel(temp_Segmentation0,4);
                    
                    filename1=char(box_list(ii+n));
                    temp_Segmentation1  = read_image2(handles,ii+n-1 ,3,Projected_by, filename1,handles.data_file, track_what,track_what);
                    temp_Raw  = read_image2(handles,ii+n-1 ,1,Projected_by, filename1,handles.data_file, track_what,track_what);
                    L1=bwlabel(temp_Segmentation1,4);
                    
                    LL1=L1;
                    
                    L1(L0~=Val)=0;
                    
                    L1_VEC=L1;
                    L1_VEC(L1_VEC==0)=[];
                    Val= mode(L1_VEC);
                    
                    
                    val_vec(Counter)=Val ;
                    matrix3=LL1==Val;
                    
                    
                    
                    
                    
                    s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
                    
                    xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=ii+n;
                    X1=round(xy(2)) ;
                    Y1=round(xy(1));
                    X2=round(xy(2)+xy(4));
                    Y2=round(xy(1)+xy(3));
                    
                   
                    
                    
                    Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
                    Sum_vec(Counter)= sum(matrix3(:)) ;
                    Counter=Counter+1;
                end 
            end 
            end
            end
             if  Forward==0
            
                 
                 
                 
            if isnan(n_frames_to_track) 
%                 Val=handles.mode4_vec;  val_vec=[];  
%                 h=waitbar(0,'please wait ....'); 
%                 
%                 Counter=1;
%                 val_vec(Counter)=Val; 
%                 
%                 filename=char(box_list( n));
%                 temp_Segmentation= read_image2(handles, n ,3,Projected_by, filename,handles.data_file, track_what,track_what);
%                 L1=bwlabel(temp_Segmentation,4);
%                 matrix3=L1==Val;
%                 temp_Raw  = read_image2(handles,n  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
%                 s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
%                 xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=n;
%                 
%                 X1=round(xy(2)) ;
%                 Y1=round(xy(1));
%                 X2=round(xy(2)+xy(4));
%                 Y2=round(xy(1)+xy(3));
%                 Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
%                 Sum_vec(Counter)= sum(matrix3(:)) ;
%                 Counter=2;
%                 
%                  
%                   for ii=n:-1:2 
%        
%  
%                     
%                     
%                     waitbar(1-ii/n)
%                     
%                     filename0=char(box_list(ii));
%                     temp_Segmentation0 = read_image2(handles,ii ,3,Projected_by, filename0,handles.data_file, track_what,track_what);
%                     L0=bwlabel(temp_Segmentation0,4);
%                     
%                     filename1=char(box_list(ii-1));
%                     temp_Segmentation1  = read_image2(handles,ii-1 ,3,Projected_by, filename1,handles.data_file, track_what,track_what);
%                     temp_Raw  = read_image2(handles,ii-1 ,1,Projected_by, filename1,handles.data_file, track_what,track_what);
%                     L1=bwlabel(temp_Segmentation1,4);
%                     LL1=L1;
%                     
%                     L1(L0~=Val)=0;
%                     
%                     L1_VEC=L1;
%                     L1_VEC(L1_VEC==0)=[];
%                     Val= mode(L1_VEC);
%                     
%                     
%                     val_vec(Counter)=Val ;
%                     matrix3=LL1==Val;
%                     
%                      
%                     
%                     temp_Raw  = read_image2(handles,ii-1  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
%                     s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
%                     xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=ii-1;
%                     
%                     X1=round(xy(2)) ;
%                     Y1=round(xy(1));
%                     X2=round(xy(2)+xy(4));
%                     Y2=round(xy(1)+xy(3));
%                     Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
%                     %                     figure(1)
%                     %                     imagesc(matrix3)
%                     Sum_vec(Counter)= sum(matrix3(:)) ;
%                     
%                     
%                     if sum(matrix3(:))<200
%                         n_frames_to_track  =ii;
%                         break
%                     end
%                     Counter=Counter+1;
%                 end
                  msgbox('under development')
%                 
            else
                
             
                
            mode5_vec= handles.mode5_vec;
            handles.mode5_vec= [];    
            guidata(hObject,handles)
            kkk=length(mode5_vec); 
            for kk=1:kkk 
                Val=  mode5_vec(kk) 
                h=waitbar(0,['Preparing object: ' num2str(kk) ' please wait ....']);
                Counter=1;
                val_vec(kk).cdata(Counter)=Val;
                
                
                
                filename=char(box_list( n));
                temp_Segmentation= read_image2(handles, n ,3,Projected_by, filename,handles.data_file, track_what,track_what);
                L1=bwlabel(temp_Segmentation,4);
                matrix3=L1==Val;
                temp_Raw  = read_image2(handles,n  ,1,Projected_by, filename,handles.data_file, track_what,track_what);
                s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
                xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=n;
                
                X1=round(xy(2)) ;
                Y1=round(xy(1));
                X2=round(xy(2)+xy(4));
                Y2=round(xy(1)+xy(3));
                Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
                Sum_vec(Counter)= sum(matrix3(:)) ;
                Counter=2;
                
                
                
                
                
                
                       
               for ii=n:-1:(n-n_frames_to_track+2)
                   ii
                 waitbar(1-ii/n)
                    
                    filename0=char(box_list(ii));
                    temp_Segmentation0 = read_image2(handles,ii ,3,Projected_by, filename0,handles.data_file, track_what,track_what);
                    L0=bwlabel(temp_Segmentation0,4);
                    
                    filename1=char(box_list(ii-1));
                    temp_Segmentation1  = read_image2(handles,ii-1 ,3,Projected_by, filename1,handles.data_file, track_what,track_what);
                    temp_Raw  = read_image2(handles,ii-1 ,1,Projected_by, filename1,handles.data_file, track_what,track_what);
                    L1=bwlabel(temp_Segmentation1,4);
                    
                     
                    
                    LL1=L1;
                    
                    L1(L0~=Val)=0;
                    
                    L1_VEC=L1;
                    L1_VEC(L1_VEC==0)=[];
                    Val= mode(L1_VEC);
                    
                    
                    val_vec(Counter)=Val ;
                    matrix3=LL1==Val;
                    
                    
                    
                    
                    
                    s=regionprops(matrix3,'BoundingBox');  xy= s.BoundingBox ;
                    
                    xy_matrix(Counter,1:4)=xy;xy_matrix(Counter,5)=ii-1;
                    X1=round(xy(2)) ;
                    Y1=round(xy(1));
                    X2=round(xy(2)+xy(4));
                    Y2=round(xy(1)+xy(3));
                    
                   
                    
                    
                    Montage(Counter).cdata=double(temp_Raw(X1:X2,Y1:Y2)).*double(matrix3(X1:X2,Y1:Y2));
                    Sum_vec(Counter)= sum(matrix3(:)) ;
                    Counter=Counter+1;
                end 
            end 
             end 
             end
             close(h) 
            
            hh=plot_cell_track(Sum_vec,Montage,n,Forward);
            drawnow
            jframe = getjframe_BACWrapper(hh);
            % on_top=get(handles.on_top,'value');
            set(jframe,'AlwaysOnTop',1)
            uiwait(hh)
            
            
            
            
            
            %             figure(1)
            
            global stop_point
            if isempty(stop_point)
                return
            end
            
          
            
            
            
            xy_matrix
            
             handles.val_vec=val_vec;
            handles.xy_matrix=xy_matrix;
            guidata(hObject, handles);
            show_frame(handles,n)
             
             
             
             
        end