function norm = normalize_to_one(f)
    mi = min(f);
    mx = max(f);
    norm = (f-mi)./(mx-mi);
end