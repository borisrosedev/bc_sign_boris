#include "create.hpp"
#include <filesystem>
#include <fstream>
#include <iostream>

namespace fs = std::filesystem;

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
