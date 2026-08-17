#include "create.h"
#include <stdio.h>

int main(void) {
  createFile("../../checkmake.ini", MODE_WRITE, "");
  createFile("../../.marklintrc", MODE_WRITE, "");
  return 0;
}
