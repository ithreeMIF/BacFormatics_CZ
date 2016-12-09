function [ M_out ] = Cams_PA_filt( M )

M = double(M);
M = nrmlize(M);
H_1 = fspecial('disk', 1);
H_2 = fspecial('disk', 2);

net = imresize(M, 2);

net1 = PA_net(net);
net2 = PA_net_2(net);
net = net1 + net2;
net = nrmlize(net);


 net = imfilter(net, H_1);
 net = imfilter(net, H_2);
 
 net = nrmlize(net);
 net = log(net + 1);
 net = nrmlize(net);

 net = imfilter(net, H_2);
 
net = high_pass(net, mean(mean(net)) + 2*std(std(net)));

net = 1 - sign(net);

net = imclose(net, strel('disk', 2));

M = nrmlize(-M);


rng_filt_strel = strel('disk', 6);
Range_im = rangefilt(M, rng_filt_strel.getnhood);
Range_im = bw_thresh(Range_im, 20);

%Range_im = imfill(Range_im, 'holes');
Range_im = imerode(Range_im, strel('octagon', 9));

Range_im = imresize(Range_im, 2);
Range_im = bw_thresh(Range_im, 0.5);

M = imresize(M, 2);

M = localnormalize(M, 3, 3);

M = frequency_filter(M, 300, 1);

M = nrmlize(M);
 
M = M .* Range_im;

M = nrmlize(M);

M = high_pass(M, mean(M(M~=0)) + 0 * std(M(M~=0)));

M = sign(M.*net);

M = imfill(M, 'holes');


M = imresize(M, 0.5);
M = imfilter(M, H_1);
M = nrmlize(M);

M = bw_thresh(M, mean(M(M~=0)) + 0.5 * std(M(M~=0)));
 
tat = imdilate(imbothat(M, strel('disk', 1)), strel('square', 2));

M = M .* (1 - tat);
M = close_net(M, 2);

M_out = M.*255;

end

%edges = edge(M);

%net = im_mult(net, 4);
%net = medfilt2(net, [3, 3]);
%M = imgaussfilt(M,2);
%net = imerode(net, strel('disk', 2));
% H = fspecial('disk',10);
%     blurred = imfilter(I,H,'replicate');
