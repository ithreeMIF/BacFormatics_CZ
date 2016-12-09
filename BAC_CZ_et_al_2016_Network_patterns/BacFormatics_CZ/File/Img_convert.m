function Img = Img_convert(Img,T)
if nargin==1
    T=2;
end
Img = double(Img(:,:,1));
Img = Img./max(Img(:)); Img=Img./T;
Img = repmat(Img, [1 1 3]); 
