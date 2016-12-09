%% ________________BacFormatics Code starts here:________________
function [matrix]=segmentation_file(matrix,strel_value,strel_type, bwareaopen_value,bwareaopen_type,ii,X,pathname_Raw,Raw_filename,track_what)
global box_Raw
% Matlab user can easily  add more segmentation and binary operations options upon demand. Instructions are as the following:
% Open segmentation_file.m located in supporting functions library with Matlab editor.
%  Add indexed case. For instance, if there are 10 cases, add case 11.
% For this case add the next format:
% case 11
%  if nargin==0
%                  matrix(11)={  ‘user given name for the operation'}
%         else
%             matrix=operation added by the user
%          end
% %Example:
% %case 7
%         %    if nargin==0
%         %         matrix(7)={   'imfill holes'}
%         %    else
%         %             matrix=imfill(matrix,'holes');
%         %    end
%
% Whereas nargin==0 is used to give the function name,
% matrix is the input and returned output  image
% 7  is the case index
% imfill is the function used on input matrix
% matrix can be only in 2-D format
% 4. Save and exit the segmentation_file.m .
% 5. Open BacFormatics_F.m with Matlab editor.
% 6. Add to the indexed case under  T_popup_function slider setting. This settings are depended on the  maximum  input value. i.e.:
%             eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));
%              eval( strcat ('set(handles.T_edit_',num2str(ii), ',','''String''', ',0)'));
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Visible''', ',', '''on''', ')'));
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Max''', ',1)'));
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Min''', ',0)'));
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Value''', ',0)'));
%              eval( strcat ('set(handles.T_Slider_',num2str(ii), ',','''Sliderstep''', ',[0.005 0.05])'))
% 7. Save and exit BacFormatics_F.m .
%
%
if nargin==0
    a=1;
    b=51; % 51 estamted as the limit for the last case
    matrix= {
        'Select:'
        } ;
else
    a=X;
    b=X;
