;Programme principal pour vérifier si un caractère est une lettre
BR main              ;Branche vers le début du programme principal

;Définition des messages (chaînes de caractères terminées par null)
msg1: .ASCII "Entrez un caractere: \x00"      ;Message de demande de saisie
msg2: .ASCII "Oui, ceci est une lettre \x00"  ;Message pour une lettre
msg3: .ASCII "Non, ceci n'est pas une lettre. \x00" ;Message pour une non-lettre

main:    STRO msg1,d         ;Affiche le message de demande
         CHARI char,d        ;Lit un caractère et le stocke dans 'char'

         LDBYTEX char,d      ;Charge le caractère dans X (1 octet)
         CPX 'A',i           ;Compare avec 'A' (ASCII 65)
         BRGE test1          ;Si >= 'A', va à test1 (potentielle majuscule)
         BRLT non            ;Si < 'A', va à non (pas une lettre)

test2:   LDBYTEX char,d      ;Recharge le caractère dans X (inutile ici)
         CPX 'a',i           ;Compare avec 'a' (ASCII 97)
         BRGE test3          ;Si >= 'a', va à test3 (potentielle minuscule)
         BR non              ;Sinon, va à non (pas une lettre)

test3:   LDBYTEX char,d      ;Recharge le caractère dans X (inutile ici)
         CPX 'z',i           ;Compare avec 'z' (ASCII 122)
         BRLE oui            ;Si <= 'z', va à oui (c'est une minuscule)
         BR non              ;Sinon, va à non (pas une lettre)

test1:   LDBYTEX char,d      ;Recharge le caractère dans X (inutile ici)
         CPX 'Z',i           ;Compare avec 'Z' (ASCII 90)
         BRLE oui            ;Si <= 'Z', va à oui (c'est une majuscule)
         BR test2            ;Sinon, va tester les minuscules

oui:     STRO msg2,d         ;Affiche le message "c'est une lettre"
         BR fin              ;Va à la fin du programme

non:     STRO msg3,d         ;Affiche le message "ce n'est pas une lettre"

fin:     STOP                ;Arrête le programme

char: .BLOCK 1               ;Réserve 1 octet pour stocker le caractère

.END                         ;Fin du programme
