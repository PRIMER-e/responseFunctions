
real modskurt(real x, real H, real m, real s, real r, real d, real p) {
  return H / (r * exp(((x - m)/(r * s) - d) / p) +
                (1 - r) * exp(- ((x - m)/((1 - r) * s) + d) / p) -
                exp(- d / p) + 1) ^ p;
}
