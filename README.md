# Defi_SDL2_QP_08_03_19
Rendu défi 2nd trimestre

Résumé et commentaires sur la réalisation du défi : 
Le tutoriel accompagnant le travail à réaliser était très correct et relativement intuitif. 
Une fois l'installation de la SDL2 quelque peu compliquée, il était bien plus agréable d'identifier et manipuler les commandes 
avec pour objectif d'afficher un bitmap, un dessin et réaliser le minijeu malgré de nombreux problèmes rencontrés. 
Le minijeu n'est malheureusement pas à proprement parler un jeu. L'hélicoptère est seulement animé et contrôlable par l'utilisateur 
à l'aide des touches z, q, s et d.  

La SDL ne fournit aucune méthode pour charger différents formats d'images. 
En utilisant SDL_image, il est possible charger des images dans tous les formats communs tels que les formats
JPG (.jpg ou .jpeg) -PNG -GIF -BMP -TGA -XPM -PNM -PCX -TIF (.tif ou .tiff) -LBM (.lbm ou.iff)   

L'éxécutable contient donc un menu permettant d'afficher : 
  - le bitmap
  - le dessin 
  - le "minijeu"
  - la différence entre SDL et SDL2
 
