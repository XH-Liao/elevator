module FinalProject(rowLED, co1LED, key_r, key_c, clk, rst);
output reg [15:0] rowLED;
output reg [3:0] colLED;
//output reg [11:0] LED;
//output reg [7:0] seg7;
'/output reg [2:0] SEL-0;
output reg [3:0] key_c;
input [3:0] key_r;
input clk, rst;
//鍵盤控制
reg [3:0] currentstate, nextstate;
reg press;
reg [3:0] row, col;
reg [2:0] number=0; //按下的按鍵
//改變state
always @ (posedge clk, negedge rst)begin
if(!rst)
currentState=D;
else
currentstate=nextstate;
end
//掃描(從co10~〜col4)如果該co1的key_r為1111,表示該co1未按下按鈕,繼續偵下一co1。
always @ * begin
case(currentState)
0: if(key_r!=4'b1111) else nextState=O;
1: if(key_r= =4 'b1111) nextState=2 else nextState=5
2: if(key_r==4'b1111)
3: if(key_r =4 'b1111)
nextState=3:
2=4'b1111)
nextstate=4;
4: if(key_r=
else nextState=5
else nextState=5
nextState=o; else
5: if(key_r= =4'b1111) nextState=0: else
nextState=5
nextState=5
endcase
nextstate=;
end
1/根據nextState設定outputkey_c得掃指定k_cky_r值
always @ (posedge c1k, negedge rst)begin
if(!rst)begin
key_c=0;
press=0;
end
else begin
case(nextState)
0: begin key_c=0; press=0; end
1: key_c=4'b1110;
2: key_c=4'b1101;
3: key_c=4'b1011;
4: key_c=4'b0111;
5: begin row=key_r; col=key_c; press=1; end
endcase
end
end
//根據按下的row,col,儲存number值
always @ (posedge clk, negedge rst)begin
if(!rst) number=1;
else if(press==1) begin
if(co1==4'b0111)begin
if(row==4'b0111)
number=1; 1/1
else if(row==4 'b1011)
number=2; //2
else if(row== =4 'b1101)
number=3; //3
end
else if(col==4'b1011)begin
if (row==4'b0111)
number=4; 1/4
else if(row==4 'b1011)
number=5; //5
end
//鍵盤控制en
end
end
//除頻器
reg [20:0] cnt_sec, cnt_LED;
reg clk_sec, c1k_LED;
//clk_LED:箭流動clock
always @ (posedge clk, negedge rst)begin
if(!rst)
clk_LED=1;
else begin
cnt_LED=cnt_LED+1;
if(cnt_LED>=499)begin
clk_LED=~C1K_LED;
cnt_LED=0;
end
end
end
//clk_sec:移動樓層讀之c1ock
always @ (posedge clk_LED, negedge rst)begin
if(!rst)
clk_sec=1;
else begin
cnt_sec=cnt_sec+1;
if(cnt_sec>=16)begin
clk_sec=~c1k_sec;
cnt_sec=0;
end
end
end