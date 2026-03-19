# Anti-sèche DAX — Fonctions essentielles Power BI

> Document restructuré à partir du fichier fourni, en conservant uniquement le contenu pédagogique sur les fonctions DAX.

## 1. Opérateurs de base en DAX

| Problème traité | Expression DAX | Exemple d'utilisation |
|---|---|---|
| Additionner deux nombres | `Nombre1 + Nombre2` | `5 + 3` donne `8` |
| Soustraire un nombre d'un autre | `Nombre1 - Nombre2` | `10 - 2` donne `8` |
| Multiplier deux nombres | `Nombre1 * Nombre2` | `4 * 2` donne `8` |
| Diviser un nombre par un autre | `DIVIDE(Nombre1, Nombre2)` | `DIVIDE(16, 2)` donne `8` et gère la division par `0` |
| Comparer si un nombre est supérieur à un autre | `Nombre1 > Nombre2` | `5 > 3` renvoie `TRUE` |
| Comparer si un nombre est supérieur ou égal à un autre | `Nombre1 >= Nombre2` | `5 >= 5` renvoie `TRUE` |
| Vérifier si deux valeurs sont égales | `Valeur1 = Valeur2` | `2 = 2` renvoie `TRUE` |
| Vérifier si deux valeurs sont différentes | `Valeur1 <> Valeur2` | `2 <> 3` renvoie `TRUE` |
| Concaténer des chaînes de texte | `Texte1 & Texte2` | `"Bonjour" & " " & "Monde"` donne `Bonjour Monde` |
| Calculer le reste d'une division | `MOD(Nombre1, Nombre2)` | `MOD(10, 3)` donne `1` |
| Élever un nombre à une puissance | `POWER(Nombre, Puissance)` | `POWER(2, 3)` donne `8` |

## 2. Fonctions logiques en DAX

| Problème traité | Expression DAX |
|---|---|
| Appliquer une condition | `IF(Condition, RésultatSiVrai, RésultatSiFaux)` |
| Combinaison de conditions (ET logique) | `AND(Condition1, Condition2)` |
| Combinaison de conditions (OU logique) | `OR(Condition1, Condition2)` |
| Inverser une condition | `NOT(Condition)` |
| Sélectionner parmi plusieurs options | `SWITCH(Expression, Valeur1, Résultat1, Valeur2, Résultat2, ..., RésultatParDéfaut)` |
| Gérer les erreurs dans une expression | `IFERROR(Expression, ValeurSiErreur)` |

## 3. Fonctions mathématiques et statistiques en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Calculer la somme d'une colonne | `SUM(Colonne)` | `SUM(Ventes[Montant])` |
| Trouver la moyenne d'une colonne | `AVERAGE(Colonne)` | `AVERAGE(Ventes[Quantité])` |
| Calculer la médiane d'une colonne | `MEDIAN(Colonne)` | `MEDIAN(Ventes[Montant])` |
| Calculer la moyenne géométrique | `GEOMEAN(Colonne)` | `GEOMEAN(Ventes[Quantité])` |
| Compter le nombre de valeurs | `COUNT(Colonne)` | `COUNT(Ventes[ArticleID])` |
| Diviser deux nombres | `DIVIDE(Nombre1, Nombre2)` | `DIVIDE(SUM(Ventes[Montant]), COUNT(Ventes[ArticleID]))` |
| Trouver la valeur minimale | `MIN(Colonne)` | `MIN(Ventes[Montant])` |
| Trouver la valeur maximale | `MAX(Colonne)` | `MAX(Ventes[Montant])` |
| Compter le nombre de lignes | `COUNTROWS(Table)` | `COUNTROWS(Ventes)` |
| Compter les valeurs distinctes | `DISTINCTCOUNT(Colonne)` | `DISTINCTCOUNT(Ventes[ClientID])` |
| Classer une valeur | `RANKX(Table, Expression)` | `RANKX(ALL(Ventes), SUM(Ventes[Montant]))` |

