# Séance 1 - Introduction à MongoDB


Comme vu, lors du cours, MongoDB est une base de données NoSQL orientée document. Cela signifie que les données sont sous la forme de JSON/BSON. Pour plus d'informations, vous pouvez consulter le [site de MongoDB](http://www.mongodb.com/). Pour ce faire, nous allons utiliser MongoDB Compass(lien de téléchargement: https://www.mongodb.com/try/download/community, MongoDB Community Server Version 8.0.0) qui nous permettra d'avoir une base de données MongoDB en local.
Nous allons installé également **MongoDB Shell** (lien https://www.mongodb.com/try/download/shell). C'est l'interface en ligne de commande fournie par MongoDB pour interagir avec la base de données. Il permet aux utilisateurs d'exécuter des commandes, d'effectuer des requêtes et de manipuler des données directement dans la console. 

### Plus d'infos sur l'installation :
- **Windows** : https://welovedevs.com/fr/articles/mongodb-windows/
- **Linux** : https://welovedevs.com/fr/articles/mongodb-linux
- **MacOs**:https://welovedevs.com/fr/articles/mongodb-mac
  
### Autres outils à installer :
- **Python** : https://www.python.org/downloads/
- **Jupyer Notebook** : https://jupyter.org/install. Editeur pour manipuler les données de db avec le langage Python


## Jeu de données

Pour ce TP, nous utiliserons le jeu de données `restaurants.json`, une base de données [fournie par MongoDB](https://www.mongodb.com/docs/atlas/sample-data/sample-restaurants/). Ce document JSON contient les données de plus de 25 000 restaurants new-yorkais. Ci-dessous sont présentées les informations du premier restaurant.

```json
{
        "_id" : ObjectId("58ac16d1a251358ee4ee87de"),
        "address" : {
                "building" : "469",
                "coord" : [
                        -73.961704,
                        40.662942
                ],
                "street" : "Flatbush Avenue",
                "zipcode" : "11225"
        },
        "borough" : "Brooklyn",
        "cuisine" : "Hamburgers",
        "grades" : [
                {
                        "date" : ISODate("2014-12-30T00:00:00Z"),
                        "grade" : "A",
                        "score" : 8
                },
                {
                        "date" : ISODate("2014-07-01T00:00:00Z"),
                        "grade" : "B",
                        "score" : 23
                },
                {
                        "date" : ISODate("2013-04-30T00:00:00Z"),
                        "grade" : "A",
                        "score" : 12
                },
                {
                        "date" : ISODate("2012-05-08T00:00:00Z"),
                        "grade" : "A",
                        "score" : 12
                }
        ],
        "name" : "Wendy'S",
        "restaurant_id" : "30112340"
}
```

## Connexion à la base de données

Maintenant que tout est mis en place nous pouvons nous connecter à la base de données que nous avons créé.

```python
import pymongo


URI = 'mongodb+srv://<user_name>:<password>@<cluster_name>.zrugz.mongodb.net/?retryWrites=true&w=majority&appName=<cluster_name>'
client = pymongo.MongoClient(URI)// # enlever le paramètre URI si connexion locale
db = client.tp

# output the name of the collections in the database
print("Collections: ", db.list_collection_names())
print("Restaurants: ", db.restaurants)
```


## A faire
## Premiers pas sur Mongo.
#### Avant de commencer ce TP, je vous invite à visiter la page suivante :  https://fxjollois.github.io/cours-2023-2024/but3--vcod--fa--nosql/res-seance2. Cela vous permettra de vous familiariser avec les concepts de MongoDB(Avec l'exemple de la db restaurants).

1. Donner les styles de cuisine présent dans la collection
1. Donner tous les grades possibles dans la base
1. Compter le nombre de restaurants proposant de la cuisine française ("French")
1. Compter le nombre de restaurants situés sur la rue "Central Avenue"
1. Compter le nombre de restaurants ayant eu une note supérieure à 50
1. Lister tous les restaurants, en n'affichant que le nom, l'immeuble et la rue
1. Lister tous les restaurants nommés "Burger King" (nom et quartier uniquement)
1. Lister les restaurants situés sur les rues "Union Street" ou "Union Square"
1. Lister les restaurants situés au-dessus de la lattitude 40.90
1. Lister les restaurants ayant eu un score de 0 et un grade "A"

## Questions complémentaires

Les questions suivantes nécessitent une recherche pour compléter ce qui a déjà été vu dans ce TP.

1. Lister les restaurants (nom et rue uniquement) situés sur une rue ayant le terme "Union" dans le nom
2. Lister les restaurants ayant eu une visite le 1er février 2014
3. Lister les restaurants situés entre les longitudes -74.2 et -74.1 et les lattitudes 40.5 et 40.6.
   
## Questions sur db movies

1. Afficher les 10 premiers éléments de la collection Film.

2. Afficher les 4,5, et 6 éléments de la collection Film.

3. Sur la collection terminator, afficher uniquement le titre et l’année de tous les films qui
contiennent le mot terminator.

4. Trouver tous les films dont le titre est ‘Terminator 2’.

5. Trouver tous les titres de films avec comportant le mot ‘terminator’

6. Combien de film comporte le mot terminator ?
