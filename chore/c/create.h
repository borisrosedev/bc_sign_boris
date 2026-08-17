#ifndef CREATE_H
#define CREATE_H

typedef enum { MODE_WRITE, MODE_READ, MODE_EXEC } FileMode;

int createFile(const char *filename, FileMode fileMode, const char *content);
#endif
