# Agrégats dans MongoDB

Il est bien évidemment possible de réaliser des calculs d'agrégats (de type somme, moyenne, minimum et maximum) dans MongoDB, avec la fonction `aggregate()`. Celle-ci permet beaucoup d'autres opérations.

## Fonctions possibles

Cette fonction va prendre en paramètre un tableau nommé `pipeline` : tableau composé d'une suite d'opérations. 

> Chaque opération sera faite après la précédente. L'ordre des opérations a donc une importance cruciale. Et le même opérateur 
peut apparaître plusieurs fois.

Voici quelques unes des opérations possibles :

| Fonction       | Opération |
|-|-|
| `$limit`       | restriction à un petit nombre de documents (très utiles pour tester son calcul) |
| `$sort`        | tri sur les documents |
| `$match`       | restriction sur les documents à utiliser |
| `$unwind`      | séparation d'un document en plusieurs sur la base d'un tableau |
| `$addFields`   | ajout d'un champs dans les documents |
| `$project`     | redéfinition des documents |
| `$group`       | regroupements et calculs d'aggégrats |
| `$sortByCount` | agrégat + tri |
| `$lookup`      | jointure avec une autre collection |
| ...            | |

## Syntaxe des opérations dans le `pipeline`

### `$limit` 

On indique juste avec un entier le nombre de document que l'on veut afficher.

- Limite aux 10 premiers restaurants

```python
first10 = db.restaurants.aggregate([
    { "$limit": 10 }
])
pandas.DataFrame(list(first10))
```

### `$sort` 

On indique de façon identique à celle du paramètre `sort` de la fonction `find()`

- Idem avec tri sur le nom du restaurant

```python
first10_sorted_name = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$sort": { "name": 1 }}
])
pandas.DataFrame(list(first10_sorted_name))
```

### `$match` 

Ici, c'est identique à celle du paramètre `query` des autres fonctions

- Idem en se restreignant à *Brooklyn*
    - Notez que nous obtenons uniquement 5 restaurants au final
    
```python
brooklyn = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$sort": { "name": 1 }},
    { "$match": { "borough": "Brooklyn" }}
])
pandas.DataFrame(list(brooklyn))
```

- Mêmes opérations mais avec la restriction en amont de la limite
    - Nous avons ici les 10 premiers restaurants de *Brooklyn* donc

```python
c = db.restaurants.aggregate([
    { "$match": { "borough": "Brooklyn" }},
    { "$limit": 10 },
    { "$sort": { "name": 1 }}
])
pandas.DataFrame(list(c))
```

### `"$unwind"` 

Le but de cette opération est d'**exploser** un tableau dans un document. 

> Un document avec un tableau à *n* éléments deviendra *n* documents avec chacun un des éléments du tableau en lieu et place de celui-ci

Nous devons mettre le nom du tableau servant de base pour le découpage (précédé d'un `$`)

- Séparation des 10 premiers restaurants sur la base des évaluations (`grades`)
    - Chaque ligne correspond maintenant a une évaluation pour un restaurant

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$unwind": "$grades" }
])
pandas.DataFrame(list(c))
```

- Idem précédemment, en se restreignant à celle ayant eu *B*

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$unwind": "$grades" },
    { "$match": { "grades.grade": "B" }}
])
pandas.DataFrame(list(c))
```

- Si on inverse les opérations `$unwind` et `$match`, le résultat est clairement différent

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$match": { "grades.grade": "B" }},
    { "$unwind": "$grades" }
])
pandas.DataFrame(list(c))
```

### `"$addFields"` et  `"$project"` 

On souhaite ici rédéfinir les documents en ajoutant des éléments (`$addFields`) ou en se restreignant à certains éléments
(`$project`)

- `{ "champs" : 1 }` : conservation du champs (0 si suppression - idem que dans `find()`, pas de mélange sauf pour `_id`)
    - valable uniquement dans `$project`
- `{ "champs": { "$opérateur" : expression }}` : permet de définir un nouveau champs
- `{ "nouveau_champs": "$ancien_champs" }` : renommage d'un champs
    
Quelques opérateurs utiles pour la projection (plus d'info [ici](https://docs.mongodb.com/manual/reference/operator/aggregation/))

- `$arrayElemAt` : élément d'un tableau
- `$first` : premier élément du tableau 
- `$last` : dernier élément du tableau
- `$size` : taille d'un tableau
- `$substr` : sous-chaîne de caractères
- `$cond` : permet de faire une condition (équivalent de *if then else*)
- ...


- On peut aussi vouloir ajouter un champs, comme ici le nombre d'évaluations

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$addFields": { "nb_grades": { "$size": "$grades" } } }
])
pandas.DataFrame(list(c))
```

