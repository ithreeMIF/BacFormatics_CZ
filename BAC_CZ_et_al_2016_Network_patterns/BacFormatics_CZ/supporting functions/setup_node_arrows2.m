           

function [XX,YY]=  setup_node_arrows2(Pos,posmatrix,N)
    
  CASE=0
        if  Pos(1)  > (posmatrix(N,1)+ posmatrix(N,3))
            'NN in right'
            %         rotating NN and looking on parent angle:
            %         parent to NN 1 to 2:
            X1=Pos(1) + Pos(3)/2
            X2=posmatrix(N,1)+ posmatrix(N,3)/2
            Y1=Pos(2) +Pos(4)/2
            Y2=posmatrix(N,2)+posmatrix(N,4)/2
            
            
            Xc=X1-X2
            Yc=Y1-Y2
            YYY_NN=(Yc/Xc)*(Pos(4)/2)
            YYY_N=(Yc/Xc)*(posmatrix(N,4)/2)
            
            XX=[posmatrix(N,1)+posmatrix(N,3) Pos(1)];
            %         YY=[Y2-0.005 Y1+0.005];
            YY=[Y2+YYY_N  Y1-YYY_NN ]
            
            
            
            
            
            
            if YY(1)<posmatrix(N,2)
                  YY(1)= posmatrix(N,2)
                CASE=1
            end
            
            if YY(1)>posmatrix(N,2)+posmatrix(N,4)
                  YY(1)= posmatrix(N,2)+posmatrix(N,4)
                CASE=2
            end
            if YY(2)>Pos(2)+Pos(4)
                  YY(2)= Pos(2)+Pos(4)
                CASE=3
            end
            if YY(2)<Pos(2)
                  YY(2)= Pos(2)
                CASE=4
            end
            
                if XX(1)<posmatrix(N,1)
                    XX(1)= posmatrix(N,1)
                    CASE=5
                end
                
                if XX(1)>posmatrix(N,1)+posmatrix(N,3)
                    XX(1)= posmatrix(N,1)+posmatrix(N,3)
                     CASE=6
                end
                if XX(2)>Pos(1)+Pos(3)
                   XX(2)= Pos(1)+Pos(3)
                    CASE=7
                end
                if XX(2)<Pos(1)
                    XX(2)= Pos(1)
                     CASE=8
                end
                XX(2)=XX(2)-0.01
            
            
            
            
            
            
            
        end
        
        if       posmatrix(N,1) > (Pos(1)+Pos(3))
            'N in right'
            X1=Pos(1) + Pos(3)/2
            X2=posmatrix(N,1)+ posmatrix(N,3)/2
            Y1=Pos(2) +Pos(4)/2
            Y2=posmatrix(N,2)+posmatrix(N,4)/2
            
            
            Xc=X1-X2
            Yc=Y1-Y2
            YYY_NN=(Yc/Xc)*(Pos(4)/2)
            YYY_N=(Yc/Xc)*(posmatrix(N,4)/2)
            
            
            XX=[posmatrix(N,1) Pos(1)+Pos(3)];
            %         YY=[Y2-0.005 Y1+0.005];
            YY=[Y2-YYY_N  Y1+YYY_NN ]
            
            
            
            %          YY=[Y2 Y1]
            
            
          
            if YY(1)<posmatrix(N,2)
%                 YY(1)= posmatrix(N,2)
                CASE=9
            end
            
            if YY(1)>posmatrix(N,2)+posmatrix(N,4)
%                 YY(1)= posmatrix(N,2)+posmatrix(N,4)
                CASE=10
            end
            if YY(2)>Pos(2)+Pos(4)
%                 YY(2)= Pos(2)+Pos(4)
                CASE=11
            end
            if YY(2)<Pos(2)
