#include "create.h"
#include <stdio.h>
#include <string.h>

int createFile(const char *filename, FileMode fileMode, const char *content) {

  // Error Handling
  if (filename == NULL || strcmp(filename, "") == 0) {
    return 1;
  }

  FILE *newFile;

  switch (fileMode) {
  case MODE_WRITE:
    newFile = fopen(filename, "w");
    if (newFile == NULL) {
      return 1;
    }
    if (content != NULL) {
      int writeOperationResult = fputs(content, newFile);
      fclose(newFile);
      return writeOperationResult;
    }
    return fclose(newFile);
  case MODE_EXEC:
  case MODE_READ:
    return 0;
  }

  return 0;
}
