module alu(input clk,input [3:0]A,input [3:0]B,input [3:0] SEL,output reg C,output reg [3:0] OUT1,output reg [3:0] OUT2);
always @(posedge clk)
begin
	if(SEL==4'b0000)
	begin
		{C,OUT1}<=A+B;
	end
	else if (SEL== 4'b0001)
	begin
		{C,OUT2}<=A-B;
	end
	else if (SEL==4'b0010)
	begin
		{OUT2,OUT1}<=A*B;
	end
	else if (SEL==4'b0011)
	begin
		{OUT1,OUT2}<=A/B;
	end
	else if (SEL==4'b0100)
	begin
		OUT1<={A[0],A[3:1]};
		OUT2<={B[0],B[3:1]};
	end
	else if (SEL==4'b0101)
	begin
		OUT1<={A[2:0],A[3]};
		OUT2<={B[2:0],B[3]};
	end
	else if (SEL==4'b0110)
	begin
		OUT1<=A<<1;
		OUT2<=B<<1;
	end
	else if (SEL==4'b0111)
	begin
		OUT1<=A>>1;
		OUT2<=B>>1;
	end
	else if (SEL==4'b1000)
	begin
		OUT1<=A&B;
	end
	else if (SEL==4'b1001)
	begin
		OUT2<=A|B;
	end
	else if (SEL==4'b1010)
	begin
		OUT1<=~(A);
		OUT2<=~(B);
	end
	else if (SEL==4'b1011)
	begin
		OUT1<=~(A|B);
	end
	else if (SEL==4'b1100)
	begin
		OUT2<=A^B;
	end
	else if (SEL==4'b1101)
	begin
		OUT1<=~(A&B);
	end
	else if (SEL==4'b1110)
	begin
		OUT1<=(A>B)?4'b1:4'b0;
	end
	else if (SEL==4'b1111)
	begin
		OUT1<=(A==B)?4'b1:4'b0;
	end
end
endmodule



module alu_tb;
reg clk;
reg [3:0]A;
reg [3:0]B;
reg [3:0]SEL;
wire C;
wire [3:0]OUT1;
wire [3:0]OUT2;

alu a(.clk(clk),.A(A),.B(B),.SEL(SEL),.C(C),.OUT1(OUT1),.OUT2(OUT2));
initial
begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #200;
      $finish;
end
initial
begin
      clk=0;
      forever #5 clk=~clk;
end
initial 
begin
      SEL=4'b0;
      A=4'd4;
      B=4'd3;
      #20;
      SEL=4'b0010;
      A=4'd4;
      B=4'd2;
      #30;
      SEL=4'b1101;
      A=4'd4;
      B=4'd2;
end
endmodule