## 4. Fonctions de texte en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Concaténer des chaînes de caractères | `CONCATENATE(<Text1>, <Text2>)` | `CONCATENATE(Client[Nom], Client[Prénom])` |
| Convertir en majuscules | `UPPER(<TextColumn>)` | `UPPER(Client[Nom])` |
| Convertir en minuscules | `LOWER(<TextColumn>)` | `LOWER(Client[Nom])` |
| Trouver la longueur d'une chaîne | `LEN(<TextColumn>)` | `LEN(Client[Commentaire])` |
| Remplacer une sous-chaîne | `REPLACE(<Text>, <Start>, <Length>, <NewText>)` | `REPLACE(Client[Adresse], 1, 5, "Rue")` |
| Extraire une sous-chaîne | `MID(<Text>, <Start>, <Length>)` | `MID(Client[Email], 2, 5)` |
| Trouver la position d'une sous-chaîne | `SEARCH(<SubText>, <Text>, <Start>, <NotFound>)` | `SEARCH("@", Client[Email], 1, -1)` |
| Enlever les espaces superflus | `TRIM(<TextColumn>)` | `TRIM(Client[Commentaire])` |
| Vérifier si un texte contient une sous-chaîne | `CONTAINSSTRING(<TextColumn>, <SubText>)` | `CONTAINSSTRING(Client[Commentaire], "urgent")` |
| Concaténer des valeurs avec un séparateur | `CONCATENATEX(<Table>, <Expression>, <Delimiter>)` | `CONCATENATEX(Clients, Clients[Nom], ", ")` |
| Formater une valeur | `FORMAT(<Value>, <FormatString>)` | `FORMAT(DimDate[Date], "DD/MM/YYYY")` |

## 5. Fonctions dates et temps en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Créer une séquence de dates | `CALENDAR(<StartDate>, <EndDate>)` | `CALENDAR("2024-01-01", "2024-12-31")` |
| Convertir année, mois, jour en date | `DATE(<Year>, <Month>, <Day>)` | `DATE(2024, 12, 31)` |
| Calculer l'année en cours | `YEAR(TODAY())` | renvoie l'année actuelle |
| Trouver le premier jour du mois | `STARTOFMONTH(<DateColumn>)` | `STARTOFMONTH(DimDate[Date])` |
| Calculer l'âge à partir de la date de naissance | `DATEDIFF(<BirthDateColumn>, TODAY(), YEAR)` | `DATEDIFF(Clients[DateNaissance], TODAY(), YEAR)` |
| Obtenir le numéro de la semaine | `WEEKNUM(<DateColumn>)` | `WEEKNUM(DimDate[Date])` |
| Extraire le mois d'une date | `MONTH(<DateColumn>)` | `MONTH(DimDate[Date])` |
| Convertir une chaîne en date | `DATEVALUE(<DateString>)` | `DATEVALUE("2024-12-31")` |
| Trouver le dernier jour du mois | `EOMONTH(<DateColumn>, <MonthsOffset>)` | `EOMONTH(DimDate[Date], 0)` |
| Ajouter un nombre de mois à une date | `EDATE(<DateColumn>, <MonthsOffset>)` | `EDATE(DimDate[Date], 3)` |
| Obtenir la date actuelle | `TODAY()` | date du jour |
| Extraire le trimestre d'une date | `QUARTER(<DateColumn>)` | `QUARTER(DimDate[Date])` |

## 6. Contexte de calcul et filtres en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Modifier le contexte de filtre pour un calcul | `CALCULATE(<Expression>, <Filter>)` | `CALCULATE(SUM(Ventes[Montant]), Clients[Region] = "Paris")` |
| Obtenir une table filtrée | `FILTER(<TableOrColumn>, <Filter>)` | `FILTER(ALL(Clients), Clients[Region] = "Paris")` |
| Ignorer les filtres appliqués sur une table | `ALL(<TableOrColumn>)` | `CALCULATE(SUM(Ventes[Montant]), ALL(Clients))` |
| Conserver certains filtres tout en en ignorant d'autres | `ALLEXCEPT(<Table>, <Column>)` | `CALCULATE(SUM(Ventes[Montant]), ALLEXCEPT(Clients, Clients[Region]))` |
| Appliquer un contexte de filtre avec les sélections actuelles | `ALLSELECTED(<TableOrColumn>)` | `CALCULATE(SUM(Ventes[Montant]), ALLSELECTED(Clients[Region]))` |
| Supprimer tous les filtres d'une table ou colonne | `REMOVEFILTERS(<TableOrColumn>)` | `CALCULATE(SUM(Ventes[Montant]), REMOVEFILTERS(Clients))` |

