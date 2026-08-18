#ifndef DISPLAY_H
#define DISPLAY_H

typedef enum { INFO_MSG, WARNING_MSG, ERROR_MSG, SUCCESS_MSG } MsgType;

int displayMsg(const char *content, MsgType type);
#endif
