;Écrivez un programme qui saisit deux nombres dans la console. Le programme affiche le plus grand des deux. 
         BR main
msg1: .ASCII "Entrez le premier nombre: \x00" 
msg2: .ASCII "Entrez le second nombre: \x00" 
msg3: .ASCII "Le plus grand des deux nombres est: \x00"


main:    STRO msg1,d ;Affiche le premier message
         DECI n,d    ;Lit le premier chiffre
         STRO msg2,d ;Affiche le second message
         DECI m,d    ;Lit le second chiffre        

         LDX  n,d    ;Charge le premier nombre dans le registre
         CPX  m,d    ;Compare le second nombre avec le premier nombre
         BRGT resu   ;Si n>m, on passe a resu
         BR   pgnb   ;Sinon on passe a pgnb

resu:    LDX  n,d    ;Charge le premier nombre (dans ce cas n>m)
         STX  res,d  ;Enregistre sa valeur dans la variable res
         BR   aff    ;Passe a l'affichage du resultat res

pgnb:    LDX  m,d    ;Charge le second nombre (dans ce cas m<n)
         STX  res,d  ;Enregistre sa valeur dans la variable res
         BR   aff    ;Passe a l'affichage du resultat res

aff:     STRO msg3,d ;Affichage du message 3
         DECO res,d  ;Affichage du resultat etant la valeur la plus grande



n:   .BLOCK 2
m:   .BLOCK 2
res: .BLOCK 2

.END