## 7. Fonctions itératives en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Somme personnalisée sur une table | `SUMX(Table, Expression)` | `SUMX(Ventes, Ventes[Quantité] * Ventes[PrixUnitaire])` |
| Moyenne personnalisée sur une table | `AVERAGEX(Table, Expression)` | `AVERAGEX(Ventes, Ventes[Montant])` |
| Minimum personnalisé sur une table | `MINX(Table, Expression)` | `MINX(Ventes, Ventes[Montant])` |
| Maximum personnalisé sur une table | `MAXX(Table, Expression)` | `MAXX(Ventes, Ventes[Montant])` |
| Compter avec condition | `COUNTX(Table, Expression)` | `COUNTX(Ventes, IF(Ventes[Montant] > 1000, 1, BLANK()))` |

## 8. Fonctions de time intelligence en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Comparer avec la période correspondante de l'année précédente | `SAMEPERIODLASTYEAR(<DateColumn>)` | `CALCULATE(SUM(Ventes[Montant]), SAMEPERIODLASTYEAR(DimDate[Date]))` |
| Obtenir une période de 3 mois | `DATESINPERIOD(<DateColumn>, <StartDate>, -3, MONTH)` | Moyenne mobile sur 3 mois |
| Obtenir la date du dernier jour de l'année en cours | `ENDOFYEAR(<DateColumn>)` | `ENDOFYEAR(DimDate[Date])` |
| Calculer le total depuis le début de l'année | `TOTALYTD(<Expression>, <DateColumn>)` | `TOTALYTD(SUM(Ventes[Montant]), DimDate[Date])` |
| Calculer le total depuis le début du mois | `TOTALMTD(<Expression>, <DateColumn>)` | `TOTALMTD(SUM(Ventes[Montant]), DimDate[Date])` |
| Calculer le total depuis le début du trimestre | `TOTALQTD(<Expression>, <DateColumn>)` | `TOTALQTD(SUM(Ventes[Montant]), DimDate[Date])` |
| Calculer les ventes de l'année précédente | `DATEADD(<DateColumn>, <NumberOfIntervals>, <Interval>)` | `CALCULATE(SUM(Ventes[Montant]), DATEADD(DimDate[Date], -1, YEAR))` |
| Calculer les ventes pour une période spécifique | `DATESBETWEEN(<DateColumn>, <StartDate>, <EndDate>)` | `CALCULATE(SUM(Ventes[Montant]), DATESBETWEEN(DimDate[Date], "2024-01-01", "2024-12-31"))` |
| Calculer les ventes du dernier mois complet | `PREVIOUSMONTH(<DateColumn>)` | `CALCULATE(SUM(Ventes[Montant]), PREVIOUSMONTH(DimDate[Date]))` |
| Calculer les ventes du dernier trimestre complet | `PREVIOUSQUARTER(<DateColumn>)` | `CALCULATE(SUM(Ventes[Montant]), PREVIOUSQUARTER(DimDate[Date]))` |

## 9. Fonctions de manipulation des tables en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Créer un résumé de table | `SUMMARIZE(Table, GroupBy_ColumnName, ...)` | `SUMMARIZE(Ventes, Ventes[Produit], "TotalVentes", SUM(Ventes[Montant]))` |
| Retirer les doublons d'une table | `DISTINCT(Table)` | `DISTINCT(Clients[Region])` |
| Ajouter des colonnes calculées | `ADDCOLUMNS(Table, "NewColumn", Expression)` | `ADDCOLUMNS(Produits, "PrixTTC", Produits[PrixHT] * 1.2)` |
| Sélectionner des colonnes calculées | `SELECTCOLUMNS(Table, "NewColumn", Expression)` | `SELECTCOLUMNS(Clients, "ClientID", Clients[ID], "Age", YEAR(NOW()) - Clients[AnnéeNaissance])` |
| Grouper une table | `GROUPBY(Table, GroupBy_ColumnName, ...)` | `GROUPBY(Ventes, Ventes[Produit], "TotalVentes", SUMX(CURRENTGROUP(), Ventes[Montant]))` |
| Trouver les lignes communes | `INTERSECT(Table1, Table2)` | `INTERSECT(ClientsActuels, ClientsPotentiels)` |
| Joindre deux tables | `NATURALINNERJOIN(Table1, Table2)` | `NATURALINNERJOIN(Ventes, Stock)` |
| Joindre avec préservation des lignes | `NATURALLEFTOUTERJOIN(Table1, Table2)` | `NATURALLEFTOUTERJOIN(Clients, Commandes)` |
| Combiner les lignes de tables | `UNION(Table1, Table2, ...)` | `UNION(TousClients, NouveauxClients)` |

## 10. Fonctions de relations en DAX

