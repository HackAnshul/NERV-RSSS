module test;
reg [15:0]inp;
reg clk,rst;
wire out,out_buzz;
wire [4:0]state;

RSSS dut(.inp(inp),.clk(clk),.rst(rst),.out(out),.state(state),.out_buzz(out_buzz));
initial begin
clk<=0;
  forever #50 clk<=(~clk);
end

initial begin
    rst<=1;
    #100
    rst<=0;
    #100
    inp<=5938;
    #1700
    if(out==0)
      begin
        $display("Lock opened");
      end
  else
      $display("Wrong Password");
      
end
  

endmodule


module RSSS(inp,clk,out,rst,state,out_buzz);
input clk,rst;
input [15:0]inp;
output reg [4:0]state;
output reg out;
output reg out_buzz;
reg count;
always @(posedge clk or posedge rst)
begin
  count<=0;
  if(rst)
    begin
      state <=5'b00000;
    end
  else
    begin
      case(state)
        //A
        5'b00000:
          begin
            if(inp[15]==0) begin 
              state<=5'b00001;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //B
        5'b00001:
          begin
            if(inp[14]==0) begin 
              state<=5'b00010;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //C
        5'b00010:
          begin
            if(inp[13]==0) begin 
              state<=5'b00011;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //D
        5'b00011:
          begin
            if(inp[12]==1) begin 
              state<=5'b00100;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //E
        5'b00100:
          begin
            if(inp[11]==0) begin 
              state<=5'b00101;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //F
        5'b00101:
          begin
            if(inp[10]==1) begin 
              state<=5'b00110;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //G
        5'b00110:
          begin
            if(inp[9]==1) begin 
              state<=5'b00111;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //H
        5'b00111:
          begin
            if(inp[8]==1) begin
              state<=5'b01000;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //I
        5'b01000:
          begin
            if(inp[7]==0) begin 
              state<=5'b01001;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //J
        5'b01001:
          begin
            if(inp[6]==0) begin 
              state<=5'b01010;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //K
        5'b01010:
          begin
            if(inp[5]==1) begin 
              state<=5'b01011;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //L
        5'b01011:
          begin
            if(inp[4]==1) begin
              state<=5'b01100;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //M
        5'b01100:
          begin
            if(inp[3]==0)begin 
              state<=5'b01101;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //N
        5'b01101:
          begin
            if(inp[2]==0) begin 
              state<=5'b01110;
              
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //O
        5'b01110:
          begin
            if(inp[1]==1) begin 
              state<=5'b01111;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
        //P
        5'b01111:
          begin
            if(inp[0]==0) begin
               state<=5'b10000;
            end
            else
              state<=5'b00000;
              count<=count+1;
          end
          //Q
        /*5'b10000:
          begin
            state<=5'b00000;
          end*/
      endcase
//Further State will be reset manually. Hence Cannot be Implemented through Verilog.
        
    end
	
end
always @(*)
begin
if(rst) begin
out<=1;
end
else if(state==5'b10000) begin
out<=0;
end
else
out<=1;  
end

always @(*)
begin
if(count==3) begin
 out_buzz<=1;
 end
 else
 out_buzz<=0;
end


endmodule






