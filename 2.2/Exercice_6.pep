BR main
msg1: .ASCII "Les deux nombres sont pairs \x00"
msg2: .ASCII "Les deux nombres sont impairs\x00"
msg3: .ASCII "L'un des nombres est pair et l'autre est impair.\x00"
msg4: .ASCII "Entrez le premier nombre:\x00"
msg5: .ASCII "Entrez le second nombre:\x00"

main:    STRO msg4,d 
         DECI num1,d         ;input du premier nombre
         STRO msg5,d
         DECI num2,d         ;input du second nombre

         LDA  num1,d
         ANDA 1,i            ;ET logique avec 1
         CPA  0,i 
         BREQ test1          ;si premier nombre est pair passe a test1          
         BR   test2          ;si premier nombre impair passe a test2
         

test1:   LDA  num2,d
         ANDA 1,i            ;ET logique avec 1
         CPA  0,i
         BREQ oui            ;si second nombre est pair affiche msg1
         BR   bof            ;si second nombre impair affiche msg3

test2:   LDA  num2,d
         ANDA 1,i            ;ET logique avec 1
         CPA  1,i
         BREQ non            ;si second nombre est impair affiche msg2
         BR   bof            ;si second nombre est impair affiche msg3
                

oui:     STRO msg1,d
         BR   fin

non:     STRO msg2,d
         BR   fin

bof:     STRO msg3,d
         

fin:     STOP
         


num1:    .BLOCK 2
num2:    .BLOCK 2

.END