end
for iii=a:b
    switch iii
       
        
        
        case 2
            if nargin==0
                matrix(2)={'2-bwmorph'}   ;          
            else
                bwareaopen_type=regexprep( bwareaopen_type,' ','')
                
                strel_value=1;
                try
                    
                    eval(strcat('matrix=bwmorph(matrix',',','''',bwareaopen_type,'''',',','strel_value);'))     ;
                catch
                    eval(strcat('matrix=bwmorph(matrix',',','''',bwareaopen_type,'''',',Inf);'))
                end
                
                
                
            end
            
            
        case 3
            if nargin==0
                matrix(3)={'3-bwareaopen-threshsold smallest objects'}     ;
            else
                matrix=bwareaopen(matrix,strel_value,4);
            end
        case 4
            
            
            if nargin==0
                matrix(4)={ '4-bwareaopen- threshsold largest objects'}  ;
            else
                L = bwlabel(matrix,4);
                stats = regionprops(L,'Area');
                idx = find([stats.Area] < strel_value);
                matrix = ismember(L,idx);
            end
            
            
        case 5
            if nargin==0
                matrix(5)={ '5-imclose spaces and gaps'}  ;
            else
                SE = strel(strel_type,strel_value ) ;
                matrix = imclose(matrix,SE) ;
            end
            
            
        case 6
            if nargin==0
                matrix(6)={ '6-imclearborder'}  ;
            else
                SE = strel(strel_type,strel_value) ;
                matrix(:,:,1)=imtophat(matrix(:,:,1),SE);
            end
            
            
        case 7
            if nargin==0
                matrix(7)={   '7-imfill holes'}  ;
            else
                matrix=imfill(matrix,'holes');
                %     matrix2=imfill_bwlabel(matrix );
            end
            
            
            
        case 8
            if nargin==0
                matrix(8)={    '8-circularity- segmentation round objects'}  ;
            else
                
                stats=regionprops(L,'all');
                Area=cat(1,stats.Area);
                Perimeter=cat(1,stats.Perimeter);
                Circularity=4*pi*Area/Perimeter^2;
                idx = find( circularity  >strel_value) ;
                if isempty(idx)==1
                    matrix=zeros(size(matrix));
                else
                    matrix = ismember(L,idx) ;
                end
            end
            
        case 9
            if nargin == 0
                matrix(9)={   '9-circularity- threshold non-round objects'}  ;
            else
                
                L = bwlabel(matrix,4);
                stats = regionprops(L,'Area','Perimeter' );
                Area=cat(1,stats.Area);
                Perim =cat(1,stats.Perimeter);
                
                Circularity=4*pi*Area./Perim.^2;
                idx  = find(Circularity > strel_value);
                
                if isempty(idx)==1
                    matrix=zeros(size(matrix));
                else
                    matrix = ismember(L,idx) ;
                end
            end
        case 10
            if nargin==0
                matrix(10)={  '10-remove segments using local maximum'}  ;
            else
        
                maxima_full_filename  =char(strcat(pathname_Raw,'ch01_Segmented',filesep,Raw_filename,'_ch01_Segmented.tif'))  ;
                maxima_matrix=double(imread_cross(maxima_full_filename)); 
                maxima_matrix =uint8(maxima_matrix *255)  ;
                
                
                maxima_matrix2= maxima_matrix(:) ;
%                 maxima_matrix2(maxima_matrix2==0)=[];
                  
                 
                maxima_matrix(  maxima_matrix>1)=1;
                
                
                
                %   remove segments that doesnt overlay with maxima_matrix:
                Perim_bwlabel= bwlabel(matrix,4) ;
                maxima_matrix2= double(  maxima_matrix) .*double(Perim_bwlabel);
                
                
                
                unique_maxima=unique(maxima_matrix2);
                Ind=setxor(  unique_maxima,1:max(Perim_bwlabel(:)));
                Ind(Ind==0)=[];
                Ind=find(ismember(Perim_bwlabel,Ind)) ;
                matrix(Ind)=0;
                
                
                
            end
        case 11
            if nargin==0
                matrix(11)={  '11-Watershed'}   ;
            else
                L=bwlabel(matrix,4);
                stats=regionprops(L, 'BoundingBox','PixelIdxList');
                
                Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch0',num2str(track_what-1),'.tif')) ;
                temp_raw =imread_cross(Raw_full_filename);
                
                matrix0=double(zeros(size(matrix)));
                zero_MATRIX=matrix0;
                for ii=1:size(stats,1)
                    temp=zero_MATRIX;
                    temp(stats(ii).PixelIdxList)=1;
                    
                    
                    XY=stats(ii).BoundingBox  ;
                    X1=round(XY(2))  ;
                    Y1=round(XY(1))  ;
                    X2=round(XY(2)+XY(4)) ;
                    Y2=round(XY(1)+XY(3)) ;
                    
                    ROI_bw  = temp(X1:X2,Y1:Y2);
                    ROI_raw = temp_raw(X1:X2,Y1:Y2)   ;
                    ROI = activecontour(ROI_bw ,ROI_raw,  300);
                    
                    
                    %
                    % figure(1)
                    % imagesc(ROI_raw)
                    %
                    % figure(2)
                    % imagesc(ROI_bw)
                    % figure(3)
                    % imagesc(ROI)
                    % pause
                    matrix0(X1:X2,Y1:Y2)=ROI;
                end
                
                
                
                return
                
                
                se = strel(strel_type,strel_value ) ;
                L=bwlabel(matrix,4);
                stats=regionprops(L, 'BoundingBox','PixelIdxList');
                matrix0=double(zeros(size(matrix)));
                zero_MATRIX=matrix0;
                for ii=1:size(stats,1)
                    temp=zero_MATRIX;
                    temp(stats(ii).PixelIdxList)=1;
                    
                    
                    XY=stats(ii).BoundingBox  ;
                    X1=round(XY(2))  ;
                    Y1=round(XY(1))  ;
                    X2=round(XY(2)+XY(4)) ;
                    Y2=round(XY(1)+XY(3)) ;
                    
                    erodedBW = temp(X1:X2,Y1:Y2);
                    
                    
                    jj=1;
                    while max(max(bwlabel(erodedBW)))==1 && jj<5
                        erodedBW = imerode(erodedBW,se);
                        jj=jj+1;
                    end
                    
                    matrix0(X1:X2,Y1:Y2)=erodedBW;
                end
                matrix= matrix0;
                return
                %
                if jj==10 || (max(max(erodedBW )) == 0  )
                    return
                end
                
                mask_em = bwlabel_max(erodedBW,2);  % select 2 largest segments
                hy = fspecial('sobel');
                hx = hy';
                Iy = imfilter(double(mask_em), hy, 'replicate');
                Ix = imfilter(double(mask_em), hx, 'replicate');
                gradmag = sqrt(Ix.^2 + Iy.^2);
                gradmag2 = imimposemin(gradmag,   mask_em);
                L = watershed(gradmag2);
                
                
                return
                D = bwdist(BW);
                DL = watershed(D);
                bgm = DL == 0;
                hy = fspecial('sobel');
                hx = hy';
                Iy = imfilter(double(matrix), hy, 'replicate');
                Ix = imfilter(double(matrix), hx, 'replicate');
                gradmag = sqrt(Ix.^2 + Iy.^2);
                gradmag2 = imimposemin(gradmag, bgm | matrix);
                L = watershed(gradmag2);
                matrix(L<3)=0;
            end
        case 12
            if nargin==0
                matrix(12)={  '12-import channel 03'}  ;
            else
                full_filename  =char(strcat(pathname_Raw,'ch03_Segmented',filesep,Raw_filename,'_ch03_Segmented.tif'));
                matrix=imread_cross(full_filename);
                
                
                
            end
        case 13
            if nargin==0
                matrix(13)={  '13-Otsu- 2nd step-use sections'}  ;
            else
                Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch0',num2str(track_what-1),'.tif')) ;
                temp_raw2=imread_cross(Raw_full_filename);
                % matrix=matrix./255;c
                L=bwlabel(matrix,4);
                stats=regionprops(L,'Eccentricity', 'EquivDiameter','MajorAxisLength','MinorAxisLength','Area','Orientation','PixelIdxList','BoundingBox');
                zero_MATRIX=L*0;
                
                load species
                load M
                
                
                matrix0=double(zeros(size(matrix)));
                for jj=1:size(stats,1)
                    
                    
                    temp=zero_MATRIX;
                    temp(stats(jj).PixelIdxList)=1;
                    
                    
                    XY=stats(jj).BoundingBox  ;
                    X1=round(XY(2))  ;
                    Y1=round(XY(1))  ;
                    X2=round(XY(2)+XY(4)) ;
                    Y2=round(XY(1)+XY(3)) ;
                    
                    matrix_bw=temp(X1:X2,Y1:Y2);
                    matrix_intensity=temp_raw2(X1:X2,Y1:Y2) ;
                    
                    matrix_bw2=matrix_bw;
                    matrix_bw2(  matrix_bw2==0)=nan;
                    matrix_intensity=double(matrix_intensity).*matrix_bw2;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    MM(1)= stats(jj).Eccentricity;
                    MM(2)=stats(jj).EquivDiameter;
                    MM(3)=stats(jj).MajorAxisLength;
                    MM(4)= stats(jj).MinorAxisLength;
                    MM(5)= stats(jj).MinorAxisLength/stats(jj).MajorAxisLength;
                    MM(6)= stats(jj).Area;
                    
                    
                    if   stats(jj).Orientation<0
                        stats(jj).Orientation=stats(jj).Orientation+180  ;
                    end
                    
                    
                    
                    matrix_bw2=   flipdim( imrotate( matrix_bw,-stats(jj).Orientation),1);
                    peak_1=sum(matrix_bw2);   peak_2=sum(matrix_bw');
                    
                    for ii=1:10
                        peak_1=  smooth(peak_1)     ;
                        peak_2=  smooth(peak_2)     ;
                    end
                    
                    
                    peak_1(isnan( peak_1))=0;   peak_2(isnan( peak_2))=0;
                    
                    
                    
                    IND1=findpeaks_BACWrapper(peak_1) ;    npeaks_1 =peak_1(IND1) ;
                    IND2=findpeaks_BACWrapper(peak_2) ;    npeaks_2 =peak_2(IND2) ;
                    IND11=findpeaks_BACWrapper(-peak_1) ;    npeaks_11 =max(peak_1(IND11)) ;
                    IND22=findpeaks_BACWrapper(-peak_2) ;    npeaks_22 =max(peak_2(IND22));
                    
                    
                    
                    
                    
                    z1=abs((npeaks_11-mean(npeaks_1))./(npeaks_11+mean(npeaks_1))) ;
                    z2=abs((npeaks_22-mean(npeaks_2))./(npeaks_22+mean(npeaks_2))) ;
                    
                    
                    MM(7)=length(npeaks_1) ;
                    MM(8)=length(npeaks_2) ;
                    MM(9)=z1;
                    MM(10)=z2;
                    
                    
                    
                    matrix_intensity2=   flipdim( imrotate( matrix_intensity,stats(jj).Orientation),1);
                    
                    % figure(2)
                    % imagesc(matrix_intensity2)
                    peak_1=nansum(matrix_intensity2);
                    
                    for ii=1:5
                        peak_1=  smooth(peak_1)     ;
                    end
                    
                    
                    peak_1(isnan( peak_1))=0;
                    
                    
                    
                    IND1=findpeaks_BACWrapper(peak_1) ;    npeaks_1 =peak_1(IND1) ;
                    IND11=findpeaks_BACWrapper(-peak_1) ;    npeaks_11 =max(peak_1(IND11)) ;
                    
                    
                    
                    
                    
                    z1=abs((npeaks_11-mean(npeaks_1))./(npeaks_11+mean(npeaks_1))) ;
                    %  figure(3)
                    % plot(peak_1)
                    %  title(['z1-' num2str(z1) 'l-' num2str(length(npeaks_1))])
                    %  pause
                    %
                    
                    MM(11)=length(npeaks_1) ;
                    MM(12)=z1;
                    
                    
                    
                    
                    
                    [Class,Error]=classify(MM, M, species) ;
                    if  strcmp(Class,'double')==1
                        matrix0(X1:X2,Y1:Y2)= matrix0(X1:X2,Y1:Y2)+  double(watershed_split_delta_classify( matrix_bw)) ;
                    else
                        matrix0(X1:X2,Y1:Y2)= matrix0(X1:X2,Y1:Y2)+  double(matrix_bw) ;
                    end
                    
                    
                    
                    
                    %             end
                end
                
                
                
                
                
                
                
                
                figure(1)
                
                imagesc(matrix0)
                
                
                
                
                
                
                matrix=matrix0;
                % %%%%%%%%%%%%%%%%%%
                %
                %
                %
                %
                % % X Y corrdiantes of ones pixels in matrix
                % [X,Y]=find(matrix);
                % X_size=size(matrix,1);Y_size=size(matrix,2);
                % XY=sub2ind([X_size Y_size],X,Y);
                %
                %
                %
                %
                % XX=(X-1);XX(XX<1)=nan;XX(XX>X_size)=nan; pixel_left= [XX Y]   ;
                %
                %  pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
                %
                %  pixel_left=matrix(pixel_left);
                %
                %
                %
                % XX=(X+1);XX(XX<1)=nan;XX(XX>X_size)=nan; pixel_right=[XX Y]   ;
                %
                % pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
                %
                % pixel_right=matrix(pixel_right);
                %
                %
                % YY=(Y+1);YY(YY<1)=nan; YY(YY>Y_size)=nan; pixel_up=[X YY]   ;
                %
                % pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
                %
                % pixel_up=matrix(pixel_up);
                %
                %
                % YY=(Y-1); YY(YY<1)=nan;YY(YY>Y_size)=nan;pixel_down=[X YY]   ;
                %
                % pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
                % pixel_down=matrix(pixel_down);
                %
                %
                % pixel_leftright=pixel_left+ pixel_right;
                % pixel_updown=pixel_up+ pixel_down;
                %
                %  ind1=find(ismember(pixel_leftright,2));
                %  ind2=find(ismember(pixel_updown,0));
                %
                % ind12=intersect(ind1,ind2);
                %
                %  XY=XY(ind12);
                %
                %  matrix(XY)=0;
                %
                %
                %  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %  matrix=rot90(matrix);
                %  % X Y corrdiantes of ones pixels in matrix
                % [X,Y]=find(matrix);
                % X_size=size(matrix,1);Y_size=size(matrix,2);
                % XY=sub2ind([X_size Y_size],X,Y);
                %
                %
                %
                %
                % XX=(X-1);XX(XX<1)=nan;XX(XX>X_size)=nan; pixel_left= [XX Y]   ;
                %
                %  pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
                %
                %  pixel_left=matrix(pixel_left);
                %
                %
                %
                % XX=(X+1);XX(XX<1)=nan;XX(XX>X_size)=nan; pixel_right=[XX Y]   ;
                %
                % pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
                %
                % pixel_right=matrix(pixel_right);
                %
                %
                % YY=(Y+1);YY(YY<1)=nan; YY(YY>Y_size)=nan; pixel_up=[X YY]   ;
                %
                % pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
                %
                % pixel_up=matrix(pixel_up);
                %
                %
                % YY=(Y-1); YY(YY<1)=nan;YY(YY>Y_size)=nan;pixel_down=[X YY]   ;
                %
                % pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
                % pixel_down=matrix(pixel_down);
                %
                %
                % pixel_leftright=pixel_left+ pixel_right;
                % pixel_updown=pixel_up+ pixel_down;
                %
                %  ind1=find(ismember(pixel_leftright,2));
                %  ind2=find(ismember(pixel_updown,0));
                %
                % ind12=intersect(ind1,ind2);
                %
                %  XY=XY(ind12);
                %
                %  matrix(XY)=0;
                %
                %
                %
                %
                %   matrix=rot90(rot90(rot90(matrix)));
                %
                %
                %
                %
                %
                % %%%%%%%%%
                
                matrix=bwareaopen(matrix,40,4);
                
                
                
                
                
                
                
                
                
                
                
                % matrix(matrix>0)=255;
                
                
                
                
                
                
                % matrix =Otsu_2nd_step_use_sections( pathname_Raw,Raw_filename,track_what,matrix,strel_value,bwareaopen_value);
            end
        case 14
            if nargin==0
                matrix(14)={  '14-Otsu- 2nd step- without sections'}  ;
            else
                
                
                
                
                
                
                
                
                
                
                
                
                Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch0',num2str(track_what-1),'.tif')) ;
                temp=double(imread_cross(Raw_full_filename));
                temp=255*(temp./(max(max(temp))));
                temp=255-temp;
                full_filename  =char(strcat(pathname_Raw,'ch02_Segmented',filesep,Raw_filename,'_ch02_Segmented.tif'))
                Lines_matrix=flipdim(imread_cross(full_filename),1);   Lines_matrix(   Lines_matrix>1)=1;
                Perim_bwlabel= bwlabel(matrix) ;Lines_matrix_bwlabel=bwlabel(Lines_matrix,8);
                
                
                
                Lines_matrix= double(Lines_matrix) .*double(Perim_bwlabel);
                
                
                s=regionprops(Perim_bwlabel,'BoundingBox');
                
                
                for ii=1:max(Perim_bwlabel(:))
                    Ind=find(ismember(Perim_bwlabel,ii));
                    Val=Lines_matrix_bwlabel(Ind);
                    Nseg=length(unique(Val))-1;
                    if Nseg>1
                        
                        matrix(Ind)=0;
                        XY=s(ii).BoundingBox  ;
                        XY(3)=XY(1)+XY(3); XY(4)=XY(2)+XY(4) ;
                        bw= Perim_bwlabel(floor(XY(2)): round(XY(4)), floor(XY(1)): round(XY(3))) ;bw(bw~=ii)=0;bw=bw./ii;
                        
                        ROI_temp_raw=double(temp(floor(XY(2)): round(XY(4)), floor(XY(1)): round(XY(3)))).*double(bw);
                        erodedBW=  Lines_matrix(floor(XY(2)): round(XY(4)), floor(XY(1)): round(XY(3))) ;  erodedBW( erodedBW~=ii)=0; erodedBW= erodedBW./ii;
                        
                        bw=Objects_split(bw,ROI_temp_raw,erodedBW);
                        
                        matrix(floor(XY(2)): round(XY(4)), floor(XY(1)): round(XY(3)))  = matrix(floor(XY(2)): round(XY(4)), floor(XY(1)): round(XY(3)))+bw;
                    end
                end
                
                
                matrix(matrix>1)=1;
                
                
                %
                %       figure
                %       imagesc(matrix)
                %
                L=bwlabel(matrix,4);
                %          figure
                %       imagesc(L)
                %  s  = regionprops(L,'Centroid', 'Area','Orientation','Eccentricity' );
                s  = regionprops(L,  'Area' );
                for ii=1:size(s,1)
                    if s(ii).Area<40
                        L(L==ii)=0;
                    end
                    %
                    %     vec(ii)=s(ii).Area;
                    
                    if s(ii).Area>1800
                        L(L==ii)=0;
                    end
                    
                    
                    
                    
                    
                    
                    
                    % matrix =Otsu_2nd_step_without_sections( pathname_Raw,Raw_filename,track_what,matrix);
                end
                L(L>1)=1;L=L*255;
                matrix=L;
            end
        case 15
            if nargin==0
                matrix(15)={  '15-Watershed- 2nd step-use sections'}  ;
            else
                matrix =Watershed_2nd_step_use_sections( pathname_Raw,Raw_filename,track_what,matrix,strel_value,bwareaopen_value);
            end
        case 16
            if nargin==0
                matrix(16)={  '16-Watershed- 2nd step- without sections'} ;
            else
                matrix =Watershed_2nd_step_without_sections( pathname_Raw,Raw_filename,track_what,matrix);
            end
        case 17
            if nargin==0
                matrix(17)={  '17-Intensity split trough Xaxis - 2nd step-use sections'}  ;
            else
                matrix =I_split_Xaxis_2nd_step_use_sections( pathname_Raw,Raw_filename,track_what,matrix,strel_value);
            end
        case 18
            if nargin==0
                matrix(18)={  '18-Intensity split trough Xaxis- 2nd step- without sections'}  ;
            else
                matrix =I_split_Xaxis_2nd_step_without_sections( pathname_Raw,Raw_filename,track_what,matrix);
            end
        case 19
            if nargin==0
                matrix(19)={  '19-Inverse intensity'}  ;
            else
                matrix=~matrix;
                
                
                
                
                % matrix= bwlabel(matrix,4);
                %
                % matrix(matrix==1)=0;
                % matrix(matrix==2)=0;
                % figure;imagesc(matrix)
                
                
                
            end
            
        case 20
            if nargin==0
                matrix(20)={  '20-imfill_bwlabel'}  ;
            else 
                matrix =imfill_bwlabel(matrix );  
            end
            
            
            
            
            
        case 21
            if nargin==0
                matrix(21)={  'function 21'}  ;
            else
                
            end
            
        case 22
            if nargin==0     %special imclose that imclose in steps
                matrix(22)={'function 22'}     ;
            else
                matrix(matrix>1)=1;
                
                
                matrix_imfill=imfill(matrix,'holes');
                matrix_delta1=matrix-matrix_imfill;
                matrix_delta1_dilate= bwmorph(matrix_delta1,'dilate',1 );
                matrix2=matrix ; matrix2( matrix_delta1_dilate>0)=0;
                
                SE = strel('disk',1 ) ;
                matrix_imclose1=imclose(matrix2,SE);
                matrix_imfill2=imfill(matrix_imclose1,'holes');
                matrix_delta2=matrix2-matrix_imfill2;
                matrix_delta2_dilate= bwmorph(matrix_delta2,'dilate',1 );
                matrix3=matrix2 ; matrix3( matrix_delta2_dilate>0)=0;
                
                SE = strel('disk',2 ) ;
                matrix_imclose2=imclose(matrix3,SE);
                matrix_imfill3=imfill(matrix_imclose2,'holes');
                matrix_delta3=matrix3-matrix_imfill3;
                matrix_delta3_dilate= bwmorph(matrix_delta3,'dilate',1 );
                matrix4=matrix3 ; matrix4( matrix_delta3_dilate>0)=0;
                
                matrix =matrix_delta1_dilate+matrix_delta2_dilate+matrix_delta3_dilate;
                
                
                
                
                %    full_filename  =char(strcat(pathname_Raw,'ch02_Filtered\',Raw_filename,'_ch02_Filtered.tif'))     ;
                %  bb=imread_cross( full_filename);
                %    bb(bb<30)=0;bb(bb>0)=1;bb=double(bb)+double(matrix);bb(bb>0)=1;
                %     matrix=uint8(255*bb);
                % matrix=bwareaopen(matrix,strel_value,4);
            end
        case 23
            if nargin==0
                matrix(23)={'function 23'}     ;
            else
                % matrix=bwareaopen(matrix,strel_value,4);
            end
        case 24
            if nargin==0
                matrix(24)={'24-create training set'}     ;
            else
                
                
                a=im2bw(matrix,0.99);
                
                SE = strel('disk',1 ) ;
                a= imclose(a,SE) ;
                
                
                
                
                BW=bwdist(a);
                
                
                
                
                
                L=zeros(size(a));  L(BW==2)=1;;L(BW==1)=1; A=a;A=A-L;A(A~=1)=0 ;
                
                
                
                L = bwlabel(A,4);
                stats = regionprops(L,'Area');
                idx = find([stats.Area] > 50);
                a = ismember(L,idx);
                matrix =uint8(a*255);
                
                
                
                
                Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch0',num2str(track_what-1),'.tif')) ;
                temp_raw2=imread_cross(Raw_full_filename);
                temp_raw=edge(temp_raw2,'log' );
                
                
                
                matrix=bwareaopen(matrix,40,4);
                SE = strel(strel_type,2 ) ;
                matrix = imclose(matrix,SE) ;
                matrix2=imfill_bwlabel(matrix );
                %    
                
                temp_raw(temp_raw>0)=1;     matrix(matrix>0)=1;
                
                matrix=abs(matrix-1);
                
                
                
                temp_raw(matrix==0)=1;
                matrix=~temp_raw;
                
                
                
                matrix=bwareaopen(matrix,40,4);
                %
                
                
            end
        case 25
            if nargin==0
                matrix(25)={'25-clean segments'}     ;
            else
                
                % matrix(1,:)=0;matrix(end,:)=0;
                % matrix(:,1 )=0;matrix(:,end )=0;
                
                
                % X Y corrdiantes of ones pixels in matrix
                [X,Y]=find(matrix);
                X_size=size(matrix,1);Y_size=size(matrix,2);
                XY=sub2ind([X_size Y_size],X,Y);
                
                
                
                
                XX=(X-1);  pixel_left= [XX Y]   ;
                
                pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
                
                pixel_left=matrix(pixel_left);
                
                
                
                XX=(X+1);   pixel_right=[XX Y]   ;
                
                pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
                
                pixel_right=matrix(pixel_right);
                
                
                YY=(Y+1);  pixel_up=[X YY]   ;
                
                pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
                
                pixel_up=matrix(pixel_up);
                
                
                YY=(Y-1);  pixel_down=[X YY]   ;
                
                pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
                pixel_down=matrix(pixel_down);
                
                
                pixel_leftright=pixel_left+ pixel_right;
                pixel_updown=pixel_up+ pixel_down;
                
                ind1=find(ismember(pixel_leftright,2));
                ind2=find(ismember(pixel_updown,0));
                
                ind12=intersect(ind1,ind2);
                
                XY=XY(ind12);
                
                matrix(XY)=0;
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                matrix=rot90(matrix);
                % X Y corrdiantes of ones pixels in matrix
                [X,Y]=find(matrix);
                X_size=size(matrix,1);Y_size=size(matrix,2);
                XY=sub2ind([X_size Y_size],X,Y);
                
                
                
                
                XX=(X-1);  pixel_left= [XX Y]   ;
                
                pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
                
                pixel_left=matrix(pixel_left);
                
                
                
                XX=(X+1);  pixel_right=[XX Y]   ;
                
                pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
                
                pixel_right=matrix(pixel_right);
                
                
                YY=(Y+1);  pixel_up=[X YY]   ;
                
                pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
                
                pixel_up=matrix(pixel_up);
                
                
                YY=(Y-1);   pixel_down=[X YY]   ;
                
                pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
                pixel_down=matrix(pixel_down);
                
                
                pixel_leftright=pixel_left+ pixel_right;
                pixel_updown=pixel_up+ pixel_down;
                
                ind1=find(ismember(pixel_leftright,2));
                ind2=find(ismember(pixel_updown,0));
                
                ind12=intersect(ind1,ind2);
                
                XY=XY(ind12);
                
                matrix(XY)=0;
                
                
                
                
                matrix=rot90(rot90(rot90(matrix)));
                
                %
                
                
                
                %%%%%%%%%
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                % tic
                %
                % matrix2=bwareaopen(matrix,40,4);
                % toc
                
                matrix = bwlabel(matrix,4);
                stats = regionprops(matrix,'Area');
                idx = find([stats.Area]>240 & [stats.Area]<80000);
                % idx = find([stats.Area]>80 & [stats.Area]<3000);
                matrix= ismember(matrix,idx);
                matrix =uint8(matrix*255);
                
                
                
                
            end
        case 26
            if nargin==0
                matrix(26)={'function 26'}     ;
            else
                
                matrix=~matrix;
                matrix=bwmorph(matrix,'spur' );
                matrix=bwmorph(matrix,'clean' );
                %      matrix=bwmorph(matrix,'hbreak' );
                matrix=bwmorph(matrix,'clean' );
                matrix=~matrix;
                %      matrix =bwareaopen( matrix,40,4);
                
                
                
                
                
                
                
                
                
                L = bwlabel(matrix,4);
                stats=regionprops(L,'MajorAxisLength','Area');
                
                idx1  = find([stats.Area] > 80);
                idx2  = find([stats.Area]  <2500);
                idx3  = find([stats.MajorAxisLength]>15);
                
                idx= intersect(idx1,idx2);
                idx= intersect(idx ,idx3);
                
                
                matrix = ismember(L,idx) ;
                matrix=bwmorph(matrix,'thicken',1 );
                
                
                
            end
        case 27
            if nargin==0
                matrix(27)={'27-Remove cells touching image edges'}     ;
            else
                
                
                matrix2=matrix*0;
                matrix2(1:end,1)=1; matrix2(1:end,end)=1;
                matrix2(1,1:end)=1; matrix2(end,1:end)=1;
                matrix4 =bwlabel(matrix,4);
                matrix3=matrix2.*matrix3   ;
                
                
                matrix3=matrix3(:);
                matrix3(matrix3==0)=[];
                matrix3=unique(matrix3);
                matrix5= (ismember(matrix4,matrix3));
                
                matrix(matrix5==1)=0;
                matrix=imfill(matrix,'holes');
                
                
                
            end
        case 28
            if nargin==0
                matrix(28)={'28-Clean E. Coli'}     ;
            else
                
                matrix=bwareaopen(matrix,320,4);
                SE = strel('disk',3) ;
                matrix = imerode(matrix,SE) ;
                matrix = imdilate(matrix,SE) ;
                
                
                matrix3=bwlabel(matrix,4);
                matrix4= matrix3;
                
                matrix2=matrix*0;
                matrix2(1:end,1:2)=1; matrix2(1:end,end-1:end)=1;
                matrix2(2,1:end)=1; matrix2(end-1:end,1:end)=1;
                
                matrix3=matrix2.*matrix3   ;
                
                
                matrix3=matrix3(:);
                matrix3(matrix3==0)=[];
                matrix3=unique(matrix3);
                matrix5= (ismember(matrix4,matrix3));
                
                matrix(matrix5==1)=0;
                matrix=imfill(matrix,'holes');
                
                matrix=~matrix;
                matrix=bwmorph(matrix,'spur' );
                matrix=bwmorph(matrix,'clean' );
                %      matrix=bwmorph(matrix,'hbreak' );
                matrix=bwmorph(matrix,'clean' );
                matrix=~matrix;
                
                L = bwlabel(matrix,4);
                stats=regionprops(L,'MinorAxisLength','Area');
                MinorAxisLength=cat(1,stats.MinorAxisLength)   ;
                Area=cat(1,stats.Area);
                idx1  = find( Area >500)  ;
                idx2  = find( MinorAxisLength >15)  ;
                idx= intersect(idx1,idx2);
                matrix = ismember(L,idx) ;
                matrix=bwmorph(matrix,'thicken',1 );
            end
        case 29
            if nargin==0
                matrix(29)={'29-clean rods for David'}     ;
            else
                matrix=~matrix;
                matrix=bwmorph(matrix,'spur' );
                matrix=bwmorph(matrix,'clean' );
                %      matrix=bwmorph(matrix,'hbreak' );
                matrix=bwmorph(matrix,'clean' );
                matrix=~matrix;
                matrix =bwareaopen( matrix,150,4);
                
                
                
                
                
                
                L = bwlabel(matrix,4);
                stats=regionprops(L,'MajorAxisLength','MinorAxisLength','Area');
                MajorAxisLength=cat(1,stats.MajorAxisLength)   ;
                MinorAxisLength=cat(1,stats.MinorAxisLength)   ;
                AR=MinorAxisLength./MajorAxisLength;  %ASPECT  RATIO
                Area=cat(1,stats.Area);
                
                
                idx1  = find(AR < 0.20)   ;
                idx2  = find( Area   <1500)   ;
                idx3  = find( MajorAxisLength >30) ;
                
                idx= intersect(idx1,idx2);
                idx= intersect(idx ,idx3);
                
                
                matrix = ismember(L,idx) ;
                
                
                % matrix=bwareaopen(matrix,strel_value,4);
            end
        case 30
            if nargin==0
                matrix(30)={'function 30'}     ;
            else
                %   SE = strel('disk',1)  ;
                % temp_raw = imerode(temp_raw,SE) ;
                % temp_raw=  noisecomp_BACWrapper(temp_raw ,19,4);
                % temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                % temp_raw= imdilate(temp_raw,SE) ;
                % temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                
                %  Area_coeff =0.2; %ring cant be larger than 20% of the cells size
                %  Area_min =5; %ring cant be smaller than min size 10 pixels was set by RS 28.9.2015
                %  Eccentricity_coeff=0.85;
                %  MinorAxisLength_coeff=0.8 %  ring minoraxis cant be shortehr than 80% of the cells minoraxis
                %  Orientation_max=150
                %   Orientation_min=30
                %
                %
                %  full_filename  =char(strcat(pathname_Raw,'ch00_Segmented\',Raw_filename,'_ch00_Segmented.tif'))
                %  bw=imread_cross(full_filename);
                %  L=bwlabel(bw,4);
                %
                %
                %  Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch01.tif')) ;
                % temp_raw=imread_cross(Raw_full_filename) ;
                % SE = strel('disk',1)  ;
                % temp_raw = imerode(temp_raw,SE) ;
                % temp_raw=  noisecomp_BACWrapper(temp_raw ,19,4);
                % temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                % temp_raw= imdilate(temp_raw,SE) ;
                % temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                % stats=regionprops(L, 'BoundingBox','PixelIdxList');
                %
                %
                % matrix=double(zeros(size(temp_raw)));
                % zero_MATRIX=uint16(matrix) ;
                %
                %
                %
                % for ii=1:size(stats,1)
                %     temp=zero_MATRIX;
                %     temp(stats(ii).PixelIdxList)=1;
                %
                %
                %     XY=stats(ii).BoundingBox  ;
                %     X1=round(XY(2))  ;
                %     Y1=round(XY(1))  ;
                %     X2=round(XY(2)+XY(4)) ;
                %     Y2=round(XY(1)+XY(3)) ;
                %
                %     ROI_bw  = temp(X1:X2,Y1:Y2);
                %
                %
                %     s_Cell= regionprops( ROI_bw, 'Area', 'MinorAxisLength' ,'Orientation');
                %
                %
                %
                %     ROI_raw = temp_raw(X1:X2,Y1:Y2)   ;
                %     ROI_raw(ROI_bw==0)=0;
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %
                %    unique_vec=unique(ROI_raw(:));
                %    unique_vec(unique_vec==0)=[];
                %    intenisty_vec=sort(unique_vec,'descend');
                %
                %
                %    ROI =zeros(size(ROI_raw));
                %    for jj=1:length(intenisty_vec)
                %        temp_I=intenisty_vec(jj);
                %
                %        ROI(ROI_raw== temp_I)=1;
                % %     figure(1)
                % %     imagesc(ROI_raw)
                % %
                % %      figure(22)
                % %       imagesc(ROI_bw)
                %
                % ROI = imclose(ROI,[0 1 0; 1 1 1; 0 1 0] );
                % ROI= imfill(ROI,'holes');
                % L_ROI=bwlabel_max(ROI);
                % %      figure(1)
                % %     imagesc(double(L_ROI)+double(ROI_bw))
                % %
                %
                %
                %   s_Ring= regionprops(L_ROI, 'Area','Eccentricity', 'MajorAxisLength','Orientation');
                % %
                % %  ['s_Ring.Area= ' num2str(s_Ring.Area)  ' , s_Cell.Area= ' num2str(s_Cell.Area) ' , Ratio= ' num2str(s_Ring.Area/s_Cell.Area)  ]
                % %  ['s_Ring.Eccentricity= ' num2str(s_Ring.Eccentricity) ]
                % %  ['s_Ring.MajorAxisLength= ' num2str(s_Ring.MajorAxisLength)  ' s_Cell.MinorAxisLength= ' num2str(s_Cell.MinorAxisLength) ' Ratio= ' num2str(s_Ring.MajorAxisLength/s_Cell.MinorAxisLength)   ]
                % %   ['s_Ring.Orientation= ' num2str(s_Ring.Orientation) ' s_Cell.Orientation= ' num2str(s_Cell.Orientation) ' diff=' num2str(diff([s_Ring.Orientation s_Cell.Orientation]))  ]
                % %
                % %   pause
                %
                %
                %
                %   if s_Ring.Area/s_Cell.Area<Area_coeff
                %
                %       if s_Ring.Area>Area_min
                %           if s_Ring.Eccentricity>Eccentricity_coeff
                %               if s_Ring.MajorAxisLength/s_Cell.MinorAxisLength>MinorAxisLength_coeff
                %                   if  abs(diff([s_Ring.Orientation s_Cell.Orientation]))>Orientation_min & abs(diff([s_Ring.Orientation s_Cell.Orientation]))<Orientation_max
                % %                        figure(2)
                % %                        imagesc(L_ROI)
                % % title('GOOD')
                % %                       pause
                % %                       BREAK=1
                % %                       'exit-good'
                %                        matrix(X1:X2,Y1:Y2)= matrix(X1:X2,Y1:Y2)+ double(L_ROI) ;
                %                       break
                %
                %                       %  matrix(X1:X2,Y1:Y2)=matrix(X1:X2,Y1:Y2)+ROI;
                %                   end
                %               end
                %           end
                %       end
                %   else
                % %       BREAK=0
                % %       'exit-area too large'
                %       break
                %   end
                %    end
                % ii
                % end
                % matrix=logical(matrix);
                % return
                
                
                
                %%%%%%%%%%%%%%%%%
                %     remove cells touching borders:
                matrix3=bwlabel(matrix);
                matrix4= matrix3;
                matrix2=matrix*0;
                matrix2(1:end,1:2)=1; matrix2(1:end,end-1:end)=1;
                matrix2(2,1:end)=1; matrix2(end-1:end,1:end)=1;
                matrix3=matrix2.*matrix3   ;
                matrix3=matrix3(:);
                matrix3(matrix3==0)=[];
                matrix3=unique(matrix3);
                matrix5= (ismember(matrix4,matrix3));
                matrix(matrix5==1)=0;
                % %%%%%%%%%%%%
                
                % matrix_thin=bwmorph(matrix,'thin',inf);
                % matrix_endpoints=bwmorph(matrix_thin,'endpoints');
                % %   remove segments that has more than two terminaton points:
                % L= bwlabel(matrix,4) ;
                % matrix2= double( matrix_endpoints).*double(L);
                % matrix_vec=matrix2(:);
                % matrix_vec( matrix_vec==0)=[];
                % z=hist( matrix_vec,max( matrix_vec));
                % %     assumption: there are at leaast two termination points, or more:
                % ind=find(z==2);
                % matrix=ismember(L,ind);
                %%%%%%%%%%%%%%%%%
                Raw_full_filename =char(strcat(pathname_Raw,'ch00_Filtered',filesep,Raw_filename,'_ch00_Filtered.tif'))     ;
                % Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch00.tif')) ;
                temp_raw=imread_cross(Raw_full_filename) ;
                temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                
                
                
                
                
                
                
                matrix_thin=bwmorph(matrix,'thin',inf);
                matrix_thin_Raw=double(matrix_thin).*double(temp_raw);
                L=bwlabel(matrix);
                stats=regionprops(L, 'BoundingBox','PixelIdxList');
                matrix=double(zeros(size(temp_raw)));
                zero_MATRIX=double(matrix) ;
                
                for ii=1:size(stats,1)
                    try
                        temp=zero_MATRIX;
                        temp(stats(ii).PixelIdxList)=1;
                        
                        
                        XY=stats(ii).BoundingBox  ;
                        X1=round(XY(2))  ;
                        Y1=round(XY(1))  ;
                        X2=round(XY(2)+XY(4)) ;
                        Y2=round(XY(1)+XY(3)) ;
                        
                        ROI_bw  = temp(X1:X2,Y1:Y2);
                        ROI_thin  = matrix_thin(X1:X2,Y1:Y2).*ROI_bw ;
                        ROI_thin_Raw=matrix_thin_Raw(X1:X2,Y1:Y2).*ROI_bw;
                        
                        ROI_endpoints=bwmorph(ROI_thin,'endpoints');
                        
                        if sum(ROI_endpoints(:))==2 %clean by termination points
                            
                            XY= clean_thin_lines_vector(logical(ROI_thin),ROI_endpoints) ;
                            XY=sub2ind(size(ROI_thin),XY(:,1),XY(:,2));
                            vec= ROI_thin_Raw(XY);
                            try
                                Med=median(vec);
                                vec(end-15:end)=[];
                                vec(1:15)=[];
                                vec=smooth(vec);
                                peak1=findpeaks_BACWrapper(vec,'Npeaks' ,1) ;
                                peak1=vec(peak1);
                                
                                
                                Nor=abs((peak1- Med)/(peak1+ Med))
                                
                                % %
                                % % %
                                %       figure(1)
                                % %
                                %       imagesc(ROI_bw )
                                %       figure(2)
                                %      imagesc(  ROI_thin)
                                %          figure(3)
                                %       imagesc(    ROI_thin_Raw)
                                %              figure(4)
                                % %
                                % %
                                %       plot(vec)
                                %       title(['std=' num2str(std(vec)) 'NOR=' num2str(Nor)])
                                %     pause
                                
                                
                                if Nor<0.09
                                    
                                    matrix(X1:X2,Y1:Y2)= matrix(X1:X2,Y1:Y2)+ double(ROI_bw)  ;
                                end
                            catch
                                matrix(X1:X2,Y1:Y2)= matrix(X1:X2,Y1:Y2)+ double(ROI_bw)  ;
                            end
                        end
                    end
                end
                matrix=logical(matrix);
                
                
                
                
                
                
                
                
                
                
                
                %%%%%%%%%%%%%%%%%
                matrix=imfill(matrix,'holes');
                % finish
                
                %%%%%%%%%%%%%%%%%
                
                
                %     matrix2=imfill(matrix,'holes');
                %     matrix3 =matrix-matrix2;
                %     matrix3  =bwareaopen( matrix3 ,20,4);
                %
                %
                %
                % L=bwlabel(matrix3);
                % stats=regionprops(L,'Perimeter','Area')    ;
                % Area=cat(1,stats.Area);
                % Perimeter=cat(1,stats.Perimeter) ;
                % Circularity=4*pi*Area./Perimeter.^2  ;
                % idx = find(Circularity  >0.7)
                % if isempty(idx)~=1
                % matrix3  = ismember(L,idx) ;
                %
                % %   remove segments that doesnt overlay with maxima_matrix:
                %     L=bwlabel(matrix2);
                %     L2=L;
                %     L2(matrix3~=1)=0;
                %
                %     Ind=unique(L2);  Ind(Ind==0)=[];
                % %
                %     matrix  = ismember(L,Ind)-matrix3 ;
                %
                %
                
                % Ind=setxor(  unique_maxima,1:max(L(:)));
                %       Ind(Ind==0)=[];
                %       matrix=ismember(L,Ind)  ;
                
                % matrix=bwareaopen(matrix,strel_value,4);
                
            end
        case 31
            if nargin==0
                matrix(31)={'31-clean by termination points'}     ;
            else
                %
                %    matrix_thin=bwmorph(matrix,'thin');
                %      matrix_endpoints=bwmorph(matrix_thin,'endpoints');
                %
                %
                %
                % %   remove segments that has more than two terminaton points:
                %     L= bwlabel(matrix,4) ;
                %     matrix2= double( matrix_endpoints).*double(L);
                %
                %     matrix_vec=matrix2(:);
                %      matrix_vec( matrix_vec==0)=[];
                %      z=hist( matrix_vec,max( matrix_vec));
                %
                %
                % %     assumption: there are at leaast two termination points, or more:
                %
                % ind=find(z==2);
                %
                % %      unique_maxima=unique(maxima_matrix2);
                % %       Ind=setxor(  unique_maxima,1:max(Perim_bwlabel(:)));
                % %       Ind(Ind==0)=[];
                % %       Ind=find(ismember(Perim_bwlabel,Ind)) ;
                % %       matrix(Ind)=0;
                % matrix=ismember(L,ind);
                %
                %
                
                
                
            end
        case 32
            if nargin==0
                matrix(32)={'32-Apply concaves defects fix'}     ;
            else
                
                
                
                
                
                
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
                    ROI_bw3= ROI_L>0;ROI_bw3( ROI_bw==1)=0;
                    max_L_before=max(max(bwlabel(ROI_bw3,4)))+1;
                    
                    
                    
                    ROI_bw2= patch_ROI(ROI_bw,5,8);
                    %try to apply patch. But befor that we need to cheack that the number of objects cells was nit affected
                    ROI_bw3(ROI_bw2==1)=1;
                    ROI_L3=bwlabel(ROI_bw3,4);
                    max_L_after=max(ROI_L3(:));
                    
                    if max_L_before==max_L_after
                        matrix2(X1:X2,Y1:Y2)=matrix2(X1:X2,Y1:Y2)  + ROI_bw2;
                    else
                        
                        matrix2(X1:X2,Y1:Y2)=matrix2(X1:X2,Y1:Y2)  + ROI_bw;
                    end
                    
                    
                    
                    
                    
                end
                
                % matrix=bwmorph(matrix2 ,'thicken',1 );
                
                
            end
            
        case 33
            if nargin==0
                matrix(33)={'33-clean bacteria segments'}     ;
            else
                %operation to clean segments from binay image (matrix)
                
                matrix2=matrix*0;
                matrix2(1:end,1)=1; matrix2(1:end,end)=1;
                matrix2(1,1:end)=1; matrix2(end,1:end)=1;
                matrix4 =bwlabel(matrix,4);
                matrix3=matrix2.*matrix4   ;
                matrix3=matrix3(:);
                matrix3(matrix3==0)=[];
                matrix3=unique(matrix3);
                matrix5= (ismember(matrix4,matrix3));
                matrix(matrix5==1)=0;
                % matrix=imfill(matrix,'holes');
                
                
                
                % X Y corrdiantes of ones pixels in matrix
                [X,Y]=find(matrix);
                X_size=size(matrix,1);Y_size=size(matrix,2);
                XY=sub2ind([X_size Y_size],X,Y);
                XX=(X-1);  pixel_left= [XX Y]   ;
                pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
                pixel_left=matrix(pixel_left);
                XX=(X+1);   pixel_right=[XX Y]   ;
                pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
                pixel_right=matrix(pixel_right);
                YY=(Y+1);  pixel_up=[X YY]   ;
                pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
                pixel_up=matrix(pixel_up);
                YY=(Y-1);  pixel_down=[X YY]   ;
                pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
                pixel_down=matrix(pixel_down);
                pixel_leftright=pixel_left+ pixel_right;
                pixel_updown=pixel_up+ pixel_down;
                ind1=find(ismember(pixel_leftright,2));
                ind2=find(ismember(pixel_updown,0));
                ind12=intersect(ind1,ind2);
                XY=XY(ind12);
                matrix(XY)=0;
                
                matrix=rot90(matrix);
                [X,Y]=find(matrix);
                X_size=size(matrix,1);Y_size=size(matrix,2);
                XY=sub2ind([X_size Y_size],X,Y);
                XX=(X-1);  pixel_left= [XX Y]   ;
                pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
                pixel_left=matrix(pixel_left);
                XX=(X+1);  pixel_right=[XX Y]   ;
                pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
                pixel_right=matrix(pixel_right);
                YY=(Y+1);  pixel_up=[X YY]   ;
                pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
                pixel_up=matrix(pixel_up);
                YY=(Y-1);   pixel_down=[X YY]   ;
                pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
                pixel_down=matrix(pixel_down);
                pixel_leftright=pixel_left+ pixel_right;
                pixel_updown=pixel_up+ pixel_down;
                ind1=find(ismember(pixel_leftright,2));
                ind2=find(ismember(pixel_updown,0));
                ind12=intersect(ind1,ind2);
                XY=XY(ind12);
                matrix(XY)=0;
                matrix=rot90(rot90(rot90(matrix)));
                
                
                matrix=~matrix;
                matrix=bwmorph(matrix,'spur' );
                matrix=bwmorph(matrix,'clean' );
                matrix=~matrix;
                
                stats = regionprops(matrix,'Area');
                idx = find([stats.Area]>80 & [stats.Area]<4000);
                matrix= ismember(matrix,idx);
                
                
                 matrix2=zeros(size(matrix)); 
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
                   if  isbulb(ROI_bw)==0
                          matrix2(X1:X2,Y1:Y2)=matrix2(X1:X2,Y1:Y2)  + ROI_bw;
                   end 
                end
                 matrix =uint8(matrix2*255);
            end
            
        case 34
            if nargin==0
                matrix(34)={'34-Detect z-ring'}     ;
            else
                Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch01.tif')) ;
                temp_raw0=imread_cross(Raw_full_filename) ;
                
                SE = strel('disk',1)  ;
                %
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % the problem: my method doesnt work on over-saturated rings that are imaged as big disks.
                % need to find these disks and removed that from the image
                temp_raw = imerode(temp_raw0,SE) ;
                temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                temp_raw= imdilate(temp_raw,SE) ;
                a=im2bw(temp_raw,0.99);
                BW=bwdist(a);
                L=zeros(size(a));  L(BW==2)=1;;L(BW==1)=1; A=a;A=A-L;A(A~=1)=0 ;L = bwlabel(A,4);
                temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                a=im2bw(temp_raw ,0.99);
                BW=bwdist(a);
                L=zeros(size(a));  L(BW==2)=1;;L(BW==1)=1; A=a;A=A-L;A(A~=1)=0 ;
                L = bwlabel(A,4);
                stats = regionprops(L,'Area','Perimeter' );
                Area=cat(1,stats.Area);
                Perim =cat(1,stats.Perimeter);
                
                Circularity=4*pi*Area./Perim.^2;
                idx1 = find(Circularity > 0.8);
                idx2  = find(Area > 20);
                idx= intersect(idx1,idx2);
                temp_raw_spot = ismember(L,idx);
                
                
                
                
                temp_raw = imerode(temp_raw0,SE) ;
                temp_raw=double(temp_raw) ;temp_raw=255*(temp_raw./(max(max(temp_raw))));temp_raw=uint8(temp_raw);
                temp_raw=  noisecomp_BACWrapper(temp_raw ,2,4);
                temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                temp_raw= imdilate(temp_raw,SE) ;
                temp_raw=double(temp_raw) ; temp_raw=255*(temp_raw./(max(max(temp_raw)))); temp_raw=uint8(temp_raw);temp_raw=255-temp_raw;
                
                
                
                
                
                
                
                
                
                
                
                Area_coeff =0.2; %ring cant be larger than 20% of the cells size
                Area_min =8 %ring cant be smaller than min size 10 pixels was set by RS 28.9.2015
                Eccentricity_coeff=0.93;
                MinorAxisLength_coeff=0.8 %  ring minoraxis cant be shortehr than 80% of the cells minoraxis
                Orientation_max=100
                Orientation_min=80
                
                
                full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'));
                bw=imread_cross(full_filename);
                
                
                
                %  need to remove all cells that have temp_raw_spot touching:
                L=bwlabel(bw,4);
                L2=L.*temp_raw_spot ;
                cells_to_remove=unique(L2);
                cells_to_remove( cells_to_remove==0)=[];
                L_cells_to_remove=ismember(L,cells_to_remove);
                bw(L_cells_to_remove==1)=0;
                
                
                L=bwlabel(bw,4);
                
                
                
                
                
                
                
                
                
                
                
                
                
                stats=regionprops(L, 'BoundingBox','PixelIdxList');
                
                
                matrix=double(zeros(size(temp_raw)));
                zero_MATRIX=uint16(matrix) ;
                
                
                
                for ii=1:size(stats,1)
                    try
                        temp=zero_MATRIX;
                        temp(stats(ii).PixelIdxList)=1;
                        
                        
                        XY=stats(ii).BoundingBox  ;
                        X1=round(XY(2))  ;
                        Y1=round(XY(1))  ;
                        X2=round(XY(2)+XY(4)) ;
                        Y2=round(XY(1)+XY(3)) ;
                        
                        ROI_bw  = temp(X1:X2,Y1:Y2);
                        
                        
                        s_Cell= regionprops( ROI_bw, 'Area', 'MinorAxisLength' ,'Orientation');
                        
                        
                        
                        ROI_raw0 = double(temp_raw0(X1:X2,Y1:Y2))   ;
                        ROI_raw0(ROI_bw==0)=nan;
                        
                        %            figure(1)
                        %            imagesc(ROI_raw0)
                        
                        median_intensity =nanmedian(nanmedian(ROI_raw0))  ;
                        
                        
                        
                        
                        ROI_raw = temp_raw(X1:X2,Y1:Y2)   ;
                        ROI_raw(ROI_bw==0)=0;
                        unique_vec=unique(ROI_raw(:));
                        unique_vec(unique_vec==0)=[];
                        intenisty_vec=sort(unique_vec,'descend');
                        ROI =zeros(size(ROI_raw));
                        for jj=1:length(intenisty_vec)
                            
                            
                            
                            
                            temp_I=intenisty_vec(jj);
                            ROI(ROI_raw== temp_I)=1;
                            ROI = imclose(ROI,[0 1 0; 1 1 1; 0 1 0] );
                            ROI= imfill(ROI,'holes');
                            L_ROI=bwlabel_max(ROI);
                            
                            ROI_raw0_ring=ROI_raw0;
                            ROI_raw0_ring(L_ROI~=1)=nan;
                            %
                            %            figure(2)
                            %            imagesc(ROI_raw0_ring)
                            %
                            median_temp_I=nanmedian(nanmedian(ROI_raw0_ring)) ;
                            median_ratio=(median_temp_I-median_intensity)/(median_temp_I+median_intensity) ;
                            %
                            %           title(num2str(median_ratio))
                            %            pause
                            
                            if median_ratio>0.15
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                s_Ring= regionprops(L_ROI, 'Area','Eccentricity', 'MajorAxisLength','Orientation');
                                %  ['s_Ring.Area= ' num2str(s_Ring.Area)  ' , s_Cell.Area= ' num2str(s_Cell.Area) ' , Ratio= ' num2str(s_Ring.Area/s_Cell.Area)  ]
                                %  ['s_Ring.Eccentricity= ' num2str(s_Ring.Eccentricity) ]
                                %  ['s_Ring.MajorAxisLength= ' num2str(s_Ring.MajorAxisLength)  ' s_Cell.MinorAxisLength= ' num2str(s_Cell.MinorAxisLength) ' Ratio= ' num2str(s_Ring.MajorAxisLength/s_Cell.MinorAxisLength)   ]
                                %   ['s_Ring.Orientation= ' num2str(s_Ring.Orientation) ' s_Cell.Orientation= ' num2str(s_Cell.Orientation) ' diff=' num2str(diff([s_Ring.Orientation s_Cell.Orientation]))  ]
                                %    pause
                                if s_Ring.Area/s_Cell.Area<Area_coeff
                                    if s_Ring.Area>Area_min
                                        if s_Ring.Eccentricity>Eccentricity_coeff
                                            if s_Ring.MajorAxisLength/s_Cell.MinorAxisLength>MinorAxisLength_coeff
                                                if  abs(diff([s_Ring.Orientation s_Cell.Orientation]))>Orientation_min & abs(diff([s_Ring.Orientation s_Cell.Orientation]))<Orientation_max
                                                    matrix(X1:X2,Y1:Y2)= matrix(X1:X2,Y1:Y2)+ double(L_ROI) ;
                                                    break
                                                end
                                            end
                                        end
                                    end
                                else
                                    break
                                end
                            end
                            
                            ii
                        end
                    end
                end
                
                
                
                matrix=logical(matrix);
                return
            end
        case 35
            if nargin==0
                matrix(35)={'35-Exclusion by Eccentricity'}     ;
            else
                L =bwlabel(matrix,4);
                stats=regionprops(L,'Eccentricity');
                idx = find([stats.Eccentricity]>strel_value);
                matrix = ismember(L,idx) ;
            end
        case 36
            if nargin==0
                matrix(36)={'36-Exclusion base on major-axis and area (parameters infile)'}     ;
            else
                L =bwlabel(matrix);
                stats=regionprops(L,'MajorAxisLength','Area');
                
                
                
                idx1  = find([stats.Area] > 150);
                idx2  = find([stats.Area]  <3000);
                idx3  = find([stats.MajorAxisLength]>10);
                idx4  = find([stats.MajorAxisLength]<90);
                idx= intersect(idx1,idx2);
                idx= intersect(idx ,idx3);
                idx= intersect(idx ,idx4);
                matrix = ismember(L,idx) ;
                
                
                return
                
                matrix2=bwdist(~matrix);
                matrix2(matrix2<4)=0;
                matrix2(matrix2>0)=1;
                %   remove segments that have more than two segments:
                L= bwlabel(matrix2) ;
                matrix2= double( matrix2).*double(L);
                
                
                L=bwlabel(matrix);
                stats=regionprops(L, 'BoundingBox');
                matrix=double(zeros(size(matrix)));
                
                
                for ii=1:size(stats,1)
                    temp=L==ii;
                    
                    
                    XY=stats(ii).BoundingBox  ;
                    X1=round(XY(2))  ;
                    Y1=round(XY(1))  ;
                    X2=round(XY(2)+XY(4)) ;
                    Y2=round(XY(1)+XY(3)) ;
                    
                    ROI_bw  = temp(X1:X2,Y1:Y2);
                    ROI_L  = double(matrix2(X1:X2,Y1:Y2)).*double(ROI_bw);
                    
                    
                    unique_ROI_L=unique(ROI_L);
                    unique_ROI_L(unique_ROI_L==0)=[];
                    
                    if max(size(unique_ROI_L))==1
                        matrix(X1:X2,Y1:Y2)= matrix(X1:X2,Y1:Y2)+ double(ROI_bw)  ;
                    end
                end
                matrix=logical(matrix);
            end
        case 37
            if nargin==0
                matrix(37)={'37-ac_evolve'}     ;
            else
                full_filename  =char(strcat(pathname_Raw,'ch00_Filtered',filesep,Raw_filename,'_ch00_Filtered.tif'));
                matrix=imread_cross(full_filename);
                matrix=ac_evolve(matrix);
                matrix =imfill_bwlabel(matrix); 
            end
        case 38
            if nargin==0
                matrix(38)={'38-split_cells_with_thin_lines_Pseudomonas_aeruginosa1'}     ;
            else
                full_filename  =char(strcat(pathname_Raw,'ch00_Filtered',filesep,Raw_filename,'_ch00_Filtered.tif'));
                matrix_Filtered=imread_cross(full_filename);
                matrix=split_cells_with_thin_lines_Pseudomonas_aeruginosa1(matrix,matrix_Filtered); %split v-cells
                matrix=split_cells_with_thin_lines_Pseudomonas_aeruginosa2(matrix,matrix_Filtered); % split using termination points
            end
        case 39
            if nargin==0
                matrix(39)={'39-split_cells_with_thin_lines_e_coli1'}     ;
            else
                
                matrix=split_cells_with_thin_lines__e_coli1(matrix);
                
            end
        case 40
            if nargin==0
                matrix(40)={'function 40'}     ;
            else
                % matrix=bwareaopen(matrix,strel_value,4);
                
                
                Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch0',num2str(track_what-1),'.tif'))
                temp=double(imread_cross(Raw_full_filename));
                temp=255*(temp./(max(max(temp))));
                temp=255-temp;
                
                full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'))
                bw= imread_cross(full_filename)   ;
                
                
                bw=bwmorph(bw,'thicken',1);
                
                
                
                temp(bw==1)=0;
                
                
                temp(temp<120)=0;   temp(temp>=120)=1;
                
                
                temp=bwmorph(temp,'erode',1);
                %       figure(1)
                %        imagesc(temp)
                %        matrix=temp;
                %          return
                
                L=bwlabel(temp);
                s=regionprops(L);
                
                stats=regionprops(L,'MajorAxisLength','Area','Perimeter');
                
                
                Area=cat(1,stats.Area);
                Perim =cat(1,stats.Perimeter);
                Circularity=4*pi*Area./Perim.^2;
                MajorAxisLength=cat(1,stats.MajorAxisLength);
                
                
                
                idx1  = find(Circularity > 0.6 );
                idx2  = find([stats.Area] >  200);
                idx3  = find([stats.Area]  <1000);
                idx4  = find([stats.MajorAxisLength]>20);
                idx5  = find([stats.MajorAxisLength]<70);
                
                idx= intersect(idx1,idx2);
                idx= intersect(idx ,idx3);
                idx= intersect(idx ,idx4);
                idx= intersect(idx ,idx5);
                matrix = ismember(L,idx ) ;
                
                %       figure(1)
                %     imagesc(matrix)
                %
                
                
                
                
                
                
            end
            
            
        case 41
            if nargin==0
                matrix(41)={'41-function 41- detect spots within cells'}     ;
            else
                
                full_filename  =char(strcat(pathname_Raw,'ch02_Filtered',filesep,Raw_filename,'_ch02_Filtered.tif'))  ;
                matrix=double(imread_cross(full_filename));
                matrix =matrix ./max(max(matrix ));
                matrix =uint8(matrix *255)  ;
                
                
                full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'))
                bw= imread_cross(full_filename) ;
                
                
                L = bwlabel(bw,4);
                
                
                
                matrix2=zeros(size(bw));
                s=regionprops(L,'Boundingbox' );
                
                for ii=1:size(s,1)
                    ii
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
                    
                    ROI_raw=  matrix(X1:X2,Y1:Y2) ;
                    
                    
                    ROI_bw=  L(X1:X2,Y1:Y2) ;
                    ROI_bw= ROI_bw==ii; %Only the segment to be splitted
                    %
                    ROI_raw= double(ROI_raw).*double(ROI_bw) ;
                    
                    %only one local maxima per cells:
                    maxi=max(ROI_raw(:));
                    if maxi>0
                        [x,y]=find(ismember(ROI_raw,maxi)) ;
                        x=x(1);y=y(1); %if there are more than one max just choose the first one
                        
                        matrix2(X1+x ,Y1+y)=1;
                    end
                end
                
                
                matrix= matrix2;
            end
            
        case 42
            if nargin==0
                matrix(42)={'42-merging small segments with cells'}     ;
                %function that merge the small segemnts that are part of the cells. Fix for
                %over splitting.
            else
                matrix1=matrix>0;
                L1=bwlabel(matrix1,4);
                stats = regionprops(L1,'Area');
                idx  = find([stats.Area] <= 100);  %  index of  only small segments
                n=find(ismember(box_Raw,Raw_filename));
                Raw_filename0=char(box_Raw(n-1));
                full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename0,'_ch00_Segmented.tif'));
                bw= imread_cross(full_filename) ;
                matrix0=bw>0;
                L0=bwlabel(matrix0,4);
                SE=strel('disk',2);
                for ii=1:length(idx)
                    temp1=L1==idx(ii);
                    matrix11= L0.*temp1;
                    vec=matrix11(:);
                    vec(vec==0)=[];
                    index_cell_before=mode(vec);
                    temp0=L0==index_cell_before;
                    matrix00= L1.*temp0;
                    vec=matrix00(:);
                    vec(vec==0)=[];
                    index_cell_after=mode(vec);
                    temp0=L1==index_cell_after;
                    bw0=temp0+temp1;
                    bw =imclose(bw0 ,SE) ;
                    bw =imfill(bw,'holes' ) ;
                    if  max(max(bwlabel(bw,4)))==2 %couldnt connect
                        temp0_bwdist=bwdist(temp0);
                        temp1_bwdist= temp0_bwdist.*temp1;
                        temp1_bwdist( temp1_bwdist==0)=nan;
                        [x1,y1]=find(ismember( temp1_bwdist,nanmin( temp1_bwdist(:))));
                        x1=x1(1);y1=y1(1);
                        pixel_matrix=zeros(size(temp0));
                        pixel_matrix(x1,y1)=1;
                        temp0_bwdist=bwdist( pixel_matrix);
                        temp0_bwdist= double(temp0_bwdist).*double(temp0);
                        temp0_bwdist( temp0_bwdist==0)=nan;
                        [x2,y2]=find(ismember( temp0_bwdist,nanmin( temp0_bwdist(:))));
                        x2=x2(1);y2=y2(1);
                        if sqrt((x1-x2)^2+ (y1-y2)^2)<4
                            [x , y]=bresenham_BACWrapper(x1,y1,x2,y2);
                            bw0(x,y)=1;
                            bw0=imclose(bw0,[0 1 0; 1 1 1; 0 1 0]);
                            bw = imfill(bw0,'holes' ) ;
                        end
                    end
                    if   max(max(bwlabel(bw,4)))==1 % connected
                        L=bwlabel(bw ,4);
                        stats=regionprops(L,  'Eccentricity'  );
                        if stats.Eccentricity>0.9
                            matrix(bw==1)=1;
                        end
                    end
                end
            end
            
        case 43
            if nargin==0
                matrix(43)={'43-Mask local maxima'}     ;
            else 
                matrix_loxal_maxima=matrix;

full_filename  =char(strcat(pathname_Raw,'ch00_Filtered',filesep,Raw_filename,'_ch00_Filtered.tif'));
matrix=imread_cross(full_filename);
matrix=ac_evolve(matrix);
matrix =imfill_bwlabel(matrix);

matrix2=matrix*0;
matrix2(1:end,1)=1; matrix2(1:end,end)=1;
matrix2(1,1:end)=1; matrix2(end,1:end)=1;
matrix4 =bwlabel(matrix,4);
matrix3=matrix2.*matrix4   ;
matrix3=matrix3(:);
matrix3(matrix3==0)=[];
matrix3=unique(matrix3);
matrix5= (ismember(matrix4,matrix3));
matrix(matrix5==1)=0;
% matrix=imfill(matrix,'holes');



% X Y corrdiantes of ones pixels in matrix
[X,Y]=find(matrix);
X_size=size(matrix,1);Y_size=size(matrix,2);
XY=sub2ind([X_size Y_size],X,Y);
XX=(X-1);  pixel_left= [XX Y]   ;
pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
pixel_left=matrix(pixel_left);
XX=(X+1);   pixel_right=[XX Y]   ;
pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
pixel_right=matrix(pixel_right);
YY=(Y+1);  pixel_up=[X YY]   ;
pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
pixel_up=matrix(pixel_up);
YY=(Y-1);  pixel_down=[X YY]   ;
pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
pixel_down=matrix(pixel_down);
pixel_leftright=pixel_left+ pixel_right;
pixel_updown=pixel_up+ pixel_down;
ind1=find(ismember(pixel_leftright,2));
ind2=find(ismember(pixel_updown,0));
ind12=intersect(ind1,ind2);
XY=XY(ind12);
matrix(XY)=0;

matrix=rot90(matrix);
[X,Y]=find(matrix);
X_size=size(matrix,1);Y_size=size(matrix,2);
XY=sub2ind([X_size Y_size],X,Y);
XX=(X-1);  pixel_left= [XX Y]   ;
pixel_left=sub2ind([X_size Y_size],pixel_left(:,1),pixel_left(:,2));
pixel_left=matrix(pixel_left);
XX=(X+1);  pixel_right=[XX Y]   ;
pixel_right=sub2ind([X_size Y_size],pixel_right(:,1),pixel_right(:,2));
pixel_right=matrix(pixel_right);
YY=(Y+1);  pixel_up=[X YY]   ;
pixel_up=sub2ind([X_size Y_size],pixel_up(:,1),pixel_up(:,2));
pixel_up=matrix(pixel_up);
YY=(Y-1);   pixel_down=[X YY]   ;
pixel_down=sub2ind([X_size Y_size],pixel_down(:,1),pixel_down(:,2));
pixel_down=matrix(pixel_down);
pixel_leftright=pixel_left+ pixel_right;
pixel_updown=pixel_up+ pixel_down;
ind1=find(ismember(pixel_leftright,2));
ind2=find(ismember(pixel_updown,0));
ind12=intersect(ind1,ind2);
XY=XY(ind12);
matrix(XY)=0;
matrix=rot90(rot90(rot90(matrix)));


matrix=~matrix;
matrix=bwmorph(matrix,'spur' );
matrix=bwmorph(matrix,'clean' );
matrix=~matrix;

stats = regionprops(matrix,'Area');
idx = find([stats.Area]>80 & [stats.Area]<4000);
matrix= ismember(matrix,idx);


matrix2=zeros(size(matrix));
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
    if  isbulb(ROI_bw)==0
        matrix2(X1:X2,Y1:Y2)=matrix2(X1:X2,Y1:Y2)  + ROI_bw;
    end
end


matrix_loxal_maxima(matrix2==0)=0; 
matrix =uint8(matrix_loxal_maxima*255); 

            end
            
        case 44
            if nargin==0
                matrix(44)={'44-imclose without overlap'}     ;
            else
                SE = strel('disk',1 ) ;
                L=bwlabel(matrix,4);
                matrix_zeros=zeros(size(L));
                for ii=1:max(L(:))
                    bw=L==ii;
                    bw2=imclose(bw,SE) ;
                    matrix_zeros_temp=matrix_zeros+bw2;
                    if max(matrix_zeros_temp(:))==1
                        matrix_zeros= matrix_zeros_temp;
                    else
                        matrix_zeros=matrix_zeros+bw;
                    end
                    matrix_zeros(matrix_zeros==2)=0;
                end
                matrix=matrix_zeros;
            end
            
        case 45
            if nargin==0
                matrix(45)={'45-merge ch03+ch00'}     ;
            else
                full_filename  =char(strcat(pathname_Raw,'ch03_Segmented',filesep,Raw_filename,'_ch03_Segmented.tif'))
                bw_ch03=imread_cross(full_filename);
                
                full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'))
                bw_ch00=imread_cross(full_filename);
                
                matrix = bw_ch00 + bw_ch03;
                matrix(matrix>1)=1 ;
            end
            
        case 46
            if nargin==0
                matrix(46)={'46-remove round (and not small) cells'}     ;
            else
                %     full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'))
                %     matrix_from_file=imread_cross(full_filename);
                %
                %     matrix_from_file=matrix_from_file>1;
                %     L=bwlabel(matrix_from_file,4);
                %
                %     if max(L(:))>100
                %         matrix=L>0;
                %     end
                %     some small cells are round.
                L = bwlabel(matrix,4);
                stats=regionprops(L,'MajorAxisLength','MinorAxisLength','Area','Perimeter','Eccentricity');
                
                % small cells:
                idx1=find([stats.Area]<500);
                idx2=find([stats.MajorAxisLength]<40);
                idx3=find([stats.MinorAxisLength]<20);
                idx2=intersect(idx1,idx2);
                idx3=intersect(idx2,idx3);
                matrix1=ismember(L,idx3) ;
                % non-round cells:
                Area=cat(1,stats.Area);
                Perimeter=cat(1,stats.Perimeter) ;
                Circularity=4*pi*Area./Perimeter.^2  ;
                idx1=find(Circularity<0.8);
                idx2=find([stats.Eccentricity]>0.80);
                idx2=intersect(idx1,idx2);
                matrix2=ismember(L,idx2) ;
                
                matrix=matrix1;
                matrix(matrix2==1)=1;
            end
            
            
        case 47
            if nargin==0
                matrix(47)={'47-imfill without overlap to ch00'}     ;
            else
                full_filename  =char(strcat(pathname_Raw,'ch00_Segmented',filesep,Raw_filename,'_ch00_Segmented.tif'))
                matrix=imread_cross(full_filename);
                L=bwlabel(matrix,4);
                matrix_zeros=zeros(size(L));
                for ii=1:max(L(:))
                    bw=L==ii;
                    bw2=imfill(bw,'holes') ;
                    matrix_zeros_temp=matrix_zeros+bw2;
                    if max(matrix_zeros_temp(:))==1
                        matrix_zeros= matrix_zeros_temp;
                    else
                        matrix_zeros=matrix_zeros+bw;
                    end
                    matrix_zeros(matrix_zersos==2)=0;
                end
                matrix=matrix_zeros;
            end
            
        case 48
            if nargin==0
                matrix(48)={'48-reprocess bulbs'}     ;
            else
                
                
%                 Raw_full_filename = char(strcat(pathname_Raw,Raw_filename,'_ch0',num2str(track_what-1),'.tif'))
%                 temp=double(imread_cross(Raw_full_filename));
%                 
                
                
                
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
                    
                    if ~isonecell(ROI_bw)
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
                
                
                
                
                
                
                
                
                
            end
            
            
            
        case 49
            if nargin==0
                matrix(49)={'49-Remove non-round cells'}     ;
            else
                L = bwlabel(matrix,4);
                stats=regionprops(L,'MajorAxisLength','MinorAxisLength','Area','Perimeter','Eccentricity','EquivDiameter');
                
                
                diameters = ([stats.MajorAxisLength]+[stats.MinorAxisLength])/2; 
                
                idx1  = find([stats.Area]>400);
                idx2  = find(diameters>25);
                idx3  = find([stats.EquivDiameter]>25);
                
                 
                
                
                
                
                
                Area=cat(1,stats.Area);
                Perimeter=cat(1,stats.Perimeter) ;
                Circularity=4*pi*Area./Perimeter.^2  ;
                idx4 = find(Circularity>0.6);
                idx5  = find([stats.Eccentricity]<0.80);
                
                
                idx2= intersect(idx1,idx2);
                idx3= intersect(idx2,idx3);
                idx4= intersect(idx3,idx4);
                idx5= intersect(idx4,idx5);
                matrix    = ismember(L,idx5) ;
                
            end
            
        case 50
            if nargin==0
                matrix(50)={'50-Remove round cells'}     ;
            else
                matrix=logical(matrix);
                L = bwlabel(matrix,4); 
                stats=regionprops(L,'MajorAxisLength','MinorAxisLength','Area','Perimeter','Eccentricity');
                
                % small cells:
                idx1=find([stats.Area]<500);
                idx2=find([stats.MajorAxisLength]<40);
                idx3=find([stats.MinorAxisLength]<20);
                idx2=intersect(idx1,idx2);
                idx3=intersect(idx2,idx3);
                matrix1=ismember(L,idx3) ;
                % non-round cells:
                Area=cat(1,stats.Area);
                Perimeter=cat(1,stats.Perimeter) ;
                Circularity=4*pi*Area./Perimeter.^2  ;
                idx1=find(Circularity<0.8);
                idx2=find([stats.Eccentricity]>0.92);
                idx2=intersect(idx1,idx2);
                matrix2=ismember(L,idx2) ;
                
                matrix=matrix1;
                matrix(matrix2==1)=1;
                
                matrix=logical(matrix);
                %
               
                
            end
            
            
           case 51
            if nargin==0
                matrix(51)={'51-binarize'};   
            else
                matrix = logical(matrix);
                
            end          
    
    
            
            
            
    end
end
