;Souad Goubaa, groupe 3.

;2) Vous saisissez 2 entiers et vous affichez un message qui indique 
;le plus grand commun diviseur de ces 2 nombres.   


         BR      main

msg1:    .ASCII  "Entrez le premier nombre: \x00"
msg2:    .ASCII  "Entrez le second nombre: \x00"
msg4:    .ASCII  "Le pgcd est: \x00"


main:    STRO    msg1,d  ;Affiche a l'utilisateur d'entrer le premier nombre
         DECI    a,d     ;Saisie du nombre
         STRO    msg2,d  ;Affiche a l'utilisateur d'entrer le second nombre
         DECI    b,d     ;Saisie du nombre

if:      LDA     a,d     ;Charge a dans A
         CPA     0,i     ;Compare avec 0
         BREQ    rep2    ;Si a=0, passe a rep2
         
         LDA     b,d     ;Charge b dans A
         CPA     0,i     ;Compare avec 0
         BREQ    rep1    ;Si b=0, passe a rep1
         
         LDA     a,d     ;Charge a dans A
         CPA     b,d     ;Compare avec b en mémoire
         BRGT    fon1    ;Si a>b, passe a fon1
         BR      fon2    ;Sinon, passe a fon2

fon1:    LDA     a,d     ;Charge a
         SUBA    b,d     ;Soustrait le contenu de b (mode direct)
         STA     a,d     ;Stocke le résultat dans a
         BR      if      ;Passe a if

fon2:    LDA     b,d     ;Charge b
         SUBA    a,d     ;Soustrait le contenu de a (mode direct)
         STA     b,d     ;Stocke le résultat dans b
         BR      if      ;Passe a if

rep1:    STRO    msg4,d  ;Affiche le message 4 (pour le resultat)
         LDA     b,d     ;Charge b pour l'affichage
         DECO    b,i     ;Affiche la valeur dans A
         BR      fin     ;Fin du programme

rep2:    STRO    msg4,d
         LDA     a,d     ;Charge a pour l'affichage
         DECO    a,i     ;Affiche la valeur dans A
         BR      fin     ;Fin du programme

fin:     STOP

a:       .BLOCK  2
b:       .BLOCK  2
         .END
