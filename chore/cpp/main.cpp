#include "create.hpp"

int main(void) {
  createFile(".env", "DB_PASSWORD=**********", MODE_WRITE);
  createFolder("infra");
}
