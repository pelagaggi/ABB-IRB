%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE TESTE
  CONST robtarget prepouso:=[[778.08,83.25,1180.04],[0.003629,0.656282,0.754506,-0.001468],[0,-1,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  VAR num contador:=0;  !numero de peças

  PROC main()
    !programa realizado por ... 
	!data: ...
    !este programa tem por objectivo ...

    
    ! deve fazer qualquer coisa ...
    abre_garra;
       
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


