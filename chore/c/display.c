#include "display.h"
#include <stdio.h>

int displayMsg(const char *content, MsgType type) {
  switch (type) {
  case INFO_MSG:
    return printf("\033[36;1m%s\033[0m\n", content);
  case ERROR_MSG:
    return printf("\033[31;1m%s\033[0m\n", content);
  case WARNING_MSG:
    return printf("\033[33;1m%s\033[0m\n", content);
  case SUCCESS_MSG:
    return printf("\033[32;1m%s\033[0m\n", content);
  }
  return 1;
}
