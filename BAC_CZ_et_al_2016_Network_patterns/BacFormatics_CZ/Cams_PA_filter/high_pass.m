    function M_out = high_pass(m_in, thresh)
       
        m_in(m_in < thresh) = 0;
        
        M_out = m_in;
    
   
    end