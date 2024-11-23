/* Generating private & public key */
p = nextprime(2^128);  /* p = 3 mod 4 */
while (p % 4 != 3, p = nextprime(p + 1));

q = nextprime(p + 1);
while (q % 4 != 3, q = nextprime(q + 1));

n = p * q;

/* Encryption */
m = 256;
print("Plain: "m);

c = Mod(m, n)^2;
print("Kryptogram: "c);

/* Decryption */
a = lift(Mod(c, p)^((p + 1)/4));
b = lift(Mod(c, q)^((q + 1)/4));

inv_q = Mod(q, p)^(-1);
inv_p = Mod(p, q)^(-1);

m1 = (a * q * inv_q + b * p * inv_p) % n;
m2 = n - m1;
m3 = (-a * q * inv_q + b * p * inv_p) % n;
m4 = n - m3;

possible_m = [m1, m2, m3, m4];
for (i = 1, 4, print("Possible m", i, ": ", possible_m[i]));
