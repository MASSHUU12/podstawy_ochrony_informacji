modexp(a, b, n) = {
    local(d, bin);
    d = 1;
    bin = binary(b);

    for (i = 1, length(bin),
        d = Mod(d*d, n);
        if(bin[i] == 1,
            d = Mod(d*a, n);
        );
    );
    return(d);
}
