p = nextprime(random(10^30));
g = 3;                       \\ Generator
x = random(p - 3) + 1;       \\ Private key (1 <= x <= p - 2)
h = Mod(g, p)^x;             \\ Public key

encrypt(m, h, p) = {
  k = random(p - 3) + 1;     \\ Random session key (1 <= k <= p - 2)
  c1 = Mod(g, p)^k;
  c2 = Mod(m * h^k, p);
  return([c1, c2]);
}

decrypt(c, x, p) = {
  s = c[1]^x;                \\ s = c1^x mod p
  m = Mod(c[2] * s^(-1), p); \\ m = c2 * s^(-1) mod p
  return(m);
}

plain = 256;
encrypted = encrypt(plain, h, p);
decrypted = lift(decrypt(encrypted, x, p));

print("Result: ", decrypted);
