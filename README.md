<style>

body {
  font-family: monospace;
  font-size: 18px
}

h3 {
  color: rgb(136, 222, 179)
}

.stressed {
  font-weight: bold;
  color: rgb(227, 227, 142);
}


</style>


# README.md

Je mets ci-dessous les notions que j'ai revues dans le cadre de la création de ce projet.

## uv
An extremely fast Python package and project manager, written in Rust.


## DB
### Administration de BD
L'administration couvre la mise en place et la configuration du système :
<ul>
  <li> création d'instances et de bases </li>
  <li>gestion de la sécurité, des utilisateurs </li>
  <li>gestion de la haute disponibilité et de la reprise après sinistre</li>
</ul>
  C'est le versant « construire et gouverner ».


### SGBD

Un SGBD (Système de Gestion de Bases de Données, en anglais DBMS) est un logiciel qui
permet de stocker, d'organiser, de sécuriser et d'interroger des données de manière fiable et
<span class="stressed">concurrente</span> pour de multiples utilisateurs.


### T-SQL
SQL = Structured Query Language, langage de requête structuré. C'est le langage standard
(normalisé ISO) pour définir et manipuler les données relationnelles. La déclinaison propre à SQL Server s'appelle T-SQL (Transact-SQL) : elle ajoute au SQL standard <span class="stressed">des extensions
procédurales (variables, boucles, gestion d'erreurs)</span>.


### sys.master_files
La vue système sys.master_files liste tous les fichiers de toutes les bases de l'instance, avec
leur type et leur chemin physique. Requête indispensable au quotidien.
