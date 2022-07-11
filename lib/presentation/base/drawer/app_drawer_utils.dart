import 'dart:math';

/// [AppDrawerUtils] contains drawer related utlity methods
class AppDrawerUtils {
  static double fixed(double value, int decimal) {
    num fac = pow(10, decimal);
    return (value * fac).round() / fac;
  }
}
