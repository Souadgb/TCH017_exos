;Écrivez un programme qui saisit un nombre dans la console. S'il est négatif, on en calcule la valeur absolue.
;Afficher la valeur absolue du nombre à la console.
;Programme pour calculer la valeur absolue 
         BR main ;Branche au programme principal 

msg1: .ASCII "Entrez un nombre: \x00" 
msg2: .ASCII "La valeur absolue est: \x00"   
     
main:    STRO     msg1,d
         DECI     n,d        ;Input du nombre 
         LDA      n,d        ;charger le nombre dans le registre A
         CPA      0,i        ;Compare avec 0
         BRGE     aff        ;affiche directement si le nombre est positif
         NEGA                ;sinon calcule la valeur absolue
         STA      n,d

aff:     STRO    msg2,d
         DECO    n,d
         STOP
n: .BLOCK 2
.END 
