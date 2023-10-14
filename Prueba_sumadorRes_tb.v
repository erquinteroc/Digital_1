module Prueba_sumadorRes_tb;
    reg A0;
    reg B0;
    reg A1;
    reg A2;
    reg A3;
    reg B1;
    reg B2;
    reg B3;
    reg Cin;
   
    //cables para conectar a la salida   
    wire S0;
    wire S1;
    wire S2;
    wire S3;
    wire Cout;
    
    SumadorRestador4bits uut (
    .A0 (A0),
    .B0 (B0),
    .A1 (A1),
    .A2 (A2),
    .A3 (A3),
    .B1 (B1),
    .B2 (B2),
    .B3 (B3),
    .Cin (Cin),
    .S0 (S0),
    .S1 (S1),
    .S2 (S2),
    .S3 (S3),
    .Cout (Cout)
  );
    
    
	initial 
	begin
	
	Cin=0; A0=1; A1=1; A2=0; A3=0; B0=1; B1=0; B2=0; B3=0;  
	#1
	Cin=0; A0=1; A1=0; A2=0; A3=0; B0=1; B1=0; B2=0; B3=0;  
	#1
	Cin=0; A0=1; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0; 
	
	$finish();
	end

//MONITOR
initial 
	$monitor("Time: %t, Cin=%d, A0=%b, A1=%b, A2=%b, A3=%b, B0=%b, B1=%b, B2=%b, B3=%b => S0 = %b, S1 = %b, S2 = %b,  S3 = %b, Cout=%b", $time, Cin, A0, A1, A2, A3, B0, B1, B2, B3, S0, S1, S2, S3, Cout);
	//SAVES FORM

initial 
begin
	$dumpfile("myuui_designSumadorRes.vcd");
	$dumpvars(0,Prueba_sumadorRes_tb);
end 
endmodule
