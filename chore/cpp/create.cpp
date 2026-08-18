#include "create.hpp"
#include "display.hpp"
#include <filesystem>
#include <fstream>
#include <ostream>
#include <string>
#include <system_error>

namespace fs = std::filesystem;

int createFolder(std::string foldername) {

  if (foldername == "") {
    displayMsg("Foldername must be valid", MsgType::MSG_ERROR);
    return 1;
  }

  displayMsg("🚀 Creating folder ... ", MsgType::MSG_INFO);
  fs::path folder = fs::current_path() / foldername;

  std::error_code error;
  if (!fs::create_directories(folder, error)) {
    if (error) {
      displayMsg("The folder won't be created", MsgType::MSG_ERROR);
      return 1;
    }
    displayMsg("⚠️ The folder already exists", MsgType::MSG_WARNING);
    return 0;
  }

  displayMsg(folder.string(), MsgType::MSG_SUCCESS);
  return 0;
}

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
  } else if (fileMode == FileMode::MODE_EXEC) {

    if (!fs::exists(filename)) {
      displayMsg("The file to make executable does not exist",
                 MsgType::MSG_ERROR);
      return 1;
    }

    displayMsg("🚀 Making the file executable ...", MsgType::MSG_INFO);
    std::error_code error;
    fs::permissions(filename,
                    fs::perms::owner_exec | fs::perms::group_exec |
                        fs::perms::others_exec,
                    fs::perm_options::add, error);
    if (error) {
      displayMsg("The permissions won't be changed", MsgType::MSG_ERROR);
      return 1;
    }
    return 0;
  }
  return 0;
}
