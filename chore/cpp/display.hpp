#pragma once
#include <string>

enum class MsgType { MSG_INFO, MSG_ERROR, MSG_WARNING, MSG_SUCCESS };

int displayMsg(std::string content, MsgType msgType);
