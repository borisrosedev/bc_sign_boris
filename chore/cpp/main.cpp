#include "create.hpp"
#include "display.hpp"

int main(void) {
  displayMsg("🚀 running ...", MsgType::MSG_INFO);
  createOrReadFile(".env", FileMode::MODE_WRITE, "DB_PASSWORD=*******");
}
