MODULE TESTE

  CONST robtarget p0  :=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR   robtarget p1  :=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR   robtarget p2  :=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR   robtarget p3  :=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR   robtarget p4  :=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

  PROC main()
    ! programa realizado por Alexandre, Juliana, VladySlav
    ! este programa tem por objectivo Atender ao item 1 da Ficha de trabalho
    ! deve Manipular uma peça do local A para o local B, e após ter regressado à posição de repouso, voltar a movimentar a peça para o local A.
    move_peca  p1, p2, p3, p4;
    move_peca  p3, p4, p1, p2;
  ENDPROC

  PROC move_peca(robtarget A, robtarget B, robtarget C, robtarget D)
    abre_garra;
    MoveJ p0, v500, z50, PINCA1P;
    MoveJ A, v500, z50, PINCA1P;
    MoveL B, v100, fine, PINCA1P;
    fecha_garra;
    MoveL A, v500, z50, PINCA1P;
    MoveJ C, v500, fine, PINCA1P;
    MoveL D, v100, z50, PINCA1P;
    abre_garra;
    MoveL C, v500, z50, PINCA1P;
    MoveJ p0, v500, z50, PINCA1P;
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