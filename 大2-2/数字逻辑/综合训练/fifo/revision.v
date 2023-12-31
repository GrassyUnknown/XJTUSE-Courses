// Quartus II Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module dual_port_ram
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=3)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input wen, ren, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] q
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	always @ (posedge write_clock)
	begin
		// Write
		if (wen)
			ram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)  
	begin
		// Read 
		if(ren)
			q <= ram[read_addr];
	end
	
endmodule

module fifo#(
	parameter	WIDTH = 8,
	parameter 	DEPTH = 3
)(
	input 					clk		, 
	input 					rst 	,
	input 					wren	,
	input 			 		rden	,
	input 		[WIDTH-1:0]	wrdata	,

	output reg				full	,   
	output reg				empty	,	
	output wire [WIDTH-1:0]	rddata  ,
	output reg [DEPTH:0]  data_avail,
	output reg [DEPTH:0]  room_avail,
	output reg           almost_full,
	output reg          almost_empty
);

reg	[DEPTH-1:0]		rd_pt;	//读指针rd_pt，指向下一个要读出的数据地址。
reg [DEPTH-1:0] 	wt_pt;  //写指针wt_pt，指向下一个要写入的数据地址。

wire	wen_con;	
wire	ren_con;	
assign	wen_con = ~full & wren;
assign	ren_con = ~empty & rden;

always@(posedge clk or negedge rst)
begin
	if(!rst)	begin   //initialize
		rd_pt <= 0;
		wt_pt <= 0;
	end
	else	begin
		if(wen_con)			//没有写满，并且写使能：允许写入，写指针+1
			wt_pt <= wt_pt + 1;
		else if(ren_con)	//没有取空，并且读使能：允许读出，读指针+1
			rd_pt <= rd_pt + 1;
	end
end


always@(posedge clk or negedge rst)
begin
	if(!rst) data_avail <= 0;
	else if(wen_con)		data_avail <= data_avail + 1;
	else if(ren_con)	data_avail <= data_avail - 1;
	room_avail<=2**DEPTH-data_avail;
end
//存满指示full和存空指示empty控制
always@(room_avail, data_avail)
begin
	if(room_avail==0) begin	
		full = 1;
		empty = 0;
	end
	else if(data_avail==0) begin
		empty = 1;
		full = 0;
	end
	else	begin
		full = 0;
		empty = 0;
	end
end
always@(room_avail, data_avail)
begin
	
	if(room_avail==1)almost_full = 1;
	else if(data_avail==1)almost_empty = 1;
	
	else begin
		almost_full = 0;
		almost_empty = 0;
	end
end

//实例化双向RAM



dual_port_ram #(
	.ADDR_WIDTH(DEPTH),
	.DATA_WIDTH(WIDTH)
)
u_RAM
(
	.write_clock(clk),		   	//同步FIFO：wclk---clk
	.wen(wen_con),
	.write_addr(wt_pt),     	//写指针wt_pt-----写地址
	.data(wrdata),
	.read_clock(clk),			//同步FIFO：rclk---clk
	.ren(ren_con),		
	.read_addr(rd_pt),		//读指针rd_pt-----读地址
	.q(rddata)
);

endmodule
