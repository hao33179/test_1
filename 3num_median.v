 
// Module Name: min_mid_max_3    
// hao
// 2022.6.4
// Description: take the middle value / minimum / maximum of 3 numbers
 
 
 
module min_mid_max_3 #(parameter size=16-1 )(                       //不完全是个组合逻辑，有流水线(6种可能)
    input       [size:0] in1,                                       //这些变量应当
    input       [size:0] in2,
    input       [size:0] in3,
    output   reg [size:0] min,
    output   reg [size:0] mid,
    output   reg [size:0] max
);
 
always@(*) begin
if(in1 > in2)begin                          //if must be in always block!
 
        if(in2 > in3)begin                  //in1 > in2 > in3
             max <= in1;
             mid <= in2;
             min <= in3;
        end
        else begin                          //in1 > in3 > in2
            if(in1 > in3)begin
                max <= in1;
                mid <= in3;
                min <= in2;
            end
            else begin                      //in3 > in1 > in2
                max <= in3;
                mid <= in1;
                min <= in2;
            end
        end
    end
else begin//1<2
 
        if(in1 > in3)begin                  //in2>in1>in3
            max <= in2;
            mid <= in1;
            min <= in3;
        end
 
        else begin                          //in2>in3>in1
            if(in2 > in3)begin
                max <= in2;
                mid <= in3;
                min <= in1;
            end 
            else begin                      //in3>in2>in1
                max <= in3;
                mid <= in2;
                min <= in1;
            end
        end
    end

end
endmodule