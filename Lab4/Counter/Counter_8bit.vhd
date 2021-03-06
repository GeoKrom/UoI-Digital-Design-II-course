library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Counter_8bit is
	port(CountIn: in std_logic_vector(7 downto 0);
		 CLK,RST,SET: in std_logic;
		 CountValue: out std_logic_vector(7 downto 0));
end Counter_8bit;

architecture RTL of Counter_8bit is
 signal count: std_logic_vector (7 downto 0);
begin
	process(CLK,RST,SET)
		begin
			if (RST = '0') then 
				count<=(count'range =>'0');
			elsif (CLK'event and CLK = '1') then
				if(SET = '1') then
					count<=count+1;
				end if;
			end if;
	end process;
	CountValue <= count;
end RTL;