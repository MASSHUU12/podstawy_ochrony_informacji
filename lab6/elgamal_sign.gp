p = nextprime(random(10^30));
g = 3;                        \\ Generator
x = random(p - 2) + 1;        \\ Private key (1 <= x <= p - 2)
h = Mod(g, p)^x;              \\ Public key

sign_message(m, x, p) = {
  k = random(p - 2) + 1;      \\ Random sesion key k (1 <= k <= p - 2)
  while(gcd(k, p - 1) != 1,
    k = random(p - 2) + 1;
  );
  r = Mod(g, p)^k;
  k_inv = Mod(k, p - 1)^(-1); \\ k mod (p - 1)
  s = ((m - x * lift(r)) * lift(k_inv)) % (p - 1);
  return([lift(r), s]);
}

verify(m, signature, h, p) = {
  r = signature[1];
  s = signature[2];
  if (r <= 0 || r >= p, return(0),
    v1 = Mod(h, p)^r * Mod(r, p)^s;
    v2 = Mod(g, p)^m;
    return(v1 == v2)
  );
}

plain = 256;
signature = sign_message(plain, x, p);

is_valid = verify(plain, signature, h, p);

print("Is valid: ", is_valid);
