#include "create.h"

int main(void) {

  // un appel à la fonction createFile à laquelle on PASSE des arguments
  createFile("../../.gitignore", ".env\n.terraform\n.tfvars\nnode_modules\n",
             MODE_WRITE);
  createFile("../../checkmake.ini", "", MODE_WRITE);
  createFile("../../.tflint.hcl", "", MODE_WRITE);
  createFile("../../.gitattributes", "", MODE_WRITE);
  createFile("../../.pre-commit-config.yaml", "", MODE_WRITE);
}
