#include "remove.h"
#include "display.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int removeFolder(const char *folderName) {
  if (rmdir(folderName) == 0) {
    displayMsg("Folder removed", SUCCESS_MSG);
  } else {
    displayMsg("Folder failted to be removed", ERROR_MSG);
  }
  return 1;
}
