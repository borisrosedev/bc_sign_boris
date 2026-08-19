#include "create.hpp"
#include <filesystem>
#include <fstream>
#include <iostream>

namespace fs = std::filesystem;

int createFolder(std::string folderName) {

  fs::path rootDir("../../");
  fs::path folderPath(rootDir.concat(folderName));
  if (fs::create_directory(folderPath)) {
    std::cout << "\033[36;1m" << "The folder {" << folderName
              << "} has been created" << "\033[m" << std::endl;
  } else {
    std::cout << "\033[31;1m" << "The folder {" << folderName
              << "} has not been created" << "\033[m" << std::endl;
  }

  return 0;
}

int createFile(std::string fileName, std::string content, FileMode fileMode) {
  if (fileName == "") {
    return 1;
  }

  fs::path rootDir("../../");
  fs::path filePath(rootDir.concat(fileName));
  std::ofstream file(filePath);
  if (!file) {
    return 1;
  }

  if (content != "") {
    file << content << "\n";
  }

  // on évite les fuites de mémoire
  file.close();
  return 0;
}
