% Moving average function

function mean_displacement_XY=mean_displacement(X,Y,length_Before,length_After) 
IND=find(~isnan(X));IND=IND(1);

X2=X(IND:end);Y2=Y(IND:end);



mean_displacement_XY2=mean_displacement2(X2,Y2,length_Before,length_After) ;

mean_displacement_XY=nan(size(X));
mean_displacement_XY(IND:end)=mean_displacement_XY2;
function mean_displacement_XY=mean_displacement2(X,Y,length_Before,length_After) 


 
if length_Before+length_After==0
    length_Before=1;
    'Assigning length_Before to value 1 because length_After is uqual to 0'
end 
p=length(X);
mean_displacement_XY=nan(size(X)); 
% [1 2 3 4 nan 6 7 8 9 10] 
for ii=1:p
    Before=ii-length_Before ;
    After=ii+length_After ; 
    if Before<1
        Before=1;
    end 
    if After> p
        After=p;
    end
    if Before<After+1
        X0=X(Before);
        Y0=Y(Before) ; 
        X1=X(After);
        Y1=Y(After) ; 
        mean_displacement_XY(ii)=sqrt((X1-X0).^2+(Y1-Y0).^2)/(After-Before);
        %         Before
        %         After
        %         if Before<After+1
        %         X0=X(Before)
        %         Y0=Y(Before)
        %
        %         VecX=X(Before+1:After)
        %         VecY=Y(Before+1:After)
        %
        %         vec=sqrt((VecX-X0).^2+(VecY-Y0).^2)
        %
        %          Length_vec=sum(~isnan(vec))
        %          mean_displacement_XY(ii)=nansum(vec)/Length_vec
    end
end
