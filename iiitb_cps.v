// fpga4student.com FPGA projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for car parking system
`timescale 1ns / 1ps
module parking_system( 
                input clk,reset_n,
 input sensor_entrance, sensor_exit, 
 input [1:0] password_1, password_2,
 output wire GREEN_LED,RED_LED,
 output reg [6:0] HEX_1, HEX_2
    );
 parameter IDLE = 3'b000, WAIT_PASSWORD = 3'b001, WRONG_PASS = 3'b010, RIGHT_PASS = 3'b011,STOP = 3'b100;
 // Moore FSM : output just depends on the current state
 reg[2:0] current_state, next_state;
 reg[31:0] counter_wait;
 reg red_tmp,green_tmp;
 // Next state
 always @(posedge clk or negedge reset_n)
 begin
 if(~reset_n) 
 current_state = IDLE;
 else
 current_state = next_state;
 end
 // counter_wait
 always @(posedge clk or negedge reset_n) 
 begin
 if(~reset_n) 
 counter_wait <= 0;
 else if(current_state==WAIT_PASSWORD)
 counter_wait <= counter_wait + 1;
 else 
 counter_wait <= 0;
 end
 // change state
// fpga4student.com FPGA projects, Verilog projects, VHDL projects
 always @(*)
 begin
 case(current_state)
 IDLE: begin
         if(sensor_entrance == 1)
 next_state = WAIT_PASSWORD;
 else
 next_state = IDLE;
 end
 WAIT_PASSWORD: begin
 if(counter_wait <= 3)
 next_state = WAIT_PASSWORD;
 else 
 begin
 if((password_1==2'b01)&&(password_2==2'b10))
 next_state = RIGHT_PASS;
 else
 next_state = WRONG_PASS;
 end
 end
 WRONG_PASS: begin
 if((password_1==2'b01)&&(password_2==2'b10))
 next_state = RIGHT_PASS;
 else
 next_state = WRONG_PASS;
 end
 RIGHT_PASS: begin
 if(sensor_entrance==1 && sensor_exit == 1)
 next_state = STOP;
 else if(sensor_exit == 1)
 next_state = IDLE;
 else
 next_state = RIGHT_PASS;
 end
 STOP: begin
 if((password_1==2'b01)&&(password_2==2'b10))
 next_state = RIGHT_PASS;
 else
 next_state = STOP;
 end
 default: next_state = IDLE;
 endcase
 end
 // LEDs and output, change the period of blinking LEDs here
 always @(posedge clk) begin 
 case(current_state)
 IDLE: begin
 green_tmp = 1'b0;
 red_tmp = 1'b0;
 HEX_1 = 7'b1111111; // off
 HEX_2 = 7'b1111111; // off
 end
 WAIT_PASSWORD: begin
 green_tmp = 1'b0;
 red_tmp = 1'b1;
 HEX_1 = 7'b000_0110; // E
 HEX_2 = 7'b010_1011; // n 
 end
 WRONG_PASS: begin
 green_tmp = 1'b0;
 red_tmp = ~red_tmp;
 HEX_1 = 7'b000_0110; // E
 HEX_2 = 7'b000_0110; // E 
 end
 RIGHT_PASS: begin
 green_tmp = ~green_tmp;
 red_tmp = 1'b0;
 HEX_1 = 7'b000_0010; // 6
 HEX_2 = 7'b100_0000; // 0 
 end
 STOP: begin
 green_tmp = 1'b0;
 red_tmp = ~red_tmp;
 HEX_1 = 7'b001_0010; // 5
 HEX_2 = 7'b000_1100; // P 
 end
 endcase
 end
 assign RED_LED = red_tmp  ;
 assign GREEN_LED = green_tmp;

endmodule
