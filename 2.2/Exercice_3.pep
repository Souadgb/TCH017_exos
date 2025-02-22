;Écrivez un programme qui saisit deux nombres, A et B dans la console. 
;Le programme affiche si A est plus grand que B, si A est plus petit que B ou 
;si A est égal à B.         


         BR main
msg1: .ASCII "Entrez le premier nombre (A): \x00" 
msg2: .ASCII "Entrez le second nombre (B): \x00" 
msg3: .ASCII "A>B \x00"
msg4: .ASCII "A<B \x00"
msg5: .ASCII "A=B \x00"


main:    STRO msg1,d ;Affiche le premier message
         DECI a,d    ;Lit le premier chiffre
         STRO msg2,d ;Affiche le second message
         DECI b,d    ;Lit le second chiffre       

         LDA  a,d
         CPA  b,d
         BREQ equ
         BRLT less
         BRGT grt

equ:     STRO msg5,d
         STOP

less:    STRO msg4,d
         STOP
         
grt:     STRO msg3,d
         STOP 






a: .BLOCK 2
b: .BLOCK 2


.END
