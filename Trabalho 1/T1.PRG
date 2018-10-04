MODULE TESTE
  !------------------------------------------------------------------------------------------------------------------------------------
  !Ponto = [ [translação] , [rotação],  [axis configuration], [external axes] ]
  !Ponto = [ [x, y, Z] , [q1, q2, q3, q4],  [cf1, cf4, cf6, cfx], [eax_a, eax_b ... eax_f]]
  !
  ! Translação é expressa em mm. (X,Y,Z)
  !   Exemplo
  !   VAR pos p := [100,200,300];
  ! Rotação é expressa em relação as coordenadas atuais
  !   Exemplo
  !   VAR orient quat1 := [1, 0, 0, 0];
  ! Axis configuration é expresso em quartos de revolução que são movimentos de 90 graus dos eixos. (0  <=  cf  <=  4)
  ! Exemplo
  ! VAR confdata conf15 := [1, -1, 0, 0];
  ! Eixos eixos lineares em mm e eixos angulares em graus
  !   (9E+09 implica em ignorar campo e utilizar indicado nas variaveis anteriores)
  !   Exemplo
  !   VAR extjoint axpos10 := [ 11, 12.3, 9E9, 9E9, 9E9, 9E9] ;
  !   11 e 12.3 podem ser mm ou graus conforme eixos, e 9E9 significa undefined
  !
  ! Redefinindo ponto de repouso
  ! VAR pos       p0      := [778.08,83.25,1180.04];
  ! VAR orient    o0      := [0.003629,0.656282,0.754506,-0.001468];
  ! VAR confdata  conf0   := [0,-1,-4,0];
  ! VAR extjoint  axpos0  := [9E+09,9E+09,9E+09,9E+09,9E+09,9E+09];
  ! VAR robtarget P0      := [p0, o0, conf0, axpos0];
  !VAR num contador:=0;  !numero de peças
  !----------------------------------------------INICIO DO PROGRAMA--------------------------------------------------------------------------------

  CONST robtarget p0:=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p1:=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p2:=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p3:=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p4:=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  

  PROC main()
    !programa realizado por Alexandre, Juliana, Vladyslav. 
	!data: ...
    !este programa tem por objectivo Atender ao item 1 da Ficha de trabalho

    ! deve Manipular uma peça do local A para o local B, e após ter regressado à posição de repouso, voltar a movimentar a peça para o local A.
    abre_garra;
    MoveJ p0, v500, z50, PINCA1P;
    MoveJ p1, v500, z50, PINCA1P;
    MoveL p2, v100, fine, PINCA1P;
    fecha_garra;
    MoveL p1, v500, z50, PINCA1P;
    MoveJ p3, v500, fine, PINCA1P;
    MoveL p4, v100, z50, PINCA1P;
    abre_garra;
    MoveL p3, v500, z50, PINCA1P;
    MoveJ p0, v500, z50, PINCA1P;

    MoveJ p3, v500, z50, PINCA1P;
    MoveL p4, v100, fine, PINCA1P;
    fecha_garra;
    MoveL p3, v500, z50, PINCA1P;
    MoveJ p1, v500, z50, PINCA1P;
    MoveL p2, v100, fine, PINCA1P;
    abre_garra;
    MoveL p1, v500, z50, PINCA1P;

  ENDPROC

  PROC abre_garra()
    Reset DOfecha;
    PulseDO\PLength:=0.2,DOabre;
    WaitTime 0.5;
  ENDPROC

  PROC fecha_garra()
    Reset DOabre;
    PulseDO\PLength:=0.2,DOfecha;
    WaitTime 0.5;
  ENDPROC
ENDMODULE