%                 YY(2)= Pos(2)
                CASE=12
            end
                   if XX(1)<posmatrix(N,1)
                    XX(1)= posmatrix(N,1)
                    CASE=13
                end
                
                if XX(1)>posmatrix(N,1)+posmatrix(N,3)
                    XX(1)= posmatrix(N,1)+posmatrix(N,3)
                     CASE=14
                end
                if XX(2)>Pos(1)+Pos(3)
                   XX(2)= Pos(1)+Pos(3)
                    CASE=15
                end
                if XX(2)<Pos(1)
                    XX(2)= Pos(1)
                     CASE=16
                end
             XX(2)=XX(2)+0.005
        end
        
        
        
        if  Pos(1)  <= (posmatrix(N,1)+ posmatrix(N,3)) &   posmatrix(N,1) <= (Pos(1)+Pos(3)) | CASE>0
          CASE
       if       posmatrix(N,2) >= (Pos(2)+Pos(4))
                
                
              X1=Pos(1) + Pos(3)/2
                X2=posmatrix(N,1)+ posmatrix(N,3)/2
                Y1=Pos(2) +Pos(4)/2
                Y2=posmatrix(N,2)+posmatrix(N,4)/2
                clc
                Xc=X1-X2
                Yc=Y1-Y2
                XXX_NN=(Xc/Yc)*(Pos(4)/2)
                XXX_N=(Xc/Yc)*(posmatrix(N,4)/2)
                YY=[posmatrix(N,2)  Pos(2)+Pos(4)];
                %         YY=[Y2-0.005 Y1+0.005];
                XX=[X2-XXX_N  X1+XXX_NN ]  
                
               
                if YY(1)<posmatrix(N,2)
                    YY(1)= posmatrix(N,2)
                end
                
                if YY(1)>posmatrix(N,2)+posmatrix(N,4)
                    YY(1)= posmatrix(N,2)+posmatrix(N,4)
                end
                if YY(2)>Pos(2)+Pos(4)
                    YY(2)= Pos(2)+Pos(4)
                end
                if YY(2)<Pos(2)
                    YY(2)= Pos(2)
                end
                
                    if XX(1)<posmatrix(N,1)
                    XX(1)= posmatrix(N,1)
                end
                
                if XX(1)>posmatrix(N,1)+posmatrix(N,3)
                    XX(1)= posmatrix(N,1)+posmatrix(N,3)
                end
                if XX(2)>Pos(1)+Pos(3)
                   XX(2)= Pos(1)+Pos(3)
                end
                if XX(2)<Pos(1)
                    XX(2)= Pos(1)
                end 
                
                YY(2)=YY(2)+0.005
            end
            
            
            
            
            
            
            
        if       posmatrix(N,2) <= (Pos(2)+Pos(4))
                X1=Pos(1) + Pos(3)/2
                X2=posmatrix(N,1)+ posmatrix(N,3)/2
                Y1=Pos(2) +Pos(4)/2
                Y2=posmatrix(N,2)+posmatrix(N,4)/2
                clc
                Xc=X1-X2
                Yc=Y1-Y2
                XXX_NN=(Xc/Yc)*(Pos(4)/2)
                XXX_N=(Xc/Yc)*(posmatrix(N,4)/2)
                YY=[posmatrix(N,2)+posmatrix(N,4) Pos(2)];
                %         YY=[Y2-0.005 Y1+0.005];
                XX=[X2+XXX_N  X1-XXX_NN ]
                
                if YY(1)<posmatrix(N,2)
                    YY(1)= posmatrix(N,2)
                end
                
                if YY(1)>posmatrix(N,2)+posmatrix(N,4)
                    YY(1)= posmatrix(N,2)+posmatrix(N,4)
                end
                if YY(2)>Pos(2)+Pos(4)
                    YY(2)= Pos(2)+Pos(4)
                end
                if YY(2)<Pos(2)
                    YY(2)= Pos(2)
                end
                
                   YY(2)=YY(2)-0.01
        end 
        end
        
          if XX(1)<posmatrix(N,1)
                    XX(1)= posmatrix(N,1)
                    CASE=5
                end
                
                if XX(1)>posmatrix(N,1)+posmatrix(N,3)
                    XX(1)= posmatrix(N,1)+posmatrix(N,3)
                     CASE=6
                end
                if XX(2)>Pos(1)+Pos(3)
                   XX(2)= Pos(1)+Pos(3)
                    CASE=7
                end
                if XX(2)<Pos(1)
                    XX(2)= Pos(1)
                     CASE=8
                end
 