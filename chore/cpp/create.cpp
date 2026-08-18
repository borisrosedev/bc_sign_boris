#include "create.hpp"
#include "display.hpp"
#include <fstream>
#include <ostream>
#include <string>

int createOrReadFile(std::string filename, FileMode fileMode,
                     std::string content) {

  displayMsg("🚀 Creating file ... ", MsgType::MSG_INFO);
  if (filename == "") {
    displayMsg("Filename must be valid", MsgType::MSG_ERROR);
    return 1;
  }

  if (fileMode == FileMode::MODE_WRITE) {
    std::ofstream file(filename);
    if (!file) {
      displayMsg("The file won't open ", MsgType::MSG_ERROR);
      return 1;
    }

    if (content == "") {
      displayMsg("⚠️ No content to add to the file", MsgType::MSG_WARNING);
      file.close();
      return 0;
    }

    displayMsg("🚀 Adding content to file ...", MsgType::MSG_INFO);
    file << content << std::endl;
    file.close();
    return 0;
  } else if (fileMode == FileMode::MODE_READ) {

    std::ifstream updatedFile(filename);
    if (!updatedFile) {
      displayMsg("Impossible to read the updated file", MsgType::MSG_ERROR);
      return 1;
    }
    std::string line;
    while (std::getline(updatedFile, line)) {
      displayMsg(line, MsgType::MSG_SUCCESS);
    }
    updatedFile.close();
    return 0;
  }
  return 0;
}
