library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY Adder IS 
	generic (n: integer :=4);
	PORT(
			CTRL : IN STD_LOGIC;
			A,B  : IN STD_LOGIC_VECTOR (n-1 downto 0);
			F    : OUT STD_LOGIC_VECTOR (n-1 downto 0);
			COUT : OUT STD_LOGIC
		);
END Adder;

ARCHITECTURE RTL OF Adder IS
	SIGNAL Interm : STD_LOGIC_VECTOR(n downto 0);
BEGIN

	p0: process(A, B, CTRL)
	begin
		if (CTRL = '0') then Interm <='0' &B;
		else Interm<=('0'& A)+('0' & B);
		end if;
	end process;
	F<=Interm(n-1 downto 0);
	COUT<=Interm(n);
END RTL;