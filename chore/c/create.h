#ifndef CREATE_H
#define CREATE_H

/**
 *  const obj = {}; // littéral d'objet
 *  const enumTab = [ 'MODE_WRITE', 'MODE_READ', 'MODE_EXEC' ]; // littéral de
 * tableau
 *
 */

typedef enum {
  MODE_WRITE,
  MODE_READ,
  MODE_EXEC,
} FileMode;

// C'est la signature de la fonction createFile
// Elle retournera obligatoirement en entier ( int ) et elle a 3 paramètres :
// deux sont de types pointeurs de char et un a un type personnalisé FileMode
int createFile(const char *filename, const char *content, FileMode fileMode);
int createFolder(const char *folderName);
#endif
