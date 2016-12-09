    function filt_im = frequency_filter(M_in, thresh, N)

    cim = double(M_in);
    [r,c] = size(cim);

    r_mat = repmat([1:r]', 1, c);
    c_mat = repmat([1:c], r, 1);

    pad_fac = 4;
    
    r1 = round((1 + 1/pad_fac)*r);
    c1 = round((1 + 1/pad_fac)*c);

    r1_mat = repmat([1:r1]', 1, c1);
    c1_mat = repmat([1:c1], r1, 1);

    pim = zeros((r1),(c1));
    kim = zeros((r1),(c1));

    r_i = round(r / pad_fac + 1):round((pad_fac + 1)/pad_fac * r );
    c_i = round(c / pad_fac + 1):round((pad_fac + 1)/pad_fac * c );
    
    pim(r_i, c_i) = cim;

    kim(r_i, c_i) =...
        pim(r_i, c_i).*((-1).^(r_mat + c_mat));

    %2D fft
    fim = fft2(kim);

    %N = 0.5; %order for butterworth filter
    %thresh = 200; % cutoff radius in frequency domain for filters

    % % function call for low pass filters
     %him=glp(fim,thresh); % gaussian low pass filter
     him = blpf(fim,thresh,N); % butterworth low pass filter
    %inverse 2D fft
     ifim = ifft2(him);

    ifim = ifim .* ((-1).^(r1_mat + c1_mat));

    rim = ifim(r_i, c_i);

    % retaining the ral parts of the matrix
    rim = real(rim);

    filt_im = rim;


        function res = blpf(im,thresh,n)

            % inputs
            % im is the fourier transform of the image
            % thresh is the cutoff circle radius (1,2,3...)
            % n is the order of the filter (1,2,3...)

            %outputs
            % res is the filtered image

            [ri,ci]=size(im);
            d0 = thresh;

            ri_mat = repmat([1:ri]', 1, ci);
            ci_mat = repmat([1:ci], ri, 1);

            d = sqrt(( ri_mat - (ri/2)).^2 + (ci_mat - (ci/2)).^2);

            h =  1 ./ (1 + (d/d0).^(2*n) ) ;

            res = h .* im;
        end
    end