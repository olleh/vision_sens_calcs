% Equation (1) and (2) from Govardovskii et al 2000

function alpha = alpha_band(l,l_max)
    %x = zeros(size(l));
    %lm = repmat(l_max,size(l));
    x = l_max./l;
    A = 69.7;
    a = 0.8795 + 0.0459 * exp(-((l_max-300).^2)/11940); % (eq. 2)
    B = 28;
    b = 0.922;
    C = -14.9;
    c = 1.104;
    D = 0.674;

    alpha = 1./( exp(A.*(a-x)) + exp(B*(b-x)) + exp(C*(c-x)) + D ); % (eq. 1)
end