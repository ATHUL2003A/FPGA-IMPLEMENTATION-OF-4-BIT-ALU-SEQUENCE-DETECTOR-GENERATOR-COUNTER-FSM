module detector(input clk,input rstn,input din,output reg dout=0);
reg [1:0] state;
reg [1:0] nextstate;
reg doutt;
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
always@(posedge clk or posedge rstn)
begin
	if (rstn==1)
	begin
		dout=0;
		state<=s0;
	end
	else
	begin
	        state<=nextstate;
	        dout<=doutt;
	end
end
	always @(state or din)
	begin
		case (state)
			s0:
			begin
				if(din==1'b0)
				begin
					doutt<=0;
					nextstate<=s0;
			        end
				else
				begin
                                        doutt<=0;				
					nextstate<=s1;
					
					
				end
			end
			s1:
			begin
				if(din==1'b0)
				begin
					doutt<=0;
					nextstate<=s0;
					
				end
				else
				begin
				        doutt<=0;
					nextstate<=s2;
					
				end
			end
			s2:
			begin
				if(din==1'b0)
				begin
				        doutt<=0;
					nextstate<=s3;
					
				end
				else
				begin
				        doutt<=0;
					nextstate<=s2;
					
				end
			end
			s3:
			begin
				if(din==1'b1)
				begin
				        doutt<=1;
				        nextstate<=s1;
				end
			        else
			        begin
					doutt<=0;
					nextstate<=s0;
					
			        end
			end
			default:
			begin
			                doutt<=0;
			                nextstate<=s0;
		        end
		endcase
	end
endmodule


module detector_tb;
reg clk;
reg rstn;
reg din;
wire dout;

detector d1(.clk(clk),.rstn(rstn),.din(din),.dout(dout));
initial
begin   
        //$monitor("dout=%b",dout);
	$dumpfile("detector.vcd");
	$dumpvars(0,detector_tb);
	#500;
	$finish;
end
initial
begin
	clk=0;
	forever #5 clk=~clk;
end
initial
begin
        rstn=1'b1;
        #5;
	rstn=1'b0;
	din=1'b1;
	#10;
	din=1'b1;
	#10;
	din=1'b0;
	#10;
	din=1'b1;
	#10;
	din=1'b1;
	#10;
	din=1'b0;
	#10;
	din=1'b1;
end
endmodule
