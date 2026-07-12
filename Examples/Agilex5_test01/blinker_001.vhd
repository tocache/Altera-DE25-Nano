library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity blinker_001 is
port(in_clk:	in std_logic;
		LED:		out std_logic);
end blinker_001;

architecture funcionamiento of blinker_001 is
signal cuenta: std_logic_vector(25 downto 0);
signal interno: std_logic;

begin
	process(in_clk)
	begin
		if rising_edge(in_clk) then
			if cuenta = 50000000 then
				cuenta <= (others => '0');
				interno <= not interno;
			else
				cuenta <= cuenta + 1;
			end if;
		end if;
	end process;
	LED <= interno;
end funcionamiento;