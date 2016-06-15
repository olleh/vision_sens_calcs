function test_cone_sens()
    % Unit tests for the functions
    function test_alpha(l)
        x = alpha_band(l,410);
        assert( l(51)==350 )
        assert( abs(x(51)  - 0.2936) < 0.0001 )
        assert( abs(x(53)  - 0.2936) > 0.0001 )
        assert( abs(x(151) - 0.4099) < 0.0001 )
    end

    function test_beta(l)
        x = beta_band(l,410);
        assert( l(21)==320 )
        assert( abs(x(21)  - 0.2594) < 0.0001 )
        assert( abs(x(21)  - 0.2596) > 0.0001 )
        assert( abs(x(101) - 0.0035) < 0.0001 )
    end

    function test_normalize(l)
        x = normalize_to_one(alpha_band(l,410));
        assert( max(x) == 1 )
        assert( min(x) == 0 )   
    end

    function test_SWS1(l)
        x = normalize_to_one(droplet_trans( l, 200, 0.08) .* cone_sensitivity(l, 362));
        y = normalize_to_one(cone_sensitivity(l, 362));
        assert( abs(x(50) - y(50)) < 0.001 )
    end

    % Run the tests
    l = 300:700;
    test_alpha(l)
    test_beta(l)
    test_normalize(l)
    test_SWS1(l)
end