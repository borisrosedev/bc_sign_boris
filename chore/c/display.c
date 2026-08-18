#include "display.h"
#include <stdio.h>
#include <string.h>

int displayMsg(const char *content, MsgType msgType) {
  if (content == NULL || strcmp(content, "") == 0) {
    return 1;
  }
  // si il y a bien un contenu qui n'est pas une chaîne de caractères vide
  switch (msgType) {
  case MSG_INFO:
    return printf("\n\033[36;1m%s\033[0m\n", content);
  case MSG_WARNING:
    return printf("\n\033[33;1m%s\033[0m\n", content);
  case MSG_ERROR:
    return printf("\n\033[31;1m%s\033[0m\n", content);
  case MSG_SUCCESS:
    return printf("\n\033[32;1m%s\033[0m\n", content);
  }
}
