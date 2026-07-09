module generatora(input clk,input rstn,output reg dout);
reg [2:0] state;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;

reg [2:0] nextstate;
always @(posedge clk)
begin
       if(rstn==1'b1)
       begin
             state<=s0;
       end
       else
       state<=nextstate;
end
always @(*)
begin
       case(state)
            s0:
            begin
                  dout<=1;
                  nextstate<=s1;
            end
            s1:
            begin
                  dout<=0;
                  nextstate<=s2;
            end
            s2:
            begin
                  dout<=0;
                  nextstate<=s3;
            end
            s3:
            begin
                  dout<=1;
                  nextstate<=s4;
            end
            s4:
            begin
                  dout<=1;
                  nextstate<=s0;
            end
       endcase
end
endmodule

module generatora_tb;
reg clk;
reg rstn;
wire dout;
           
generatora g1(.clk(clk),.rstn(rstn),.dout(dout));
initial
begin
       $dumpfile("dump.vcd");
       $dumpvars();
       #100 ;
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
        #6;
        rstn=1'b0;
        
end
endmodule
