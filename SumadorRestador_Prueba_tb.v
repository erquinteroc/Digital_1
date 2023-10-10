//  A testbench for SumadorRestador_Prueba_tb
`timescale 1us/1ns

module SumadorRestador_Prueba_tb;
    reg A0;
    reg B0;
    reg A1;
    reg A2;
    reg A3;
    reg B1;
    reg B2;
    reg B3;
    reg Cin;
    
	initial 
	begin
	
	Cin=1; A0=1; A1=1; A2=0; A3=0; B0=1; B1=0; B2=0; B3=0;
	#1
	Cin=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0;
	#1
	Cin=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0;
	#1 
	Cin=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0;
	
	$finish();
	end
    
 //cables para conectar a la salida   
    wire S0;
    wire S1;
    wire S2;
    wire S3;
    wire Cout;
    
  SumadorRestador dut (Cin, A0, A1, A2, A3, B0, B1, B2, B3, S0, S1, S2, S3, Cout);

//MONITOR
initial 
	$monitor("Time: %t, Cin=%d, A0=%d; A1=%d; A2=%d; A3=%d; B0=%d; B1=%d; B2=%d; B3=%d, => S0 = %d, S1 = %d, S2 = %d,  S3 = %d, Cout=%d", $time, Cin, A0, A1, A2, A3, B0, B1, B2, B3, S0, S1, S2, S3, Cout);
	//SAVES FORM

initial 
begin
	$dumpfile("myi_designSumadorRes.vcd");
	$dumpvars(0,SumadorRestador_Prueba_tb
	);
end 
endmodule

 // SumadorRestador SumadorRestador0 (
 //   .A0(A0),
 //   .B0(B0),
 //   .A1(A1),
 //   .A2(A2),
//    .A3(A3),
  //  .B1(B1),
 //   .B2(B2),
 //   .B3(B3),
//    .Cin(Cin),
 //   .S0(S0),
 //   .S1(S1),
 //   .S2(S2),
 //   .S3(S3),
 //   .Cout(Cout)
 // );

