read("modexp.gp");

h(x) = x;

setrand(2);

p = nextprime(random(10^30));
q = nextprime(random(10^25));

n = p * q;
e = random(n);
phin = (p - 1) * (q - 1);

while (gcd(e, phin) != 1, e = e + 1);

d = lift(Mod(e, phin)^(-1));

(e * d) % phin;
log(n) / log(27);

m = 420
\\ Encryption
E(x) = lift(modexp(x, e, n));
\\ Decryption
D(x) = lift(modexp(x, d, n));
secret = E(m);
D(secret)
m + O(27^5);
factor(n)

\\ Signing
mx = h(m);
s = modexp(mx, d, n)

\\ Verification
v = modexp(s, e, n);
if (v == mx, print("Signature verified"), print("Signature verification failed"))