| Problème traité | Expression DAX | Exemple et explication |
|---|---|---|
| Relier des tables (1 vers plusieurs) | `RELATED(<ColumnName>)` | `RELATED(Clients[Nom])` renvoie la valeur du côté `1` de la relation |
| Accéder à une table liée (plusieurs vers 1) | `RELATEDTABLE(<Table>)` | `RELATEDTABLE(Clients)` renvoie une table liée |
| Utiliser une relation spécifique entre les tables | `USERELATIONSHIP(<Column1>, <Column2>)` | `CALCULATE(SUM(Ventes[Montant]), USERELATIONSHIP(Ventes[ClientID], Clients[ID]))` |
| Modifier le comportement de filtrage entre les tables | `CROSSFILTER(<ColumnName1>, <ColumnName2>, <Mode>)` | `CALCULATE(SUM(Ventes[Montant]), CROSSFILTER(Ventes[ClientID], Clients[ID], "None"))` |
| Créer une relation virtuelle entre tables | `TREATAS(<Table1>, <Table2>)` | `CALCULATE(SUM(Ventes[Montant]), TREATAS(VALUES(Clients[Region]), Ventes[Region]))` |
| Rechercher une valeur selon des critères | `LOOKUPVALUE(<ResultColumn>, <SearchColumn>, <SearchValue>)` | `LOOKUPVALUE(Clients[Nom], Clients[ID], Ventes[ClientID])` |

## 11. Fonctions d'information en DAX

| Problème traité | Expression DAX | Exemple |
|---|---|---|
| Vérifier si une valeur est numérique | `ISNUMBER(<Value>)` | `ISNUMBER(Ventes[Quantité])` |
| Vérifier si une valeur est une erreur | `ISERROR(<Value>)` | `ISERROR(DIVIDE(Ventes[Montant], 0))` |
| Obtenir le nom d'une colonne sélectionnée | `SELECTEDVALUE(<ColumnName>)` | `SELECTEDVALUE(Ventes[Produit])` |
| Vérifier si un contexte de filtre est appliqué | `HASONEVALUE(<ColumnName>)` | `HASONEVALUE(Clients[Region])` |
| Retourner l'identifiant principal de l'utilisateur | `USERPRINCIPALNAME()` | identifiant de l'utilisateur actuel |
| Vérifier si un filtre spécifique est appliqué | `HASONEFILTER(<ColumnName>)` | `HASONEFILTER(Ventes[Catégorie])` |
| Vérifier si le résultat d'une expression est vide | `ISBLANK(<Expression>)` | `ISBLANK(SUM(Ventes[Remise]))` |
| Vérifier si un filtre est appliqué sur une colonne | `ISFILTERED(<ColumnName>)` | `ISFILTERED(Clients[Region])` |
| Vérifier si un croisement de filtres est appliqué | `ISCROSSFILTERED(<TableName>, <ColumnName>)` | `ISCROSSFILTERED(Ventes, Ventes[Produit])` |

## 12. Fonctions de fenêtrage en DAX

| Problème traité | Expression DAX | Exemple d'utilisation |
|---|---|---|
| Récupérer une ligne à une position absolue | `INDEX(<Position>[, <Arguments> ...])` | `INDEX(1, Sales)` |
| Déplacer une ligne dans une partition spécifiée | `OFFSET(<Delta>[, <Arguments> ...])` | `OFFSET(1, Sales)` |
| Récupérer une plage de lignes dans une partition | `WINDOW(<From>, <To>[, <Arguments> ...])` | `WINDOW(1, 10, Sales)` |
| Partitionner les données pour le fenêtrage | `PARTITIONBY(<ColumnName>[, <ColumnName>])` | `PARTITIONBY(Sales[Region])` |
| Ordonner les données dans chaque partition | `ORDERBY(<Expression>[, <Order> ...])` | `ORDERBY(Sales[Date], ASC, Sales[Amount], DESC)` |

## 13. Remarque sur les fonctions INFO en DAX

Les fonctions `INFO` en DAX permettent d'accéder à des métadonnées détaillées du modèle de données Power BI.

Elles sont utiles pour :
- explorer les tables, colonnes et mesures ;
- documenter un modèle de données ;
- interroger la structure du modèle sans recourir à une syntaxe de requête distincte.

Ces fonctions ne sont généralement pas destinées à être utilisées directement dans des mesures ou tables calculées métier, mais elles sont très utiles pour l'inspection technique du modèle.
