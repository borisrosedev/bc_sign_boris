#include "display.hpp"
#include <iostream>
#include <ostream>

int displayMsg(std::string content, MsgType msgType) {

  switch (msgType) {
  case MsgType::MSG_INFO:
    std::cout << "\033[36;1m" << content << std::endl;
    break;
  case MsgType::MSG_ERROR:
    std::cerr << "\033[31;1m" << content << std::endl;
    break;
  case MsgType::MSG_SUCCESS:
    std::cout << "\033[32;1m" << content << std::endl;
    break;
  case MsgType::MSG_WARNING:
    std::cout << "\033[33;1m" << content << std::endl;
    break;
  }
  return 0;
}
