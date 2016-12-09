    function threshed_im = bw_thresh(M, thresh)
        
        M(M < thresh) = 0;
        M(M >= thresh) = 1;
        threshed_im = M;
    end