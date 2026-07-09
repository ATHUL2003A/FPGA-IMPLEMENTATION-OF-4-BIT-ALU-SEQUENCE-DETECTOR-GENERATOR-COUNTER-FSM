module scounter(input clk,input rstn,input m,output reg [7:0]q=8'b0);
localparam minvalue=8'd0;
localparam maxvalue=8'd255;
always@(posedge clk)
begin
	if (rstn==0)
	begin
		q<=8'b0;
	end
	else if (m==0 & q<maxvalue)
	begin
		q<=q+1;
	end
	else if (m==0 & q==maxvalue)
	begin
		q<=8'b0;
	end
	else if (m==1 & q>minvalue)
	begin
	        q<=q-1;
	end
	else if (m==1 & q==minvalue)
	begin
	        q<=8'd255;
	end
end
endmodule

module scounter_tb;
reg clk;
reg rstn;
reg m;
wire [7:0]q;

scounter s1(.clk(clk),.rstn(rstn),.m(m),.q(q));
initial
begin
	$dumpfile("dump.vcd");
	$dumpvars();
	#2560;
	$finish;
end
initial
begin
	clk=0;
	forever #5 clk=~clk;
end
initial
begin
	rstn=1;
	m=0;
	#50;
	m=1;
	#50;
	m=0;
	
end
endmodule


