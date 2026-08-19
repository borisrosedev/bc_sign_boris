#pragma once
#include <string>

typedef enum { MODE_WRITE, MODE_READ, MODE_EXEC } FileMode;

// on déclare les fonctions
int createFile(std::string fileName, std::string content, FileMode fileMode);
int createFolder(std::string folderName);
