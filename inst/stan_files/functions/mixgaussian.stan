
real mixgaussian(real x, real H1, real H2, real m1, real m2, real s1, real s2) {
  return H1 * exp(-0.5 * ((x - m1) / s1) ^ 2) + H2 * exp(-0.5 * ((x - m2) / s2) ^ 2);
}
