#pragma once
#include <string>

enum class FileMode { MODE_WRITE, MODE_READ, MODE_EXEC };
int createOrReadFile(std::string filename, FileMode fileMode,
                     std::string content);
