%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE TESTE
  CONST robtarget p0:=[[993.37,-94.03,862.95],[0.041782,0.644977,0.762155,0.037132],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p1:=[[993.41,40.53,816.06],[0.041866,0.644932,0.762188,0.037157],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p2:=[[993.36,40.53,-2.93],[0.041806,0.644953,0.762177,0.03707],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR robtarget p3:=[[1161.03,-347.34,75.26],[0.020254,0.645224,0.763543,0.016678],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR robtarget p4:=[[1161.03,-347.34,-1.53],[0.020244,0.645189,0.763574,0.016664],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR num N:=3;
  VAR num delta:=3;
  VAR num dx:=1;
  VAR robtarget pt1;
  VAR robtarget pt3;

  PROC main()
    ! programa realizado por Alexandre, Juliana, VladySlav
    ! este programa tem por objectivo Atender ao item 1 da Ficha de trabalho
    ! deve Manipular uma peça do local A para o local B, e após ter regressado à posição de repouso, voltar a movimentar a peça para o local A.
    abre_garra;
    MoveL p0,v500,fine,PINCA1P;
    MoveL p1,v500,fine,PINCA1P;
    MoveL p2,v500,fine,PINCA1P;
    TPReadNum N,"Quantas unidades?";
    abre_garra;
    p3:=Offs(p1,0,-200,0);
    p4:=Offs(p2,0,-200,0);
    MoveJ p0,v500,z50,PINCA1P;
    FOR i FROM 1 TO N DO
      IF i<2 THEN
        dx:=0;
      ELSE
        dx:=delta;
      ENDIF
      pt1:=Offs(Offs(p2,0,0,(((N-i)*30)+dx)),0,0,200);
      pt3:=Offs(Offs(p4,0,0,((i-1)*(30)+dx)),0,0,200);
      move_peca pt1,Offs(p2,0,0,(((N-i)*30)+dx)),pt3,Offs(p4,0,0,((i-1)*(30)+dx));
    ENDFOR
    MoveJ p0,v500,z50,PINCA1P;
    FOR i FROM 1 TO N DO
      IF i<2 THEN
        dx:=0;
      ELSE
        dx:=delta;
      ENDIF
      pt1:=Offs(Offs(p2,0,0,((i-1)*(30)+dx)),0,0,200);
      pt3:=Offs(Offs(p4,0,0,(((N-i)*30)+dx)),0,0,200);
      move_peca pt3,Offs(p4,0,0,(((N-i)*30)+dx)),pt1,Offs(p2,0,0,((i-1)*(30)+dx));
    ENDFOR
  ENDPROC

  PROC move_peca(
    robtarget A,
    robtarget B,
    robtarget C,
    robtarget D)

    MoveJ A,v500,fine,PINCA1P;
    MoveL B,v100,fine,PINCA1P;
    fecha_garra;
    MoveL A,v500,z50,PINCA1P;
    MoveJ C,v500,fine,PINCA1P;
    MoveL D,v100,fine,PINCA1P;
    abre_garra;
    MoveL C,v100,z50,PINCA1P;
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

