module p3(clk0,a1,a2,a3,a4,succ,set,endmodi,yes,reset,defeat);

input a1,a2,a3,a4,set,yes,reset,endmodi;
output succ,defeat;
reg c0;
reg c1;
reg c2;
reg c3;
reg r0;
reg r1;
reg r2;
reg r3;

wire check0,check1,check2,check3,succ1,succ2,succ3,defeat2,succ4,pass,unye;
reg clk_now;
input clk0;
reg changeable;

always @(posedge clk0)
begin
	if(set==1)
	begin
		c0<=a1;
		c1<=a2;
		c2<=a3;
		c3<=a4;
	end
	if(set==0 && changeable==1)
	begin
		r0<=a1;
		r1<=a2;
		r2<=a3;
		r3<=a4;
	end
	if(succ==1)
	begin
		changeable<=1;
	end
	if(endmodi==0)
	begin
		changeable<=0;
	end
end

	not(unye,yes);
	xor (check0,c0,r0);
	xor (check1,c1,r1);
	xor (check2,c2,r2);
	xor (check3,c3,r3);
	or(succ1,check0,check1);
	or(succ2,succ1,check2);
	or(succ3,succ2,check3);
	and(pass,unye,reset);
	not (succ4,succ3);
	and(succ,succ4,pass);
	not (defeat2,succ);
	and(defeat,pass,defeat2);
	

endmodule