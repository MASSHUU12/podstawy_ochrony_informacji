read("modexp.gp");

setrand(2);

p = nextprime(random(10^30));
q = nextprime(random(10^25));

n = p * q;
e = random(n);
phin = (p - 1) * (q - 1);

while (gcd(e, phin) != 1, e = e + 1);
e;

\\d = lift(modexp(e, -1, phin));
d = lift(Mod(e, phin)^(-1));

(e * d) % phin;
log(n) / log(27);

m = 420
E(x) = lift(modexp(x, e, n));
D(x) = lift(modexp(x, d, n));
secret = E(m);
D(secret)
m + O(27^5);
factor(n)

##
