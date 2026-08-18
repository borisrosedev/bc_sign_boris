#include "create.h"
#include <stdio.h>
#include <string.h>

int createFile(const char *filename, const char *content, FileMode fileMode) {

  // Error Handling

  if (filename == NULL || strcmp(filename, "") == 0) {
    return 1;
  }

  // déclaration d'une variable file qui est un pointeur sur fichier
  FILE *file;

  // Hypothesis n°1

  switch (fileMode) {
  case MODE_WRITE:
    file = fopen(filename, "w");
    if (file == NULL) {

      return -1;
    }
    // cas où non seulement on créer un fichier mais en plus on veut peut-être
    // écrire dedans
    if (content != NULL || strcmp(content, "") != 0) {
      int writeOperationResult = fputs(content, file);
      fclose(file);
      if (writeOperationResult > 0) {
        return 0;
      } else {
        return -1;
      }
    }
    break;

    // revoir la notion d'écoulement des cas.
  case MODE_READ:
  case MODE_EXEC:
    break;
  }

  return 0;
}
