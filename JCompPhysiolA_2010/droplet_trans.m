function trans = droplet_trans(l, l_0, b)
    trans = exp(-exp(-b*(l-l_0)));
end