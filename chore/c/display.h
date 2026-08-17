#ifndef DISPLAY_H
#define DISPLAY_H
typedef enum { MSG_INFO, MSG_ERROR, MSG_WARNING } MsgType;
int display(char *content, MsgType msgType);
#endif
