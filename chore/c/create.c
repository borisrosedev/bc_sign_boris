#include "create.h"
#include <stdio.h>
#include <string.h>

// createFile("../../.marklintrc", MODE_WRITE);
// createFile("../../.gitattributes", MODE_WRITE, "");

int createFile(const char *filename, FileMode fileMode, const char *content) {

  if (filename == NULL || strcmp(filename, "") == 0) {
    return 1;
  }

  FILE *file;

  switch (fileMode) {

  case MODE_READ:
  case MODE_EXEC:
    break;
  case MODE_WRITE:
    file = fopen(filename, "w");
    if (file == NULL) {
      return -1;
    }
    // le fichier a bien été créé
    if (content == NULL || strcmp(content, "") == 0) {
      fclose(file);
      break;
    }
    // si il veut écrire qqch
    int writeResult = fputs(content, file);
    fclose(file); // DRY DO NOT REPEAT YOURSELF
    if (writeResult != 0) {
      break;
    } else {
      return -1;
    }
  }

  return 0;
}
