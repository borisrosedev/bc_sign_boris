#pragma once

#include <string>

typedef enum { MALE, FEMALE } Gender;
typedef enum { DIRECTORY, REGULAR_FILE } FileType;

class Robot {
public:
  Robot(std::string name, Gender gender);

  int create(FileType what, const std::string &path);
  int tasksDone() const;

private:
  std::string m_name;
  Gender m_gender;
  int tasksCount = 0;
};
