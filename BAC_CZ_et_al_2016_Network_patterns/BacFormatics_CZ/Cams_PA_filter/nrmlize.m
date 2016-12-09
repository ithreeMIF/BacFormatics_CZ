    function norm_M = nrmlize(m_in)
        
        m_in(m_in == -Inf) = min(m_in(m_in ~= -Inf));
    
        m_in(m_in == Inf) = min(min(m_in));
    
        m_in = m_in - min(min(m_in));
        
        m_in = m_in ./ max(max(m_in)); 

        m_in = m_in .* 255;
        
        m_in(isnan(m_in)) = 0;
        
        norm_M = m_in;
    end