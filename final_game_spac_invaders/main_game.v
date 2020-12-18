`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:39 12/12/2020 
// Design Name: 
// Module Name:    main_game 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Game(
   input CLK,
	input rst_game,
	input btnL,
	input btnR,
	input fire,
	input startbtn,
	input btnL2,
	input btnR2,
	input fire2,
    output H_sync,
    output V_sync,
    output VGA_RED,
    output VGA_GREEN,
    output VGA_BLUE,
	 output speaker
    );
	 
wire integer spaceshipX;
wire integer spaceshipY;
wire integer spaceshipX2;
wire integer spaceshipY2;
wire [9:0]rocketX,rocketX2,alienrocketX1,alienrocketX2,alienrocketX3,alienrocketX4,alienrocketX5,alienrocketX6;
wire [8:0]rocketY,rocketY2,alienrocketY1,alienrocketY2,alienrocketY3,alienrocketY4,alienrocketY5,alienrocketY6;
wire [9:0]alien_addr;
wire [9:0]alienX1,alienX2,alienX3,alienX4,alienX5;
wire [8:0]alienY1,alienY2,alienY3,alienY4,alienY5;
wire [9:0]alien2X1,alien2X2,alien2X3,alien2X4,alien2X5;
wire [8:0]alien2Y1,alien2Y2,alien2Y3,alien2Y4,alien2Y5;
wire [9:0]alien3X1,alien3X2,alien3X3,alien3X4,alien3X5;
wire [8:0]alien3Y1,alien3Y2,alien3Y3,alien3Y4,alien3Y5;
reg [8:0]space_addr,life_addr;
wire [8:0]ship_addr;
wire [7:0]space_dout;
reg [8:0]space_addr2,life_addr2;
wire [8:0]ship_addr2;
wire [7:0]space_dout2;

reg [8:0]select_addr;
wire [7:0]select_dout;
reg select_border;
reg [9:0] selectX = 136;
reg [9:0] selectY = 382;

reg [9:0]alien_addr1,alien_addr2,alien_addr3,alien_addr4,alien_addr5;
reg [9:0]alien_addr6,alien_addr7,alien_addr8,alien_addr9,alien_addr10;
reg [9:0]alien_addr11,alien_addr12,alien_addr13,alien_addr14,alien_addr15;
wire [7:0]alien_dout,alien2_dout,alien3_dout;
wire rocketflying,rocketflying2,alien1border,alien2border,alien3border,hit,hit_2,gameover,all_dead,hitrocket,hitrocket2;
wire alienrocketflying1,alienrocketflying2,alienrocketflying3,alienrocketflying4,alienrocketflying5,alienrocketflying6;
wire alienfire1,alienfire2,alienfire3,alienfire4,alienfire5,alienfire6;
wire alienalive1,alienalive2,alienalive3,alienalive4,alienalive5;
wire alienalive6,alienalive7,alienalive8,alienalive9,alienalive10;
wire alienalive11,alienalive12,alienalive13,alienalive14,alienalive15;
wire [5:0]alienhit,alienhit2,liveminus,liveminus2;
wire hit1,hit2,hit3,hit4,hit5;
wire hit6,hit7,hit8,hit9,hit10;
wire hit11,hit12,hit13,hit14,hit15;

wire hit1_2,hit2_2,hit3_2,hit4_2,hit5_2;
wire hit6_2,hit7_2,hit8_2,hit9_2,hit10_2;
wire hit11_2,hit12_2,hit13_2,hit14_2,hit15_2;

wire totalgameover;
reg livesgameover;
reg border,shipborder,shipborder2,scoreborder,rocketborder,rocketborder2,gameoverborder,startborder,startscreen,lifeborder,lifeborder2;
reg alienborder1,alienborder2,alienborder3,alienborder4,alienborder5;
reg alienborder6,alienborder7,alienborder8,alienborder9,alienborder10;
reg alienborder11,alienborder12,alienborder13,alienborder14,alienborder15;
reg alienrocketborder1,alienrocketborder2,alienrocketborder3,alienrocketborder4,alienrocketborder5,alienrocketborder6;
reg [18:0]backgroundaddr;
reg [14:0]gameoveraddr;
reg [16:0]startaddr;
wire [7:0]background,gameoverimg,startimg;
reg [12:0] points;
reg [2:0] lives,lives2;
reg shipAlive,shipAlive2;
reg new_game;
integer delay_gameover;

wire CLK_200Hz;

reg rst;
wire integer speed_level;

reg [10:0] char_num;
reg [10:0] h_idx;
reg [10:0] v_idx;
	 
wire [11:0] X;
wire [11:0] Y;
integer R = 0;
integer G = 0;
integer B = 0;



spaceship SHIP(spaceshipX,spaceshipY,btnL,btnR,spaceshipX2,spaceshipY2,btnL2,btnR2,CLK_200Hz,CLK,rst,
    alienrocketX1,alienrocketY1,
    alienrocketX2,alienrocketY2,
    alienrocketX3,alienrocketY3,
    alienrocketX4,alienrocketY4,
    alienrocketX5,alienrocketY5,
    alienrocketX6,alienrocketY6,
    alienrocketflying1,alienrocketflying2,
    alienrocketflying3,alienrocketflying4,
    alienrocketflying5,alienrocketflying6,
    alienhit,liveminus,liveminus2,shipAlive,shipAlive2
    );
	 
	 
rocket RKTSHIP(CLK,rst,spaceshipX,spaceshipY,
    rocketX,rocketY,
    alienrocketX1,alienrocketY1,
    alienrocketX2,alienrocketY2,
    alienrocketX3,alienrocketY3,
    alienrocketX4,alienrocketY4,
    alienrocketX5,alienrocketY5,
    alienrocketX6,alienrocketY6,
    alienrocketflying1,alienrocketflying2,
    alienrocketflying3,alienrocketflying4,
    alienrocketflying5,alienrocketflying6,
    1,fire,rocketflying,hit,shipAlive);
	 
rocket RKTSHIP2(CLK,rst,spaceshipX2,spaceshipY2,
    rocketX2,rocketY2,
    alienrocketX1,alienrocketY1,
    alienrocketX2,alienrocketY2,
    alienrocketX3,alienrocketY3,
    alienrocketX4,alienrocketY4,
    alienrocketX5,alienrocketY5,
    alienrocketX6,alienrocketY6,
    alienrocketflying1,alienrocketflying2,
    alienrocketflying3,alienrocketflying4,
    alienrocketflying5,alienrocketflying6,
    1,fire2,rocketflying2,hit_2,shipAlive2);
	 
rocket ALIENRKT1(CLK,rst,alienX1,alienY1,alienrocketX1,alienrocketY1,rocketX,rocketY,rocketX2,rocketY2,0,0,0,0,0,0,0,0,rocketflying,rocketflying2,0,0,0,0,0,alienfire1,alienrocketflying1,alienhit[0],alienalive1);
rocket ALIENRKT2(CLK,rst,alienX5,alienY5,alienrocketX2,alienrocketY2,rocketX,rocketY,rocketX2,rocketY2,0,0,0,0,0,0,0,0,rocketflying,rocketflying2,0,0,0,0,0,alienfire2,alienrocketflying2,alienhit[1],alienalive5);
rocket ALIENRKT3(CLK,rst,alien2X2,alien2Y2,alienrocketX3,alienrocketY3,rocketX,rocketY,rocketX2,rocketY2,0,0,0,0,0,0,0,0,rocketflying,rocketflying2,0,0,0,0,0,alienfire3,alienrocketflying3,alienhit[2],alienalive7);
rocket ALIENRKT4(CLK,rst,alien2X4,alien2Y4,alienrocketX4,alienrocketY4,rocketX,rocketY,rocketX2,rocketY2,0,0,0,0,0,0,0,0,rocketflying,rocketflying2,0,0,0,0,0,alienfire4,alienrocketflying4,alienhit[3],alienalive9);
rocket ALIENRKT5(CLK,rst,alien3X2,alien3Y2,alienrocketX5,alienrocketY5,rocketX,rocketY,rocketX2,rocketY2,0,0,0,0,0,0,0,0,rocketflying,rocketflying2,0,0,0,0,0,alienfire5,alienrocketflying5,alienhit[4],alienalive12);
rocket ALIENRKT6(CLK,rst,alien3X4,alien3Y4,alienrocketX6,alienrocketY6,rocketX,rocketY,rocketX2,rocketY2,0,0,0,0,0,0,0,0,rocketflying,rocketflying2,0,0,0,0,0,alienfire6,alienrocketflying6,alienhit[5],alienalive14);

speaker SND(CLK,speaker,hit,hit_2);

wire nofire = 0;
alien ALN1(CLK,rst,318,150,alienX1,alienY1,30,alienalive1,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit1,hit1_2,alienfire1,60000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN2(CLK,rst,251,150,alienX2,alienY2,30,alienalive2,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit2,hit2_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN3(CLK,rst,184,150,alienX3,alienY3,30,alienalive3,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit3,hit3_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN4(CLK,rst,117,150,alienX4,alienY4,30,alienalive4,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit4,hit4_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN5(CLK,rst,50,150,alienX5,alienY5,30,alienalive5,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit5,hit5_2,alienfire2,80000000,0,startscreen,gameover,all_dead,speed_level);

alien ALN6(CLK,rst,318,98,alien2X1,alien2Y1,30,alienalive6,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit6,hit6_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN7(CLK,rst,251,98,alien2X2,alien2Y2,30,alienalive7,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit7,hit7_2,alienfire3,50000000,alienalive2,startscreen,gameover,all_dead,speed_level);
alien ALN8(CLK,rst,184,98,alien2X3,alien2Y3,30,alienalive8,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit8,hit8_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN9(CLK,rst,117,98,alien2X4,alien2Y4,30,alienalive9,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit9,hit9_2,alienfire4,70000000,alienalive4,startscreen,gameover,all_dead,speed_level);
alien ALN10(CLK,rst,50,98,alien2X5,alien2Y5,30,alienalive10,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit10,hit10_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);

alien ALN11(CLK,rst,318,50,alien3X1,alien3Y1,30,alienalive11,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit11,hit11_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN12(CLK,rst,251,50,alien3X2,alien3Y2,30,alienalive12,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit12,hit12_2,alienfire5,60000000,(alienalive7 || alienalive2),startscreen,gameover,all_dead,speed_level);
alien ALN13(CLK,rst,184,50,alien3X3,alien3Y3,30,alienalive13,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit13,hit13_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);
alien ALN14(CLK,rst,117,50,alien3X4,alien3Y4,30,alienalive14,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit14,hit14_2,alienfire6,10000000,(alienalive9 || alienalive4),startscreen,gameover,all_dead,speed_level);
alien ALN15(CLK,rst,50,50,alien3X5,alien3Y5,30,alienalive15,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit15,hit15_2,nofire,150000000,0,startscreen,gameover,all_dead,speed_level);


vga_testing vga(.CLK_I(CLK),.VGA_HS_O(H_sync),.VGA_VS_O(V_sync),.VGA_RED_O(VGA_RED),.VGA_GREEN_O(VGA_GREEN),.VGA_BLUE_O(VGA_BLUE),.X(X),.Y(Y),.R(R),.G(G),.B(B));

reg [9:0] addrs_number_0;
wire number_data_0;
reg number_border_0;

reg [9:0] addrs_number_1;
wire number_data_1;
reg number_border_1;

reg [9:0] addrs_number_2;
wire number_data_2;
reg number_border_2;

reg [9:0] addrs_number_3;
wire number_data_3;
reg number_border_3;

reg [3:0] points_0;
reg [3:0] points_1;
reg [3:0] points_2;
reg [3:0] points_3;

reg multiplayer = 0;


ZeroToNine scores_0(CLK,1,0,addrs_number_0,0,number_data_0);
ZeroToNine scores_1(CLK,1,0,addrs_number_1,0,number_data_1);
ZeroToNine scores_2(CLK,1,0,addrs_number_2,0,number_data_2);
ZeroToNine scores_3(CLK,1,0,addrs_number_3,0,number_data_3);

SpaceShip select_menu(CLK,1,0,select_addr,0,select_dout);
img START(CLK,1,0,startaddr,0,startimg);
SpaceShip ship(CLK,1,0,ship_addr,0,space_dout);
SpaceShip2 ship2(CLK,1,0,ship_addr2,0,space_dout2);
alien0 alien1(CLK,1,0,alien_addr,0,alien_dout);
alien2 alien2(CLK,1,0,alien_addr,0,alien2_dout);
alien3 alien3(CLK,1,0,alien_addr,0,alien3_dout);
GameOver GAMEOVER(CLK,1,0,gameoveraddr,0,gameoverimg);

clk_div CLK_Div_200Hz(CLK,rst,CLK_200Hz);



/************************************************/
assign hit =    hit1 || hit2 || hit3 || hit4 || hit5 ||
                hit6 || hit7 || hit8 || hit9 || hit10||
                hit11 || hit12 || hit13 || hit14 || hit15;
					 
assign hit_2 =    hit1_2 || hit2_2 || hit3_2 || hit4_2 || hit5_2 ||
                hit6_2 || hit7_2 || hit8_2 || hit9_2 || hit10_2 ||
                hit11_2 || hit12_2 || hit13_2 || hit14_2 || hit15_2;
                
assign alien1border =   alienborder1 || alienborder2 ||alienborder3 || alienborder4 || alienborder5;
assign alien2border =   alienborder6 || alienborder7 ||alienborder8 || alienborder9 || alienborder10;
assign alien3border =   alienborder11 || alienborder12 ||alienborder13 || alienborder14 || alienborder15;
                        
assign alien_addr = (alienborder1)? alien_addr1:
                    (alienborder2)? alien_addr2:
                    (alienborder3)? alien_addr3:
                    (alienborder4)? alien_addr4:
                    (alienborder5)? alien_addr5:
                    (alienborder6)? alien_addr6:
                    (alienborder7)? alien_addr7:
                    (alienborder8)? alien_addr8:
                    (alienborder9)? alien_addr9:
                    (alienborder10)? alien_addr10:
                    (alienborder11)? alien_addr11:
                    (alienborder12)? alien_addr12:
                    (alienborder13)? alien_addr13:
                    (alienborder14)? alien_addr14:
                    (alienborder15)? alien_addr15:
                    0;
                    
assign ship_addr =  (shipborder)? space_addr : 
                    (lifeborder)? life_addr : 0;
						  
assign ship_addr2 =  (shipborder2)? space_addr2 : 
                    (lifeborder2)? life_addr2 : 0;

assign gameover =   (alienalive1 && alienY1 >= spaceshipY - 22) ||
                    (alienalive2 && alienY2 >= spaceshipY - 22) ||
                    (alienalive3 && alienY3 >= spaceshipY - 22) ||
                    (alienalive4 && alienY4 >= spaceshipY - 22) ||
                    (alienalive5 && alienY5 >= spaceshipY - 22) ||
                    (alienalive6 && alien2Y1 >= spaceshipY - 30) ||
                    (alienalive7 && alien2Y2 >= spaceshipY - 30) ||
                    (alienalive8 && alien2Y3 >= spaceshipY - 30) ||
                    (alienalive9 && alien2Y4 >= spaceshipY - 30) ||
                    (alienalive10 && alien2Y5 >= spaceshipY - 30) ||
                    (alienalive11 && alien3Y1 >= spaceshipY - 22) ||
                    (alienalive12 && alien3Y2 >= spaceshipY - 22) ||
                    (alienalive13 && alien3Y3 >= spaceshipY - 22) ||
                    (alienalive14 && alien3Y4 >= spaceshipY - 22) ||
                    (alienalive15 && alien3Y5 >= spaceshipY - 22);
						  
assign all_dead = ~alienalive1 && ~alienalive2 && ~alienalive3 && ~alienalive4 && ~alienalive5 && 
							~alienalive6 && ~alienalive7 && ~alienalive8 && ~alienalive9 && ~alienalive10 && 
							~alienalive11 && ~alienalive12 && ~alienalive13 && ~alienalive14 && ~alienalive15; 
                         
assign totalgameover = (gameover) || (livesgameover);

always@(posedge CLK or posedge rst)
begin
    if(rst)
    begin
		startscreen <= 1;
		selectX <= 121;
		selectY <= 382;
		multiplayer <= 0;
    end else begin
        if(startscreen) begin
				if (btnL || btnL2)begin
					selectX <= 121;
					multiplayer <= 0;
				end
				else if (btnR || btnR2) begin
					selectX <= 259;
					multiplayer <= 1;
				end
            if((fire || fire2) && select_time) begin
                startscreen <= 0;
            end
        end
    end
end

reg select_time;
integer select_delay;
always@(posedge CLK or posedge rst)
begin
	if (rst)
	begin
		select_delay <= 0;
		select_time <= 0;
	end
	else if (startscreen)
	begin
		if (select_delay < 4000000)
		begin
			select_delay <= select_delay + 1;
		end
		else begin
			select_time <= 1;
		end
	end
end

always@(posedge CLK or posedge rst)
begin
	if (rst)
	begin
		delay_gameover <= 0;
		new_game <= 0;
		
	end
	else if (totalgameover)
		begin
		if (delay_gameover < 40000000)
		begin
			delay_gameover <= delay_gameover + 1;
		end
		else begin
			new_game <= 1;
			delay_gameover <= 0;
		end
	end
end

always@(posedge CLK)
begin	
	rst <=  rst_game || ((fire || fire2)&& (totalgameover) && (new_game));
end

always@(posedge CLK)
begin
    if(startborder || select_border || totalgameover || alien3border || alien3border || alien2border || alien1border || number_border_0 || number_border_1 || number_border_2 || number_border_3 ||
	 rocketborder || rocketborder2 || alienrocketborder1 || alienrocketborder2 || alienrocketborder3 || alienrocketborder4 || alienrocketborder5 || alienrocketborder6 || shipborder || shipborder2 || lifeborder || lifeborder2 || border) 
    begin
		
		if (startscreen)
			begin
				if (select_border)
				begin
					R <= select_dout[7];
					G <= select_dout[4];
					B <= select_dout[1];
				end
				if (startborder)
				begin
					R <= startimg[7];
					G <= startimg[4];
					B <= startimg[1];
				end
			end
		else if (totalgameover)
			begin
				R <= gameoverimg[7];
				G <= gameoverimg[4];
				B <= gameoverimg[1];
			if (number_border_0)
			begin
				R <= number_data_0;
				G <= number_data_0;
				B <= number_data_0;
			end
			if (number_border_1)
			begin
				R <= number_data_1;
				G <= number_data_1;
				B <= number_data_1;
			end
			if (number_border_2)
			begin
				R <= number_data_2;
				G <= number_data_2;
				B <= number_data_2;
			end
			if (number_border_3)
			begin
				R <= number_data_3;
				G <= number_data_3;
				B <= number_data_3;
			end
			end
		else
			begin
			if (alien1border)
				begin
					R <= alien_dout[7];
					G <= alien_dout[4];
					B <= alien_dout[1];
				end
			if (alien2border)
				begin
					R <= alien2_dout[7];
					G <= alien2_dout[4];
					B <= alien2_dout[1];
				end
			if (alien3border)
				begin
					R <= alien3_dout[7];
					G <= alien3_dout[4];
					B <= alien3_dout[1];
				end
			if (rocketborder)
			begin
					R <= 0;
					G <= 1;
					B <= 0;
			end
			if (rocketborder2)
			begin
					R <= 1;
					G <= 0;
					B <= 0;
			end
			if (alienrocketborder1)
			begin
				R <= 1;
				G <= 1;
				B <= 1;
			end
			if (alienrocketborder2)
			begin
				R <= 1;
				G <= 1;
				B <= 1;
			end
			if (alienrocketborder3)
			begin
				R <= 1;
				G <= 1;
				B <= 1;
			end
			if (alienrocketborder4)
			begin
				R <= 1;
				G <= 1;
				B <= 1;
			end
			if (alienrocketborder5)
			begin
				R <= 1;
				G <= 1;
				B <= 1;
			end
			if (alienrocketborder6)
			begin
				R <= 1;
				G <= 1;
				B <= 1;
			end
			if (shipborder)
			begin
					R <= space_dout[7];
					G <= space_dout[4];
					B <= space_dout[1];
			end
			if (lifeborder)
			begin
				R <= space_dout[7];
				G <= space_dout[4];
				B <= space_dout[1];
			end
			if (shipborder2)
			begin
					R <= space_dout2[7];
					G <= space_dout2[4];
					B <= space_dout2[1];
			end
			if (lifeborder2)
			begin
				R <= space_dout2[7];
				G <= space_dout2[4];
				B <= space_dout2[1];
			end
			if (border)
			begin
				R <= 0;
				G <= 1;
				B <= 1;
			end
			if (number_border_0)
			begin
				R <= number_data_0;
				G <= number_data_0;
				B <= number_data_0;
			end
			if (number_border_1)
			begin
				R <= number_data_1;
				G <= number_data_1;
				B <= number_data_1;
			end
			if (number_border_2)
			begin
				R <= number_data_2;
				G <= number_data_2;
				B <= number_data_2;
			end
			if (number_border_3)
			begin
				R <= number_data_3;
				G <= number_data_3;
				B <= number_data_3;
			end
			end
    end else begin
        R <= 0;
        B <= 0;
        G <= 0;
    end
end

always@(posedge CLK or posedge rst)
begin
    if(rst)
    begin
        points <= 0;
        livesgameover <=0 ;
        lives <= 0;
		  lives2 <= 0;
    end else begin
        points <=   (hit1 || hit2 || hit3 || hit4 || hit5 || hit1_2 || hit2_2 || hit3_2 || hit4_2 || hit5_2) ? points + 10 :
                    (hit6 || hit7 || hit8 || hit9 || hit10 || hit6_2 || hit7_2 || hit8_2 || hit9_2 || hit10_2) ? points + 20 :
                    (hit11 || hit12 || hit13 || hit14 || hit15 || hit11_2 || hit12_2 || hit13_2 || hit14_2 || hit15_2) ? points + 30 : 
                    points;
        lives <= (liveminus) ? lives + 1 : lives;
		  shipAlive <= lives < 3 ? 1 : 0;
		  shipAlive2 <= multiplayer ? (lives2 < 3 ? 1 : 0) : 0;
		  lives2 <= (liveminus2) ? lives2 + 1 : lives2;
		  
		  if (~shipAlive && ~shipAlive2)
		  begin
			livesgameover <= 1;
		  end
		  else
		  begin
				livesgameover <= 0;
			end
    end
end

always@(points)
begin
	points_0 <= points % 10;
	points_1 <= (points%100)/10;
	points_2 <= ((points%1000)-(points%100))/100;
	points_3 <= ((points%10000)-(points%1000))/1000;
end

always@(posedge CLK or posedge rst)
begin
    if(rst)
    begin
        backgroundaddr <= 0;
        gameoveraddr <= 0;
        space_addr <= 0;
        life_addr <= 0;
		  space_addr2 <= 0;
        life_addr2 <= 0;
        alien_addr1 <= 0;
        alien_addr2 <= 0;
        alien_addr3 <= 0;
        alien_addr4 <= 0;
        alien_addr5 <= 0;
        alien_addr6 <= 0;
        alien_addr7 <= 0;
        alien_addr8 <= 0;
        alien_addr9 <= 0;
        alien_addr10 <= 0;
        alien_addr11 <= 0;
        alien_addr12 <= 0;
        alien_addr13 <= 0;
        alien_addr14 <= 0;
        alien_addr15 <= 0;  
		  addrs_number_0 <= 0;
		  addrs_number_1 <= 0;
		  addrs_number_2 <= 0;
		  addrs_number_3 <= 0;
		  
    end else
    begin
		  addrs_number_0 <= (Y == 10+8 || addrs_number_0 > (points_0*79) + 79) ? (points_0*80): (number_border_0 ? (addrs_number_0 + 1) : addrs_number_0);
		  addrs_number_1 <= (Y == 10+8 || addrs_number_1 > (points_1*79) + 79) ? (points_1*80): (number_border_1 ? (addrs_number_1 + 1) : addrs_number_1);
		  addrs_number_2 <= (Y == 10+8 || addrs_number_2 > (points_2*79) + 79) ? (points_2*80): (number_border_2 ? (addrs_number_2 + 1) : addrs_number_2);
		  addrs_number_3 <= (Y == 10+8 || addrs_number_3 > (points_3*79) + 79) ? (points_3*80): (number_border_3 ? (addrs_number_3 + 1) : addrs_number_3);

		  
        startaddr <= (Y == 124 )? 0 : (startborder ? (startaddr + 1): startaddr);
		  select_addr <= (Y == selectX + 16) ? 0 : (select_border ? (select_addr + 1) : select_addr);
        backgroundaddr <= (Y >= 30 && Y <= 470)? (backgroundaddr + 1'b1) : 0;
        gameoveraddr <= (Y == 264 )?  0 :(gameoverborder ? (gameoveraddr + 1'b1): gameoveraddr);
        space_addr <= (Y == spaceshipY + 16)? 0 : ((shipborder)? (space_addr +  1'b1) : (space_addr));
        life_addr <= (Y == 38)? 0 : ((lifeborder)? (life_addr +  1'b1) : (life_addr));
		  space_addr2 <= (Y == spaceshipY2 + 16)? 0 : ((shipborder2)? (space_addr2 +  1'b1) : (space_addr2));
        life_addr2 <= (Y == 38)? 0 : ((lifeborder2)? (life_addr2 +  1'b1) : (life_addr2));
        alien_addr1 <= (Y == alienY1 + 0)? 0 : ((alienborder1)? (alien_addr1 +  1'b1) : (alien_addr1));
        alien_addr2 <= (Y == alienY2 + 22)? 0 : ((alienborder2)? (alien_addr2 +  1'b1) : (alien_addr2));
        alien_addr3 <= (Y == alienY3 + 22)? 0 : ((alienborder3)? (alien_addr3 +  1'b1) : (alien_addr3));
        alien_addr4 <= (Y == alienY4 + 22)? 0 : ((alienborder4)? (alien_addr4 +  1'b1) : (alien_addr4));
        alien_addr5 <= (Y == alienY5 + 22)? 0 : ((alienborder5)? (alien_addr5 +  1'b1) : (alien_addr5));
        alien_addr6 <= (Y == alien2Y1 + 30)? 0 : ((alienborder6)? (alien_addr6 +  1'b1) : (alien_addr6));
        alien_addr7 <= (Y == alien2Y2 + 30)? 0 : ((alienborder7)? (alien_addr7 +  1'b1) : (alien_addr7));
        alien_addr8 <= (Y == alien2Y3 + 30)? 0 : ((alienborder8)? (alien_addr8 +  1'b1) : (alien_addr8));
        alien_addr9 <= (Y == alien2Y4 + 30)? 0 : ((alienborder9)? (alien_addr9 +  1'b1) : (alien_addr9));
        alien_addr10 <= (Y == alien2Y5 + 30)? 0 : ((alienborder10)? (alien_addr10 +  1'b1) : (alien_addr10));
        alien_addr11 <= (Y == alien3Y1 + 22)? 0 : ((alienborder11)? (alien_addr11 +  1'b1) : (alien_addr11));
        alien_addr12 <= (Y == alien3Y2 + 22)? 0 : ((alienborder12)? (alien_addr12 +  1'b1) : (alien_addr12));
        alien_addr13 <= (Y == alien3Y3 + 22)? 0 : ((alienborder13)? (alien_addr13 +  1'b1) : (alien_addr13));
        alien_addr14 <= (Y == alien3Y4 + 22)? 0 : ((alienborder14)? (alien_addr14 +  1'b1) : (alien_addr14));
        alien_addr15 <= (Y == alien3Y5 + 22)? 0 : ((alienborder15)? (alien_addr15 +  1'b1) : (alien_addr15));
    end
end


always @(posedge CLK)
	begin
	
		 number_border_0 <= ((X > 40 && X <= 40+8) && (Y >= 10 && Y <= 10+9));
		 number_border_1 <= ((X > 30 && X <= 30+8) && (Y >= 10 && Y <= 10+9));
		 number_border_2 <= ((X > 20 && X <= 20+8) && (Y >= 10 && Y <= 10+9));
		 number_border_3 <= ((X > 10 && X <= 10+8) && (Y >= 10 && Y <= 10+9));
		 
	
        startborder <= (startscreen) && (((X >= 91 ) && (X <= 91+217)) && ((Y >= 238) && (Y <= 238+124)));
		  select_border <= (startscreen) && (((X >= selectX ) && (X <= selectX + 30)) && ((Y >=selectY) && (Y <= selectY + 15)));
        border <= (((Y >= 0) && (Y <= 5)) || ((Y >= 594) && (Y <= 599)) || ((X >= 0) && (X <= 5)) || ((X >= 390) && (X <= 395)));
        gameoverborder <= (totalgameover) && (((X >= 3 ) && (X <= 390)) && ((Y >= 258) && (Y <= 342)));
        shipborder <= (shipAlive) && (((X >= spaceshipX ) && (X <= spaceshipX + 30)) && ((Y >= spaceshipY) && (Y <= spaceshipY + 15)));
        lifeborder <= (lives == 0) && (((X >= 350 ) && (X <=380)) && ((Y >= 22) && (Y <= 37)));
        rocketborder <= (shipAlive) && (rocketflying)?(((X >= rocketX ) && (X <= rocketX + 4)) && ((Y >= rocketY) && (Y <= rocketY + 8))):0;
		  shipborder2 <= (shipAlive2) && (((X >= spaceshipX2 ) && (X <= spaceshipX2 + 30)) && ((Y >= spaceshipY2) && (Y <= spaceshipY2 + 15)));
        lifeborder2 <= multiplayer && (lives2 == 0) && (((X >= 300 ) && (X <=330)) && ((Y >= 22) && (Y <= 37)));
        rocketborder2 <= (shipAlive2) && (rocketflying2)?(((X >= rocketX2 ) && (X <= rocketX2 + 4)) && ((Y >= rocketY2) && (Y <= rocketY2 + 8))):0;
        alienrocketborder1 <= (alienrocketflying1)?(((X >= alienrocketX1 ) && (X <= alienrocketX1 + 4)) && ((Y >= alienrocketY1) && (Y <= alienrocketY1 + 8))):0;
        alienrocketborder2 <= (alienrocketflying2)?(((X >= alienrocketX2 ) && (X <= alienrocketX2 + 4)) && ((Y >= alienrocketY2) && (Y <= alienrocketY2 + 8))):0;
        alienrocketborder3 <= (alienrocketflying3)?(((X >= alienrocketX3 ) && (X <= alienrocketX3 + 4)) && ((Y >= alienrocketY3) && (Y <= alienrocketY3 + 8))):0;
        alienrocketborder4 <= (alienrocketflying4)?(((X >= alienrocketX4 ) && (X <= alienrocketX4 + 4)) && ((Y >= alienrocketY4) && (Y <= alienrocketY4 + 8))):0;
        alienrocketborder5 <= (alienrocketflying5)?(((X >= alienrocketX5 ) && (X <= alienrocketX5 + 4)) && ((Y >= alienrocketY5) && (Y <= alienrocketY5 + 8))):0;
        alienrocketborder6 <= (alienrocketflying6)?(((X >= alienrocketX6 ) && (X <= alienrocketX6 + 4)) && ((Y >= alienrocketY6) && (Y <= alienrocketY6 + 8))):0;
        alienborder1 <= (alienalive1)&&(((X >= alienX1 ) && (X <= alienX1 + 29)) && ((Y >= alienY1) && (Y <= alienY1 + 21)));
        alienborder2 <= (alienalive2)&&(((X >= alienX2 ) && (X <= alienX2 + 29)) && ((Y >= alienY2) && (Y <= alienY2 + 21)));
        alienborder3 <= (alienalive3)&&(((X >= alienX3 ) && (X <= alienX3 + 29)) && ((Y >= alienY3) && (Y <= alienY3 + 21)));
        alienborder4 <= (alienalive4)&&(((X >= alienX4 ) && (X <= alienX4 + 29)) && ((Y >= alienY4) && (Y <= alienY4 + 21)));
        alienborder5 <= (alienalive5)&&(((X >= alienX5 ) && (X <= alienX5 + 29)) && ((Y >= alienY5) && (Y <= alienY5 + 21)));
        alienborder6 <= (alienalive6)&&(((X >= alien2X1 ) && (X <= alien2X1 + 30)) && ((Y >= alien2Y1) && (Y <= alien2Y1 + 29)));
        alienborder7 <= (alienalive7)&&(((X >= alien2X2 ) && (X <= alien2X2 + 30)) && ((Y >= alien2Y2) && (Y <= alien2Y2 + 29)));
        alienborder8 <= (alienalive8)&&(((X >= alien2X3 ) && (X <= alien2X3 + 30)) && ((Y >= alien2Y3) && (Y <= alien2Y3 + 29)));
        alienborder9 <= (alienalive9)&&(((X >= alien2X4 ) && (X <= alien2X4 + 30)) && ((Y >= alien2Y4) && (Y <= alien2Y4 + 29)));
        alienborder10 <= (alienalive10)&&(((X >= alien2X5 ) && (X <= alien2X5 + 30)) && ((Y >= alien2Y5) && (Y <= alien2Y5 + 29)));
        alienborder11 <= (alienalive11)&&(((X >= alien3X1 ) && (X <= alien3X1 + 32)) && ((Y >= alien3Y1) && (Y <= alien3Y1 + 21)));
        alienborder12 <= (alienalive12)&&(((X >= alien3X2 ) && (X <= alien3X2 + 32)) && ((Y >= alien3Y2) && (Y <= alien3Y2 + 21)));
        alienborder13 <= (alienalive13)&&(((X >= alien3X3 ) && (X <= alien3X3 + 32)) && ((Y >= alien3Y3) && (Y <= alien3Y3 + 21)));
        alienborder14 <= (alienalive14)&&(((X >= alien3X4 ) && (X <= alien3X4 + 32)) && ((Y >= alien3Y4) && (Y <= alien3Y4 + 21)));
        alienborder15 <= (alienalive15)&&(((X >= alien3X5 ) && (X <= alien3X5 + 32)) && ((Y >= alien3Y5) && (Y <= alien3Y5 + 21)));
	end

endmodule

module spaceship
    (/*selectX,selectY,*/spaceshipX,spaceshipY,btnL,btnR,spaceshipX2,spaceshipY2,btnL2,btnR2,clk,clk_20MHz,rst,
    alienrocketX1,alienrocketY1,
    alienrocketX2,alienrocketY2,
    alienrocketX3,alienrocketY3,
    alienrocketX4,alienrocketY4,
    alienrocketX5,alienrocketY5,
    alienrocketX6,alienrocketY6,
    alienrocket1,alienrocket2,
    alienrocket3,alienrocket4,
    alienrocket5,alienrocket6,
    alienhit,liveminus,liveminus2,shipAlive,shipAlive2);
    input btnL,btnR,btnL2,btnR2;
    input clk,rst,clk_20MHz;
	 input shipAlive,shipAlive2;
    output spaceshipX,spaceshipX2;
    output spaceshipY,spaceshipY2;
    output reg liveminus,liveminus2;
	 output reg [5:0] alienhit;
    input alienrocket1,alienrocket2,alienrocket3,alienrocket4,alienrocket5,alienrocket6;
    input [9:0]alienrocketX1,alienrocketX2,alienrocketX3,alienrocketX4,alienrocketX5,alienrocketX6;
    input [8:0]alienrocketY1,alienrocketY2,alienrocketY3,alienrocketY4,alienrocketY5,alienrocketY6;  
    integer spaceshipX = 145;
    integer spaceshipY = 500;
	 integer spaceshipX2 = 225;
    integer spaceshipY2 = 500;
    always@(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            spaceshipX <= 145;
            spaceshipY <= 500;
				spaceshipX2 <= 225;
            spaceshipY2 <= 500;
        end
        else begin
            if(btnL) begin
                spaceshipX <= (spaceshipX > 0)? (spaceshipX - 10'd1):spaceshipX;
            end 
            else if(btnR) begin
                spaceshipX <= (spaceshipX < 355)? (spaceshipX + 9'd1):spaceshipX;
            end
				
				if(btnL2) begin
                spaceshipX2 <= (spaceshipX2 > 0)? (spaceshipX2 - 10'd1):spaceshipX2;
            end 
            else if(btnR2) begin
                spaceshipX2 <= (spaceshipX2 < 355)? (spaceshipX2 + 9'd1):spaceshipX2;
            end
        end
    end
	 always @(posedge clk_20MHz or posedge rst)
	 begin
	 if (rst)
		begin
	        alienhit <= 0;
           liveminus <= 0;
			  liveminus2 <= 0;
		end
	else begin
	
	if (shipAlive)
	begin
		
	if ((alienrocket1 &&(((alienrocketX1 >= spaceshipX -2)&&(alienrocketX1 <= spaceshipX + 33))&&(alienrocketY1 == spaceshipY))))
		begin
			alienhit[0] <= 1'b1;
			liveminus <= 1'b1;
		end
	else  if ((alienrocket2 &&(((alienrocketX2 >= spaceshipX -2)&&(alienrocketX2 <= spaceshipX + 33))&&(alienrocketY2 == spaceshipY))))
			begin
				alienhit[1] <= 1'b1;
				liveminus <= 1'b1;
			end
	else if ((alienrocket3 &&(((alienrocketX3 >= spaceshipX -2)&&(alienrocketX3 <= spaceshipX + 33))&&(alienrocketY3 == spaceshipY))))
			begin
				alienhit[2] <= 1'b1;
				liveminus <= 1'b1;
			end
	else if ((alienrocket4 &&(((alienrocketX4 >= spaceshipX -2)&&(alienrocketX4 <= spaceshipX + 33))&&(alienrocketY4 == spaceshipY))))
			begin
				alienhit[3] <= 1'b1;
				liveminus <= 1'b1;
			end
	else if ((alienrocket5 &&(((alienrocketX5 >= spaceshipX -2)&&(alienrocketX5 <= spaceshipX + 33))&&(alienrocketY5 == spaceshipY))))
			begin
				alienhit[4] <= 1'b1;
				liveminus <= 1'b1;
			end
	else if ((alienrocket6 &&(((alienrocketX6 >= spaceshipX -2)&&(alienrocketX6 <= spaceshipX + 33))&&(alienrocketY6 == spaceshipY))))
			begin
				alienhit[5] <= 1'b1;
				liveminus <= 1'b1;
			end
	else begin
             alienhit <= 0;
             liveminus <= 0;
         end
	end
	
	if (shipAlive2)
	begin
	
	if ((alienrocket1 &&(((alienrocketX1 >= spaceshipX2 -2)&&(alienrocketX1 <= spaceshipX2 + 33))&&(alienrocketY1 == spaceshipY2))))
		begin
			alienhit[0] <= 1'b1;
			liveminus2 <= 1'b1;
		end
	else  if ((alienrocket2 &&(((alienrocketX2 >= spaceshipX2 -2)&&(alienrocketX2 <= spaceshipX2 + 33))&&(alienrocketY2 == spaceshipY2))))
			begin
				alienhit[1] <= 1'b1;
				liveminus2 <= 1'b1;
			end
	else if ((alienrocket3 &&(((alienrocketX3 >= spaceshipX2 -2)&&(alienrocketX3 <= spaceshipX2 + 33))&&(alienrocketY3 == spaceshipY2))))
			begin
				alienhit[2] <= 1'b1;
				liveminus2 <= 1'b1;
			end
	else if ((alienrocket4 &&(((alienrocketX4 >= spaceshipX2 -2)&&(alienrocketX4 <= spaceshipX2 + 33))&&(alienrocketY4 == spaceshipY2))))
			begin
				alienhit[3] <= 1'b1;
				liveminus2 <= 1'b1;
			end
	else if ((alienrocket5 &&(((alienrocketX5 >= spaceshipX2 -2)&&(alienrocketX5 <= spaceshipX2 + 33))&&(alienrocketY5 == spaceshipY2))))
			begin
				alienhit[4] <= 1'b1;
				liveminus2 <= 1'b1;
			end
	else if ((alienrocket6 &&(((alienrocketX6 >= spaceshipX2 -2)&&(alienrocketX6 <= spaceshipX2 + 33))&&(alienrocketY6 == spaceshipY2))))
			begin
				alienhit[5] <= 1'b1;
				liveminus2 <= 1'b1;
			end
	else begin
             alienhit <= 0;
             liveminus2 <= 0;
         end
		end
		end
	end
endmodule

module rocket(clk,rst,startX,startY,
        rocketX,rocketY,
        rocketX1,rocketY1,
        rocketX2,rocketY2,
        rocketX3,rocketY3,
        rocketX4,rocketY4,
        rocketX5,rocketY5,
        rocketX6,rocketY6,
        rocket1flying,
        rocket2flying,
        rocket3flying,
        rocket4flying,
        rocket5flying,
        rocket6flying,
        direction,fire,flying,hit,shipAlive
        );

    input clk,rst,fire,hit,direction,rocket1flying,rocket2flying,rocket3flying,rocket4flying,rocket5flying,rocket6flying,shipAlive;
    input [9:0]startX,rocketX1,rocketX2,rocketX3,rocketX4,rocketX5,rocketX6;
    input [8:0]startY,rocketY1,rocketY2,rocketY3,rocketY4,rocketY5,rocketY6;
    output reg flying;
    output reg [9:0]rocketX;
    output reg [8:0]rocketY;
    reg [23:0] counter;
    reg rockethit;
	 integer speed;
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            rockethit <= 0;
        end else 
        begin
            if( ((flying && rocket1flying) && ((rocketX >= rocketX1 - 2)&&(rocketX <= rocketX1 + 6))&&(rocketY == rocketY1 + 8))||
                ((flying && rocket2flying) && ((rocketX >= rocketX2 - 2)&&(rocketX <= rocketX2 + 6))&&(rocketY == rocketY2 + 8))||
                ((flying && rocket3flying) && ((rocketX >= rocketX3 - 2)&&(rocketX <= rocketX3 + 6))&&(rocketY == rocketY3 + 8))||
                ((flying && rocket4flying) && ((rocketX >= rocketX4 - 2)&&(rocketX <= rocketX4 + 6))&&(rocketY == rocketY4 + 8))||
                ((flying && rocket5flying) && ((rocketX >= rocketX5 - 2)&&(rocketX <= rocketX5 + 6))&&(rocketY == rocketY5 + 8))||
                ((flying && rocket6flying) && ((rocketX >= rocketX6 - 2)&&(rocketX <= rocketX6 + 6))&&(rocketY == rocketY6 + 8)))
            begin 
                rockethit <= 1'b1;
            end else begin
                rockethit <= 0;
            end      
        end
    end
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
        begin   
            flying <=0;
        end else
        begin
            if(fire && shipAlive)
            begin
                if(flying == 0)begin
                    flying <=1;
                    rocketX <= startX + 10'd13;
                    rocketY <= startY;
                end
            end 
            if(flying)
            begin   
                rocketY <= direction ? (rocketY - speed):(rocketY + speed);
                if((rocketY == 10) || (rocketY >= 510) || hit || rockethit)
                begin
                    flying <= 0;
                end
            end
        end
    end
    
    always@(posedge clk)
        if(flying)
        begin
            if(counter == 24'd75000)begin
                 speed <= 1'b1;
                 counter <= 0;
            end else begin
                 counter <= counter + 1'b1;
                 speed <= 0;
            end
        end else begin
            counter <= 0;
            speed <= 0;
        end
    
endmodule

module alien(clk,rst,startX,startY,alienX,alienY,width,alienalive,rocketflying,rocketX,rocketY,rocketflying2,rocketX2,rocketY2,hit,hit2,alienfire,firefreq,frontalive,startscreen,gameover,all_dead,speed_level);

    input clk,rst;
    output reg alienalive,hit,hit2,alienfire;
    input rocketflying,rocketflying2,startscreen,gameover,frontalive;
    input [9:0] startX;
    input [8:0] startY;
    input [9:0] rocketX,rocketX2;
    input [8:0] rocketY,rocketY2;
    input [9:0] width;
    input [27:0] firefreq;
	 output speed_level;
	 input all_dead;
    output reg [9:0]alienX;
    output reg [8:0]alienY;
    reg [23:0] counter;
    reg [27:0] firecounter;
    reg speed,direction;
	 integer speed_level; 
	 
    always@(posedge clk or posedge rst)
    begin
        if(rst || all_dead)
        begin
            firecounter <= 0;
            alienfire <= 0;
        end else begin
            if(alienalive && ~frontalive && ~startscreen && ~gameover) begin
                if(firecounter >= firefreq) begin
                    firecounter <= 0;
                    alienfire <= 1;
                end else begin
                    firecounter <= firecounter + 1'b1;
                    alienfire <= 0;
                end
            end else begin
                firecounter <= 0;
                alienfire <= 0;
            end
        end
    end
    
    always@(posedge clk or posedge rst)
    begin
        if(rst || all_dead)
        begin
            alienalive <= 1'b1;
            hit <= 0;
        end else begin
            if(((rocketflying) && alienalive &&(((rocketX >= alienX -2)&&(rocketX <= alienX + width + 2))&&(rocketY == alienY+2))))begin
                alienalive <= 0;
                hit <= 1'b1;
            end else begin
                hit <= 0;
            end
				if (((rocketflying2) && alienalive &&(((rocketX2 >= alienX -2)&&(rocketX2 <= alienX + width + 2))&&(rocketY2 == alienY+2))))begin
					alienalive <= 0;
               hit2 <= 1'b1;
				end else begin
					hit2 <= 0;
				end
        end
    end
    
    always@(posedge clk or posedge rst)
    begin
        if(rst || all_dead)
        begin
            alienX <= startX;
				speed_level <=  rst ? 450000 : speed_level - 50000;
        end else if(counter == speed_level)
            begin
                 speed <= 1;
                 counter <= 0;
             end else 
             begin
                if(direction) 
                begin
                    counter <= counter + 1'b1;
                    alienX <= startscreen? alienX: alienX+speed;
                    speed <= 0;
                end else 
                begin
                    counter <= counter + 1'b1;
                    alienX <= startscreen? alienX: alienX-speed;
                    speed <= 0;
                end
            end
        end
    
    always@(posedge clk or posedge rst)begin
        if(rst || all_dead)
        begin
            direction <= 0;
            alienY <= startY;
        end else begin
            if(alienX == startX - 50 && direction == 0) begin
                direction <= 1'b1;
                alienY <= (gameover) ? alienY : alienY + 10;
            end else if(alienX == startX + 30 && direction == 1)begin
                direction <= 0;
                alienY <= (gameover) ? alienY : alienY + 10;
            end
        end
    end
   
endmodule

module speaker(clk,speaker,hit,hit_2);
    input clk,hit,hit_2;
    output speaker;
    reg [25:0] playtime;
	 reg speaker;
    
    always @(posedge clk)
    begin
        if(hit || hit_2)begin
            playtime <= 140000;
        end 
        if(playtime > 0)begin
            playtime <= playtime - 1'b1;
            speaker = 1;
			end
		else begin
				speaker = 0;
			end
	end
endmodule




module clk_div 
#( 
parameter WIDTH = 17,
parameter N = 100000
)
(clk,reset, clk_out);
 
input clk;
input reset;
output clk_out;
 
reg [WIDTH-1:0] r_reg;
wire [WIDTH-1:0] r_nxt;
reg clk_track;
 
always @(posedge clk or posedge reset)
 
begin
  if (reset)
     begin
        r_reg <= 0;
	clk_track <= 1'b0;
     end
 
  else if (r_nxt == N)
 	   begin
	     r_reg <= 0;
	     clk_track <= ~clk_track;
	   end
 
  else 
      r_reg <= r_nxt;
end
 
 assign r_nxt = r_reg+1;   	      
 assign clk_out = clk_track;
endmodule

