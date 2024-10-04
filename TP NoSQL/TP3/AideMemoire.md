## MngoDB Exo

Les fonctions agrégats de MongoDB permettent de traiter des données en effectuant des calculs, des transformations et des regroupements. Voici quelques-unes des fonctions agrégats les plus courantes, accompagnées d'exemples.
1. **$match** : Filtre les documents pour ne garder que ceux qui répondent à certaines conditions.
 
 *Exemple :* db.collection.aggregate([ { $match: { age: { $gt: 18 } } }]). Cette requête ne renvoie que les documents où l'âge est supérieur à 18

2. **$group** : Regroupe les documents par une clé donnée et permet d’effectuer des calculs sur chaque groupe.
 *Exemple :* db.collection.aggregate([{ $group: { _id: "$department", total: { $sum: "$salary" } } }]). Cette requête  calcule le total des salaires par département.

3. **$sort** : Trie les documents selon un ou plusieurs critères.Ce pipeline trie les documents par âge, du plus âgé au plus jeune.
*Exemple :* db.collection.aggregate([{ $sort: { age: -1 } }]).
4. **$project**: Modifie la structure des documents, permettant de sélectionner, de renommer ou d'ajouter des champs.Cette req renvoie les noms et âges tout en multipliant le salaire par 12 pour obtenir un salaire annuel.

     *Exemple:* db.collection.aggregate([ { $project: { name: 1, age: 1, salary: { $multiply: ["$salary", 12] } } }])
5. **$limit** : Limite le nombre de documents renvoyés. Cette requête renvoie uniquement les cinq premiers documents.
 *Exemple :*db.collection.aggregate([{ $limit: 5 } ])

6. **$unwind**: Décompose un tableau dans les documents, créant des documents séparés pour chaque élément du tableau.
   
*Exemple :* db.collection.aggregate([{ $unwind: "$tags" }]). Si un document contient un tableau de tags, chaque tag sera un document distinct.

7. **$lookup**: Effectue une jointure entre deux collections.

      *Exemple :*
   db.orders.aggregate([{
   $lookup: {
   from: "products",
   localField: "productId",
   foreignField: "_id", as: "productDetails"}}])
   







