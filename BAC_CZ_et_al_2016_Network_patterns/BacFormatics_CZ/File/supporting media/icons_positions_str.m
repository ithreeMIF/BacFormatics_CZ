function str =icons_positions_str(Flags,Ind) 


  
switch Ind
    case 1
        str='Mode: Edit Trajectories';
    case 2
        str='Mode: Edit Tracks';
    case 3
        str='Mode: Split Cells';
    case 4
        str='Mode: Merge Cells';
    case 5
        str='Mode: Select Cells';
    case 6
        str='Mode: Reject Segment';
    case 7
        str='Mode: Edit Association';
    case 8
        str='Mode: Paint Tool';
    case 9
        str='Apply: Open experiment';
    case 10
        str='Apply: Save experiment';
    case 11
        str='Apply: Label cells';
    case 12
        str='under construction';
    case 13
        str='Apply: Associate cells';
    case 14
        str='under construction';
    case 15
        str='Apply: Link trajectories';
    case 16
        str='Apply: Fix association';
    case 17
        str='Capture image';
    case 18
        str='under construction';
    case 19 
        
        switch Flags.Arrows
            case 1
                str='Show major axis';
            case 2
                str='Show minor axis';
            case 3
                str='Show major+minor axis';
            case 4
                str='Show displacement arrows';
            case 5
                str='Show arrows along major axis';
            case 6
                str='Show arrows from center to polar-spot';
            otherwise
                str='Visualization: Arrows options';
        end
        
        
    case 20 
         switch Flags.Events
            case 1
             str='Anotate cells appear+disappear'; 
             otherwise
               str='Visualization: Events options';    
         end
    case 21
         switch Flags.Box
            case 1
                  str='BoundingBox : all cells';
            case 2
                  str='Selected cells (contour+ROI box)';
            case 3
                  str='Selected cells (PixelList+ROI box)';
            case  4
                  str='Annotations of selected cells';
            case 5
                  str='Show only selected cells';
            otherwise
              str='Visualization: Show border options';
         end
        
         
         
    case 22  
        switch Flags.Segment
            case 1
             str='Anotate segmentation'; 
             otherwise
               str='Visualization: Show segments';    
        end
        
    case 23
         switch Flags.Contour
            case 1
               str='Show Contour-dots'; 
            case 2 
                 str='Show Contour-line'; 
            otherwise
                str='Visualization: Contour options'; 
        end
     
    case 24
        
        str='underdevelopment1';
        
    case 25 
           switch Flags.Intersection
            case 1
             str='Show Intersections'; 
             otherwise
               str='Visualization: Intersections';    
           end 
           
    case 26
         switch Flags.Center
            case 1
                    str='Show Centroid'; 
            case 2
                    str='Show Centroid+cell ID';  
            otherwise
                str='Visualization:  cell center';
         end
       
    case 27
         switch Flags.Mesh
            case 1
                str='Show interpulated ribbons+centerline';
            case 2
                str='Show interpulated contour'; 
              case 3
                str='Show closed interpulated contour'; 
           
            otherwise
                    str='Visualization: Interpulated contour';
         end
     
    case 28
          switch Flags.Centerline
            case 1
             str='Anotate Centerline'; 
             otherwise
               str='Visualization: Show Centerline';    
          end 
    case 29
        switch Flags.Polar_Points
            case 1
             str='Show polar points'; 
             otherwise
               str='Visualization: polar points';    
        end 
           
    case 30
           switch Flags.Spots
            case 1
             str='Show spots'; 
             otherwise
               str='Visualization: local maxima/spots';    
        end 
end 
 
 