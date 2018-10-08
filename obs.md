#   Observações acerca da sintaxe
##  Ponto e suas coordenadas
```
Ponto = [ [translação] , [rotação],  [axis configuration], [external axes] ]
Ponto = [ [x, y, Z] , [q1, q2, q3, q4],  [cf1, cf4, cf6, cfx], [eax_a, eax_b ... eax_f]]
! Translação é expressa em mm. (X,Y,Z)
!   Exemplo
VAR pos p := [100,200,300];
! Rotação é expressa em relação as coordenadas atuais
!   Exemplo
VAR orient quat1 := [1, 0, 0, 0];
! Axis configuration é expresso em quartos de revolução que são movimentos de 90 graus dos eixos. (0  <=  cf  <=  4)
! Exemplo
VAR confdata conf15 := [1, -1, 0, 0];
! Eixos eixos lineares em mm e eixos angulares em graus
!   (9E+09 implica em ignorar campo e utilizar indicado nas variaveis anteriores)
!   Exemplo
VAR extjoint axpos10 := [ 11, 12.3, 9E9, 9E9, 9E9, 9E9] ;
!   11 e 12.3 podem ser mm ou graus conforme eixos, e 9E9 significa undefined
!
! Redefinindo ponto de repouso
VAR pos       p0      := [778.08,83.25,1180.04];
VAR orient    o0      := [0.003629,0.656282,0.754506,-0.001468];
VAR confdata  conf0   := [0,-1,-4,0];
VAR extjoint  axpos0  := [9E+09,9E+09,9E+09,9E+09,9E+09,9E+09];
VAR robtarget P0      := [p0, o0, conf0, axpos0];
```
## Pocedimento ou PROC (Funções)
#### Sem parametros
```
PROC main()
    !Chamando sua função
    minha_Proc;
ENDPROC

PROC minha_Proc()
    ! Faz alguma coisa
ENDPROC
```
#### Com parametros
```
PROC main()
    VAR bool flag1 := TRUE;
    VAR byte valor := 220;
    !Chamando sua função
    minha_Proc flag1, valor ;
ENDPROC

PROC minha_Proc(bool A, byte B)
    ! Faz alguma coisa com A e B
ENDPROC
```