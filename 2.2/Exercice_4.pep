;Écrivez un programme qui saisit le poids et l'âge d'un participant dans la console. 
;Pour que ce participant puisse sauter en parachute, il doit être âgé d'au moins 15 ans
;et peser au minimum 40kg. Afficher si le participant a le droit de sauter en parachute ou non. 


         BR main
msg1: .ASCII "Entrez le poids du participant (kg): \x00" 
msg2: .ASCII "Entrez l'age du participant: \x00" 
msg3: .ASCII "Oui, le participant peut sauter en parachute. \x00"
msg4: .ASCII "Non, le participant ne peut pas sauter en parachute. \x00"




main:    STRO msg1,d  ;Affiche le premier message
         DECI poid,d  ;Lit le poids
         STRO msg2,d  ;Affiche le second message
         DECI age,d   ;Lit l'age   

         LDA  poid,d  
         CPA  40,i    ;Compare le poids saisit avec le poids minimal de 40
         BRGE test    ;Si poids=> 40 va vers fonction test
         BRLT non     ;Sinon affiche message de refus
        

test:    LDA age,d
         CPA 15,i     ;Compare l'âge saisit avec l'âge minimal de 15    
         BRGE oui     ;Si age=>15 va afficher message de oui
         BRLT non     ;Sinon affiche le refus

oui:     STRO msg3,d
         STOP
         
non:     STRO msg4,d
         STOP 




poid: .BLOCK 2
age: .BLOCK 2


.END
