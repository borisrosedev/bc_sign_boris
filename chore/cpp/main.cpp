#include "Robot.h"
#include <iostream>

int main() {
  Robot robot{"Doly", FEMALE};

  robot.create(DIRECTORY, "demo");
  robot.create(REGULAR_FILE, "demo/notes.txt");

  std::cout << robot.tasksDone() << " task(s) done" << std::endl;
  return 0;
}
