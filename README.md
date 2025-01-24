# Étude Numérique d'une Intégrale Complexe de Mouvement du Pendule Simple

Ce projet explore la résolution numérique d'une intégrale complexe en utilisant des méthodes d'approximation telles que **la méthode des trapèzes** et **la méthode de Simpson**. Les résultats incluent une comparaison des valeurs calculées, une analyse des erreurs et des graphiques illustrant la convergence des méthodes.

## Contenu

- **Document LaTeX** : Contient les explications, les tableaux des résultats et les graphes des différentes méthodes utilisées pour l'approximation.
- **Script en langage R** : Implementation pratique des méthodes numériques d'approximation.

## Résultats

### Comparaison des Méthodes

Pour différentes valeurs de subdivisions (\( n \)) :

| \( n \) | Trapèze  | Simpson  | Erreur Trapèze  | Erreur Simpson  |
|--------|----------|----------|-----------------|-----------------|
| 2      | 4.276300 | 3.584088 | 9.196999e-01    | 2.274873e-01    |
| 4      | 3.533865 | 3.286386 | 1.772642e-01    | 7.021431e-02    |
| 8      | 3.368911 | 3.313926 | 1.231046e-02    | 4.267413e-02    |
| 16     | 3.356693 | 3.352621 | 9.294095e-05    | 3.979567e-03    |
| 32     | 3.356601 | 3.356570 | 7.468645e-09    | 3.097036e-05    |
| 64     | 3.356601 | 3.356601 | 8.881784e-16    | 2.489548e-09    |
| 128    | 3.356601 | 3.356601 | 8.881784e-16    | 4.440892e-16    |
| 256    | 3.356601 | 3.356601 | 8.881784e-16    | 8.881784e-16    |

## Organisation du Projet

- **`mini_projet_anum.pdf`** : Fichier PDF écrit en LaTeX principal contenant la recherche complète.
- **`script.r`** : Contient le script utilisé pour la recherche.


## Objectifs du Projet

    Comparer la précision des méthodes numériques (trapèzes et Simpson).
    Étudier la convergence des deux méthodes.
    Visualiser les résultats pour mieux interpréter les erreurs.

## Technologies Utilisées

    Langage LaTeX : Pour la rédaction scientifique.
    pgfplots : Génération des graphiques.
    TikZ : Création d'illustrations.
    Python (optionnel) : Calculs numériques et génération des données (si applicable).

## Licence

Ce projet est sous licence MIT.
