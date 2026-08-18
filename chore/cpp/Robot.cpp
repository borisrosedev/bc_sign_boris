#include "Robot.h"
#include <filesystem>
#include <fstream>
#include <iostream>
#include <system_error>
#include <utility>

namespace fs = std::filesystem;

Robot::Robot(std::string name, Gender gender)
    : m_name(std::move(name)), m_gender(gender) {}

int Robot::tasksDone() const { return tasksCount; }

int Robot::create(FileType what, const std::string &path) {
  switch (what) {
  case DIRECTORY: {
    fs::path p = path;
    if (fs::exists(p)) {
      std::cout << m_name << ": " << p << " already exists" << std::endl;
      return 1;
    }
    std::error_code error;
    if (!fs::create_directory(p, error)) {
      std::cerr << m_name << ": error while trying to create the dir: "
                << error.message() << std::endl;
      return 1;
    }
    break;
  }
  case REGULAR_FILE: {
    std::ofstream file(path);
    if (!file) {
      std::cerr << m_name << ": error while trying to create the file"
                << std::endl;
      return 1;
    }
    break;
  }
  }

  tasksCount++;
  return 0;
}
