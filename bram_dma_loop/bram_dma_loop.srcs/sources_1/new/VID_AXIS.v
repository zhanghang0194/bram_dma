`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 16:24:10
// Design Name: 
// Module Name: VID_AXIS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VID_AXIS(
    input vid_clk               ,
    input vid_rst_n             ,
    input vid_de                ,
    input vid_hs                ,
    input vid_vs                ,
    input [23:0] vid_data       ,
    input [7:0] vid_alpha       ,
    
    input m_axis_aclk           ,
    
    output [31:0] m_axis_tdata  ,
    output [3:0] m_axis_tkeep   ,
    output m_axis_tlast         ,
    output m_axis_tuser         ,
    output m_axis_tvalid        ,
    input m_axis_tready        
    );
    
    //参数定义
    
    //连线
    assign m_axis_tvalid = ~empty && m_axis_tready ;
    assign m_axis_tkeep = 4'b1111 ;
    assign m_axis_tuser = 1'bx ;
    

    //reg定义
    reg vid_vs_r1 = 1'b0,vid_vs_r2 = 1'b0;
    reg vid_de_r1 = 1'b0,vid_de_r2 = 1'b0;
    reg vid_hs_r1 = 1'b0;
    reg [23:0] vid_data_r1 = 24'd0;
    reg [23:0] vid_data_r2 = 24'd0;
    reg vid_tlast = 1'b0;    

    //wire定义
    wire full;
    wire empty;
    

    
    
    always@(posedge vid_clk)begin
        vid_vs_r1    <= vid_vs;
        vid_vs_r2    <= vid_vs_r1;
        vid_hs_r1    <= vid_hs;
        vid_de_r1    <= vid_de;
        vid_de_r2    <= vid_de_r1;
        vid_data_r1  <= vid_data;  
        vid_data_r2  <= vid_data_r1;  
    end
    
    
    always@(posedge vid_clk) begin
	   vid_tlast <= (vid_hs_r1==1'b1 & vid_hs==1'b0);
    end



fifo_generator_0 u_fifo_generator_0(
    .rst(~vid_rst_n)                        ,
    .wr_clk(vid_clk)                        ,
    .wr_en(vid_de_r2 && ~full )                , //vid_de & ~full
    .din({vid_data_r2,vid_alpha,vid_tlast})    ,
    .full(full)                             ,
    
    .rd_clk(m_axis_aclk)                    ,
    .rd_en(m_axis_tvalid)                   , 
    .dout({m_axis_tdata,m_axis_tlast})      ,
    .empty(empty)                           
  );
    
endmodule
