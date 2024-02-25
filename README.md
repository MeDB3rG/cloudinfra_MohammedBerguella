# cloudinfra


Afin de résoudre le TP, j'ai procédé en plusieurs étapes :
- D'abord le bucket, ensuite le load balencer, ensuite l'autoscaling et enfin les security groupes.
- J'ai alimenté le launch template au fur et à mesure du TP.
- Afin de garder une vue organisée et d'éviter les répétitions, j'ai créé un fichier var.tf dans lequel j'ai stocké toutes mes variables à utiliser dans les différents services.
- J'ai rencontré le plus de difficultés au niveau de l'interconnexion des différents services (notamment à cause d'un mauvais paramétrage des security groups) mais aussi à cause du script bash à envoyer en user_data au lancement de la VM
- Pour le reste, j'ai suivi les consignes ainsi que la documentation, ce qui m'a beaucoup aidé ! (et bien sûr, les conseils de Monsieur Lucas qui a bien aidé aussi :D)
