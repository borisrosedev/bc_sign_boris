#ifndef DISPLAY_H
#define DISPLAY_H
typedef enum { MSG_INFO, MSG_ERROR, MSG_WARNING, MSG_SUCCESS } MsgType;
int displayMsg(const char *content, MsgType msgType);
#endif
