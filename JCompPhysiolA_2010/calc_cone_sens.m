function sensitivities = calc_cone_sens(pigment_l_max, oil_droplet_b, oil_droplet_l_0, ocular_medium, region)

    l = region;
    %oe = ones(1,600);

    sensitivities = zeros(4,size(l,2));
    droplet = sensitivities;
    ocular = sensitivities;
    cone = sensitivities;

    for cone_type = 1:4
        % eq. 4 in H&V 2005
        droplet(cone_type,:) = droplet_trans( l, oil_droplet_l_0(cone_type), oil_droplet_b(cone_type));

        % published data on file
        ocular(cone_type,:)  = ocular_medium( 1:size(l,2) );

        % Equation 1, 2, 4, 5a and 5b from Govardovskii et al 2000 
        cone(cone_type,:)    = cone_sensitivity( l, pigment_l_max(cone_type));

        % combine and use eq 5 from H&V 2005
        sensitivities(cone_type,:) = normalize_to_one(ocular(cone_type,:) .* droplet(cone_type,:) .* cone(cone_type,:) );
    end

end