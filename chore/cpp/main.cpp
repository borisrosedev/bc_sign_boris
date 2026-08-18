#include "create.hpp"
#include "display.hpp"

int main(void) {
  displayMsg("🚀 running ...", MsgType::MSG_INFO);

  if (createOrReadFile(".env", FileMode::MODE_WRITE, "DB_PASSWORD=*******") !=
      0) {
    return 1;
  }

  if (createOrReadFile(".env", FileMode::MODE_READ, "") != 0) {
    return 1;
  }

  if (createFolder("infra") != 0) {
    return 1;
  }

  return 0;
}
