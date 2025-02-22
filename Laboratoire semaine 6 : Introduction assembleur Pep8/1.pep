;Souad Goubaa, groupe 3.

;1)Vous saisissez 2 entiers positifs non-nuls, et vous afficher 
;un message qui dit si le deuxième nombre est diviseur du premier.  


         BR      main       ;Branche au programme principal 

msg1: .ASCII "Entrez le premier nombre: \x00" 
msg2: .ASCII "Entrez le second nombre: \x00" 
msg3:    .ASCII "Le deuxième nombre est diviseur du premier \x00"   
msg4:    .ASCII "Le deuxième nombre n'est pas diviseur du premier \x00" 
     
main:    STRO    msg1,d     ;Afficher à l'utilisateur le message demandant d'entrer le premier nombre
         DECI    num1,d     ;Saisie du nombre
         STRO    msg2,d     ;Afficher à l'utilisateur le message demandant d'entrer le second nombre
         DECI    num2,d     ;Saisie du nombre

         ;Copie num1 dans reste pour ne pas modifier l'original 
         LDA     num1,d 
         STA     rest,d 

sous:    LDA     rest,d     ;Charge le premier nombre
         SUBA    num2,d     ;Soustrait le second nombre au premier
         BRLT    veri       ;Si le reste <0, passe a la fonction veri 
         STA     rest,d     ;Sinon stocke nouveau reste 
         BR      sous       ;Continue les soustractions

veri:    LDA     rest,d     ;Charge le reste
         BREQ    oui        ;Si le reste =0, passe a la fonction oui
         BR      non        ;Sinon, passe a la fonction non

         
oui:     STRO    msg3,d     ;Affiche que le second nombre est bien un diviseur du premier 
         BR      fin        ;Passe a la fonction fin

non:     STRO    msg4,d     ;Affiche que le second nombre n'est pas diviseur du premier

fin:     STOP               ;Mettre fin au programme 

num1:    .BLOCK 2
num2:    .BLOCK 2   
rest:    .BLOCK 2  

.END 
