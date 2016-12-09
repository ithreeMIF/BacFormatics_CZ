function out = semi_implicit_scheme(phi, u0, time_space, mu, nu, lambda, sigma, epsilon, P )
% Prepared by Bin Wang, 10, Jan. 2009
 


    phi_x_plus = circshift(phi, [-1 0]) - phi;
    phi_y_center  = (circshift(phi, [0 -1]) - circshift(phi, [0 1])) /2;
    c1 = 1 ./ (sqrt(phi_x_plus.^2 + phi_y_center .^2) + 1e-10);
    
    phi_x_minus = phi - circshift(phi, [1 0]);
    phi_xy_center  = (circshift(phi, [1 -1]) - circshift(phi, [1 1])) /2;
    c2 = 1 ./ (sqrt(phi_x_minus.^2 + phi_xy_center .^2) + 1e-10);
    
    phi_x_center  = (circshift(phi, [-1 0]) - circshift(phi, [1 0])) /2;
    phi_y_plus = circshift(phi, [0 -1]) - phi;
    c3 = 1 ./ (sqrt(phi_x_center .^2 + phi_y_plus.^2) + 1e-10);
    
    phi_yx_center  = (circshift(phi, [-1 1]) - circshift(phi, [1 1])) /2;
    phi_y_minus = phi - circshift(phi, [0 1]);
    c4 = 1 ./ (sqrt(phi_yx_center .^2 + phi_y_minus.^2) + 1e-10);
    
    in_val = in_average( phi, u0, epsilon );
    out_val = out_average( phi, u0, epsilon );
    diracU = dirac(phi, sigma);
    m1 = time_space * mu * diracU;
    
    C = 1 + m1 .*( c1 + c2 + c3 + c4 );

    out = (1 ./ C) .* ( phi + m1.*( c1.*circshift(phi, [-1 0]) + c2.*circshift(phi, [1 0]) ...
        + c3.*circshift(phi, [0 -1]) + c4.*circshift(phi, [0 1])) ...
        + time_space * diracU .* (- nu - lambda(1) * (u0 - in_val).^2 ...
        + lambda(2) * (u0 - out_val).^2))...
        + lambda(3) * P;
end

%% heaviside
function H = heaviside(phi, epsilon)
    H = (1 / 2) .*(1+2.0 / pi .*(atan(phi / epsilon)));
end

%% dirac
function out = dirac(phi, sigma)
    out =(1 / 2 / sigma) * (1 + cos(pi * phi / sigma));
    out = ((phi <= sigma) & (phi >= -sigma)) .* out;
end

%% in_average
function out = in_average( phi ,u0, epsilon )
    bw_out = heaviside( phi, epsilon);
    out = sum(sum(u0 .* bw_out)) / sum(bw_out(:));
end

%% out_average
function out = out_average( phi ,u0, epsilon )
    bw_out = 1 - heaviside( phi, epsilon );
    out = sum(sum(u0 .* bw_out)) / sum(bw_out(:));
end
