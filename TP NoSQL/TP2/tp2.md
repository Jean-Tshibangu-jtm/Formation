
# Agrégation avec MongoDB


## A faire

1. Quelles sont les 10 plus grandes chaînes de restaurants (i.e les restaurants avec un nom identique) ? Il existe deux façons de faire.

[//]: # (    <details>)

[//]: # (        <summary>Correction</summary>)

[//]: # (        Text here)

[//]: # (    </details>)

2. Donner le Top 5 et le Flop 5 des types de cuisine, en terme de nombre de restaurants. Il faut faire 2 requêtes.
1. Quelles sont les 10 rues avec le plus de restaurants ?
1. Quelles sont les rues situées sur strictement plus de 2 quartiers ? Essayez d'ajouter le nom des quartiers de chaque rue (cf `addToSet`).
1. Lister par quartier le nombre de restaurants et le score moyen. Attention à bien découper le tableau `grades`
1. Donner les dates de début et de fin des évaluations
1. Quels sont les 10 restaurants (nom, quartier, addresse et score) avec le plus petit score moyen ? &rarr; découpage, regroupement par restaurant, tri et limite
1. Quels sont les restaurants (nom, quartier et addresse) avec uniquement des grades "A" ?
    - restriction à ceux qui ont A, découpage, suppression des autres grades que "A" et affichage des infos
    - on peut envisager d'autres choses (découpage, `addToSet`, et restriction à ceux pour lequel le tableau créé = ["A"] - par exemple)
1. Compter le nombre d'évaluation par jour de la semaine.
    &rarr; Recherche sur l'extraction du jour de la semaine à partir d'une date à faire.
1. Donner les 3 types de cuisine les plus présents par quartier
    - Piste de réflexion
        1. double regroupement à prévoir
        2. tri à prévoir
        3. regroupement avec `push`
        4. `slice` pour prendre une partie d'un tableau
