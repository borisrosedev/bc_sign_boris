#include "create.h"
#include "display.h"
#include <stdio.h>

int main(void) {
  int gitattributesCreationResult =
      createFile("../../.gitattributes", MODE_WRITE, "* text=auto eol=lf\n");
  int checkmakeCreationResult =
      createFile("../../checkmake.ini", MODE_WRITE, "");
  int ganttCreationResult = createFile("../../gantt.mw", MODE_WRITE, "");

  if (gitattributesCreationResult == 0) {
    displayMsg(".gitattributes created successfully", MSG_SUCCESS);
  } else {
    displayMsg(".gitattributes failted to be created", MSG_ERROR);
  }

  if (checkmakeCreationResult == 0) {
    displayMsg("checkmake.ini created successfully", MSG_SUCCESS);
  } else {
    displayMsg("checkmake.ini failted to be created", MSG_ERROR);
  }

  if (ganttCreationResult == 0) {
    displayMsg("gantt.mw created successfully", MSG_SUCCESS);
  } else {
    displayMsg("gantt.mw failted to be created", MSG_ERROR);
  }

  return 0;
}
