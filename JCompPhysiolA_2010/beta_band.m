% Eq 4, 5a and 5b in Govardovskii et al 2000
function beta = beta_band( l, l_max)
    
    beta_l_max = 189 + 0.315 * l_max;   % eq 5b
    b = -40.5 + 0.195 * l_max;          % bandwidth eq 5b
    
    beta = 0.26 * exp(-((l-beta_l_max)/b).^2);
    
end