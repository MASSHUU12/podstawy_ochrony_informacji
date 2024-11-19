p = nextprime(random(10^30));
q = nextprime(random(10^25));

/* Secret key A */
a = random(p - 2) + 1;
A = Mod(q, p)^a; /* Public key A */

/* Secret key B */
b = random(p - 2) + 1;
B = Mod(q, p)^b; /* Public key B */

/* Exchange of public keys and calculation of a common key */
common_key_a = B^a;
common_key_b = A^b;

if (common_key_a == common_key_b, print("The common key has been agreed correctly: ", lift(common_key_a)), print("Key reconciliation error."))
