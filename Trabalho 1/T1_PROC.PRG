MODULE TESTE

  CONST robtarget p0:=[[778.08,83.25,1180.03],[0.003624,0.656317,0.754476,-0.001467],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p1:=[[758.72,-213.38,908.43],[0.167028,-0.769248,-0.60344,0.12736],[-1,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p2:=[[787.34,-230.2,765.22],[0.255636,-0.748537,-0.581478,0.190331],[-1,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p3:=[[782.69,295.38,823.01],[0.155228,-0.533719,-0.800599,0.223808],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p4:=[[620.6,272.02,712.91],[0.199651,-0.493967,-0.786642,0.311979],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];


  PROC main()
    ! programa realizado por Alexandre, Juliana, VladySlav
    ! este programa tem por objectivo Atender ao item 1 da Ficha de trabalho
    ! deve Manipular uma peça do local A para o local B, e após ter regressado à posição de repouso, voltar a movimentar a peça para o local A.
    FOR i FROM 1 TO 2 DO
      move_peca  p1, p2, p3, p4;
      move_peca  p3, p4, p1, p2;
    ENDFOR
  ENDPROC

  PROC move_peca(robtarget A, robtarget B, robtarget C, robtarget D)
    abre_garra;
    MoveJ p0, v500, z50, PINCA1P;
    MoveJ A, v500, z50, PINCA1P;
    MoveL B, v100, fine, PINCA1P;
    fecha_garra;
    MoveL A, v500, z50, PINCA1P;
    MoveJ C, v500, z50, PINCA1P;
    MoveL D, v100, fine, PINCA1P;
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