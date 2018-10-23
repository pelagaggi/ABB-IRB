MODULE TESTE
  VAR robtarget p0:=[[1192.94,-193.95,187.33],[0.021705,0.64548,0.763255,0.018078],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR robtarget p1:=[[1182.17,44.74,134.17],[0.020557,0.645422,0.76336,0.017056],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR robtarget p2:=[[1182.18,44.75,-1.81],[0.020544,0.6454,0.763379,0.017026],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR robtarget p3:=[[1161.03,-347.34,75.26],[0.020254,0.645224,0.763543,0.016678],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR robtarget p4:=[[1161.03,-347.34,-1.53],[0.020244,0.645189,0.763574,0.016664],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR num N:=3;
  
  PROC main()
    ! programa realizado por Alexandre, Juliana, VladySlav
    ! este programa tem por objectivo Atender ao item 1 da Ficha de trabalho
    ! deve Manipular uma peça do local A para o local B, e após ter regressado à posição de repouso, voltar a movimentar a peça para o local A.
    TPReadNum N, "Quantas unidades?";

    abre_garra;
    MoveL p0, v500, fine, PINCA1P;
    MoveL p1, v500, fine, PINCA1P;
    MoveL p2, v500, fine, PINCA1P;

    p3 := Offs(p1,0,-200,0);
    p4 := Offs(p2,0,-200,0);

    FOR i FROM 1 TO N DO
      move_peca  p1, Offs(p2,0,0,((N-i)*31)), p3, Offs(p4,0,0,(i-1)*(31));
    ENDFOR
    FOR i FROM 1 TO N DO
      move_peca  p3,Offs(p4,0,0,((N-i)*31)),p1,Offs(p2,0,0,(i-1)*(31)) ;
    ENDFOR
  ENDPROC

  PROC move_peca(robtarget A, robtarget B, robtarget C, robtarget D)
    MoveJ p0, v500, z50, PINCA1P;
    MoveJ A, v500, fine, PINCA1P;
    MoveL B, v100, fine, PINCA1P;
    fecha_garra;
    MoveL A, v100, z50, PINCA1P;
    MoveJ C, v500, fine, PINCA1P;
    MoveL D, v100, fine, PINCA1P;
    abre_garra;
    MoveL C, v100, z50, PINCA1P;
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