#include "armstrong_numbers.h"
#include <math.h>

bool is_armstrong_number(int candidate) {
  if (candidate == 0) {
    return true;
  }

  int sum = 0, power = log10(candidate) + 1;

  for (int acc = candidate, d = 0; acc != 0;
       d = acc % 10, acc /= 10, sum += pow(d, power)) {
  }

  return sum == candidate;
}
