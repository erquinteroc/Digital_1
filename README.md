##Sumador Restador 4 bits - Laboratorio 2
<p>
Para la realizacion de un sumador restador podemos realizar la union de un Semisumador, el cual esta compuesto de la siguiente forma: 
</p>

![semisum](https://github.com/erquinteroc/Digital_1/assets/147540973/d5ebe052-3749-4a1c-84b5-e098e2293e40)

![tablaverda](https://github.com/erquinteroc/Digital_1/assets/147540973/d12c576d-3b54-4502-a7c8-66be60ebd67b)

<p>
La union de 4 semi-sumadores nos dara una salida de 4 bits, donce el carry sera incresado en la entrada Cin del siguiente semi-sumador. Adicionalmente es necesario agregar unas compuestar XOR a las entradas de B para hacer el complemento a 2 del numero B, en caso de que sea negativo. Como se observa en el siguiente circuito.
</p>

![sumador-Comple](https://github.com/erquinteroc/Digital_1/assets/147540973/2975385c-7963-4ddd-a7e8-1058775f4778)

**Otra forma de expresar el circuito sumador restador usaldo el sumador que tiene por defecto Digital, como seobserva a continuacion:**
![sumadorcajita](https://github.com/erquinteroc/Digital_1/assets/147540973/cfd9068b-ae69-4dcd-b126-1629ac1fcb78)

##### Codigo verilog circuito 2. 

```
module DIG_Add
#(
    parameter Bits = 1
)
(
    input [(Bits-1):0] a,
    input [(Bits-1):0] b,
    input c_i,
    output [(Bits - 1):0] s,
    output c_o
);
   wire [Bits:0] temp;

   assign temp = a + b + c_i;
   assign s = temp [(Bits-1):0];
   assign c_o = temp[Bits];
endmodule
module SumadorRestador4bits (
  input A0,
  input B0,
  input Cin,
  input B2,
  input B1,
  input B3,
  input A1,
  input A2,
  input A3,
  output S0,
  output Cout,
  output S1,
  output S2,
  output S3
);
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  wire s11;
  assign s4 = (B0 ^ Cin);
  assign s6 = (B1 ^ Cin);
  assign s8 = (B2 ^ Cin);
  assign s10 = (B3 ^ Cin);
  DIG_Add #(
    .Bits(1)
  )
  DIG_Add_i0 (
    .a( A0 ),
    .b( s4 ),
    .c_i( Cin ),
    .s( S0 ),
    .c_o( s5 )
  );
  DIG_Add #(
    .Bits(1)
  )
  DIG_Add_i1 (
    .a( A1 ),
    .b( s6 ),
    .c_i( s5 ),
    .s( S1 ),
    .c_o( s7 )
  );
  DIG_Add #(
    .Bits(1)
  )
  DIG_Add_i2 (
    .a( A2 ),
    .b( s8 ),
    .c_i( s7 ),
    .s( S2 ),
    .c_o( s9 )
  );
  DIG_Add #(
    .Bits(1)
  )
  DIG_Add_i3 (
    .a( A3 ),
    .b( s10 ),
    .c_i( s9 ),
    .s( S3 ),
    .c_o( s11 )
  );
  assign Cout = (s11 ^ Cin);
endmodule
```
###Creacion del Test Bench

    module SumadorRestador_Prueba_tb;
        reg A0, A1, A2, A3, B0, B1, B2, B3, Cin;
    ;   
        //cables para conectar a la salida   
        wire S0, S1, S2, S3, Cout;
    
        
    	initial 
    	begin
    	
    	Cin=0; A0=1; A1=1; A2=0; A3=0; B0=1; B1=0; B2=0; B3=0;  
    	#1
    	Cin=0; A0=1; A1=1; A2=1; A3=0; B0=1; B1=1; B2=0; B3=0; 
    	#1
    	Cin=1; A0=1; A1=1; A2=1; A3=0; B0=0; B1=1; B2=0; B3=0; 
    	#1 
    	Cin=0; A0=1; A1=0; A2=0; A3=0; B0=1; B1=0; B2=0; B3=0; 
    	
    	$finish();
    	end
        
        SumadorRestador uut (
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
    
    //MONITOR (Observar en la terminar)
    initial 
    	$monitor("Time: %t, Cin=%b, A0=%b, A1=%b, A2=%b, A3=%b, B0=%b, B1=%b, B2=%b, B3=%b, => S0 = %b, S1 = %b, S2 = %b,  S3 = %b, Cout=%b", $time, Cin, A0, A1, A2, A3, B0, B1, B2, B3, S0, S1, S2, S3, Cout);
    	//SAVES FORM
    
    initial 
    begin
    	$dumpfile("myi_designSumadorRes.vcd");
    	$dumpvars(0,SumadorRestador_Prueba_tb);
    end 
    endmodule
<p> Ingresamos los comandos en la terminal, para correr el test bench y observarlo con GTKwave </p>
    


    iverilog -o SumadorRestador SumadorRestador_Prueba_tb.v    	SumadorRestador.v
    ./SumadorRestador
    gtkwave myi_designSumadorRes.vcd

![testbench](https://github.com/erquinteroc/Digital_1/assets/147540973/a350c6ca-b314-4999-8413-55cc6ddeb375)

    