- On souhaite ici ne garder que le nom et le quartier des 10 premiers restaurants
    - Notez l'ordre (alphabétique) des variables, et pas celui de la déclaration
    
```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { "name": 1, "borough": 1 } }
])
pandas.DataFrame(list(c))
```

- Ici, on supprime l'adresse et les évaluations 

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { "address": 0, "grades": 0 } }
])
pandas.DataFrame(list(c))
```

- En plus du nom et du quartier, on récupère l'adresse mais dans un nouveau champs 

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { "name": 1, "borough": 1 , "street": "$address.street"} }
])
pandas.DataFrame(list(c))
```

- On ajoute le nombre de visites pour chaque restaurant (donc la taille du tableau `grades`)

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { "name": 1, "borough": 1, "nb_grades": { "$size": "$grades" } } }
])
pandas.DataFrame(list(c))
```

- On trie ce résultat par nombre de visites, et on affiche les 10 premiers

Notez qu'il y a des restaurants sans visite donc (pour lesquels `grades` est présent mais égal à `NULL`). Dans l'idéal, ces restaurants ne devraient pas avoir de champs `grades`.

```python
c = db.restaurants.aggregate([
    { "$project": { "name": 1, "borough": 1, "nb_grades": { "$size": "$grades" } } },
    { "$sort": { "nb_grades": 1 }},
    { "$limit": 10 }
])
pandas.DataFrame(list(c))
```

- On ne garde maintenant que le premier élément du tableau `grades` (à l'indice 0)

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { "name": 1, "borough": 1, "grade": { "$arrayElemAt": [ "$grades", 0 ]} } }
])
pandas.DataFrame(list(c))
```

- On peut aussi faire des opérations sur les chaînes, tel que la mise en majuscule du nom
-   $out  crée une nouvelle collection si elle n’existe pas déjà. Exemple $out: "outputCollection"

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { "nom": { "$toUpper": "$name" }, "borough": 1 } }
])
pandas.DataFrame(list(c))
```

- On extrait ici les trois premières lettres du quartier

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$project": { 
        "nom": { "$toUpper": "$name" }, 
        "quartier": { "$substr": [ "$borough", 0, 3 ] } 
    } }
])
pandas.DataFrame(list(c))
```

