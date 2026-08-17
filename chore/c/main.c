#include "create.h"
#include <stdio.h>

int main(void) {
  int result = createFile("", MODE_WRITE, "");
  printf("%d", result);
  return 0;
}
