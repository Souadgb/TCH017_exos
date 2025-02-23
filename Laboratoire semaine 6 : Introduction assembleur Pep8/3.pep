; Dans un jeu video simple, le joueur commence avec un score initial. 
; A chaque niveau, il gagne 2 points s'il reussit, ou perd 1 point s'il echoue.
; Ecrivez un programme qui : 
; 1. Demande le score initial du joueur 
; 2. Demande le nombre de niveaux a jouer 
; 3. Pour chaque niveau : Demande si le niveau est réussi (1) ou échoué (0) et met a jour le score selon le resultat.
; 4. Affiche le score final

         BR main
 
msg1: .ASCII "Score initial: \x00" 
msg2: .ASCII "Nombre de niveaux: \x00" 
msg3: .ASCII "Niveau reussi? (1=oui, 0=non): \x00" 
msg4: .ASCII "Score final: \x00" 


main:    STRO    msg1,d      ;Demande score initial 
         DECI    score,d     ;Input de l'usager
         STRO    msg2,d      ;Demande nombre de niveaux 
         DECI    nbNiv,d     ;Input de l'usager
         LDA     0,i         ;Charge 0 dans la memoire pour le compteur
         STA     niveau,d    ;Initialise compteur a 0


boucle:  STRO    msg3,d      ;Demande resultat niveau 
         DECI    reussi,d    ;Input de l'usager
         LDA     reussi,d    ;Charge l'input de l'usager
         CPA     1,i         ;Verifie si niveau reussi (si input=1)
         BRNE    echec       ;Si non réussi (=0), va a echec 
         LDA     score,d     ;Charge le score dans la memoire
         ADDA    2,i         ;Si reussi: +2 points 
         BR      suite       ;Passe a suite


echec:   LDA     score,d     ;Charge le score dans la memoire
         SUBA    1,i         ;Si echec: -1 point 

suite:   STA     score,d     ;Sauvegarde nouveau score 
         LDA     niveau,d    ;Charge le compteur de niveau
         ADDA    1,i         ;Incrémente compteur niveau 
         STA     niveau,d    ;Sauvegarde l'incrementation
         CPA     nbNiv,d     ;Compare avec total niveaux 
         BRLT    boucle      ;Continue si pas fini (niveau<total niveaux)
         STRO    msg4,d      ;Affiche résultat final 
         DECO    score,i     ;Affiche résultat final 

         STOP 


score:   .BLOCK 2 ;Score du joueur 
nbNiv:   .BLOCK 2 ;Nombre de niveaux 
niveau:  .BLOCK 2 ;Compteur de niveaux 
reussi:  .BLOCK 2 ;Résultat du niveau (0/1) 

         .END