- On fait de même, mais on met en majuscule et on note *BRX* pour le *Bronx*
    - on garde le quartier d'origine pour vérification ici

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$addFields": { "quartier": { "$toUpper": { "$substr": [ "$borough", 0, 3 ] } } }},
    { "$project": { 
        "nom": { "$toUpper": "$name" }, 
        "quartier": { "$cond": { "if": { "$eq": ["$borough", "Bronx"] }, "then": "BRX", "else": "$quartier" } },
        "borough": 1
    } }
])
pandas.DataFrame(list(c))
```

### `"$group"` 

Cet opérateur permet le calcul d'agrégats tel qu'on le connaît. 

- `_id` : déclaration du critère de regroupement
    - chaîne de caractères : pas de regroupement (tous les documents)
    - `$champs` : regroupement selon ce champs
    - `{ "a1": "$champs1", ... }` : regroupement multiple (avec modification des valeurs possible)
- Calculs d'agrégats à faire :
    - `$sum` : somme (soit de valeur fixe - 1 pour faire un décompte donc, soit d'un champs spécifique)
    - `$avg, $min, $max`
    - `$addToSet` : regroupement des valeurs distinctes d'un champs dans un tableau 
    - `$push` : aggrégation de champs dans un tableau.Il est utilisé pour ajouter une valeur spécifiée à un tableau dans un document.

- On calcule ici le nombre total de restaurants

```python
c = db.restaurants.aggregate([
    { "$group": { "_id": "Total", "NbRestos": { "$sum": 1 }}}
])
pandas.DataFrame(list(c))
```

- On fait de même, mais par quartier

```python
c = db.restaurants.aggregate([
    { "$group": { "_id": "$borough", "NbRestos": { "$sum": 1 }}}
])
pandas.DataFrame(list(c))
```

- Pour faire le calcul des notes moyennes des restaurants du *Queens*, on exécute le code suivant

```python
c = db.restaurants.aggregate([
    { "$match": { "borough": "Queens" }},
    { "$unwind": "$grades" },
    { "$group": { "_id": "null", "score": { "$avg": "$grades.score" }}}
])
pandas.DataFrame(list(c))
```

-  Il est bien évidemment possible de faire ce calcul par quartier et de les trier selon les notes obtenues (dans l'ordre décroissant)

```python
c = db.restaurants.aggregate([ 
    { "$unwind": "$grades" },
    { "$group": { "_id": "$borough", "score": { "$avg": "$grades.score" }}},
    { "$sort": { "score": -1 }}
])
pandas.DataFrame(list(c))
```

- On peut aussi faire un regroupement par quartier et par rue (en ne prenant que la première évaluation - qui est la dernière en date a priori), pour afficher les 10 rues où on mange le plus sainement
    - Notez que le premier `$match` permet de supprimer les restaurants sans évaluations (ce qui engendrerait des moyennes = `NA`)

```python
c = db.restaurants.aggregate([
    { "$project": { 
        "borough": 1, "street": "$address.street", 
        "eval": { "$arrayElemAt": [ "$grades", 0 ]} 
    } },
    { "$match": { "eval": { "$exists": True } } },
    { "$match": { "eval.score": { "$gte": 0 } } },
    { "$group": { 
        "_id": { "quartier": "$borough", "rue": "$street" }, 
        "score": { "$avg": "$eval.score" }
    }},
    { "$sort": { "score": 1 }},
    { "$limit": 10 }
])
pandas.DataFrame(list(c))
```

- Pour comprendre la différence entre `$addToSet` et `$push`, on les applique sur les grades obtenus pour les 10 premiers restaurants
    - `$addToSet` : valeurs distinctes
    - `$push` : toutes les valeurs présentes

```python
c = db.restaurants.aggregate([
    { "$limit": 10 },
    { "$unwind": "$grades" },
    { "$group": { 
        "_id": "$name", 
        "avec_addToSet": { "$addToSet": "$grades.grade" },
        "avec_push": { "$push": "$grades.grade" }
    }}
])
pandas.DataFrame(list(c))
```

### `$sortBycount`

Cet opérateur réalise un regroupement sur le champs spécifié (précédé d'un `$`), compte le nombre de document pour chaque
modalité de ce champs, puis fait un tri décroissant sur le nombre calculé. Il est clairement fait pour réaliser des TOPs donc.

- Quartiers de New-York triés par nombre décroissant de restaurants

```python
c = db.restaurants.aggregate([
    { "$sortByCount": "$borough" }
])
pandas.DataFrame(list(c))
```

- C'est l'équivalent de la commande suivante

```python
c = db.restaurants.aggregate([
    { "$group": { "_id": "$borough", "count": { "$sum": 1 } } },
    { "$sort": { "count": -1 }}
])
pandas.DataFrame(list(c))
```


## Gestion des variables spéciales dans le DataFrame

Une fois importées dans un DataFrame, les champs complexes (comme `address` et `grades`) sont des variables d'un type un peu particulier.

```python
df = pandas.DataFrame(list(db.restaurants.find(limit = 10)))
df
```

### Variables ayant des dictionnaires comme valeurs

Le champs address est une liste de dictionnaires, ayant chacun plusieurs champs (ici tous les mêmes).

```python
df.address
```

#### Manipulation simple

Nom du bâtiment et rue concaténés dans une nouvelle variable de `df` (utilisation de *list comprehension* ici)

```python
df.assign(info = [e["building"] + ", " + e["street"] for e in df.address])
```

#### Manipulation plus complexe

Transformation de la liste en un DataFrame

```python
pandas.DataFrame([e for e in df.address])
```

#### Idem en intégrant le résultat dans le DataFrame original

```python
pandas.concat([df.drop("address", axis = 1), pandas.DataFrame([e for e in df.address])], axis = 1)
```

### Variables ayant des tableaux comme valeurs

Le champs `grades` est une liste de tableaux, ayant chacun potentiellement plusieurs valeurs (des dictionnaires de plus)

```python
df.grades
```

### Manipulation simple

Récupération d'un élément du tableau (premier ou dernier)

```python
df.assign(derniere = [e[0] for e in df.grades], premiere = [e[-1] for e in df.grades]).drop("grades", axis = 1)
```

### Manipulation plus complexe

Transformation de la liste de tableaux en un seul DataFrame

- `zip()` permet d'itérer sur plusieurs tableaux en même temps
- `concat()` permet de concaténer les tableaux entre eux

```python
dfgrades = pandas.concat([pandas.DataFrame(g).assign(_id = i) for (i, g) in zip(df._id, df.grades)])
dfgrades
```

### Combinaison avec les données originales

Jointure entre les deux DataFrames avec merge()

```python
pandas.merge(df.drop("grades", axis = 1), dfgrades.reset_index())
```
