## Base du Shell (COMMANDES DE BASE)

- db: affiche la base de donn ́ees courante;
- use [db]: utiliser la base [db]
- show dbs: Afficher toutes les bases de données
- show collections: Afficher toutes les collections existantes dans une BD.
- db.dropDatabase(): Supprimer une base de données
- cls: Nettoyer le shell
- help:Afficher de l’aide
- mongoexport -d [db] -c [collection] -o [file.json] : Permet d’exporter la base de donn ́ees sous format JSON
- mongoexport -d [db] -c [collection] –fieldsname=[name] –type=csv -o [file.csv] : Permet d’exporter la base de donn ́ees sous format CSV(Excel)
- mongoimport -d [db] [file.json] : Importer la base de données en format Json
- mongoimport –db [db] –collection [collection] –jsonArray –file [file.json] : importer une collection sp ́ecifique dans la base de données JSON.

## OPERATIONS CRUD(CREATE READ UPDATE DELETE)
### CREATE
- db.[myCollection].insertOne({doc1}): Permet de cr ́eer une collection si elle n’existe pas, soit d’insérer un document dans une collection existante.
- db.[myCollection].insertMany([{doc1},{doc2}]): Permet d’insésrer plusieurs documents à la fois sur une collection
  
### READ
- db.[collection].find() : Permet de lire tous les documents contenus dans une collection des données(correspond au SELECT * de MySQL)
- db.[collection].find({field : value} ) : Permet de rechercher un document sp ́ecifique dans la collection des données.
- db.[collection].find ({< field1 >: < operator1 >:< value1 >, ...}) : Permet de faire de recherche pouss ́ee en utilisant des opérateurs de comparaison comme ”IN” pour sélectionner une plage de données

### UPDATE
- db.[collection].UpdateOne() : Met `a jour le premier document de la collection qui match à la recherche.
- db.[collection].UpdateMany({filter/act1},{filter/act2}) : Permet de mettre à jour plusieurs documents à la fois dans une collection de
données
- item db.[collection].replaceOne({filter/remplacement}): Permet de remplacer tous les documents sans toucher à l’id (ObjectId)

  ### DELETE

- db.[collection].deleteMany() : Permet de supprimer tous les documents de la collection.
- db.[collection].deleteMany({field : value}) : Permet de supprimer tous les documents de la collection qui respecte la condition.
- db.[collection].deleteOne({field : value}) : Permet de supprimer le premier  ́élément qui match avec la condition. Si la collection comporte plusieurs documents, il supprime celui qui vient en premier d’un point de vue IdObject.

- ## AUTRES FONCTIONS UTILES
- skip :utilis ́e apr`es un find, skip permet de ne pas retourner les X premiers d’enregistrements dans le résultat, X  étant une variable
    Exemple : db.[collection].find().skip(10)
- limit [db] : utilis ́e apr`es un find, limit permet de retourner uniquement X enregistrements dans le résultat, X  étant une variable. Si X vaut 0, alors on indique que l’on ne veut pas de limite en terme de nombre d’enregistrement
- db.collection.find().pretty() :formater la sortie de vos requêtes de manière plus lisible.
  Exemple : db.[collection].find(critère, projection).pretty() 
